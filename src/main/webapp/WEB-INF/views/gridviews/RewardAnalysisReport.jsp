<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <section role="main" class="content-body"> -->
	<!-- <header class="page-header">
		<h2>Reward Processing</h2>

		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li><a href=""> <i class="fa fa-home"></i>
				</a></li>
				<li><span>Report</span></li>
				<li><span>Reward Analysis Report</span></li>
			</ol>

			<a class="sidebar-right-toggle" data-open="sidebar-right"> <i
				class="fa fa-chevron-left"></i>
			</a>
		</div>
	</header> -->




	<form class="form-horizontal form-bordered"
		action="generateRewardAnalysisReport" method="post" id="Saveform">
		
		<!-- Page-header start -->
                                <div class="page-header" style="background-color: #027BC6;line-height: 2em;">
                                    <div class="row align-items-end">
                                        <div class="col-lg-8">
                                            <div class="page-header-title">
                                                <div class="d-inline" style="padding-left: 1em;">
                                                    <h4 style="color: white;">RW Analysis</h4>
                                                   
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
                                                    <li class="breadcrumb-item"><a href="rewardanalysisreport">RW Analysis</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              <!-- Page-header end -->

	<div class="card">
		<div class="card-block">
			<div class="form-group row">
				<div class="col-md-4">

					<label class="control-label">Scheme
						Name<span class="required">*</span>
					</label> <select data-plugin-selectTwo
						class="form-control form-control-sm" name="scheme_name"
						id="scheme_name"
						data-plugin-options='{ "placeholder": "Select", "allowClear": true }'
						required>
						<option selected="selected"></option>
					</select>
				</div>


				<div style="display: none;">
					<div style="display: none">
						<label class="control-label">Region <i class="menu-icon fa red"> *</i>
						</label> <select class="form-control form-control-sm" name="appl_regn_code" id="appl_regn_code" required>
						</select>
					</div>
				</div>


				<div class="col-md-4">

					<label class="control-label" >Distributors<span
						class="required">*</span></label> <select data-plugin-selectTwo
						class="form-control form-control-sm" name="appl_depot_code"
						id="appl_depot_code"
						data-plugin-options='{ "placeholder": "Select", "allowClear": true }'
						required>
						<option selected="selected"></option>
					</select>
				</div>
				<div class="col-md-4">

					<label class="control-label formmodifiedLable" for="inputDefault">Dealer
						Name<span class="required">*</span>
					</label> <select data-plugin-selectTwo
						class="form-control form-control-sm" name="dlr_ac_name"
						id="dlr_ac_name"
						data-plugin-options='{ "placeholder": "Select", "allowClear": true }'>
						<option selected="selected"></option>
					</select>
				</div>
			</div>
			<div class="form-group row">
			<div class="col-md-12" style="text-align: center;">
				<button class="btn btn-sm btn-primary" id="action4" value="Show Report"
					onclick="searchinfo()">Show Report</button>
				<button class="btn btn-sm btn-primary" id="action5" value="Download Report"
					onclick="downloadreport()">Download Report</button>
			</div>
			</div>
		</div>

	</div>

		<div class="form-group" style="text-align: center;">
			
		</div>

		<div style="display: none;">
			<div>
				<label>Bill To Id <i class="menu-icon fa red"> *</i>
				</label>

				<div>
					<div>
						<select name="bill_to_id" id="bill_to_id" required>
						</select>

					</div>
				</div>
			</div>
		</div>






		<label style="font-weight: bold !important">Redeemed On :</label>



	</form>

	<!-- start: page -->
	<div class="card">
		<div class="card-header">
			<h5>Reward Details</h5>
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

					
						<th class="col-md-4" style="min-width: 100px;">Distributors</th>
						
						<th class="col-md-4" style="min-width: 150px;">A/C No.</th>
						<!-- 														<th class="col-md-4" style="min-width:120px;">Bill To</th> -->
						<!-- 														<th class="col-md-4" style="min-width:120px;">Dlr Cat</th> -->
						<!-- 														<th class="col-md-4" style="min-width:100px;">Cust Type</th> -->
						<th class="col-md-4" style="min-width: 250px;">A/C Name</th>
						<th class="col-md-4" style="min-width: 250px;">Reward Section</th>
						<th class="col-md-4" style="min-width: 100px;">Reward Type</th>
						<th class="col-md-4" style="min-width: 100px;">Product</th>
						<th class="col-md-4" style="min-width: 100px;">Unit</th>
						<th class="col-md-4" style="min-width: 120px;">Reward Date</th>
						<th class="col-md-4" style="min-width: 100px;">LY</th>
						<th class="col-md-4" style="min-width: 100px;">Target</th>
						<th class="col-md-4" style="min-width: 100px;">TY</th>
						<th class="col-md-4" style="min-width: 100px;">TGT Pending</th>
						<th class="col-md-4" style="min-width: 100px;">Status</th>
						<!-- 														<th class="col-md-4" style="min-width:100px;">Add PTS</th> -->
						<!-- 														<th class="col-md-4" >Base Total</th> -->
						<th class="col-md-4" style="min-width: 250px;">Reward Desc</th>
						<th class="col-md-4" style="min-width: 150px;">Actual</th>
						<th class="col-md-4" style="min-width: 150px;">Requested</th>
						<th class="col-md-4" style="min-width: 250px;">Adjustment
							Reason</th>
						<th class="col-md-4" style="min-width: 150px;">Gift TO CN</th>
						<th class="col-md-4" style="min-width: 100px;">Converted CN
							Value</th>
						<th class="col-md-4" style="min-width: 100px;">Adjustment
							Flag</th>
						<!-- 														<th class="col-md-4" style="min-width:100px;">Adjustment Flag</th>												 -->
						<!-- 														<th class="col-md-4" >Interface Status</th> -->
						<!-- 														<th class="col-md-4" >Last Refreshed</th>																			 -->

					</tr>
				</thead>
				<tbody>
					<%
						int j = 1;
					%>
					<c:forEach var="info" items="${Info_grid}" varStatus="status">
						<c:set var="interface_status">${info.interface_status}</c:set>
						<c:set var="reward_section_total">${info.reward_section}</c:set>
						<c:set var="reward_gift_id">${info.reward_gift_id}</c:set>
						<c:set var="reward_color">${info.reward_color}</c:set>
						<%
							String interface_status = (String) pageContext.getAttribute("interface_status");
								// 															if (interface_status.equals("P")) {
						%>
						<%
							String reward_section_total = (String) pageContext.getAttribute("reward_section_total");
								String reward_gift_id = (String) pageContext.getAttribute("reward_gift_id");

								String reward_color = (String) pageContext.getAttribute("reward_color");
						%>
						<%
							if (interface_status.equals("P")) {
						%>
						<tr style="background-color: #c5d0dc;">
							<%
								} else {
							%>
						
						<tr>
							<%
								}
							%>


							<%-- 															<td><%=j%> --%>

							<!-- 															</td> -->
							<%-- <%  --%>
							<!--  															if (reward_section_total.equalsIgnoreCase("TOTAL")) { -->
							<%-- 															%> --%>

							<!-- 															<td> -->


							<input type="hidden" id="opa_analysis_id<%=j%>"
								name="opa_analysis_id" style="width: 100%"
								value="${info.opa_analysis_id}" />
							<input type="hidden" id="scheme_id<%=j%>" name="scheme_id"
								value="${info.scheme_id}" />
							<%-- 		<input type="hidden" id="scheme_code<%=j%>" name="scheme_code" value="${info.scheme_code}" />	 --%>
							<%-- 															<%} else {  --%>
							<%-- 															}%> --%>

							<%-- 															${info.regn}</td> --%>
							<%-- 															<td>${info.state}</td> --%>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.depot}</td>
							<%-- 															<td>${info.terr_code}</td> --%>
							<%-- 															<td>${info.terr_name}</td> --%>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.dlr_ac_no}</td>
							<%-- 															<td>${info.dlr_bill_to}</td> --%>
							<%-- 															<td>${info.dlr_cat}</td> --%>
							<%-- 															<td>${info.dlr_type}</td> --%>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.dlr_name}</td>

							<%-- 																<%} else { %> --%>

							<!-- <!-- 																		<td> -->


							<%-- 															<input type="hidden" id="opa_analysis_id<%=j%>" name="opa_analysis_id" style="width:100%" value="${info.opa_analysis_id}" /> --%>
							<%-- 																<input type="hidden" id="scheme_id<%=j%>" name="scheme_id" value="${info.scheme_id}"/> --%>
							<%-- 																<input type="hidden" id="scheme_code<%=j%>" name="scheme_code" value="${info.scheme_code}" />	 --%>
							<%-- <%-- 															<%} else {  --%>
							<%-- <%-- 															}%> --%>

							<%-- <%-- 															<input type="hidden" id="regn<%=j%>" name="regn" style="width:100%" value="${info.regn}" /></td> --%>
							<%-- <%-- 															<td><input type="hidden" id="state<%=j%>" name="state" style="width:100%" value="${info.state}" /></td> --%>
							<%-- 															<td><input type="hidden" id="depot<%=j%>" name="depot" style="width:100%" value="${info.depot}" /></td> --%>
							<%-- <%-- 															<td><input type="hidden" id="terr_code<%=j%>" name="terr_code" style="width:100%" value="${info.terr_code}" /></td> --%>
							<%-- <%-- 															<td><input type="hidden" id="terr_name<%=j%>" name="terr_name" style="width:100%" value="${info.terr_name}" /></td> --%>
							<%-- 															<td><input type="hidden" id="dlr_ac_no<%=j%>" name="dlr_ac_no" style="width:100%" value="${info.dlr_ac_no}" /></td> --%>
							<%-- <%-- 															<td><input type="hidden" id="dlr_bill_to<%=j%>" name="dlr_bill_to" style="width:100%" value="${info.dlr_bill_to}" /></td> --%>
							<%-- <%-- 															<td><input type="hidden" id="dlr_cat<%=j%>" name="dlr_cat" style="width:100%" value="${info.dlr_cat}"/></td> --%>
							<%-- <%-- 															<td><input type="hidden" id="dlr_type<%=j%>" name="dlr_type" style="width:100%" value="${info.dlr_type}" /></td> --%>
							<%-- 															<td><input type="hidden" id="dlr_name<%=j%>" name="dlr_name" style="width:100%" value="${info.dlr_name}" /></td> --%>

							<%-- 															<% }%> --%>

							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_section}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_type}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.product}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.unit}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_date1}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_ly}</td>

							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_target}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_ty}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.next_tgt_pending}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_status}</td>
							<%-- 															<td>${info.additional}</td>  --%>
							<%-- 															 <td>${info.base_total}</td> --%>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_description}<input
								type="hidden" id="reward_description<%=j%>"
								name="reward_description" style="min-width: 100%"
								value="${info.reward_description}" /></td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_total}<input
								type="hidden" id="reward_total<%=j%>" name="reward_total"
								style="min-width: 100%" value="${info.reward_total}" /></td>
							<%-- 															<%  
