<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



	<form class="form-horizontal form-bordered"
		action="generateRewardAnalysisReport" method="post" id="Saveform">
		 <!-- Page-header start -->
                                <div class="page-header" style="background-color: #027BC6;line-height: 2em;">
                                    <div class="row align-items-end">
                                        <div class="col-lg-8">
                                            <div class="page-header-title">
                                                <div class="d-inline" style="padding-left: 1em;">
                                                    <h4 style="color: white;">Reward Processing Request</h4>
                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="page-header-breadcrumb" style="padding-right: 1em;">
                                                <ul class="breadcrumb-title">
                                                    <li class="breadcrumb-item">
                                                        <a href="it"> <i class="feather icon-home"></i> </a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!">Report</a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!">Reward Processing Request</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Page-header end -->
                                
                                
   <!--      <div class="card">
		<div class="card-header">
			<h5>Scheme Outflow Details</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
				<table class="table table-bordered table-striped"
					id="datatable-editable"
					data-url="assets/ajax/ajax-datatables-sample.json">
					<thead>
														<tr>
														<th class="center" width="5%" >Sr. No.</th>
														<th class="center" width="10%">Scheme ID</th>
														<th class="center" width="15%">Scheme Code</th>
														<th class="center" width="15%">SCH Start Time</th>
														<th class="center" width="15%">SP Start Time</th>
														<th class="center" width="15%" >SP End Time</th>
														<th class="center" width="15%" >SCH End Time</th>
														<th class="center" width="15%" >Status</th>
														
														</tr>
					</thead>
					<tbody data-spy="scroll" data-target="#myscrollspy data-offset="20">
						<%
							int j6 = 1;
						%>
						<c:forEach var="viewprfinfo" items="${schememaster}" varStatus="status">
												<tr>
												<td>
												<input type="hidden" value="${viewprfinfo.rw_analysis_queue_id}"></input>
															<%=j6%>
													</td>
													<td>${viewprfinfo.scheme_id}		</td>
													<td>${viewprfinfo.scheme_code}		</td>
													<td>${viewprfinfo.start_time}		</td>
													<td>${viewprfinfo.sp_starttime}		</td>
													<td>${viewprfinfo.sp_endtime}		</td>
													<td>${viewprfinfo.end_time}			</td>
													<td>${viewprfinfo.status}</td>
													
													</tr>
													<% j6=j6+1; %>
												</c:forEach> 
																	</tbody>
				</table>
		</div>
		</div> -->

	<!-- start: page -->
	<section class="panel">
		<header class="panel-heading">
			<div class="panel-actions">
				<a href="#" class="fa fa-caret-down"></a> 
			</div>

				<h4 class="panel-title">Reward Processing Request Report Queue 1</h4>
		</header>
		<div class="panel-body">
			<table class="table table-bordered table-striped" id="datatable-editable1"
				data-url="assets/ajax/ajax-datatables-sample.json">
				 <thead>
														<tr>
														<th class="center" width="5%" >Sr. No.</th>
														<th class="center" width="10%">Scheme ID</th>
														<th class="center" width="15%">Scheme Code</th>
														<th class="center" width="15%">SCH Start Time</th>
														<th class="center" width="15%">SP Start Time</th>
														<th class="center" width="15%" >SP End Time</th>
														<th class="center" width="15%" >SCH End Time</th>
														<th class="center" width="15%" >Status</th>
														
														</tr>
													 </thead>	
											<tbody>
												<% int j=1; %>
											<c:forEach var="viewprfinfo" items="${schememaster}" varStatus="status">
												<tr>
												<td>
												<input type="hidden" value="${viewprfinfo.rw_analysis_queue_id}"></input>
															<%=j%>
													</td>
													<td>${viewprfinfo.scheme_id}		</td>
													<td>${viewprfinfo.scheme_code}		</td>
													<td>${viewprfinfo.start_time}		</td>
													<td>${viewprfinfo.sp_starttime}		</td>
													<td>${viewprfinfo.sp_endtime}		</td>
													<td>${viewprfinfo.end_time}			</td>
													<td>${viewprfinfo.status}</td>
													
													</tr>
													<% j=j+1; %>
												</c:forEach> 	
												
													</tbody>
			</table>
		</div>
	</section>
	<!-- end: page -->     <!-- second grid -->
	
	<section class="panel">
		<header class="panel-heading">
			<div class="panel-actions">
				<a href="#" class="fa fa-caret-down"></a>
			</div>

			<h4 class="panel-title">Reward Processing Request Report Queue 2</h4>
			
		</header>
		<div class="panel-body">
			<table class="table table-bordered table-striped" id="datatable-editable2"
				data-url="assets/ajax/ajax-datatables-sample.json">
				 <thead>
														<tr>
														<th class="center" width="5%" >Sr. No.</th>
														<th class="center" width="10%">Scheme ID</th>
														<th class="center" width="15%">Scheme Code</th>
														<th class="center" width="15%">SCH Start Time</th>
														<th class="center" width="15%">SP Start Time</th>
														<th class="center" width="15%" >SP End Time</th>
														<th class="center" width="15%" >SCH End Time</th>
														<th class="center" width="15%" >Status</th>
														</tr>
													 </thead>	
											<tbody>
												<% int j1=1; %>
											<c:forEach var="viewprfinfo1" items="${schememaster2}" varStatus="status">
												<tr>
												<td>
												<input type="hidden" value="${viewprfinfo1.rw_analysis_queue_id}"></input>
															<%=j1%>
													</td>
													<td>${viewprfinfo1.scheme_id}		</td>
													<td>${viewprfinfo1.scheme_code}		</td>
													<td>${viewprfinfo1.start_time}		</td>
													<td>${viewprfinfo1.sp_starttime}		</td>
													<td>${viewprfinfo1.sp_endtime}		</td>
													<td>${viewprfinfo1.end_time}			</td>
													<td>${viewprfinfo1.status}</td>
													
													</tr>
													<% j1=j1+1; %>
												</c:forEach> 	
												
													</tbody>
			</table>
		</div>
	</section>
	
	
	<!-- end: page -->     <!-- third grid -->
	
	<section class="panel">
		<header class="panel-heading">
			<div class="panel-actions">
				<a href="#" class="fa fa-caret-down"></a>
			</div>

			<h4 class="panel-title">Reward Processing Request Report Queue 3</h4>
			
		</header>
		<div class="panel-body">
			<table class="table table-bordered table-striped" id="datatable-editable3"
				data-url="assets/ajax/ajax-datatables-sample.json">
				 <thead>
														<tr>
														<th class="center" width="5%" >Sr. No.</th>
														<th class="center" width="10%">Scheme ID</th>
														<th class="center" width="15%">Scheme Code</th>
														<th class="center" width="15%">SCH Start Time</th>
														<th class="center" width="15%">SP Start Time</th>
														<th class="center" width="15%" >SP End Time</th>
														<th class="center" width="15%" >SCH End Time</th>
														<th class="center" width="15%" >Status</th>
														</tr>
													 </thead>	
											<tbody>
												<% int j3=1; %>
											<c:forEach var="viewprfinfo1" items="${schememaster3}" varStatus="status">
												<tr>
												<td>
												<input type="hidden" value="${viewprfinfo1.rw_analysis_queue_id}"></input>
															<%=j3%>
													</td>
													<td>${viewprfinfo1.scheme_id}		</td>
													<td>${viewprfinfo1.scheme_code}		</td>
													<td>${viewprfinfo1.start_time}		</td>
													<td>${viewprfinfo1.sp_starttime}		</td>
													<td>${viewprfinfo1.sp_endtime}		</td>
													<td>${viewprfinfo1.end_time}			</td>
													<td>${viewprfinfo1.status}</td>
													
													</tr>
													<% j3=j3+1; %>
												</c:forEach> 	
												
													</tbody>
			</table>
		</div>
	</section>
	
	
	<!-- end: page -->     <!-- fourth grid -->
	
	<section class="panel">
		<header class="panel-heading">
			<div class="panel-actions">
				<a href="#" class="fa fa-caret-down"></a>
			</div>

			<h4 class="panel-title">Reward Processing Request Report Queue 4</h4>
			
		</header>
		<div class="panel-body">
			<table class="table table-bordered table-striped" id="datatable-editable4"
				data-url="assets/ajax/ajax-datatables-sample.json">
				 <thead>
														<tr>
														<th class="center" width="5%" >Sr. No.</th>
														<th class="center" width="10%">Scheme ID</th>
														<th class="center" width="15%">Scheme Code</th>
														<th class="center" width="15%">SCH Start Time</th>
														<th class="center" width="15%">SP Start Time</th>
														<th class="center" width="15%" >SP End Time</th>
														<th class="center" width="15%" >SCH End Time</th>
														<th class="center" width="15%" >Status</th>
														</tr>
													 </thead>	
											<tbody>
												<% int j4=1; %>
											<c:forEach var="viewprfinfo1" items="${schememaster4}" varStatus="status">
												<tr>
												<td>
												<input type="hidden" value="${viewprfinfo1.rw_analysis_queue_id}"></input>
															<%=j4%>
													</td>
													<td>${viewprfinfo1.scheme_id}		</td>
													<td>${viewprfinfo1.scheme_code}		</td>
													<td>${viewprfinfo1.start_time}		</td>
													<td>${viewprfinfo1.sp_starttime}		</td>
													<td>${viewprfinfo1.sp_endtime}		</td>
													<td>${viewprfinfo1.end_time}			</td>
													<td>${viewprfinfo1.status}</td>
													
													</tr>
													<% j4=j4+1; %>
												</c:forEach> 	
												
													</tbody>
			</table>
		</div>
	</section>
	
	
	<section class="panel">
		<header class="panel-heading">
			<div class="panel-actions">
				<a href="#" class="fa fa-caret-down"></a> 
			</div>

			
		</header>
		<div class="panel-body">
			<table class="table table-bordered table-striped" id="datatable-editable5"
				data-url="assets/ajax/ajax-datatables-sample.json">
				 <thead>
														<tr>
														<th class="center" width="5%" >Sr. No.</th>
														<th class="center" width="10%">Scheme ID</th>
														<th class="center" width="15%">Scheme Code</th>
														<th class="center" width="15%">SCH Start Time</th>
														<th class="center" width="15%">SP Start Time</th>
														<th class="center" width="15%" >SP End Time</th>
														<th class="center" width="15%" >SCH End Time</th>
														<th class="center" width="15%" >Status</th>
														</tr>
													 </thead>	
											<tbody>
												<% int j5=1; %>
											<c:forEach var="viewprfinfo1" items="${schememaster5}" varStatus="status">
												<tr>
												<td>
												<input type="hidden" value="${viewprfinfo1.rw_analysis_queue_id}"></input>
															<%=j5%>
													</td>
													<td>${viewprfinfo1.scheme_id}		</td>
													<td>${viewprfinfo1.scheme_code}		</td>
													<td>${viewprfinfo1.start_time}		</td>
													<td>${viewprfinfo1.sp_starttime}		</td>
													<td>${viewprfinfo1.sp_endtime}		</td>
													<td>${viewprfinfo1.end_time}			</td>
													<td>${viewprfinfo1.status}</td>
													
													</tr>
													<% j5=j5+1; %>
												</c:forEach> 	
												
													</tbody>
			</table>
		</div>
	</section>


