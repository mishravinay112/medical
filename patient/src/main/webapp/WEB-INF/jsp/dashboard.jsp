<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<div class="container text-center">    
  <div class="row">
    <div class="col-sm-3 well">
      <div class="well">
        <img src="userImage?id=${user.id}" class="img-responsive img-thumbnail" height="100" width="100" alt="${user.firstName} ${user.lastName}">
        <p class="divider"></p>
            <p><h4><a href="#" style="color:#CD5C5C">${user.firstName}&nbsp;${user.lastName}</a></h4></p>
      </div>
      <div class="well">
      <ul class="nav" style="color:#CD5C5C">
        <li><button class="btn btn-link" href="#" style="color:#CD5C5C" ><span class="glyphicon glyphicon glyphicon-home"></span></li></button><li>Dashboard</li>
        <li><button class="btn btn-link"style="color:#CD5C5C" data-toggle="modal" data-target="#doctors"><span class="glyphicon glyphicon-user"></span></li></button><li>Doctors</li>
        <li><button class="btn btn-link" style="color:#CD5C5C" data-toggle="modal" data-target="#medicines"><span class="glyphicon glyphicon-erase"></span></li></button><li>Medicines</li>
        <li><button class="btn btn-link" style="color:#CD5C5C" data-toggle="modal" data-target="#files"><span class="glyphicon glyphicon-folder-open"></span></li></button><li>Files</li>
         <li><button class="btn btn-link" style="color:#CD5C5C" data-toggle="modal" data-target="#"><span class="glyphicon glyphicon-thumbs-up"></span></li></button><li>Cure Date</li>
      </ul>
       </div>
       