// 															if (interface_status.equals("P")) {
<!-- 															%> -->
<%--  															<td><input type="text" id="adjustments<%=j%>" name="adjustments" style="width:100%" value="${info.adjustments}" class="adjustpoints" onkeypress="return isNumber(event);" pattern="[0-9]{1,15}"/></td>  --%>
							<%-- 															<td><input type="text" id="adjustment_reason<%=j%>" name="adjustment_reason" style="width:100%" value="${info.adjustment_reason}" class="adjustreason"/></td>   --%>

							<!-- 															<td> -->
							<%-- 															<%  
// 															if (reward_gift_id.equals("")) {
<!-- 															%> -->
<%-- 															<input type="hidden" id="reward_gift_id<%=j%>" name="reward_gift_id" style="width:100%" value="${info.reward_gift_id}"   /> --%>
							<%-- 															<input type="text" id="gift_to_cn_flag<%=j%>" name="gift_to_cn_flag" style="width:100%" value="${info.gift_to_cn_flag}"   readonly/> --%>
							<%-- 															<%} else { %> --%>
							<%-- 															<input type="hidden" id="reward_gift_id<%=j%>" name="reward_gift_id" style="width:100%" value="${info.reward_gift_id}"   /> --%>
							<%-- 															<input type="text"  id="gift_to_cn_flag<%=j%>" name="gift_to_cn_flag" style="width:100%" value="${info.gift_to_cn_flag}"  onblur="gifttocn(<%=j%>)" />  --%>
							<%-- 															<% }%>  --%>
							<!-- 															</td>  -->
							<%-- 															<td><input type="text" id="converted_cn_value<%=j%>" name="converted_cn_value" style="width:100%" value="${info.converted_cn_value}" class="adjustcn" onkeypress="return isNumber(event);" pattern="[0-9]{1,15}" readonly="readonly" /></td> --%>
							<%-- 															<td><input type="text" id="attribute1<%=j%>" name="attribute1" style="width:100%" value="${info.attribute1}" readonly /></td> --%>
							<%-- 															<%} else { %> --%>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.adjustments}<input
								type="hidden" id="adjustments<%=j%>" name="adjustments"
								style="width: 100%" value="${info.adjustments}"
								class="adjustpoints" onkeypress="return isNumber(event);"
								pattern="[0-9]{1,15}" /></td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.adjustment_reason}<input
								type="hidden" id="adjustment_reason<%=j%>"
								name="adjustment_reason" style="width: 100%"
								value="${info.adjustment_reason}" class="adjustreason" /></td>

							<td bgcolor="<c:out value='${reward_color}'/>">${info.gift_to_cn_flag}<input
								type="hidden" id="gift_to_cn_flag<%=j%>" name="gift_to_cn_flag"
								style="width: 100%" value="${info.gift_to_cn_flag}"
								class="adjustgift" /></td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.converted_cn_value}<input
								type="hidden" id="converted_cn_value<%=j%>"
								name="converted_cn_value" style="width: 100%"
								value="${info.converted_cn_value}" class="adjustcn"
								onkeypress="return isNumber(event);" pattern="[0-9]{1,15}" /></td>
							<%-- 															<td>${info.attribute1}<input type="hidden" id="attribute1<%=j%>" name="attribute1" style="width:100%" value="${info.attribute1}" /></td> --%>
							<%-- 															<% }%>  --%>
							<%-- 															<td>${info.interface_status}</td>  --%>
							<%-- 															<td>${info.reward_last_update1}</td> --%>
							<%
								if (reward_section_total.equalsIgnoreCase("TOTAL")) {
							%>

							<td bgcolor="<c:out value='${reward_color}'/>">${info.attribute1}</td>
							<%
								} else {
							%>
							<td><input type="hidden" id="adjustment_status<%=j%>"
								name="adjustment_status" style="width: 100%"
								value="${info.attribute1}" /></td>
							<%
								}
							%>
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
	<%-- <section class="panel">
		<header class="panel-heading">
			<div class="panel-actions">
				<!-- <a href="#" class="fa fa-caret-down"></a> <a href="#"
					class="fa fa-times"></a> -->
			</div>

			<h2 class="panel-title">Reward Details</h2>
		</header>





		<div class="panel-body">
			<table class="table table-bordered table-hover"
				id="datatable-editable" style="overflow-x: auto;
    display: block;"
				data-url="assets/ajax/ajax-datatables-sample.json">
				<thead>
					<tr>

					
						<th class="col-md-4" style="min-width: 100px;">Distributors</th>
						
						<th class="col-md-4" style="min-width: 150px;">A/C No.</th>
						<!-- 														<th class="col-md-4" style="min-width:120px;">Bill To</th> -->
						<!-- 														<th class="col-md-4" style="min-width:120px;">Dlr Cat</th> -->
						<!-- 														<th class="col-md-4" style="min-width:100px;">Cust Type</th> -->
						<th class="col-md-4" style="min-width: 250px;">A/C Name</th>
						<th class="col-md-4" style="min-width: 250px;">Reward Section</th>
						<th class="col-md-4" style="min-width: 100px;">Reward Type</th>
						<th class="col-md-4" style="min-width: 100px;">Product</th>
						<th class="col-md-4" style="min-width: 100px;">Unit</th>
						<th class="col-md-4" style="min-width: 120px;">Reward Date</th>
						<th class="col-md-4" style="min-width: 100px;">LY</th>
						<th class="col-md-4" style="min-width: 100px;">Target</th>
						<th class="col-md-4" style="min-width: 100px;">TY</th>
						<th class="col-md-4" style="min-width: 100px;">TGT Pending</th>
						<th class="col-md-4" style="min-width: 100px;">Status</th>
						<!-- 														<th class="col-md-4" style="min-width:100px;">Add PTS</th> -->
						<!-- 														<th class="col-md-4" >Base Total</th> -->
						<th class="col-md-4" style="min-width: 250px;">Reward Desc</th>
						<th class="col-md-4" style="min-width: 150px;">Actual</th>
						<th class="col-md-4" style="min-width: 150px;">Requested</th>
						<th class="col-md-4" style="min-width: 250px;">Adjustment
							Reason</th>
						<th class="col-md-4" style="min-width: 150px;">Gift TO CN</th>
						<th class="col-md-4" style="min-width: 100px;">Converted CN
							Value</th>
						<th class="col-md-4" style="min-width: 100px;">Adjustment
							Flag</th>
						<!-- 														<th class="col-md-4" style="min-width:100px;">Adjustment Flag</th>												 -->
						<!-- 														<th class="col-md-4" >Interface Status</th> -->
						<!-- 														<th class="col-md-4" >Last Refreshed</th>																			 -->

					</tr>
				</thead>
				<tbody>
					<%
						int j = 1;
					%>
					<c:forEach var="info" items="${Info_grid}" varStatus="status">
						<c:set var="interface_status">${info.interface_status}</c:set>
						<c:set var="reward_section_total">${info.reward_section}</c:set>
						<c:set var="reward_gift_id">${info.reward_gift_id}</c:set>
						<c:set var="reward_color">${info.reward_color}</c:set>
						<%
							String interface_status = (String) pageContext.getAttribute("interface_status");
								// 															if (interface_status.equals("P")) {
						%>
						<%
							String reward_section_total = (String) pageContext.getAttribute("reward_section_total");
								String reward_gift_id = (String) pageContext.getAttribute("reward_gift_id");

								String reward_color = (String) pageContext.getAttribute("reward_color");
						%>
						<%
							if (interface_status.equals("P")) {
						%>
						<tr style="background-color: #c5d0dc;">
							<%
								} else {
							%>
						
						<tr>
							<%
								}
							%>


																						<td><%=j%>

							<!-- 															</td> -->
							<% 
							<!--  															if (reward_section_total.equalsIgnoreCase("TOTAL")) { -->
																						%>

							<!-- 															<td> -->


							<input type="hidden" id="opa_analysis_id<%=j%>"
								name="opa_analysis_id" style="width: 100%"
								value="${info.opa_analysis_id}" />
							<input type="hidden" id="scheme_id<%=j%>" name="scheme_id"
								value="${info.scheme_id}" />
									<input type="hidden" id="scheme_code<%=j%>" name="scheme_code" value="${info.scheme_code}" />	
																						<%} else { 
																						}%>

																						${info.regn}</td>
																						<td>${info.state}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.depot}</td>
																						<td>${info.terr_code}</td>
																						<td>${info.terr_name}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.dlr_ac_no}</td>
																						<td>${info.dlr_bill_to}</td>
																						<td>${info.dlr_cat}</td>
																						<td>${info.dlr_type}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.dlr_name}</td>

																							<%} else { %>

							<!-- <!-- 																		<td> -->


																						<input type="hidden" id="opa_analysis_id<%=j%>" name="opa_analysis_id" style="width:100%" value="${info.opa_analysis_id}" />
																							<input type="hidden" id="scheme_id<%=j%>" name="scheme_id" value="${info.scheme_id}"/>
																							<input type="hidden" id="scheme_code<%=j%>" name="scheme_code" value="${info.scheme_code}" />	
							<%-- 															<%} else { 
							<%-- 															}%>

							<%-- 															<input type="hidden" id="regn<%=j%>" name="regn" style="width:100%" value="${info.regn}" /></td>
							<%-- 															<td><input type="hidden" id="state<%=j%>" name="state" style="width:100%" value="${info.state}" /></td>
																						<td><input type="hidden" id="depot<%=j%>" name="depot" style="width:100%" value="${info.depot}" /></td>
							<%-- 															<td><input type="hidden" id="terr_code<%=j%>" name="terr_code" style="width:100%" value="${info.terr_code}" /></td>
							<%-- 															<td><input type="hidden" id="terr_name<%=j%>" name="terr_name" style="width:100%" value="${info.terr_name}" /></td>
																						<td><input type="hidden" id="dlr_ac_no<%=j%>" name="dlr_ac_no" style="width:100%" value="${info.dlr_ac_no}" /></td>
							<%-- 															<td><input type="hidden" id="dlr_bill_to<%=j%>" name="dlr_bill_to" style="width:100%" value="${info.dlr_bill_to}" /></td>
							<%-- 															<td><input type="hidden" id="dlr_cat<%=j%>" name="dlr_cat" style="width:100%" value="${info.dlr_cat}"/></td>
							<%-- 															<td><input type="hidden" id="dlr_type<%=j%>" name="dlr_type" style="width:100%" value="${info.dlr_type}" /></td>
																						<td><input type="hidden" id="dlr_name<%=j%>" name="dlr_name" style="width:100%" value="${info.dlr_name}" /></td>

																						<% }%>

							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_section}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_type}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.product}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.unit}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_date1}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_ly}</td>

							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_target}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_ty}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.next_tgt_pending}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_status}</td>
																						<td>${info.additional}</td> 
																						 <td>${info.base_total}</td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_description}<input
								type="hidden" id="reward_description<%=j%>"
								name="reward_description" style="min-width: 100%"
								value="${info.reward_description}" /></td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.reward_total}<input
								type="hidden" id="reward_total<%=j%>" name="reward_total"
								style="min-width: 100%" value="${info.reward_total}" /></td>
																						<%  
