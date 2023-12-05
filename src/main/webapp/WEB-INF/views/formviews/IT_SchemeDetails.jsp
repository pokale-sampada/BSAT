
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form action="ITschemerequest" class="form-horizontal" id="Saveform"
	ModelAttribute="New_Scheme_mstr" method="Post"
	enctype="multipart/form-data">
	<div class="card">
		<div class="card-header">
			<h5>Scheme Details</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row">
				<!--  Row 1 Started -->
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Name</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.scheme_name}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Code</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.scheme_code}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Status</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.active_flag}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Type</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.scheme_type}"
						name="scheme_type" id="scheme_type">
				</div>
			</div>
			<div class="form-group row">
				<!--  Row 2 Started -->
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Business
						Line</label> <input type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled=""
						value="${JSON.scheme_business_line}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Serial No</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.scheme_srl_no}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Budget</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.scheme_budget}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Version</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.revision}">
				</div>
			</div>
			<div class="form-group row">
				<!--  Row 3 Started -->
				<div class="col-md-3">
					<label class="block" for="inputDefault">Effective Date From</label>
					<input type="text"
						class="form-control form-control-sm form-control-primary"
						id="start_date" name="start_date" id="inputDisabled" 
						value="${JSON.start_date1}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Effective Date To</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="end_date" name="end_date" id="inputDisabled" 
						 value="${JSON.end_date1}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Redemption Date</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="redemption_date" name="redemption_date" value="${JSON.redemp_date1}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Fin Month</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.scheme_fin_month}">
				</div>
			</div>
			<div class="form-group row">
				<!--  Row 4 Started -->
				<div class="col-md-3">
					<label class="block" for="inputDefault">Overall Volume
						Growth (%)</label> <input type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.volume_growth}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Overall Value
						Growth (%)</label> <input type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.value_growth}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Overall Spread (%)</label>
					<input type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.spraid}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Fin Year</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.scheme_fin_yr}">
				</div>
			</div>
			<div class="form-group row">
				<!--  Row 5 Started -->
				<div class="col-md-3">
					<label class="block" for="inputDefault">Linked Scheme for
						Gift</label> <input type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.parent_scheme_name}">
				</div>
				<div class="col-md-10">
					<label class="block" for="inputDefault" value="${JSON.objective}">Objective</label>
					<textarea class="form-control form-control-sm form-control-primary"
						rows="3" id="textareaAutosize" data-plugin-textarea-autosize
						disabled=""></textarea>
				</div>
			</div>
		</div>
	</div>
	<!--  End of Scheme Review Panel-->
	<!--  Budget details  Panel-->
	<div class="card">
		<div class="card-header">
			<h5>Budget Details</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row">
				<div class="col-md-4" hidden>
					<label class="block" for="inputDefault">Adex id</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.provision_id}">
				</div>
				<div class="col-md-4">
					<label class="block" for="inputDefault">Budget Available</label> <input
						type="text" name="budget_available1" id="budget_available"
						value="<fmt:formatNumber
									value="${JSON.budget_available}"
									pattern="#,##0.0" />"
						class="form-control form-control-sm form-control-primary" readonly />
					<input name="budget_available" id="budget_available1"
						value="${JSON.budget_available}"
						class="form-control form-control-sm form-control-primary" readonly
						type="hidden" />

				</div>
				<div class="col-md-4">
					<label class="block" for="inputDefault">Provision Required
					</label> <input type="text"
						class="form-control form-control-sm form-control-primary"
						name="fin_analysis_flag" id="fin_analysis_flag"
						readonly="readonly" value="${JSON.fin_analysis_flag}">
				</div>
			</div>
		</div>
	</div>
	<!--  End of Budget Panel-->
	<!--  Selected Depots-->
	<div class="card">
		<div class="card-header">
			<h5>Selected Distributors</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row">
				<div class="col-md-1"></div>
				<div class="col-md-5">
					<label class="control-label  no-padding-right">Region <i
						class="menu-icon fa red"> *</i>
					</label>
					<div>
						<select multiple style="height: 170px;" name="appl_regn_code"
							id="appl_regn_code"
							class="form-control form-control-sm form-control-primary mb-md"
							required>
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<label class="block">Selected Region <i
						class="menu-icon fa red"> *</i>
					</label>
					<div>

						<select multiple class="form-control form-control-sm "
							style="height: 170px;" name="sel_regn" id="sel_regn">
						</select>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-md-1"></div>
				<div class="col-md-5">
					<label class="control-label  no-padding-right">Distributors
						<i class="menu-icon fa red"> *</i>
					</label>
					<div>
						<select multiple style="height: 170px;" name="depot" id="depot"
							class="form-control form-control-sm form-control-primary mb-md"
							required>

							<c:forEach var="sch_depos" items="${schdepos}" varStatus="status">
								<option selected value="${sch_depos.sch_depot_code}">${sch_depos.sch_depot_name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<label class="control-label  no-padding-right">Selected
						Distributors <i class="menu-icon fa red"> *</i>
					</label>
					<div>
						<select multiple style="height: 170px;" id="sel_depo"
							name="sel_depo"
							class="form-control form-control-sm form-control-primary mb-md">
							<c:forEach var="sch_depos" items="${schdepos}" varStatus="status">
								<option selected value="${sch_depos.sch_depot_code}">${sch_depos.sch_depot_name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-md-1"></div>
				<div class="col-md-5">
					<label class="control-label  no-padding-right">Dealers <i
						class="menu-icon fa red"> *</i>
					</label>
					<div>
						<select multiple style="height: 170px;" name="level" id="level"
							class="form-control mb-md" required readonly>
							<option value="NA">NA</option>
							<%--  <c:forEach var="levels" items="${depo1}"
											varStatus="status">
											<option selected value="${levels}">${levels}</option>
										</c:forEach> --%>
						</select>
					</div>
				</div>
				<div class="col-md-5">
					<label class="control-label  no-padding-right">Selected Dealers <i
						class="menu-icon fa red"> *</i>
					</label>
					<div>
						<select multiple style="height: 170px;" name="sel_level" id="sel_level"
							class="form-control mb-md" required>
							<!-- <option value="NA">NA</option> -->
							<%--  <c:forEach var="levels" items="${depo1}"
											varStatus="status">
											<option selected value="${levels}">${levels}</option>
										</c:forEach> --%>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  End of Selected Depots-->
	<!--  Scheme Related Details-->
	<div class="card">
		<div class="card-header">
			<h5>Scheme Related Details</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row">
				<div class="col-md-4">
					<label class="block" for="inputDefault">Scheme Created By</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${lastname}  ${firstname}">
				</div>
				<div class="col-md-4">
					<label class="block" for="inputDefault">Scheme Created On</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" value="${JSON.creation_date1}">
				</div>
			</div>
		</div>
	</div>
	<!--  End of Scheme Related Details-->
	<!--  Upload Document-->
	<div class="card">
		<div class="card-header">
			<h5>Upload Document</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row">
				<div class="col-md-6">
					<label>Upload Scheme Document </label> <input type="file"
						name="doc_file" id="id-input-file-3"
						onsubmit="return validation(this)"
						class="form-control form-control-sm form-control-primary"
						multiple="">
				</div>
				<div class="col-md-6">
					<label>Upload Other Document </label> <input type="file"
						name="doc_file1" id="id-input-file-4"
						onsubmit="return validation(this)"
						class="form-control form-control-sm form-control-primary"
						multiple="">
				</div>
			</div>
		</div>
	</div>
	<!--  End of Upload Document-->
	<!--  Scheme Reward Details-->
	<div class="card">
		<div class="card-header">
			<h5>Scheme Reward Details</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row">
				<div class="table-responsive">
					<table
						class="table table-bordered table-striped table-condensed mb-none">
						<thead>
							<tr>
								<th style="width: 10%">SR No</th>
								<th style="width: 15%">Reward Group</th>
								<th style="width: 30%">Reward Item</th>
								<th style="width: 20%">Reward Code</th>
								<th style="width: 20%">Effective Price in Rs.</th>
							</tr>
						</thead>
						<tbody>
							<%
										int j = 1;
									%>
							<c:forEach var="grp_reg" items="${gift_list}" varStatus="status">
								<tr>
									<td><%=j%> ${grp_reg.sch_details_id}</td>
									<td>${grp_reg.gift_group}</td>
									<td>${grp_reg.attribute1}</td>
									<td>${grp_reg.sch_gift_code}</td>
									<td>${grp_reg.gift_effective_price}</td>
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
	</div>
	<!--  End of Scheme Reward Details-->
	<!--  Product Outflow Details-->
	<div class="card">
		<div class="card-header">
			<h5>Product Outflow Details</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row">
				<div class="col-md-3">
					<label class="block" for="inputDefault">Total Product
						Outflow of Scheme</label> <input type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" disabled="" value="${JSON.scheme_budget}">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-md-4"
					style="overflow-x: scroll; display: inline-block; padding-left: 0; padding-right: 0;">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							style="white-space: nowrap;" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="center" style="width: 3%; padding: 8px 4px 8px 4px;">SR.NO</th>
									<th class="center" style="width: 6%; padding: 8px 5px 8px 5px;">PRD
										LINE TYPE</th>
									<th class="center"
										style="width: 6%; padding: 8px 15px 8px 15px;">PRODUCT</th>
								</tr>
							</thead>
							<tbody>
								<%
													int j2 = 1;
												%>
								<c:forEach var="grp_reg" items="${product_outflow_list}"
									varStatus="status">
									<tr>
										<td>
											<div id="loading<%=j2%>" style="display: none;">
												<img src="resources/login_assets/Loading1.gif" alt="BASS"
													style="width: 70%; height: 15%; margin-left: 16%; margin-top: 0%;"
													class="">
											</div>
											<div id="sch_prd_outflow_id<%=j2%>">
												<center>
													<%=j2%></center>
												<input type="hidden"
													value="${grp_reg.sch_prd_outflow_unique_id}"
													id="sch_prd_outflow_unique_id<%=j2%>"
													name="sch_prd_outflow_unique_id" />
											</div>
										</td>
										<td><select id="sch_prd_outflow_line_type<%=j2%>"
											name="sch_prd_outflow_line_type" class="fetchprdlinetype"
											style="width: 100%;" required>
												<option value="">--Select--</option>
												<c:set var="prd_line_sel"
													value="${grp_reg.sch_prd_line_type}"></c:set>
												<c:forEach var="prd_outflow_line_type"
													items="${prd_outflow_line_type_list}" varStatus="status">
													<c:set var="prd_outflow_line"
														value="${prd_outflow_line_type}"></c:set>
													<%
																		String prd_outflow_line = (String) pageContext.getAttribute("prd_outflow_line");
																				String prd_line_sel = (String) pageContext.getAttribute("prd_line_sel");
																	%>
													<%
																		if (prd_line_sel.equals(prd_outflow_line)) {
																	%>
													<option value="${prd_outflow_line_type}" selected>${prd_outflow_line_type}</option>
													<%
																		} else {
																	%>
													<option value="${prd_outflow_line_type}">${prd_outflow_line_type}</option>
													<%
																		}
																	%>
												</c:forEach>
										</select></td>
										<td><select id="sch_product_outflow_id<%=j2%>"
											name="sch_product_outflow_id" class="fetchprdval"
											value="${grp_reg.sch_prd_value}" style="width: 100%;"
											required>
												<option value="${grp_reg.sch_prd_value}">${grp_reg.sch_prd_value}</option>
										</select></td>
									</tr>
									<%
														j2 = j2 + 1;
													%>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-md-8" style="padding-left: 0; padding-right: 0;">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							id="dynamic-table4"
							style="display: block; overflow: auto; white-space: nowrap;"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">LLY VOL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">LY VOL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">TGT GWT
										VOL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">PROJ VOL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">LLY VAL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">LY VAL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">TGT GWT
										VAL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">PROJ VAL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">SPD TGT
										VOL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">SPD TGT
										VAL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">SPD LY VOL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">SPD LY VAL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">TGT GWT
										SPD</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">SPD TY TGT
										VOL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">SPD TY TGT
										VAL</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">WT AVG</th>
									<th class="center"
										style="width: 5%; padding: 8px 10px 8px 10px;">PRD BDGT</th>
								</tr>
							</thead>
							<tbody>
								<%
													int j3 = 1;
												%>
								<c:forEach var="grp_reg" items="${product_outflow_list}"
									varStatus="status">
									<tr>
										<td><input type="hidden"
											value="<fmt:formatNumber value="${grp_reg.lly_vol}" pattern="###0.00" />"
											id="sch_prd_lly_vol<%=j3%>" name="sch_prd_lly_vol"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											class="form-control form-control-sm form-control-primary mb-md"
											value="<fmt:formatNumber value="${grp_reg.lly_vol_div}" pattern="###0.00" />"
											id="sch_prd_lly_vol_div<%=j3%>" name="sch_prd_lly_vol_div"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /></td>
										<td><input type="hidden"
											value="<fmt:formatNumber value="${grp_reg.ly_vol}" pattern="###0.00" />"
											id="sch_prd_ly_vol<%=j3%>" name="sch_prd_ly_vol"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											class="form-control form-control-sm form-control-primary mb-md"
											value="<fmt:formatNumber value="${grp_reg.ly_vol_div}" pattern="###0.00" />"
											id="sch_prd_ly_vol_div<%=j3%>" name="sch_prd_ly_vol_div"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /></td>
										<td><input type="text"
											value="<fmt:formatNumber value="${grp_reg.proj_grwth_vol_pct}" pattern="###0.00" />"
											id="proj_grwth_vol_pct<%=j3%>" name="proj_grwth_vol_pct"
											class="fetchgrwthvolpct form-control form-control-sm form-control-primary mb-md"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" required /></td>
										<td><input type="hidden"
											value="<fmt:formatNumber value="${grp_reg.proj_ty_vol}" pattern="###0.00" />"
											id="sch_prd_ty_vol<%=j3%>" name="sch_prd_ty_vol"
											class="fetchprdtyvol form-control form-control-sm form-control-primary mb-md"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											value="<fmt:formatNumber value="${grp_reg.proj_ty_vol_div}" pattern="###0.00" />"
											id="sch_prd_ty_vol_div<%=j3%>" name="sch_prd_ty_vol_div"
											class="fetchprdtyvol_div form-control form-control-sm form-control-primary mb-md"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /></td>
										<td><input type="hidden"
											value="<fmt:formatNumber value="${grp_reg.lly_val}" pattern="###0.00" />"
											id="sch_prd_lly_val<%=j3%>" name="sch_prd_lly_val"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											class="form-control form-control-sm form-control-primary mb-md"
											value="<fmt:formatNumber value="${grp_reg.lly_val_div}" pattern="###0.00" />"
											id="sch_prd_lly_val_div<%=j3%>" name="sch_prd_lly_val_div"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /></td>
										<td><input type="hidden"
											value="<fmt:formatNumber value="${grp_reg.ly_val}" pattern="###0.00" />"
											id="sch_prd_ly_val<%=j3%>" name="sch_prd_ly_val"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											class="form-control form-control-sm form-control-primary mb-md"
											value="<fmt:formatNumber value="${grp_reg.ly_val_div}" pattern="###0.00" />"
											id="sch_prd_ly_val_div<%=j3%>" name="sch_prd_ly_val_div"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /></td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.proj_grwth_val_pct}" groupingUsed = "false" type = "number"/>" id="proj_grwth_val_pct<%=j3%>" name="proj_grwth_val_pct" class="fetchgrwthvolpct"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" required readonly/> --%>
											<input type="text"
											value="<fmt:formatNumber value="${grp_reg.proj_grwth_val_pct}" pattern="###0.00" />"
											id="proj_grwth_val_pct<%=j3%>" name="proj_grwth_val_pct"
											class="fetchgrwthvalpct form-control form-control-sm form-control-primary mb-md"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" required />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.proj_ty_val}" groupingUsed = "false" type = "number"/>" id="sch_prd_ty_val<%=j3%>" name="sch_prd_ty_val"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="hidden"
											value="<fmt:formatNumber value="${grp_reg.proj_ty_val}" pattern="###0.00" />"
											id="sch_prd_ty_val<%=j3%>" name="sch_prd_ty_val"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											class="form-control form-control-sm form-control-primary mb-md"
											value="<fmt:formatNumber value="${grp_reg.proj_ty_val_div}" pattern="###0.00" />"
											id="sch_prd_ty_val_div<%=j3%>" name="sch_prd_ty_val_div"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_tgt_vol}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_tgt_vol<%=j3%>" name="sch_prd_spread_tgt_vol" class="fetchspdvol"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											value="<fmt:formatNumber value="${grp_reg.spread_tgt_vol}" pattern="###0" />"
											id="sch_prd_spread_tgt_vol<%=j3%>"
											name="sch_prd_spread_tgt_vol"
											class="fetchspdvol form-control form-control-sm form-control-primary mb-md"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_tgt_val}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_tgt_val<%=j3%>" name="sch_prd_spread_tgt_val" class="fetchspdval"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											value="<fmt:formatNumber value="${grp_reg.spread_tgt_val}" pattern="###0" />"
											id="sch_prd_spread_tgt_val<%=j3%>"
											name="sch_prd_spread_tgt_val"
											class="fetchspdval form-control form-control-sm form-control-primary mb-md"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_mtd_ly_vol}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_mtd_ly_vol<%=j3%>" name="sch_prd_spread_mtd_ly_vol"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											value="<fmt:formatNumber value="${grp_reg.spread_mtd_ly_vol}" pattern="###0" />"
											id="sch_prd_spread_mtd_ly_vol<%=j3%>"
											class="form-control form-control-sm form-control-primary mb-md"
											name="sch_prd_spread_mtd_ly_vol" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_mtd_ly_val}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_mtd_ly_val<%=j3%>" name="sch_prd_spread_mtd_ly_val"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											value="<fmt:formatNumber value="${grp_reg.spread_mtd_ly_val}" pattern="###0" />"
											id="sch_prd_spread_mtd_ly_val<%=j3%>"
											class="form-control form-control-sm form-control-primary mb-md"
											name="sch_prd_spread_mtd_ly_val" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.proj_grwth_spd_pct}" groupingUsed = "false" type = "number"/>" id="proj_grwth_spd_pct<%=j3%>" name="proj_grwth_spd_pct" class="fetchgrwthpct"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" required readonly/> --%>
											<input type="text"
											value="<fmt:formatNumber value="${grp_reg.proj_grwth_spd_pct}" pattern="###0.00" />"
											id="proj_grwth_spd_pct<%=j3%>" name="proj_grwth_spd_pct"
											class="fetchgrwthspdpct form-control form-control-sm form-control-primary mb-md"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" required />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_mtd_ty_tgt_vol}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_mtd_ty_tgt_vol<%=j3%>" name="sch_prd_spread_mtd_ty_tgt_vol"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary mb-md"
											value="<fmt:formatNumber value="${grp_reg.spread_mtd_ty_tgt_vol}" pattern="###0" />"
											id="sch_prd_spread_mtd_ty_tgt_vol<%=j3%>"
											name="sch_prd_spread_mtd_ty_tgt_vol" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_mtd_ty_tgt_val}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_mtd_ty_tgt_val<%=j3%>" name="sch_prd_spread_mtd_ty_tgt_val"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.spread_mtd_ty_tgt_val}" pattern="###0" />"
											id="sch_prd_spread_mtd_ty_tgt_val<%=j3%>"
											name="sch_prd_spread_mtd_ty_tgt_val" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.wt_avg}" groupingUsed = "false" type = "number"/>" id="sch_prd_wt_avg<%=j3%>" name="sch_prd_wt_avg" class="fetchwtavg"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" required readonly/> --%>
											<input type="text"
											value="<fmt:formatNumber value="${grp_reg.wt_avg}" pattern="###0.00" />"
											id="sch_prd_wt_avg<%=j3%>" name="sch_prd_wt_avg"
											class="form-control form-control-sm form-control-primary"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" required />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.total_prd_bdgt}" groupingUsed = "false" type = "number"/>" id="sch_prd_total_prd_bdgt<%=j3%>" name="sch_prd_total_prd_bdgt"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											value="<fmt:formatNumber value="${grp_reg.total_prd_bdgt}" pattern="###0.00" />"
											id="sch_prd_total_prd_bdgt<%=j3%>"
											class="form-control form-control-sm form-control-primary"
											name="sch_prd_total_prd_bdgt" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
									</tr>
									<%
														j3 = j3 + 1;
													%>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  End of Product Outflow Details-->
	<!--  IT product Details-->
	<div class="card">
		<div class="card-header">
			<h5>IT product Details</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row">
				<div class="table-responsive">
					<input type="hidden" id="rowcount3" name="rowcount3" value="">
					<table id="dynamic-table3"
						class="table table-bordered table-striped table-condensed mb-none">
						<thead>
							<tr>
								<th style="width: 10%">SR No</th>
								<th style="width: 20%">Product Code</th>
								<th style="width: 30%">Product Group</th>
								<th style="width: 10%">Product Category</th>
								<th style="width: 15%">Product Description</th>
							</tr>
						</thead>
						<tbody>
							<%
										int i1 = 1;
									%>
							<c:set var="itprdsize" value="${it_product_size}"></c:set>
							<%
										Integer itprdsize = (Integer) pageContext.getAttribute("itprdsize");
									%>
							<c:forEach var="grp_reg" items="${it_product_list}"
								varStatus="status">
								<tr>
									<td><%=i1%> <input type="hidden"
										value="${grp_reg.sch_it_prd_dtls_id}"
										id="sch_it_prd_dtls_id<%=i1%>" name="sch_it_prd_dtls_id" /></td>
									<td><c:set var="prdcode" value="${grp_reg.sch_prd_code}"></c:set>
										<c:set var="prdgrp" value="${grp_reg.sch_prd_grp}"></c:set> <c:set
											var="prdcat" value="${grp_reg.sch_prd_cat}"></c:set> <%
													String prdcode = (String) pageContext.getAttribute("prdcode");
														String prdgrp = (String) pageContext.getAttribute("prdgrp");
														String prdcat = (String) pageContext.getAttribute("prdcat");
												%> <select id="sch_prd_code<%=i1%>" name="sch_prd_code"
										class="fetchgrpid3" onchange="checkForSelectedVal()"
										style="width: 100%;">
											<option value="">--Select--</option>
											<%
														if (itprdsize == 1 && prdcode == null && prdgrp == null && prdcat == null) {
													%>
											<option value="All" selected>All</option>
											<%
														} else if (itprdsize == 1) {
													%>
											<option value="All">All</option>
											<%
														}
													%>
											<c:set var="prdcode_sel" value="${grp_reg.sch_prd_code}"></c:set>
											<c:forEach var="prd_codem" items="${prd_code_list}"
												varStatus="status">
												<c:set var="prd_code" value="${prd_codem.prd_code}"></c:set>
												<%
															String prd_code = (String) pageContext.getAttribute("prd_code");
																	String prdcode_sel = "";
																	if (prdcode != null) {
																		prdcode_sel = (String) pageContext.getAttribute("prdcode_sel");
																	}
														%>
												<%
															if (prdcode_sel.equals(prd_code)) {
														%>
												<option value="${prd_codem.prd_code}" selected>${prd_codem.prd_code}</option>
												<%
															} else {
														%>
												<option value="${prd_codem.prd_code}">${prd_codem.prd_code}</option>
												<%
															}
														%>
											</c:forEach>
									</select></td>
									<td><select id="sch_prd_grp<%=i1%>" name="sch_prd_grp"
										class="fetchgrpid4" style="width: 100%;">
											<option value="">--Select--</option>
											<c:set var="prdgrp_sel" value="${grp_reg.sch_prd_grp}"></c:set>
											<c:forEach var="prd_grpm" items="${prd_grp_list}"
												varStatus="status">
												<c:set var="prd_grp" value="${prd_grpm.prd_grp}"></c:set>
												<%
															String prd_grp = (String) pageContext.getAttribute("prd_grp");
																	String prdgrp_sel = "";
																	if (prdgrp != null) {
																		prdgrp_sel = (String) pageContext.getAttribute("prdgrp_sel");
																	}
														%>
												<%
															if (prdgrp_sel.equals(prd_grp)) {
														%>
												<option value="${prd_grpm.prd_grp}" selected>${prd_grpm.prd_grp}</option>
												<%
															} else {
														%>
												<option value="${prd_grpm.prd_grp}">${prd_grpm.prd_grp}</option>
												<%
															}
														%>
											</c:forEach>
									</select></td>
									<td><select id="sch_prd_cat<%=i1%>" name="sch_prd_cat"
										class="fetchgrpid5" style="width: 100%;">
											<option value="">--Select--</option>
											<c:set var="prdcat_sel" value="${grp_reg.sch_prd_cat}"></c:set>
											<c:forEach var="prd_catm" items="${prd_cat_list}"
												varStatus="status">
												<c:set var="prd_cat" value="${prd_catm.prd_cat}"></c:set>

												<%
															String prd_cat = (String) pageContext.getAttribute("prd_cat");
																	String prdcat_sel = "";
																	if (prdcat != null) {
																		prdcat_sel = (String) pageContext.getAttribute("prdcat_sel");
																	}
														%>
												<%
															if (prdcat_sel.equals(prd_cat)) {
														%>
												<option value="${prd_catm.prd_cat}" selected>${prd_catm.prd_cat}</option>
												<%
															} else {
														%>
												<option value="${prd_catm.prd_cat}">${prd_catm.prd_cat}</option>
												<%
															}
														%>
											</c:forEach>
									</select></td>
									<td><select id="sch_prd_cat_desc<%=i1%>"
										name="sch_prd_cat_desc" value="${grp_reg.sch_prd_cat_desc}"
										style="width: 100%;" readonly>
											<option value="${grp_reg.sch_prd_cat_desc}">${grp_reg.sch_prd_cat_desc}</option>
									</select></td>
								</tr>
								<%
											i1 = i1 + 1;
										%>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="form-group row">
					<div class="col-md-4">
						<input type="button" class="btn btn-primary btn-sm"
							value="Add Row" onclick="AddRow3()">
					</div>
					<div class="col-md-4">
						<input type="button" id="add3" class="btn btn-primary btn-sm"
							value="Delete Row" onclick="delRow3(<%=i1%>)">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  End of IT product Details-->
	<!--  Document Details-->
	<div class="card">
		<div class="card-header">
			<h5>Document Details</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row">
				<div class="table-responsive">
					<table
						class="table table-bordered table-striped table-condensed mb-none">
						<thead>
							<tr>
								<th style="width: 10%">SR No</th>
								<th style="width: 20%">Document Type</th>
								<th style="width: 30%">Document Title</th>
								<th style="width: 10%">Version</th>
								<th style="width: 15%">Upload Date</th>
								<th style="width: 15%">Download File</th>
							</tr>
						</thead>
						<tbody>
							<%
										int i = 1;
									%>
							<c:forEach var="grp_reg" items="${doc_list}" varStatus="status">
								<tr>
									<td><%=i%></td>
									<td>${grp_reg.doc_type}</td>
									<td>${grp_reg.doc_title}</td>
									<td>${grp_reg.revision}</td>
									<td>${grp_reg.doc_upload_date1}</td>
									<td><a href="DowdDocument?Doc_id=${grp_reg.scheme_doc_id}"><i
											class="fa fa-download bigger-160" aria-hidden="true"></i></a></td>
								</tr>
								<%
											i = i + 1;
										%>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<input type="hidden" name="scheme_id" id="scheme_id"
					value="${JSON.scheme_id}" /> <input type="button"
					class="btn btn-primary btn-sm" id="show" value="Show All Documents"
					onclick="show_all_doc()" />
			</div>
		</div>
	</div>
	<!--  End of Document Details-->
	<input type="checkbox" id="SchemeProcessingDetailsHideID"
		name="SchemeProcessingDetails"
		onchange="SchemeProcessingDetailsHide()"> Deploy new OIA Rule Mapping
	Processing Details <br></br>
	<!--  Scheme Processing Details-->
	<div class="card" id="SchemeProcessingDetails" style="display: none">
		<div class="card-header">
			<h5>OIA Rule Mapping</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<div class="form-group row">
				<!--  Row 1 Started -->
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Directory
						Name</label>
					<textarea name="sch_dir_name" id="sch_dir_name"
						value="${JSON.sch_dir_name}"
						class="form-control form-control-sm form-control-primary"
						name="objective" id="objective" rows="2" cols="3" required>${JSON.sch_dir_name}</textarea>
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Financial Analysis
						File Name</label>
					<textarea name="fin_an_batch_file" id="fin_an_batch_file"
						value="${JSON.fin_an_batch_file}"
						class="form-control form-control-sm form-control-primary"
						name="objective" id="objective" rows="2" cols="3" required>${JSON.fin_an_batch_file}</textarea>
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Analysis
						File Name</label>
					<textarea name="sch_an_batch_file" id="sch_an_batch_file"
						value="${JSON.sch_an_batch_file}"
						class="form-control form-control-sm form-control-primary"
						name="objective" id="objective" rows="2" cols="3">${JSON.sch_an_batch_file}</textarea>
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Process Rewards
						File Name</label>
					<textarea name="prc_rw_batch_file" id="prc_rw_batch_file"
						value="${JSON.prc_rw_batch_file}"
						class="form-control form-control-sm form-control-primary"
						name="objective" id="objective" rows="2" cols="3">${JSON.prc_rw_batch_file}</textarea>
				</div>
				<!--  Row 2 Started -->
				<div class="col-md-3">
					<label class="block" for="inputDefault">OPA Scheme Analysis
						Webservice Deployment Link</label>
					<textarea name="sch_opa_url" id="sch_opa_url"
						value="${JSON.sch_opa_url}"
						class="form-control form-control-sm form-control-primary"
						name="objective" id="objective" rows="2" cols="3">${JSON.sch_opa_url}</textarea>
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">OPA What if
						Interview Deployment Link</label>
					<textarea value="${JSON.opa_whatif_url}" name="opa_whatif_url"
						id="opa_whatif_url"
						class="form-control form-control-sm form-control-primary"
						name="objective" id="objective" rows="2" cols="3">${JSON.opa_whatif_url}</textarea>
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">OPA Scheme
						Deployment Policy Model Name</label>
					<textarea value="${JSON.opa_sch_an_name}" name="opa_whatif_url"
						id="opa_whatif_url"
						class="form-control form-control-sm form-control-primary"
						name="objective" id="objective" rows="2" cols="3">${JSON.opa_sch_an_name}</textarea>
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Processing
						Queue </label>
					<c:set var="proque">${JSON.attribute4}</c:set>
					<%
								String proque = (String) pageContext.getAttribute("proque");
								if (proque.equals("")) {
								%>
					<select name="attribute4" id="attribute4" value=""
						class="parallel_queue" required>
						<option value="1">Process queue1</option>
						<option value="2">Process queue2</option>
						<option value="3">Process queue3</option>
						<option value="4">Process queue4</option>
						<option value="5">Process queue5</option>
					</select>
					<%
								} else {
									if (proque.equals("1")) {
							%>
					<select name="attribute4" id="attribute4"
						value="${JSON.attribute4}" class="parallel_queue" required>
						<option value="${JSON.attribute4}">Process queue1</option>
					</select>
					<%
								} else if (proque.equals("2")) {
							%>
					<select name="attribute4" id="attribute4"
						value="${JSON.attribute4}" class="parallel_queue" required>
						<option value="${JSON.attribute4}">Process queue2</option>
					</select>
					<%
								} else if (proque.equals("3")) {
							%>
					<select name="attribute4" id="attribute4"
						value="${JSON.attribute4}" class="parallel_queue" required>
						<option value="${JSON.attribute4}">Process queue3</option>
					</select>
					<%
								} else if (proque.equals("4")) {
							%>
					<select name="attribute4" id="attribute4"
						value="${JSON.attribute4}" class="parallel_queue" required>
						<option value="${JSON.attribute4}">Process queue4</option>
					</select>
					<%
								} else if (proque.equals("5")) {
							%>
					<select name="attribute4" id="attribute4"
						value="${JSON.attribute4}" class="parallel_queue" required>
						<option value="${JSON.attribute4}">Process queue5</option>
					</select>
					<%
								}
								}
							%>
				</div>
				<!--  Row 3 Started -->
				<div class="col-md-12">
					<label class="block" for="inputDefault">IT Comment For
						Scheme Update To PMG</label>
					<textarea name="attribute5" id="attribute5"
						value="${JSON.attribute5}" rows="6" cols="3"
						style="width: 800px; height: 100px;">${JSON.attribute5}</textarea>
				</div>
			</div>
		</div>
	</div>
	<!--  End of Scheme Processing Details-->
	<div class="card">
		<div class="card-block">
			<div class="form-group row">
				<div class="col-md-5"></div>
				<div class="col-md-5">
					<input type="hidden" name="action" id="action" value="">
					<button type="button" class="btn btn-primary btn-sm"
						onclick="submitform()">Ready For Analysis</button>
					<button type="button" class="btn btn-primary btn-sm"
						onclick="submitform1()">Save</button>
				</div>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
  function show_all_doc()

     {
       var aa=$('#show').val();

       var s_id=document.getElementById("scheme_id").value;

        // window.location.href="show_doc";

       window.open("show_doc?scheme_id="+s_id,"Ratting","width=750,height=550,left=250,top=200,toolbar=0,status=0,");

     }
	function checkForSelectedVal() {
			//var productCodeVal = document.getElementById("sch_prd_code1").value;
			if (productCodeVal == "All" || productCodeVal == undefined) {
				document.getElementById("add3").disabled = true;
			} else {
				document.getElementById("add3").disabled = false;
			}
		} 
		$(window)
				.load(
						function() {
							
							document.getElementById("SchemeProcessingDetails").style.display = "none";
							document.getElementById("sch_dir_name").value = "BPIL_SCH_ML7_1734_1718";
							document.getElementById("fin_an_batch_file").value = "BPIL_SCH_ML7_1734_1718_FIN_AN_Batch.bat";
							document.getElementById("sch_an_batch_file").value = "BPIL_SCH_ML7_1734_1718_SCH_AN_Batch.bat";
							document.getElementById("prc_rw_batch_file").value = "BPIL_SCH_ML7_1734_1718_RW_AN_Batch.bat";
							document.getElementById("opa_whatif_url").value = "https://bergerindiaprod--tst1.custhelp.com/web-determinations/startsession/BPIL_SCH_ML7_1734_1718_WhatIf";
							document.getElementById("attribute4").value = "1";
							document.getElementById("attribute5").value = "IT Request";							

							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadfinyear',

										success : function(data) {
											var select = $('#scheme_fin_yr');
											select.find('option').remove();
											$
													.each(
															data,
															function(index,
																	value) {
																//alert(value.scheme_fin_yr);
																$('<option>')
																		.val(
																				value.fin_year)
																		.text(
																				value.fin_year)
																		.appendTo(
																				select);
															});

										}
									});

							var lovtype = "BLINE_TYPE";
							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadschemebusinessline',
										data : ({
											bline : lovtype
										}),
										success : function(data) {
											var select = $('#scheme_business_line');
											// alert(select); -->
											select.find('option').remove();
											$
													.each(
															data,
															function(index,
																	value) {
																$('<option>')
																		.val(
																				value)
																		.text(
																				value)
																		.appendTo(
																				select);
															});

										}
									});

							var lovtype = "SCHEME_TYPE";
							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadschemetype',
										data : ({
											scheme : lovtype
										}),
										success : function(data) {
											var select = $('#scheme_type');
											// alert(select); -->
											select.find('option').remove();
											$
													.each(
															data,
															function(index,
																	value) {
																if (value == "${JSON.scheme_type}") {
																	$(
																			'<option selected>')
																			.val(
																					value)
																			.text(
																					value)
																			.appendTo(
																					select);
																} else {
																	$(
																			'<option>')
																			.val(
																					value)
																			.text(
																					value)
																			.appendTo(
																					select);
																}
															});

										}
									});

			
							
							$('#rowcount3').val($('#dynamic-table3 tr').length-1);
