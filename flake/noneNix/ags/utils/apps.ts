import Apps from "gi://AstalApps?version=0.1";

const appInfoCache = new Map<string, Apps.Application | null>();
const MAX_CACHE_SIZE = 50;

let appManager: Apps.Apps | null = null;

function getAppManager(): Apps.Apps {
   if (!appManager) {
      appManager = new Apps.Apps();
   }
   return appManager;
}

function addToCache(key: string, value: Apps.Application | null): void {
   if (appInfoCache.size >= MAX_CACHE_SIZE) {
      const firstKey = appInfoCache.keys().next().value;
      if (firstKey) appInfoCache.delete(firstKey);
   }
   appInfoCache.set(key, value);
}

function findAppInList(
   appId: string,
   appList: Apps.Application[],
): Apps.Application | null {
   const searchTerm = appId.toLowerCase();

   for (const app of appList) {
      if (
         app.entry?.toLowerCase() === searchTerm ||
         app.iconName === appId ||
         app.name === appId ||
         app.wm_class === appId
      ) {
         return app;
      }
   }

   for (const app of appList) {
      if (app.entry?.toLowerCase().includes(searchTerm)) {
         return app;
      }
   }

   return null;
}

export function getAppInfo(appId: string): Apps.Application | null {
   if (!appId) return null;

   if (appInfoCache.has(appId)) {
      return appInfoCache.get(appId)!;
   }

   const manager = getAppManager();
   const appList = manager.get_list();

   const match = findAppInList(appId, appList);

   addToCache(appId, match);
   return match;
}