// 															if (interface_status.equals("P")) {
<!-- 															%> -->
<%--  															<td><input type="text" id="adjustments<%=j%>" name="adjustments" style="width:100%" value="${info.adjustments}" class="adjustpoints" onkeypress="return isNumber(event);" pattern="[0-9]{1,15}"/></td> 
																						<td><input type="text" id="adjustment_reason<%=j%>" name="adjustment_reason" style="width:100%" value="${info.adjustment_reason}" class="adjustreason"/></td>  

							<!-- 															<td> -->
																						<%  
// 															if (reward_gift_id.equals("")) {
<!-- 															%> -->
<%-- 															<input type="hidden" id="reward_gift_id<%=j%>" name="reward_gift_id" style="width:100%" value="${info.reward_gift_id}"   />
																						<input type="text" id="gift_to_cn_flag<%=j%>" name="gift_to_cn_flag" style="width:100%" value="${info.gift_to_cn_flag}"   readonly/>
																						<%} else { %>
																						<input type="hidden" id="reward_gift_id<%=j%>" name="reward_gift_id" style="width:100%" value="${info.reward_gift_id}"   />
																						<input type="text"  id="gift_to_cn_flag<%=j%>" name="gift_to_cn_flag" style="width:100%" value="${info.gift_to_cn_flag}"  onblur="gifttocn(<%=j%>)" /> 
																						<% }%> 
							<!-- 															</td>  -->
																						<td><input type="text" id="converted_cn_value<%=j%>" name="converted_cn_value" style="width:100%" value="${info.converted_cn_value}" class="adjustcn" onkeypress="return isNumber(event);" pattern="[0-9]{1,15}" readonly="readonly" /></td>
																						<td><input type="text" id="attribute1<%=j%>" name="attribute1" style="width:100%" value="${info.attribute1}" readonly /></td>
																						<%} else { %>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.adjustments}<input
								type="hidden" id="adjustments<%=j%>" name="adjustments"
								style="width: 100%" value="${info.adjustments}"
								class="adjustpoints" onkeypress="return isNumber(event);"
								pattern="[0-9]{1,15}" /></td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.adjustment_reason}<input
								type="hidden" id="adjustment_reason<%=j%>"
								name="adjustment_reason" style="width: 100%"
								value="${info.adjustment_reason}" class="adjustreason" /></td>

							<td bgcolor="<c:out value='${reward_color}'/>">${info.gift_to_cn_flag}<input
								type="hidden" id="gift_to_cn_flag<%=j%>" name="gift_to_cn_flag"
								style="width: 100%" value="${info.gift_to_cn_flag}"
								class="adjustgift" /></td>
							<td bgcolor="<c:out value='${reward_color}'/>">${info.converted_cn_value}<input
								type="hidden" id="converted_cn_value<%=j%>"
								name="converted_cn_value" style="width: 100%"
								value="${info.converted_cn_value}" class="adjustcn"
								onkeypress="return isNumber(event);" pattern="[0-9]{1,15}" /></td>
																						<td>${info.attribute1}<input type="hidden" id="attribute1<%=j%>" name="attribute1" style="width:100%" value="${info.attribute1}" /></td>
																						<% }%> 
																						<td>${info.interface_status}</td> 
																						<td>${info.reward_last_update1}</td>
							<%
								if (reward_section_total.equalsIgnoreCase("TOTAL")) {
							%>

							<td bgcolor="<c:out value='${reward_color}'/>">${info.attribute1}</td>
							<%
								} else {
							%>
							<td><input type="hidden" id="adjustment_status<%=j%>"
								name="adjustment_status" style="width: 100%"
								value="${info.attribute1}" /></td>
							<%
								}
							%>
						</tr>

						<%
							j = j + 1;
						%>

					</c:forEach>


				</tbody>
			</table> --%>


			<div class="wizard-actions">
				<input type="hidden" name="action" id="action" value="">
			</div>

		</div>