var count = $('#rowcount3').val();
							$.ajax({
    url: '${pageContext.request.contextPath}/loadproductcode',
    success: function(data) {
    
        var select = $('#sch_prd_code'+count);
        select.find('option').remove();

	$('<option>').val("").text("--Select--").appendTo(select);
	if(count == 1) {
	$('<option>').val("All").text("All").appendTo(select);
	} else if(count != 1){
		$("#sch_prd_code1 option[value='All']").remove();
	}
           $.each(data, function(index, value) {
	$('<option>').val(value.prd_code).text(value.prd_code).appendTo(select);
        });

    }
  });

							$.ajax({
			                 	url: '${pageContext.request.contextPath}/loadDSRregion',
			                     success: function(data) {
			                     	var select = $('#appl_regn_code');
			                    	var regn_select = $('#sel_regn');
			                    	  $('<option selected>').val('C2').text('C2').appendTo(regn_select);
			                         select.find('option').remove();
			        					$('<option >').val("").text("--select--").appendTo(select);
			                   	    $.each(data, function(index, value) {
			                            if(value == "${JSON.appl_regn_code}") {
			                                $('<option selected>').val(value).text(value).appendTo(select);
			                                $('<option selected>').val(value).text(value).appendTo(regn_select);
			                                    }else{
			      				$('<option>').val(value).text(value).appendTo(select);
			                                    }

			                         });

			                     }
			                 });

			                 
			                $('#appl_regn_code').change(function(event) {
			                 	
			               	 
			               	 var region = $('#appl_regn_code').val();
			         			 var Region = ""+region+"";
			         			 
			               	 //var region = $("select#appl_regn_code").val();
			                  
			                	$.ajax({
			                    	url: '${pageContext.request.contextPath}/loaddependentDSRregion',
			                        data: ({ava_region :Region}),
			                      
			                        success: function(data) {

			                        	 var select = $('#depot');

			                        	 	
			                        		select.find('option').remove();
			                            $.each(data, function(index, value) {
			                           	 $('<option>').val(value.depot_code).text(value.depot_name).appendTo(select);
			                            });
			                            
			                            
			                          
			                            
			                 
			                        }
			                    });


			                });

			        
			                var arr = [];
			                var arr2 = [];
			                
			        	$('#depot').change(function(event) {
			                	
			       		 var region = $('#depot').val();
			       		 var Region = ""+region+"";   
			       		
			       		
			       		 
			       		 var e = document.getElementById("depot");
			       		 var strUser = e.options[e.selectedIndex].text;
			       		 var Region2 = ""+strUser+""; 
			       		 
			       		
			       		 
			       		 $("#depot option:selected").each(function () {
			       			   var $this = $(this);
			       			   if ($this.length) {
			       			    var selText = $this.text();
			       			    var selval = $this.val();
			       			    
			       			   
			       			    
			       			    arr.push(selText);
			       			    arr2.push(selval);
			       			    
			       			   
			       			    
			       			   }
			       			});
			       		 
			       		 
			       		 var select = $('#sel_depo');
			       		 select.find('option').remove();
			       		 
			       		 for (var i = 0; i < arr.length; i++) {
			       			 $('<option selected>').val(arr2[i]).text(arr[i]).appendTo(select);
			       		        //$('#sel_depo').val(arr);
			       		    }
			                });
			                 
			                 
			         });
		
		
		
	</script>