<!--start of modal of left panal-->
       <!-- Modal -->
		<div id="doctors" class="modal fade" role="dialog">
  			<div class="modal-dialog">
    			<!-- Modal content-->
    			<div class="modal-content">
     						<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title text-center">
									<span style="text-decoration: underline; color: rgb(14, 118, 189);">MEDICAL</span>
									<span style="color: #CD5C5C; text-decoration: underline;">-CARD</span>
								</h4>
							</div>
      				<div class="modal-body">
        				<p><table class="table table-bordered">
        				<thead>
        				<tr>
        				<th>Doctor</th>
        				</tr>
        				</thead>
        				<tbody>
        				<tr><td><a href="#">Dr. John Smith</a></td></tr>
        				<tr><td><a href="#">Dr. Kiran Rao</a></td></tr>
        				<tr><td><a href="#">Dr. Sam Dwyne</a></td></tr>
        				</tbody>
        				</table>
        				</p>
     			 	</div>
     				
     				 <div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      				</div>
    			</div>
			</div>
		</div>
			
		<!-- Modal -->
		<div id="medicines" class="modal fade" role="dialog">
  			<div class="modal-dialog">

    				<!-- Modal content-->
    				<div class="modal-content">
     							<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title text-center">
												<span
														style="text-decoration: underline; color: rgb(14, 118, 189);">MEDICAL</span><span
														style="color: #CD5C5C; text-decoration: underline;">-CARD</span>
										</h4>
								</div>
      					<div class="modal-body">
        					<p>
        					 <div class="table-responsive text-center">
						<table class="table table-bordered ">
							<thead style="background-color: #CD5C5C;">
								<tr style="color: #f1f1f1">
									<th>Medicine</th>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Paracetamol</td>
								</tr>
								<tr>
									<td>Vicodene</td>
									
								</tr>
								<tr>
									<td>Soframicine</td>
									
                  
								</tr>
							</tbody>
						</table>
					</div>    	
        					
        					</p>
      					</div>
      					
      					<div class="modal-footer">
        					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      					</div>
    				</div>
			</div>
		</div>
		
		<!-- Modal of files-->
			<div id="files" class="modal fade" role="dialog">
  					<div class="modal-dialog">
    					<!-- Modal content-->
    					<div class="modal-content">
     						<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title text-center">
										<span
												style="text-decoration: underline; color: rgb(14, 118, 189);">MEDICAL</span><span
												style="color: #CD5C5C; text-decoration: underline;">-CARD</span>
									</h4>
							</div>
      					<div class="modal-body">
      							<script>
      								var count=0;
     								 function getFiles()
      								{
    	 								 var fileType=document.getElementById("fileTypes").value;
    	 									// alert("value of select : "+fileType);
    	 									 $("#fileSearchResult").show();
    	  									$.ajax({url: "/patient/getFiles?id=${user.id}&fileType="+fileType, success: function(result){
    	  										//alert(result)
    	  										console.log(result);
    	  										/* result=JSON.parse(result);
    	  										console.log(result); */
        	 									console.log("start of for loop");
        	 									var i;
        	 									for(i=count;i<result.length;i++,count++)
        	 									{
        	 										result[i]=JSON.parse(result[i]);
        	 										console.log(result[i]);
        	 										var element="";
        	 										element+="<button type='button' class='btn btn-success' data-toggle='modal' data-target='#"+result[i].userId+result[i].fileId+"'>"+result[i].date+"</button>"
        	 										document.getElementById('node').innerHTML=document.getElementById('node').innerHTML+element;
        	 										element="";
        	 										element+="<div id='"+result[i].userId+result[i].fileId+"' class='modal fade' role='dialog'>";
        	 										element+="<div class='modal-dialog'>";
        	 											element+="<!-- Modal content-->";
        	 												element+="<div class='modal-content text-center'>";
        	 													element+="<div class='modal-header'>";
        	 														element+="<button type='button' class='close' data-dismiss='modal'>&times;</button>";
        	 															element+="<h3 class='modal-title'>"+result[i].name+"</h3>&nbsp;<sub>"+result[i].date+"</sub>";
        	 																element+="</div>";
        	 																	element+="<div class='modal-body '>";
        	 																		element+="<p><img src='/patient/viewFile?fileId="+result[i].fileId+"' width='100%' height='100%'/></p><br><p>"+result[i].description+"</p>";
        	 																			element+="</div>";
        	 																				element+="<div class='modal-footer'>";
        	 																					element+="<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>";
        	 																						element+="</div>";
        	 																							element+="</div>";

        	 																								element+="</div>";
        	 																									element+="</div>";
        	 											
        	 																									document.getElementById('nodeForModal').innerHTML=document.getElementById('nodeForModal').innerHTML+element;
        	 																									console.log("element added")
        	 									}
        	 									console.log("end of for loop");
        	 									
        										}}); 
      								}
      							</script>

        							<form action="javascript:getFiles();" class="form-horizontal">
											<div class="well">
                        						<div class="col-lg-12">
                            						<div class="input-group">
                                 						<span class="input-group-addon">Choose file</span>
                                  							<script>
                                    							function show(obj)
                                   								 {
                                      
                                         								// document.getElementById("result").style.display='block';
                                            						var newThing = prompt('Enter a name for the new file type:');
                                          
                                           							 $.ajax({url: "/patient/updateFileType?id=${user.id}&fileType="+newThing, success: function(result){
                                            						console.log(result);
                                            						  $("#fileTypes").prepend(new Option(newThing,newThing));
                                            	 					 $("#selectFileTypes").prepend(new Option(newThing,newThing));
                                           						 		}});  
                                        								document.getElementById("fileTypes").options.selectedIndex = 0;
                                       //  alert("end");
                                    								}  
                                 								</script>
                                							<select id="fileTypes" class="selectpicker form-control" data-live-search="true" name="fileTypes"  onclick="if(this.selectedIndex==this.options.length- 1) show(this);">
                                      						
                                      						<%@page import="com.medical.connection.JdbcConfig,java.sql.*,com.medical.model.User" %>
                                     						<% ResultSet rs=null;
                                 						     try
                              									{
                              										Connection con=JdbcConfig.getConnection();
                              										User user=(User)request.getSession().getAttribute("user");
                              										String query="select name from filetype where id='"+user.getId()+"' or id is null";
                              										System.out.println("query to be fired : "+query);
                              										Statement st=con.createStatement();
                              										rs=st.executeQuery(query);
                              										int count=0;
                              										while(rs.next())
                              										{count++;System.out.println(rs.getString(1));
                              								%>	
                              								 <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                              								<%
                              										}
                              										System.out.println("count : "+count);
                              								
                              			
                              									}
                              								catch (Exception e)
                              								{
                              									e.printStackTrace();
                              								}
                                     						 %>
                                     						 <option value="newFile">
                                       						New File Type
                                      						</option>
                                						</select>
                                    				<span class="input-group-btn">
                                    					<button class="btn btn-default" type="submit">Get</button>
                                    				</span>
                              					</div>
                          					</div>
                          					<br>
            						</div>
        					</form>
        			
        			<div id="fileSearchResult" class="well" style="display:none;">
        			<script>
        			$(document).on("click", "#newFileButton", function(event)
        			{
        			   // alert( "button clicked" ); 
        				document.getElementById("fileSaveForm").style.display="block";
						document.getElementById("success").style.display="none";
        			});
        			</script>
        			<div class="btn-group" id='node'>
        				<button type="button" class="btn btn-success" data-toggle="modal" id="newFileButton" data-target="#newFile"><span class="glyphicon glyphicon-plus"></span></button>
        			</div>
        			</div>
        			</div>
				<div class="modal-footer">
        						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
     			</div>
     	</div>
    </div>