<!-- 	</section> -->
<!-- </section> -->

<!-- end: page -->


<script src="resources/newportal/vendor/jquery/jquery.js"></script>

<script>

$(window).load(function() {

$('.required').css({
'color' : 'red'
});

})
		$(document).ready(function() {
			$('#datatable-editable').DataTable().draw();
		});
		
		$( window ).scroll(function() {$(".table.table-bordered.table-striped.nowrap.dataTable.fixedHeader-floating").css({
			'overflow-x' : '' , 'display' : ''
		});});
	</script>



<script>

function downloadreport()
{
	if(document.getElementById("scheme_name").value == ""){
		alert("Please select scheme name");
	}else{
		var scheme_name=document.getElementById("scheme_name").value;	
		var depot_code=document.getElementById("appl_depot_code").value;
		var dealer_name=document.getElementById("dlr_ac_name").value;
		var bill_to_id=document.getElementById("bill_to_id").value;


		window.location.href="downloadRewardAnalysisReport?scheme_name="+scheme_name+"&depot_code="+depot_code+"&dealer_name="+dealer_name+"&bill_to_id="+bill_to_id;
	}	
}

function searchinfo()
{
	if(document.getElementById("scheme_name").value == ""){
		alert("Please select scheme name");
	}else{
		var scheme_name=document.getElementById("scheme_name").value;	
		var depot_code=document.getElementById("appl_depot_code").value;
		var dealer_name=document.getElementById("dlr_ac_name").value;
		var bill_to_id=document.getElementById("bill_to_id").value;


		window.location.href="generateRewardAnalysisReport?scheme_name="+scheme_name+"&depot_code="+depot_code+"&dealer_name="+dealer_name+"&bill_to_id="+bill_to_id;
	}	
}