<script>
		// function AddPrdTyp(rowno)
		// {

		// var count = rowno;

		//$('.fetchgrpid3').mousedown(function(){

		//	var count = $('.fetchgrpid3').index(this)+1;
		//	var rowNumber = Number($('#dynamic-table3 tr').length);
		//	//alert(rowNumber);
		//	$('#rowcount3').val($('#dynamic-table3 tr').length-1);
		//var count2 = $('#rowcount3').val();
		//	$.ajax({
		//	    url: '${pageContext.request.contextPath}/loadproductcode',
		//	    success: function(data) {

		//	        var select = $('#sch_prd_code'+count);
		//	        select.find('option').remove();
		//	       $('<option>').val("").text("--Select--").appendTo(select);
		//	  	if(count2 == 1) {
		//	  	$('<option>').val("All").text("All").appendTo(select);
		//	  	} else if(count2 != 1){
		//	  		$("#sch_prd_code1 option[value='All']").remove();
		//	  	}

		//	           $.each(data, function(index, value) {
		//		$('<option>').val(value.prd_code).text(value.prd_code).appendTo(select);
		//	        });

		//	    }
		//	  });

		//});

		//$('.fetchgrpid4').mousedown(function(){

		// 	var count = $('.fetchgrpid4').index(this)+1;

		// 	$.ajax({
		// 	    url: '${pageContext.request.contextPath}/loadproductgrp',
		// 	    success: function(data) {

		// 	        var select = $('#sch_prd_grp'+count);
		// 	        select.find('option').remove();

		// 		$('<option>').val("").text("--Select--").appendTo(select);
		// 	           $.each(data, function(index, value) {
		// 		$('<option>').val(value.prd_grp).text(value.prd_grp).appendTo(select);
		// 	        });

		// 	    }
		// 	  });

		//  });

		//$('.fetchgrpid5').mousedown(function(){

		// 	var count = $('.fetchgrpid5').index(this)+1;

		// 	$.ajax({
		// 	    url: '${pageContext.request.contextPath}/loadproductcat',
		// 	    success: function(data) {

		// 	        var select = $('#sch_prd_cat'+count);
		// 	        select.find('option').remove();

		// 		$('<option>').val("").text("--Select--").appendTo(select);
		// 	           $.each(data, function(index, value) {
		// 		$('<option>').val(value.prd_cat).text(value.prd_cat).appendTo(select);
		// 	        });

		// 	    }
		// 	  });

		//  });

		$('.fetchgrpid5')
				.change(
						function() {
							var count = $('.fetchgrpid5').index(this) + 1;

							//	$('#sch_prd_cat'+count).change(function(){
							var datavalue = $('#sch_prd_cat' + count).val();

							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadproductcatdesc',
										data : ({
											datavalue : datavalue
										}),
										success : function(data) {

											var select = $('#sch_prd_cat_desc'
													+ count);
											select.find('option').remove();

											$('<option>').val("").text(
													"--Select--").appendTo(
													select);
											$
													.each(
															data,
															function(index,
																	value) {
																$('<option>')
																		.val(
																				value.prd_cat_desc)
																		.text(
																				value.prd_cat_desc)
																		.appendTo(
																				select);
															});

										}
									});

							//	});
						});

		$('.parallel_queue').mousedown(function() {

			var select = $('#attribute4');
			select.find('option').remove();

			$('<option>').val("1").text("Process queue1").appendTo(select);
			$('<option>').val("2").text("Process queue2").appendTo(select);
			$('<option>').val("3").text("Process queue3").appendTo(select);
			$('<option>').val("4").text("Process queue4").appendTo(select);
			$('<option>').val("5").text("Process queue5").appendTo(select);

		});

		function delRow3(cnt) {
			document.getElementById("add3").disabled = false;
			$('#rowcount3').val($('#dynamic-table3 tr').length - 1);
			var count = $('#rowcount3').val();
			var rowNumber = Number($('#dynamic-table3 tr').length);

			if (count >= cnt) {
				document.getElementById("dynamic-table3").deleteRow(count);

				if (count == 2) {
					$("#sch_prd_code1 option").eq(1).before(
							$("<option></option>").val("All").text("All"));
				}
			}
		}

		function AddRow3() {
			var rowNumber = Number($('#dynamic-table3 tr').length);
			//alert(rowNumber);
			$('#dynamic-table3 tr')
					.last()
					.after(
							'<tr>'
									+ '<td><center>'
									+ ($('#dynamic-table3 tr').length)
									+ '<input type="hidden" id="sch_it_prd_dtls_id'
									+ $('#dynamic-table3 tr').length
									+ '" name="sch_it_prd_dtls_id"></center></td>'
									+ '<td><select name="sch_prd_code" id="sch_prd_code'
									+ $('#dynamic-table3 tr').length
									+ '" onchange="checkForSelectedVal()" class="col-md-12"><option value="">--Select--</option></select></td>'
									+ '<td><select name="sch_prd_grp" id="sch_prd_grp'
									+ $('#dynamic-table3 tr').length
									+ '" class="col-md-12"><option value="">--Select--</option></select></td>'
									+ '<td><select name="sch_prd_cat" id="sch_prd_cat'
									+ $('#dynamic-table3 tr').length
									+ '" class="col-md-12"><option value="">--Select--</option></select></td>'
									+ '<td><select name="sch_prd_cat_desc" id="sch_prd_cat_desc'
									+ $('#dynamic-table3 tr').length
									+ '" class="col-md-12"><option value="">--Select--</option></select></td>'
									+ '</tr>');
			//$('#dynamic-table3 tr').last().after('<tr><td><center>'+($('#dynamic-table3 tr').length-1)+'<input type="hidden" id="sch_it_prd_dtls_id'+$('#dynamic-table3 tr').length+'" name="sch_it_prd_dtls_id"></center></td><td><select name="sch_prd_code" id="sch_prd_code'+$('#dynamic-table3 tr').length+'" class="col-xs-12 col-sm-4"><option value="">--Select--</option></select></td><td><select name="sch_prd_grp" id="sch_prd_grp'+$('#dynamic-table3 tr').length+'" class="col-xs-12 col-sm-4"><option value="">--Select--</option></select></td><td><select name="sch_prd_cat" id="sch_prd_cat'+$('#dynamic-table3 tr').length+'" class="col-xs-12 col-sm-4"><option value="">--Select--</option></select></td><td><select name="sch_prd_cat_desc" id="sch_prd_cat_desc'+$('#dynamic-table3 tr').length+'" class="col-xs-12 col-sm-4"><option value="">--Select--</option></select></td></tr>');

			$('#rowcount3').val($('#dynamic-table3 tr').length - 1);
			var count = $('#rowcount3').val();

			$.ajax({
				url : '${pageContext.request.contextPath}/loadproductcode',
				success : function(data) {

					var select = $('#sch_prd_code' + count);
					select.find('option').remove();

					$('<option>').val("").text("--Select--").appendTo(select);
					if (count == 1) {
						$('<option>').val("All").text("All").appendTo(select);
					} else if (count != 1) {
						$("#sch_prd_code1 option[value='All']").remove();
					}
					$.each(data, function(index, value) {
						$('<option>').val(value.prd_code).text(value.prd_code)
								.appendTo(select);
					});

				}
			});

			$.ajax({
				url : '${pageContext.request.contextPath}/loadproductgrp',
				success : function(data) {

					var select = $('#sch_prd_grp' + count);
					select.find('option').remove();

					$('<option>').val("").text("--Select--").appendTo(select);
					$.each(data, function(index, value) {
						$('<option>').val(value.prd_grp).text(value.prd_grp)
								.appendTo(select);
					});

				}
			});

			$.ajax({
				url : '${pageContext.request.contextPath}/loadproductcat',
				success : function(data) {

					var select = $('#sch_prd_cat' + count);
					select.find('option').remove();

					$('<option>').val("").text("--Select--").appendTo(select);
					$.each(data, function(index, value) {
						$('<option>').val(value.prd_cat).text(value.prd_cat)
								.appendTo(select);
					});

				}
			});

			$('#sch_prd_cat' + count)
					.change(
							function() {
								var datavalue = $('#sch_prd_cat' + count).val();

								$
										.ajax({
											url : '${pageContext.request.contextPath}/loadproductcatdesc',
											data : ({
												datavalue : datavalue
											}),
											success : function(data) {

												var select = $('#sch_prd_cat_desc'
														+ count);
												select.find('option').remove();

												$('<option>').val("").text(
														"--Select--").appendTo(
														select);
												$
														.each(
																data,
																function(index,
																		value) {
																	$(
																			'<option>')
																			.val(
																					value.prd_cat_desc)
																			.text(
																					value.prd_cat_desc)
																			.appendTo(
																					select);
																});

											}
										});

							});

		} // Add Row over
		
		function submitform1()
	    {
	        $('#action').val("Cancel");
	         var aa = confirm('Do you want to proceed?')
	         if(aa == true)
	         {
	             $('#Saveform').submit();
	             }
	         else {
	                 return false;
	             }
	    } // submitform1 end of submitform1
	    function submitform()
	    {
	        $('#action').val("Active scheme");
	        var chkurl = $('#sch_opa_url').val();
	        var chkstdt = $('#start_date').val();
	        var chkendt = $('#end_date').val();
	        
	        var chkregncode = $('#appl_regn_code').val();
	        var chkdepocode = $('#sel_depo').val();
	        
	        $('#rowcount3').val($('#dynamic-table3 tr').length-1);

			var count3 = $('#rowcount3').val();
			var sch_itprd_line = true;
	        
			for(i=1; i<=count3; i++){
				 var sch_prd_code = $('#sch_prd_code'+i).val();
				 var sch_prd_grp = $('#sch_prd_grp'+i).val();
				 var sch_prd_cat = $('#sch_prd_cat'+i).val();
				 
				 if(sch_prd_code == '' && sch_prd_grp == '' && sch_prd_cat == '' ) {
					 sch_itprd_line = false;
				 }
				 

			}
	        
	        
	        
	        var chkdir = $('#sch_dir_name').val();
	        var chkfin = $('#fin_an_batch_file').val();
	        var chksch = $('#sch_an_batch_file').val();
	        var chkprd = $('#prc_rw_batch_file').val();
	        var chkparque = $('#attribute4').val();
	        var chkitcomment = $('#attribute5').val();


	         if( chkregncode!=null && chkregncode!="" &&  chkdepocode!=null && chkdepocode!="" &&
	        		 chkdir!=null && chkdir!="" &&  chkfin!=null && chkfin!="" &&
	        		 chksch!=null && chksch!="" &&  chkprd!=null && chkprd!="" &&
	        		 chkparque!=null && chkparque!="" &&  chkitcomment!=null && chkitcomment!="" &&
	        		 chkstdt!=null && chkstdt!="" &&  chkendt!=null && chkendt!="" )
	             {
	             var aa = confirm('Do you want to proceed?')
	             if(aa == true)
	             {
	                $('#Saveform').submit();
	            }
	             else {
	                 return false;
	                 }

	         }
	        else
	            {
	                alert("Please fill field of Mandatory Field");
	            }
	    } // submitform end of submitform
	</script>

