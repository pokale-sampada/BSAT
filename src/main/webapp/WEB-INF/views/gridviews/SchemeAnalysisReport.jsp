
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="updateoutput" method="post" id="Saveform">
<!-- Page-header start -->
                                <div class="page-header" style="background-color: #027BC6;line-height: 2em;">
                                    <div class="row align-items-end">
                                        <div class="col-lg-8">
                                            <div class="page-header-title">
                                                <div class="d-inline" style="padding-left: 1em;">
                                                    <h4 style="color: white;">Scheme Analysis</h4>
                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="page-header-breadcrumb" style="padding-right: 1em;">
                                                <ul class="breadcrumb-title">
                                                    <li class="breadcrumb-item">
                                                        <a href=""> <i class="feather icon-home"></i> </a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="">Report</a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="schemeanalysisreport">Scheme Analysis</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              <!-- Page-header end -->
	<div class="card">
		<div class="card-header">
			<h5>Scheme Analysis</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row"></div>
			<div class="form-group row">
				<div class="col-md-2">
					<label class="control-label" for="inputSuccess">Scheme Name
						: <span class="required">*</span></label>
				</div>
				<div class="col-md-3">
					<select class="form-control form-control-sm"
						data-plugin-selectTwo name="scheme_name" id="scheme_name"
						required="required">
						<option>--Select--</option>
					</select>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<label class="control-label" for="inputSuccess">Distributors Name
						:  <span class="required">*</span></label>
				</div>
				<div class="col-md-3">
					
					<select class="form-control form-control-sm"
						data-plugin-selectTwo name="depot_name" id="depot_name"
						required="required">
						<option>--Select--</option>
					</select>
				</div>
				
			</div>
			<div class="form-group row">
			<div class="col-md-12" style="text-align: center;">
				<input type="button" class="btn btn-sm btn-primary" id="action4"
					name="gen_report" value="Show Report" onclick="myFunction2()"></input>
				<input type="button" class="btn btn-sm btn-primary" id="action5"
					name="show_report" value="Download Report" onclick="myFunction4()"></input>
			</div>
		</div>
		</div>
	</div>
	
		<label>Last Refreshed : ${LastRefresh}</label>
		<!-- start: page -->
		<div class="card">
		<div class="card-header">
			<h5>Scheme Analysis Report</h5>
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
			<table class="table table-bordered table-striped nowrap" id="fix-header">
					<thead>
						<tr>
							<th style="min-width: 50px;">ML</th>
							<th style="min-width: 120px;"><center>Scheme ID</center></th>
							<th style="min-width: 280px;"><center>Scheme Name</center></th>
							<th style="min-width: 50px;">Region</th>
							<th style="min-width: 100px;">Distributors</th>
							<th style="min-width: 50px;">Terr</th>
							<th style="min-width: 120px;"><center>TSI</center></th>
							<th style="min-width: 70px;">Customer</th>
							<th style="min-width: 50px;"><center>Site</center></th>
							<th style="min-width: 280px;">Dealer Name</th>
							<th style="min-width: 60px;">Club</th>
							<th style="min-width: 150px;">Scheme Section</th>
							<th style="min-width: 70px;">UOM</th>
							<th style="min-width: 100px;">Product</th>
							<th style="min-width: 80px;">Target</th>
							<th style="min-width: 80px;">Achieved</th>
							<th style="min-width: 80px;">Pending</th>
							<th style="min-width: 100px;">RW_DT</th>
							<th style="min-width: 50px;">Status</th>
							<th style="min-width: 100px;">Reward Type</th>
							<th style="min-width: 80px;">Reward Amount</th>
						</tr>
					</thead>
					<tbody>
						<%
							int j = 1;
						%>
						<c:forEach var="info" items="${Info_grid}" varStatus="status">

							<tr>
								<td>${info.ml}<input type="hidden" id="ml<%=j%>" name="ml"
									style="min-width: 100%" value="${info.ml}" /></td>
								<td>${info.schemeId}<input type="hidden"
									id="schemeId<%=j%>" name="schemeId"
									style="min-min-width: 200px" value="${info.schemeId}" /></td>
								<td>${info.scheme_name}<input type="hidden"
									id="scheme_name<%=j%>" name="scheme_name" style="width: 100%"
									value="${info.scheme_name}" /></td>
								<td>${info.regn}<input type="hidden" id="regn<%=j%>"
									name="regn" style="width: 100%" value="${info.regn}" /></td>
								<td>${info.depot}<input type="hidden" id="regn<%=j%>"
									name="regn" style="width: 100%" value="${info.regn}" /></td>
								<td>${info.terr_code}<input type="hidden"
									id="terr_code<%=j%>" name="terr_code" style="min-width: 100%"
									value="${info.terr_code}" /></td>
								<td>${info.tsi}<input type="hidden" id="tsi<%=j%>"
									name="tsi" style="min-width: 100%" value="${info.tsi}" /></td>
								<td>${info.customer}<input type="hidden"
									id="customer<%=j%>" name="customer" style="min-width: 100%"
									value="${info.customer}" /></td>
								<td>${info.site}<input type="hidden" id="site<%=j%>"
									name="site" style="min-width: 100%" value="${info.site}" /></td>
								<td>${info.dlr_name}<input type="hidden"
									id="dlr_name<%=j%>" name="dlr_name" style="min-width: 100%"
									value="${info.dlr_name}" /></td>
								<td>${info.club}<input type="hidden" id="club<%=j%>"
									name="club" style="min-width: 100%" value="${info.club}" /></td>
								<td>${info.reward_section}<input type="hidden"
									id="reward_section<%=j%>" name="reward_section"
									style="min-width: 100%" value="${info.reward_section}" /></td>
								<td>${info.uom}<input type="hidden" id="uom<%=j%>"
									name="uom" style="min-width: 100%" value="${info.uom}" /></td>
								<td>${info.product}<input type="hidden" id="product<%=j%>"
									name="product" style="min-width: 100%" value="${info.product}" /></td>
								<td>${info.target}<input type="hidden" id="target<%=j%>"
									name="target" style="min-width: 100%" value="${info.target}" /></td>
								<td>${info.achieved}<input type="hidden"
									id="achieved<%=j%>" name="achieved" style="min-width: 100%"
									value="${info.achieved}" /></td>
								<td>${info.pending}<input type="hidden" id="pending<%=j%>"
									name="pending" style="min-width: 100%" value="${info.pending}" /></td>
								<td>${info.reward_date1}<input type="hidden"
									id="reward_date<%=j%>" name="reward_date"
									style="min-width: 100%" value="${info.reward_date1}" /></td>
								<td>${info.status}<input type="hidden" id="status<%=j%>"
									name="status" style="min-width: 100%" value="${info.status}" /></td>
								<td>${info.reward_type}<input type="hidden"
									id="reward_type<%=j%>" name="reward_type"
									style="min-width: 100%" value="${info.reward_type}" /></td>
								<td>${info.reward_amt}<input type="hidden"
									id="reward_amt<%=j%>" name="reward_amt" style="min-width: 100%"
									value="${info.reward_amt}" /></td>

							</tr>
							<%
								j = j + 1;
							%>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		</div>
	</form>
	<!-- end: page -->