function closeform()
{
	window.close();
}

function isNumber(evt) {
	var iKeyCode = (evt.which) ? evt.which : evt.keyCode;

	if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
    
	return false;

	
return true;
} 
</script>
<script>
				$(window).load(function(){
					$('.col-xs-12.col-sm-12').css({
						'overflow-x' : 'auto'
					});
					
					
					/* alert("hhh1");
					var id1=document.getElementById("scheme_name").value;
					$.ajax({
					    url: '${pageContext.request.contextPath}/getschemedepot',	
					    data: ({depot : id1}),
					    success: function(data) {	
					    	alert("hhh2");
					    	var select = $('#appl_depot_code');
					    	select.find('option').remove();
					    	$('<option>').val("").text("--select--").appendTo(select);
					           	  $.each(data, function(index, value) {		        	
					           		if(value.depot_name == "${deptnm}"){
					    	  $('<option selected>').val(value.depot_name).text(value.depot_name).appendTo(select);
					           		}else{
					           			$('<option>').val(value.depot_name).text(value.depot_name).appendTo(select); 			
					           		}
					    	});
					
					    }
					  });
					 */
					 
						$.ajax({
// 						    url: '${pageContext.request.contextPath}/getschemename4',
						    url: '${pageContext.request.contextPath}/gethistrwschemename',
						    success: function(data) {				        	
						    	var select = $('#scheme_name');
						    	select.find('option').remove();
						    	$('<option>').val("").text("--Select--").appendTo(select);
						           	  $.each(data, function(index, value) {	
						           		var scheme_nm_code = value.scheme_name + '(' + value.scheme_code + ')';
						           		  if(value.scheme_id == "${scheme_id}"){
						    	  $('<option selected>').val(value.scheme_id).text(scheme_nm_code).appendTo(select);
						           		  }else{
						           			$('<option>').val(value.scheme_id).text(scheme_nm_code).appendTo(select);
						           		  }
						    	});
						
						    }
						  });
					 
					 var schemeid = "${scheme_id}";
						$.ajax({
// 						    url: '${pageContext.request.contextPath}/getschemedepot',
						    url: '${pageContext.request.contextPath}/getschemedepotdetails',
						   data: ({schemeid :schemeid}),
						    success: function(data) {

						        var select = $('#appl_depot_code');
						        select.find('option').remove();
								$('<option>').val("").text("--Select--").appendTo(select);
						            $.each(data, function(index, value) {
						            	
// 						            	 if(value.depot_code == "${depo_code}"){

// 											$('<option selected>').val(value.depot_code).text(value.depot_name).appendTo(select);
// 						            	 } else {
// 						            		 $('<option>').val(value.depot_code).text(value.depot_name).appendTo(select);
// 						            	 }

						            	if(value.sch_depot_code == "${depo_code}"){

						 					$('<option selected>').val(value.sch_depot_code).text(value.sch_depot_name).appendTo(select);
						             	 } else {
						             		 $('<option>').val(value.sch_depot_code).text(value.sch_depot_name).appendTo(select);
						             	 }

						        });

						    }
						 });
						
						 var depo = "${depo_code}";
	
						
						$.ajax({

							
							url: '${pageContext.request.contextPath}/getdealer_name',
	                        data: ({depot :depo,
	                        	schemeid : schemeid}),
	                        
	                         success: function(data) {

	                        	 var select = $('#dlr_ac_name');
	 					    	select.find('option').remove();
	 					    	$('<option>').val("").text("--Select--").appendTo(select);
	 					           	  $.each(data, function(index, value) {		        	
// 	 					           		if(value.dlr_ac_no == "${dealer_code}"){

// 	 					           			$('<option selected>').val(value.dlr_ac_no).text(value.dlr_name).appendTo(select);
// 	 					           		}
// 	 					           		else {
// 	 					           		$('<option>').val(value.dlr_ac_no).text(value.dlr_name).appendTo(select);
// 	 					           		}

	 					           	if(value.dlr_bill_to == "${dealer_code}"){

 					           			$('<option selected>').val(value.dlr_bill_to).text(value.dlr_ac_no + " - " + value.dlr_name).appendTo(select);
 					           		}
 					           		else {
 					           		$('<option>').val(value.dlr_bill_to).text(value.dlr_ac_no + " - " + value.dlr_name).appendTo(select);
 					           		}

	 					           		
	 					    	});

	                         }
	                      });
						
						var dealer = "${dealer_code}";
						$.ajax({
	                         url: '${pageContext.request.contextPath}/getbilltoid',
	                        data: ({dealer :dealer,
	                        	depot :depo,
	                        	schemeid : schemeid}),
	                         success: function(data) {

	                        	 var select = $('#bill_to_id');
	 					    	select.find('option').remove();
// 	 					    	$('<option>').val("").text("--Select--").appendTo(select);
	 					           	  $.each(data, function(index, value) {		        	

		 					           		if(value.opa_rw_an_dealer_id == "${dealer_billto}"){

	 					           			$('<option selected>').val(value.opa_rw_an_dealer_id).text(value.opa_rw_an_dealer_id).appendTo(select); 			
		 					           		}
		 					           		else {
		 					           		$('<option>').val(value.opa_rw_an_dealer_id).text(value.opa_rw_an_dealer_id).appendTo(select);
		 					           		}
	 					    	});

	                         }
	                      });



			
					 
					 $('#scheme_name').change(function(event) {
	                     var schemeid = $("select#scheme_name").val();

	                    $.ajax({
// 	                         url: '${pageContext.request.contextPath}/getschemedepot',
	                         url: '${pageContext.request.contextPath}/getschemedepotdetails',
	                        data: ({schemeid :schemeid}),
	                         success: function(data) {

	                        	 var select = $('#appl_depot_code');
	 					    	select.find('option').remove();
	 					    	$('<option>').val("").text("--Select--").appendTo(select);
	 					           	  $.each(data, function(index, value) {		        	
	 					           		
	 					        
// 								        		 $('<option>').val(value.depot_code).text(value.depot_name).appendTo(select);
		            		 			$('<option>').val(value.sch_depot_code).text(value.sch_depot_name).appendTo(select);
							    
	 					           		
	 					    	});
	 					           	var select1 = $('#dlr_ac_name');
		 					    	select1.find('option').remove();
		 					    	$('<option>').val("").text("--Select--").appendTo(select1);
		 					    	
		 					    	
		 					    	var select2 = $('#bill_to_id');
		 					    	select2.find('option').remove();
		 					    	$('<option>').val("").text("--Select--").appendTo(select2);

	                         }
	                      });


	        });
					 
					 
					 
					  $('#appl_depot_code').change(function(event) {
						  
						  var schemeid = $("select#scheme_name").val();
		                     var depot = $("select#appl_depot_code").val();

		                    $.ajax({
		                         url: '${pageContext.request.contextPath}/getdealer_name',
		                        data: ({depot :depot,
		                        	schemeid : schemeid}),
		                        
		                         success: function(data) {

		                        	 var select = $('#dlr_ac_name');
		 					    	select.find('option').remove();
		 					    	$('<option>').val("").text("--Select--").appendTo(select);
		 					           	  $.each(data, function(index, value) {		        	
		 					           		
// 			 								$('<option>').val(value.dlr_ac_no).text(value.dlr_name).appendTo(select);
			 								
			 								$('<option>').val(value.dlr_bill_to).text(value.dlr_ac_no + " - " + value.dlr_name).appendTo(select);
			 					       		
		 					    	});
		 					           	  
		 					           	  
		 						    	
			 					    	
			 					    	var select2 = $('#bill_to_id');
			 					    	select2.find('option').remove();
			 					    	$('<option>').val("").text("--Select--").appendTo(select2);


		                         }
		                      });


		        });
					
					 $('#dlr_ac_name').change(function(event) {
	                     var dealer = $("select#dlr_ac_name").val();
	                     var schemeid = $("select#scheme_name").val();
	                     var depot = $("select#appl_depot_code").val();

	                    $.ajax({
	                         url: '${pageContext.request.contextPath}/getbilltoid',
	                        data: ({dealer :dealer,
	                        	depot :depot,
	                        	schemeid : schemeid}),
	                         success: function(data) {

	                        	 var select = $('#bill_to_id');
	 					    	select.find('option').remove();
// 	 					    	$('<option>').val("").text("--Select--").appendTo(select);
	 					           	  $.each(data, function(index, value) {		        	
	 					           		
		 					           		$('<option>').val(value.opa_rw_an_dealer_id).text(value.opa_rw_an_dealer_id).appendTo(select);
			 					           	
	 					    	});

	                         }
	                      });


	        });
					 
					 
					
					/*  $('#appl_regn_code').change(function(event) {
	                     var region = $("select#appl_regn_code").val();

	                    $.ajax({
	                         url: '${pageContext.request.contextPath}/loaddependentregion1',
		                        data: ({ava_region :region}),
	                         success: function(data) {

	                        	 var select = $('#depot_name');
	 					    	select.find('option').remove();
	 					    	$('<option>').val("").text("--select--").appendTo(select);
	 					           	  $.each(data, function(index, value) {		        	
	 					           		alert(value.depot_code);
	 					           			$('<option>').val(value.depot_code).text(value.depot_name).appendTo(select); 			
	 					           		
	 					    	});

	                         }
	                      });


	        }); */
					  
					  
					 var region_type = "REGION_TYPE";


		             $.ajax({
		                    url: '${pageContext.request.contextPath}/loadregion',
		                    data: ({region : region_type}),
		                    success: function(data) {
		                        var select = $('#appl_regn_code');
		                             select.find('option').remove();
						$('<option>').val("").text("--Select--").appendTo(select);
		                          $.each(data, function(index, value) {
		                              if(value == "${JSON.appl_regn_code}") {
		                          $('<option selected>').val(value).text(value).appendTo(select);
		                              }else{
						$('<option>').val(value).text(value).appendTo(select);
		                              }
		                        });

		                    }
		                   });
		             
		             
		            
		             
		             $('#depot_name').change(function(event) {
		            	
	                     var region = $("select#depot_name").val();

	                    $.ajax({
	                         url: '${pageContext.request.contextPath}/getdealer_name',
	                        data: ({depot :region}),
	                         success: function(data) {

	                        	 var select = $('#dealer_name');
							    	select.find('option').remove();
							    	$('<option>').val("").text("--Select--").appendTo(select);
							           	  $.each(data, function(index, value) {		        	
							           		if(value.depot_name == "${deptnm}"){
							    	  $('<option selected>').val(value.dealer_name).text(value.dealer_name).appendTo(select);
							           		}else{
							           			$('<option>').val(value.dealer_name).text(value.dealer_name).appendTo(select); 			
							           		}
							    	});

	                         }
	                      });


	        });
		             		             
					$.ajax({
					    url: '${pageContext.request.contextPath}/getschemeterr',	
					    success: function(data) {				        	
					    	var select = $('#terr_name');
					    	select.find('option').remove();
					    	$('<option>').val("").text("--Select--").appendTo(select);
					           	  $.each(data, function(index, value) {		        	
					           		if(value.depot_name == "${deptnm}"){
					    	  $('<option selected>').val(value.depot_name).text(value.depot_name).appendTo(select);
					           		}else{
					           			$('<option>').val(value.depot_name).text(value.depot_name).appendTo(select); 			
					           		}
					    	});
					
					    }
					  });

		});
				</script>
