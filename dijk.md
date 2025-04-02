<span style="color:darkorange"><strong>Initialization:</strong></span>  
<span style="color:teal">2</span> <span style="color:blue">N'</span> = {<span style="color:purple">u</span>}  
<span style="color:teal">3</span> <span style="color:blue">for all nodes</span> <span style="color:purple">v</span>  
<span style="color:teal">4</span> <span style="color:blue">if</span> <span style="color:purple">v</span> <span style="color:blue">adjacent to</span> <span style="color:purple">u</span>  
<span style="color:teal">5</span> <span style="color:blue">then</span> D(<span style="color:purple">v</span>) = c(<span style="color:purple">u</span>,<span style="color:purple">v</span>)  
<span style="color:teal">6</span> <span style="color:blue">else</span> D(<span style="color:purple">v</span>) = ∞  

<br>

<span style="color:darkorange"><strong>Loop:</strong></span>  
<span style="color:teal">9</span> <span style="color:blue">find</span> <span style="color:purple">w</span> <span style="color:blue">not in</span> <span style="color:blue">N'</span> <span style="color:blue">such that</span> D(<span style="color:purple">w</span>) <span style="color:blue">is a minimum</span>  
<span style="color:teal">10</span> <span style="color:blue">add</span> <span style="color:purple">w</span> <span style="color:blue">to</span> <span style="color:blue">N'</span>  
<span style="color:teal">11</span> <span style="color:blue">update</span> D(<span style="color:purple">v</span>) <span style="color:blue">for all</span> <span style="color:purple">v</span> <span style="color:blue">adjacent to</span> <span style="color:purple">w</span> <span style="color:blue">and not in</span> <span style="color:blue">N'</span> :  
<span style="color:teal">12</span> D(<span style="color:purple">v</span>) = <span style="color:blue">min</span>( D(<span style="color:purple">v</span>), D(<span style="color:purple">w</span>) + c(<span style="color:purple">w</span>,<span style="color:purple">v</span>) )  
<span style="color:teal">13</span> <span style="color:gray">/* new cost to v is either old cost to v or known</span>  
<span style="color:teal">14</span> <span style="color:gray">shortest path cost to w plus cost from w to v */</span>  
<span style="color:teal">15</span> <span style="color:blue">until</span> <span style="color:blue">all nodes in</span> <span style="color:blue">N'</span>
