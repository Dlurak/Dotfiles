return {
	{
		trigger = 'section',
		body = '\\section{$1}',
	},
	{
		trigger = 'subsection',
		body = '\\subsection{$1}',
	},
	{
		trigger = 'subsubsection',
		body = '\\subsubsection{$1}',
	},
	{
		trigger = 'itemize',
		body = [[\begin{itemize}
	\item $1
\end{itemize}]]
	},
	{
		trigger = 'enumerate',
		body = [[\begin{enumerate}
	\item $1
\end{enumerate}]]
	},
	{
		trigger = 'begin_end',
		body = [[\begin{$1}
	\item $2
\end{$1}]]
	},
	{
		trigger = 'align',
		body = [[\begin{align}
	$1
\end{align}]]
	},
	{
		trigger = 'tikzpicture',
		body = [[\begin{tikzpicture}
	$1
\end{tikzpicture}]]
	},
	{
		trigger = 'tikz_line',
		body = [[\draw ($1) -- ($2);]]
	},
	{
		trigger = 'tikz_node',
		body = [[\node at ($1) {$2};]]
	},
	{
		trigger = 'tikz_plot',
		body = [[\draw[domain=$1:$2, variable=\x] plot ({\x}, {$3});]]
	},
	{
		trigger = 'tikz_axes',
		body = [[\draw[->, thin] ($1, 0) -- ($2, 0) node[right] {\$x\$};
\draw[->, thin] (0, $3) -- (0, $4) node[above] {\$y\$};]]
	},
	{
		trigger = 'frac',
		body = [[\frac{$1}{$2}]]
	},
	{
		trigger = 'bold',
		body = [[\textbf{$1}]]
	},
	{
		trigger = 'sqrt',
		body = [[\sqrt{$1}]]
	},
	{
		trigger = 'menge', -- german for set
		body = [[\mathbb{$1}]]
	},
	{
		trigger = 'minipage',
		body = [[\begin{minipage}{\textwidth}
    $1
\end{minipage}]]
	},
}