<script>
        function myFunction1()
        {
        	setTimeout(myFunction3, 1000);
//         	  var depot_name = $('#depot_name').val();
				var depot_name = "011:Vadodara-2";
              var scheme_id = $('#scheme_name').val();
              
        	$.ajax({
			    url: '${pageContext.request.contextPath}/callopa',
			    data:({depot_name : depot_name ,scheme_id : scheme_id}),
			    success: function(data) {				        	
			    	
// 			    		 $("#show_report").show();  
// 			       		$("#show_details").show();
// 			       		$("#gen_report").hide();
			       		$("#loading").hide();
			       		myFunction2();
			    }
			  });
             		
       		
        	
        	
        		
        	
       //	 window.location.href = "callopa?deptnm="+depot_name+"&&schnm="+scheme_name+"";
        }
        
        function myFunction3()
        {
        	$("#loading").show();	
        }

        function myFunction2()
        {
//         	 $("#gen_report").hide(); 
            var depot_name = $('#depot_name').val();
            var scheme_name = $('#scheme_name').val();

        window.location.href = "loadrewarddata?schnm="+scheme_name+"";
        //$("#show_details").show();
        }
        
        function gifttocn(j)
        {
        	var gift_to_cn_flag = $('#gift_to_cn_flag'+j).val();
        	var n = gift_to_cn_flag.charCodeAt(0);
        	if(gift_to_cn_flag.length == 1 ){
        		if(n == 89 || n == 78 ) {
                	var reward_gift_id = $('#reward_gift_id'+j).val();
                	var reward_total = $('#reward_total'+j).val();
                	var adjustments = $('#adjustments'+j).val();
                	var adjustment_reason = $('#adjustment_reason'+j).val();
                	var converted_cn_value = '0';
                	if(gift_to_cn_flag == 'Y') 
                	{
                		$('#attribute1'+j).val("Y");
                		$.ajax({
                		    url: '${pageContext.request.contextPath}/getgifttocn',
                		    data: ({reward_gift_id :reward_gift_id}),
                		    success: function(data) {	
                		    	var gift_to_cn = data;
                		    	
                		    	if(gift_to_cn == 0) {
                		    		if(adjustments == 0 && adjustment_reason == '') {
                		        		$('#attribute1'+j).val("");
                		        	}
                		    		$('#gift_to_cn_flag'+j).val("N");
                		    		alert("Gift to CN not allowed for this Gift as Gift to CN value for this gift is 0. ");
                		    	}
                		    	
                		    	converted_cn_value = gift_to_cn *  reward_total;
                		    	$('#converted_cn_value'+j).val(converted_cn_value);  
                		    	
                		    	   	  

                		    }
                		});
                	}
                	else {
                		$('#converted_cn_value'+j).val(converted_cn_value);
                		if(adjustments == 0 && adjustment_reason == '') {
                			$('#attribute1'+j).val("");
                		}
                	}

        		} else {
       			 alert("Only 'Y' or 'N' is allowed for Gift to CN flag");
    			 $('#gift_to_cn_flag'+j).val("N");
    			}
        	} else {
        		alert("Only 'Y' or 'N' is allowed for Gift to CN flag");
        		$('#gift_to_cn_flag'+j).val("N");
        	}
        }
        </script>


