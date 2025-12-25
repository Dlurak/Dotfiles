krabby random > /tmp/pokemon

tail /tmp/pokemon -n +2
head -n 1 /tmp/pokemon > /tmp/pokemon-tmp
mv /tmp/pokemon-tmp /tmp/pokemon
