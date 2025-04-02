<span style="color:darkorange"><strong>Initialization:</strong></span>  
<span style="color:blue">Start by initializing the algorithm:</span>  
<span style="color:blue">N'</span> = {<span style="color:purple">u</span>} <span style="color:gray">/* Add the starting node u to the set of visited nodes */</span>  
<span style="color:blue">For all nodes</span> <span style="color:purple">v</span>:  
<span style="color:blue">If</span> <span style="color:purple">v</span> <span style="color:blue">is adjacent to</span> <span style="color:purple">u</span>:  
D(<span style="color:purple">v</span>) = c(<span style="color:purple">u</span>,<span style="color:purple">v</span>) <span style="color:gray">/* Set the cost to reach v as the cost of the edge from u to v */</span>  
<span style="color:blue">Else</span>:  
D(<span style="color:purple">v</span>) = ∞ <span style="color:gray">/* Set the cost to reach v as infinity if there is no direct edge */</span>  

<br>

<span style="color:darkorange"><strong>Loop:</strong></span>  
<span style="color:blue">Repeat the following steps until all nodes are visited:</span>  
<span style="color:blue">Find</span> <span style="color:purple">w</span> <span style="color:blue">not in</span> <span style="blue">N'</span> <span style="color:blue">such that</span> D(<span style="color:purple">w</span>) <span style="color:blue">is minimum</span>  
<span style="color:gray">/* Select the unvisited node with the smallest known distance */</span>  
<span style="color:blue">Add</span> <span style="color:purple">w</span> <span style="color:blue">to</span> <span style="color:blue">N'</span> <span style="color:gray">/* Mark w as visited */</span>  
<span style="color:blue">Update</span> D(<span style="color:purple">v</span>) <span style="color:blue">for all</span> <span style="color:purple">v</span> <span style="color:blue">adjacent to</span> <span style="color:purple">w</span> <span style="color:blue">and not in</span> <span style="color:blue">N'</span>:  
D(<span style="color:purple">v</span>) = <span style="color:blue">min</span>( D(<span style="color:purple">v</span>), D(<span style="color:purple">w</span>) + c(<span style="color:purple">w</span>,<span style="color:purple">v</span>) )  
<span style="color:gray">/* Update the cost to reach v as the smaller of the current cost or the cost to reach w plus the edge cost from w to v */</span>  

<br>
<span style="color:blue">Continue until all nodes are in</span> <span style="color:blue">N'</span>.