</div>
<!-- end of modal of files-->
					
        			<!-- Modal for new file-->
					<div id="newFile" class="modal fade" role="dialog">
  						<div class="modal-dialog">
    						<!-- Modal content-->
   							 <div class="modal-content">
      							 <div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title text-center">
											<span
													style="text-decoration: underline; color: rgb(14, 118, 189);">MEDICAL</span><span
													style="color: #CD5C5C; text-decoration: underline;">-CARD</span>
										</h4>
								</div>
      							
      							<div class="modal-body">
         						<script>
       								  function saveFile(formDt)
         							{
        	 							var formData = new FormData($("#fileSaveForm")[0]);
										console.log(formData);
										console.log("start posting updated user data");
										$.ajax({
		        								   type: "POST",
		         									url: '/patient/saveFile',
		           									data: formData, // serializes the form's elements.
		           									success: function(data)
		           									{
		           										
		           										document.getElementById("fileSaveForm").style.display="none";
		           										document.getElementById("success").style.display="block";
		               									//alert(data); 
		           									},
		           									cache: false,
		           									contentType: false,
		           									processData: false
		         								});
										console.log("done posting updated user data");
        	 							//document.getElementById("newFile").style.display="none";
         								}
         
         						</script>
         								<div class="alert alert-success fade in" id="success">
											<a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
												Your password has been successfully changed, Please login with <b>new password</b>.
										</div>
           								<form:form action="javascript:saveFile();" method="POST" id="fileSaveForm" role="form" enctype="multipart/form-data" modelAttribute="DataFile" autocomplete="off">
            								<fieldset>

              									<div class="form-group">
				   						       <label for="upload-photo">Please Select The File<span class="req">* </span></label>
                  									<form:input type="file"  id="upload-photo" path="file" required="required" ></form:input>
              									</div>
        

               										<div class="form-group"> 	 
                										<label for="name"><span class="req">* </span> File Name: </label>
                  										  <form:input class="form-control" type="text" name="name" path="name" required="required" ></form:input> 
               										 </div>
													<script>
													$(function() {
														$("#datepicker").datepicker({
															maxDate : '0',
															changeMonth : true,
															changeYear : true,
															yearRange : '1940:' + (new Date).getFullYear(),
															dateFormat : 'dd/mm/yy'
														});
													});
													</script>
           
           												<div class="form-group">
             											 <label for="datepicker"><span class="req">* </span> Date of File Genration: </label>
              												 <form:input type="text" path="date" class="form-control" id="datepicker" required="required" ></form:input>
         												 </div>
			
			
          												<div class="form-group">
															<label for="selectFileType"><span class="req" style="color:#CD5C5C">* </span>Select The File Type</label>
                											  <form:select id="selectFileTypes" path="fileType" class="selectpicker form-control" data-live-search="true" name="fileTypes"  onclick="if (this.selectedIndex==this.options.length - 1) show();">
                 												  <%
                 														 rs.beforeFirst();
                 												  
                  														 while(rs.next())
         																	{
         															%>
         															 <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
         															<%
         																	}
                   
                  													 %>
                  												</form:select>
          												</div>
          
            										<div class="form-group">
           												 <label for="description"><span class="req"> </span> description: </label>
                  											 <form:textarea name="description" path="Description" class="form-control" rows="5" form="fileSaveForm" placeholder="Enter description here"></form:textarea>
                     
           											 </div>
				
													<form:hidden path="userId" value="${user.id}"/>

           											 <div class="form-group">
             										   <input class="btn btn-success" type="submit" name="submit_reg" value="Save" >
           											 </div>
                     
            								</fieldset>
           							 </form:form><!-- ends register form -->
       
      						</div>
     						
     						<div class="modal-footer">
        						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
     						 </div>
    					</div>
    				</div>
 				</div>
    <!-- modal end -->
				
  
      
   