<script>
		    function submitform(j)
		    {
		    	$('#action').val("Update");
		    	
		    	 var adjustflag = $('#attribute1'+j).val();
		    	 
				if(adjustflag == "Y")
		         {
					
					var adjustments = $('#adjustments'+j).val();
					var adjustment_reason = $('#adjustment_reason'+j).val();
					
					if(adjustments == "" || adjustment_reason == "") {
						alert("Please provide adjustment amount and reason.");
						
					} else {
				         var aa = confirm('Do you want to update this scheme?')
				         if(aa == true)
				         {
				        	 var table = $('#table1').DataTable();
				        	 var data = table.$('input, select').serialize();
				        	 var formdata = $('#Saveform').serialize();
				             $('#Saveform').submit();
				             
		// 		             $.ajax({
		// 		 			    url: '${pageContext.request.contextPath}/updateoutput',
		// 		 			   type: 'post',
		// 		 			    data: data,
		// 		 			    success: function(data) {				        	
				 			    	
		// 		 			    }
		// 		 			  });
				             
				             }
				         else {
				                 return false;
				             }
					}
		         } else {
		        	 var aa = confirm('Do you want to update this scheme?')
			         if(aa == true)
			         {
			        	 var table = $('#table1').DataTable();
			        	 var data = table.$('input, select').serialize();
			        	 var formdata = $('#Saveform').serialize();
			             $('#Saveform').submit();
			             
	// 		             $.ajax({
	// 		 			    url: '${pageContext.request.contextPath}/updateoutput',
	// 		 			   type: 'post',
	// 		 			    data: data,
	// 		 			    success: function(data) {				        	
			 			    	
	// 		 			    }
	// 		 			  });
			             
			             }
			         else {
			                 return false;
			             }
		         }
		    }
		    
		    function submitform1(j)
		    {
		    	$('#action').val("Freeze");
		    	
		    	var adjustflag = $('#attribute1'+j).val();
		    	 
		    	
		    	if(adjustflag == "Y")
		         {
		    	
					var adjustments = $('#adjustments'+j).val();
					var adjustment_reason = $('#adjustment_reason'+j).val();
					
					
					if(adjustments == "" || adjustment_reason == "") {
						alert("Please provide adjustment amount and reason.");
						
					} else {
				         var aa = confirm('Are you sure to freeze this scheme?')
				         if(aa == true)
				         {
				             $('#Saveform').submit();
				             }
				         else {
				                 return false;
				             }
					}
		         } else {
		        	 var aa = confirm('Are you sure to freeze this scheme?')
			         if(aa == true)
			         {
			             $('#Saveform').submit();
			             }
			         else {
			                 return false;
			             }
		         }
		    }
		    </script>