<script>

$(window).load(function() {

$('.required').css({
'color' : 'red'
});

});
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
				tr.append("_$ta" +  json[i].scheme_code + "_$tag");
				tr.append("_$ta" + json[i].start_date1 + "_$tag");
				tr.append("_$ta" + json[i].end_date1 + "_$tag");
				tr.append("_$ta" + json[i].submission_date1 + "_$tag");
				tr.append("_$ta" + json[i].active_flag + "_$tag");
		
				$('#datatable-editable').find('tbody').append(tr);
				//$('#datatable-editable').append(tr);
			}
		 */

		$('#datatable-editable').DataTable().draw();

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

<script>
	$(window)
			.load(
					function() {
						
						$('.col-xs-12.col-sm-12').css({
							'overflow-x' : 'auto'
						});
						
						$
								.ajax({
									url : '${pageContext.request.contextPath}/getschschemename',
									success : function(data) {

										var select = $('#scheme_name');
										select.find('option').remove();
										$('<option>').val("")
												.text("--Select--").appendTo(
														select);
										$
												.each(
														data,
														function(index, value) {
															var scheme_nm_code = value.scheme_name
																	+ '('
																	+ value.scheme_code
																	+ ')';
															if (value.scheme_id == "${scheme_id}") {
																$(
																		'<option selected>')
																		.val(
																				value.scheme_id)
																		.text(
																				scheme_nm_code)
																		.appendTo(
																				select);
															} else {
																$('<option>')
																		.val(
																				value.scheme_id)
																		.text(
																				scheme_nm_code)
																		.appendTo(
																				select);
															}
														});

									}
								});

						var region = "${scheme_id}";
						$
								.ajax({
									url : '${pageContext.request.contextPath}/getschemedepotdetails',
									//    data: ({depot :region}),
									success : function(data) {

										var select = $('#depot_name');
										select.find('option').remove();
										// 		$('<option>').val("").text("--Select--").appendTo(select);
										$
												.each(
														data,
														function(index, value) {

															if (value.depot_code == "${deptnm}") {

																$(
																		'<option selected>')
																		.val(
																				value.depot_code)
																		.text(
																				value.depot_name)
																		.appendTo(
																				select);
															} else {
																$('<option>')
																		.val(
																				value.depot_code)
																		.text(
																				value.depot_name)
																		.appendTo(
																				select);
															}

														});

									}
								});

						$('#scheme_name').change(function(event) {
						    var schemeid = $("select#scheme_name").val();
						    $.ajax({
//						         url: '${pageContext.request.contextPath}/getschemedepot',
						        url: '${pageContext.request.contextPath}/getschemedepotdetails',
						       data: ({schemeid : schemeid}),
						        success: function(data) {

						            var select = $('#depot_name');
						            select.find('option').remove();
									$('<option>').val("").text("--Select--").appendTo(select);
							            $.each(data, function(index, value) {
							            	
//						 	            	 if(value.depot_code == "${deptnm}"){

//						 						$('<option selected>').val(value.depot_code).text(value.depot_name).appendTo(select);
//						 	            	 } else {
//						 	            		 $('<option>').val(value.depot_code).text(value.depot_name).appendTo(select);
//						 	            	 }

//							 	            	 if(value.sch_depot_code == "${deptnm}"){

//							 						$('<option selected>').val(value.sch_depot_code).text(value.sch_depot_name).appendTo(select);
//							 	            	 } else {
								            		 $('<option>').val(value.sch_depot_code).text(value.sch_depot_name).appendTo(select);
//							 	            	 }


						            });

						        }
						     });

						});

					});
</script>
<script type="text/javascript">
	function myFunction3() {
		$("#loading").show();
	}

	function myFunction2() {
		var depot_name = $('#depot_name').val();
        var scheme_name = $('#scheme_name').val();

        if(scheme_name != ""){
        	window.location.href = "loadoutputdata?deptnm="+depot_name+"&schnm="+scheme_name+"";
        }else{
        	alert("Please select scheme name");
        }
	}

	function myFunction4() {
        var depot_name = $('#depot_name').val();
        var scheme_name = $('#scheme_name').val();
        
        if(scheme_name != ""){
        	window.location.href = "exportreport?deptnm="+depot_name+"&schnm="+scheme_name+"";
        }else{
        	alert("Please select scheme name");
        }
	}
</script>
