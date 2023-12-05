<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	
	 <!-- Page-header start -->
                                <div class="page-header" style="background-color: #027BC6;line-height: 2em;">
                                    <div class="row align-items-end">
                                        <div class="col-lg-8">
                                            <div class="page-header-title">
                                                <div class="d-inline" style="padding-left: 1em;">
                                                    <h4 style="color: white;">Scheme Master</h4>
                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="page-header-breadcrumb" style="padding-right: 1em;">
                                                <ul class="breadcrumb-title">
                                                    <li class="breadcrumb-item">
                                                        <a href="home"> <i class="feather icon-home"></i> </a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!">Scheme Master</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Page-header end -->
	
	<div class="card">
		<div class="card-header">
			<h5>Scheme Master</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
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
							<th class="text-center" width="10%">Sr.No.</th>
							<th class="text-center" width="26%">Scheme Name</th>
							<th class="text-center" width="15%">Scheme Code</th>
							<th class="text-center" width="10%">Effective From</th>
							<th class="text-center" width="10%">Effective To</th>
							<th class="text-center" width="13%">Submission Date</th>
							<th class="text-center" width="16%">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
							int j = 1;
						%>
						<c:forEach var="viewprfinfo" items="${schememaster}"
							varStatus="status">
							<tr>
								<td class="text-center"><%=j%></td>
								<td><a href="schemedetails?scheme_id=${viewprfinfo.scheme_id}">${viewprfinfo.scheme_name}</a></td>
								<td class="text-center">${viewprfinfo.scheme_code}</td>
								<td class="text-center">${viewprfinfo.start_date1}</td>
								<td class="text-center">${viewprfinfo.end_date1}</td>
								<td class="text-center">${viewprfinfo.submission_date1}</td>
								<td class="text-center">${viewprfinfo.active_flag}</td>
							</tr>
							<%
								j = j + 1;
							%>
						</c:forEach>
					</tbody>
					<!-- 
					 <tfoot>
						<tr>
							<th class="text-center" width="10%">Sr.No.</th>
							<th class="text-center" width="26%">Scheme Name</th>
							<th class="text-center" width="15%">Scheme Code</th>
							<th class="text-center" width="10%">Effective From</th>
							<th class="text-center" width="10%">Effective To</th>
							<th class="text-center" width="13%">Submission Date</th>
							<th class="text-center" width="16%">Status</th>
						</tr>
					</tfoot> 
					 -->
				</table>
			</div>
		</div>
	</div>