<script>
		 $('.adjustpoints').keyup(function(){	
			 
		 	var sum = 0;			 
			var count = $('.adjustpoints').index(this)+1;
			var adjustments = $('#adjustments'+count).val();
        	var adjustment_reason = $('#adjustment_reason'+count).val();
			
// 			 $('#sch_tot_cn_pts'+count).val("0"); 
			
// 			 var part1_value = $('#part1_value'+count).val();  
// 			 var part2_value = $('#part2_value'+count).val();  
// 			 var sch_adj_pts = $('#sch_adj_pts'+count).val();  
			 
// 			 var sum = parseInt(part1_value) + parseInt(part2_value) + parseInt(sch_adj_pts);
			 
// 			 $('#sch_tot_cn_pts'+count).val(sum);
			 if(adjustments == 0 && adjustment_reason == '') {
             	$('#attribute1'+count).val("");
             } else {
            	 $('#attribute1'+count).val("Y");
             }
			 
		 });
		 
		 $('.adjustreason').keyup(function(){	
			 
			 	var sum = 0;			 
				var count = $('.adjustreason').index(this)+1;
				var adjustments = $('#adjustments'+count).val();
	        	var adjustment_reason = $('#adjustment_reason'+count).val();
				
//	 			 $('#sch_tot_cn_pts'+count).val("0"); 
				
//	 			 var part1_value = $('#part1_value'+count).val();  
//	 			 var part2_value = $('#part2_value'+count).val();  
//	 			 var sch_adj_pts = $('#sch_adj_pts'+count).val();  
				 
//	 			 var sum = parseInt(part1_value) + parseInt(part2_value) + parseInt(sch_adj_pts);
				 
//	 			 $('#sch_tot_cn_pts'+count).val(sum);
				 if(adjustments == 0 && adjustment_reason == '') {
	             	$('#attribute1'+count).val("");
	             } else {
	            	 $('#attribute1'+count).val("Y");
	             }
				 
			 });
		 
		 $('.adjustgift').keyup(function(){	
			 
			 	var sum = 0;			 
				var count = $('.adjustgift').index(this)+1;
				
//	 			 $('#sch_tot_cn_pts'+count).val("0"); 
				
//	 			 var part1_value = $('#part1_value'+count).val();  
//	 			 var part2_value = $('#part2_value'+count).val();  
//	 			 var sch_adj_pts = $('#sch_adj_pts'+count).val();  
				 
//	 			 var sum = parseInt(part1_value) + parseInt(part2_value) + parseInt(sch_adj_pts);
				 
//	 			 $('#sch_tot_cn_pts'+count).val(sum);
				 $('#attribute1'+count).val("Y");
				 
			 });
		 
		 $('.adjustcn').keyup(function(){	
			 
			 	var sum = 0;			 
				var count = $('.adjustcn').index(this)+1;
				
//	 			 $('#sch_tot_cn_pts'+count).val("0"); 
				
//	 			 var part1_value = $('#part1_value'+count).val();  
//	 			 var part2_value = $('#part2_value'+count).val();  
//	 			 var sch_adj_pts = $('#sch_adj_pts'+count).val();  
				 
//	 			 var sum = parseInt(part1_value) + parseInt(part2_value) + parseInt(sch_adj_pts);
				 
//	 			 $('#sch_tot_cn_pts'+count).val(sum);
				 $('#attribute1'+count).val("Y");
				 
			 });
		 </script>


<script>
		function showgrid(){
			$('#grid1').show();
		}
		</script>
<script>
	$(document).ready(function(){
		
		$("#loading").hide();
		
	})
	</script>