<script>
	function SchemeProcessingDetailsHide() {
		var checkval = document.getElementById("SchemeProcessingDetailsHideID").checked;
		if(checkval == true){
			document.getElementById("SchemeProcessingDetails").style.display = "block";
			document.getElementById("sch_dir_name").value = "";
			document.getElementById("fin_an_batch_file").value = "";
			document.getElementById("sch_an_batch_file").value = "";
			document.getElementById("prc_rw_batch_file").value = "";
			document.getElementById("opa_whatif_url").value = "";
			document.getElementById("attribute4").value = "";
			document.getElementById("attribute5").value = "";
		}else{
			document.getElementById("SchemeProcessingDetails").style.display = "none";
			document.getElementById("sch_dir_name").value = "BPIL_SCH_ML7_1734_1718";
			document.getElementById("fin_an_batch_file").value = "BPIL_SCH_ML7_1734_1718_FIN_AN_Batch.bat";
			document.getElementById("sch_an_batch_file").value = "BPIL_SCH_ML7_1734_1718_SCH_AN_Batch.bat";
			document.getElementById("prc_rw_batch_file").value = "BPIL_SCH_ML7_1734_1718_RW_AN_Batch.bat";
			document.getElementById("opa_whatif_url").value = "https://bergerindiaprod--tst1.custhelp.com/web-determinations/startsession/BPIL_SCH_ML7_1734_1718_WhatIf";
			document.getElementById("attribute4").value = "1";
			document.getElementById("attribute5").value = "It Request";
		}
		
	}
	
	
</script>

</section>
