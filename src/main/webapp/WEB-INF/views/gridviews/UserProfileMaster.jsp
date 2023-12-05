<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Page-header start -->
<div class="page-header"
	style="background-color: #027BC6; line-height: 2em;">
	<div class="row align-items-end">
		<div class="col-lg-8">
			<div class="page-header-title">
				<div class="d-inline" style="padding-left: 1em;">
					<h4 style="color: white;">User Master</h4>

				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="page-header-breadcrumb" style="padding-right: 1em;">
				<ul class="breadcrumb-title">
					<li class="breadcrumb-item"><a href="admin"> <i
							class="feather icon-home"></i>
					</a></li>
					<li class="breadcrumb-item"><a href="#!">User Management</a></li>
					<li class="breadcrumb-item"><a href="#!">Update User Profile</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- Page-header end -->

<div class="card">
	<div class="card-header">
		<h5>User Master</h5>
		<div class="card-header-right">
			<ul class="list-unstyled card-option">
				<!-- <li><a href="saveregion"><i class="feather icon-plus" style="color: blue; font-size: 20px; font-weight: bold;"
					title="Add New Region "></i></a></li> -->
				<li><i class="feather icon-maximize full-card"></i></li>
				<li><i class="feather icon-minus minimize-card"></i></li>
				<li><i class="feather icon-trash-2 close-card"></i></li>
			</ul>
		</div>
	</div>
	<div class="card-block">
		<div class="dt-responsive table-responsive">
			<table id="header-footer-fix"
				class="table table-bordered nowrap table-hover">
				<thead>
					<tr>
						<th class="text-center">User ID</th>
						<th class="text-center">Username</th>
						<th class="text-center">User Type</th>
						<th class="text-center">First Name</th>
						<th class="text-center">Last Name</th>
						<th class="text-center">Active Directory ID</th>
					</tr>
				</thead>
				<tbody>
					<%
							int j = 1;
						%>
					<c:forEach var="viewprfinfo" items="${usermaster}"
						varStatus="status">
						<tr>
							<td>${viewprfinfo.user_id}</td>
							<td>
									<a href="userdetails?username=${viewprfinfo.user_name}">${viewprfinfo.user_name}</a>
								</td>
							<td>${viewprfinfo.user_type}</td>
							<td>${viewprfinfo.first_name}</td>
							<td>${viewprfinfo.last_name}</td>
							<td>${viewprfinfo.active_directory_id}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<th class="text-center">User ID</th>
						<th class="text-center">Username</th>
						<th class="text-center">User Type</th>
						<th class="text-center">First Name</th>
						<th class="text-center">Last Name</th>
						<th class="text-center">Active Directory ID</th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>



<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section role="main" class="content-body">
	<header class="page-header">
		<h2></h2>

		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li><a href="admin"> <i class="fa fa-home"></i>
				</a></li>
				<li><span>Setups</span></li>
				<li><span>Update User Profile</span></li>
			</ol>

			<a class="sidebar-right-toggle" data-open="sidebar-right"></a>
		</div>
	</header>

	<!-- start: page -->
	<section class="panel">
		<header class="panel-heading">
			<div class="panel-actions">
				<a href="#"></a>
			</div>

			<h2 class="panel-title">User Master</h2>
		</header>
		<div class="panel-body">
			<table class="table table-striped table-bordered table-hover"
				id="table1" cellspacing="0" style="max-width: 100%; margin: 0 auto;">
				<thead>
					<tr>
						<th class="center" width="10%">User ID</th>
						<th class="center" width="26%">Username</th>
						<th class="center" width="15%">User Type</th>
						<th class="center" width="10%">First Name</th>
						<th class="center" width="10%">Last Name</th>
						<th class="center" width="13%">Active Directory ID</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="viewprfinfo" items="${usermaster}"
						varStatus="status">
						<tr>
							<td>${viewprfinfo.user_id}</td>
							<td>
									<a href="userdetails?username=${viewprfinfo.user_name}">${viewprfinfo.user_name}</a>
								</td>
							<td>${viewprfinfo.user_type}</td>
							<td>${viewprfinfo.first_name}</td>
							<td>${viewprfinfo.last_name}</td>
							<td>${viewprfinfo.active_directory_id}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</section>
	<!-- end: page -->
</section>

<script src="resources/newportal/vendor/jquery/jquery.js"></script>

<script>
	$(document).ready(function() {
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

		$('#table1').DataTable().draw();

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
 --%>