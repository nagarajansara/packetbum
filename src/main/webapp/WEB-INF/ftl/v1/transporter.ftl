<html>
<body>

<table id="results" class="table">
                        <thead>
                            <tr><th class="span1">deadline</th>
                            <th class="span3"><span class="wordbreakall">from</span></th>
                            <th class="span3"><span class="wordbreakall">to</span></th>
                            <th class="span1">length</th>
                            <th class="span1">weight</th>
                            <th class="span2"><span class="wordbreakall">set-up</span></th>
                          
                        </tr></thead>
                        <tbody>
                             <#list model["retrieveTpdateils"] as retrieveTpdateils>
                             
                             <tr>
                             <td> ${retrieveTpdateils.deadline}</td>
                              <td> ${retrieveTpdateils.tpfrom} </td>
                               <td> ${retrieveTpdateils.tpto}</td>
                                 <td>${retrieveTpdateils.length} </td>
                                <td>${retrieveTpdateils.weight} </td>
                               <td> ${retrieveTpdateils.setup}</td>
                             </tr>
                             
                             
                             </#list>
                               
                    </table>


</body>



</html>