<!-- Modal  of cure dates-->
<div id="curedates" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
     <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title text-center">
							<span
								style="text-decoration: underline; color: rgb(14, 118, 189);">MEDICAL</span><span
								style="color: #CD5C5C; text-decoration: underline;">-CARD</span>
						</h4>
	</div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!--end of all modals of left panel-->
      
      <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
        <p><strong>Vinay!</strong></p>
        Dr. Shruti just checked your profile.
      </div>
     
    </div>
    
    <div class="col-sm-7">
    
      <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-default text-left">
            <div class="panel-body">
              <p contenteditable="true">How are you feeling today?</p>
              <button type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-thumbs-up"></span> Good
              </button>     
            </div>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>Dr. Tiju</p>
           <img src="img/drTiju.png" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Just Forgot that I had to mention something about someone to someone about how I forgot something, but now I forgot it. Ahh, forget it! Or wait. I remember.... no I don't.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>Dr. Pratibha</p>
           <img src="img/drPratibha.png" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Me aaj koi advice nahi dungi.Jo hai sab badiya baki tum log dekh lo :-)</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>Dr. Priyanka</p>
           <img src="img/drPriyanka.png" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>an apple a day keep the doctor away :-P</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>Anja Medical Store </p>
           <img src="img/pharmacist.jpg" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Sir your medicines will be delivered at 5 sharp please be available. I am updating schedules to your proile it will be verified by doctor as soon as possible.</p>
          </div>
        </div>
      </div>     
    </div>
    
    <div class="col-sm-2 well">
      <div class="thumbnail">
        <p>Important</p>
        <p><strong>Caretine Test</strong></p>
        <p>Fri. 3 March 2017</p>
        <button class="btn btn-primary">Info</button>
      </div>      
      <div class="well">
        <p><strong><span class="glyphicon glyphicon-remove"></span> Sugar Check</strong></p>
        <p>28 Feb 2017</p>
      </div>
      <div class="well">
        <p><strong><span class="glyphicon glyphicon-check"></span> Meeting to Dr. S.P. Jain</strong></p>
        <p>21 Feb 2017</p>
      </div>
    </div>
    <div id="nodeForModal"></div>
  </div>
</div>