<script>
$(document).ready(function() {


		alert("Hiuu");
			
			$('#datatable-editable').DataTable({
		        fixedHeader: true
		    });
			$('.col-xs-12.col-sm-12').css({
				'overflow-x' : 'auto!important'
			});
		});
		
		
		
		
</script>	



		

 <script>
	$(document).ready(function() 
			{
	//alert("***");
		
	//	$.getJSON('${pageContext.request.contextPath}/load_Pending_IT_Scheme_Approval', // ${pageContext.request.contextPath}/load_Pending_IT_Scheme_Approval
	//	function(json) {
			/*
			$('#datatable-editable').dataTable( {
		        "aaData": json,
		        "columns": [
		            { "data": "scheme_id" } ,
		            { "data": "scheme_name" },
		            { "data": "scheme_code" },
		            { "data": "start_date1" }, 
		            { "data": "end_date1" },
		            { "data": "submission_date1" },
		            { "data": "active_flag" }
		        ]
		    })
		    */
		    
		//	var tr;
		
			
			/*
			$('#datatable-editable').DataTable().destroy();
			*/
			
			
		/* 	for (var i = 0; i < json.length; i++) {

				tr = $('<tr/>');
				tr.append("<td>" +i+"</td>");
				tr.append("<td>" + json[i].scheme_name + "</td>");
				tr.append("<td>" +  json[i].scheme_code + "</td>");
				tr.append("<td>" + json[i].start_date1 + "</td>");
				tr.append("<td>" + json[i].end_date1 + "</td>");
				tr.append("<td>" + json[i].submission_date1 + "</td>");
				tr.append("<td>" + json[i].active_flag + "</td>");
	
				$('#datatable-editable').find('tbody').append(tr);
				//$('#datatable-editable').append(tr);
			}
			*/
			
			$('#datatable-editable1').DataTable().draw();
			$('#datatable-editable2').DataTable().draw();
			$('#datatable-editable3').DataTable().draw();
			$('#datatable-editable4').DataTable().draw();
			$('#datatable-editable5').DataTable().draw();
			
	/* 	});  */
		
		//var oTable = $('#datatable-editable').DataTable( );
		// to reload
		//oTable.ajax.reload();
		
		/*
		var table = $('#datatable-editable').DataTable();
		table.draw();
		*/
		
	
		
		/*
	 $.ajax({
	    'url': "${pageContext.request.contextPath}/load_Pending_IT_Scheme_Approval",
	    'method': "GET",
	    'contentType': 'application/json'
	}).done( function(data) {
	    $('#datatable-editable').dataTable( {
	        "aaData": data,
	        "columns": [
	            { "data": "scheme_id" } ,
	            { "data": "scheme_name" },
	            { "data": "scheme_code" },
	            { "data": "start_date1" }, 
	            { "data": "end_date1" },
	            { "data": "submission_date1" },
	            { "data": "active_flag" }
	        ]
	    })
	}); */
	 
	}); 
			
</script>
