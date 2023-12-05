<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form action="updatescheme_request" class="form-horizontal"
	id="Saveform" ModelAttribute="New_Scheme_mstr" method="Post"
	enctype="multipart/form-data">
	<div class="card">
		<div class="card-header">
			<h5>Review Scheme Details</h5>
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
						name="scheme_name" id="scheme_name" readonly="readonly"
						value="${JSON.scheme_name}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Code</label> <input
						name="scheme_code" id="scheme_code" type="text"
						class="form-control form-control-sm form-control-primary"
						readonly="readonly" value="${JSON.scheme_code}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Status</label> <input
						name="active_flag" id="active_flag" type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" readonly="readonly" value="${JSON.active_flag}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Type</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						readonly="readonly" name="scheme_type" id="scheme_type"
						value="${JSON.scheme_type}">
				</div>
			</div>
			<div class="form-group row">
				<!--  Row 2 Started -->
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Business
						Line</label> <input name="scheme_business_line" id="scheme_business_line"
						type="text"
						class="form-control form-control-sm form-control-primary"
						readonly="readonly" value="${JSON.scheme_business_line}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Serial No</label> <input
						name="scheme_srl_no" id="scheme_srl_no" type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" readonly="readonly"
						value="${JSON.scheme_srl_no}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Budget</label> <input
						name="scheme_budget1" id="scheme_budget" type="text"
						class="form-control form-control-sm form-control-primary"
						readonly="readonly" value="${JSON.scheme_budget}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Version</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						name="revision" id="revision" readonly="readonly"
						value="${JSON.revision}">
				</div>
			</div>
			<div class="form-group row">
				<!--  Row 3 Started -->
				<div class="col-md-3">
					<label class="block" for="inputDefault">Effective Date From</label>
					<input type="text" class="form-control form-control-sm form-control-primary"
						id="start_date" name="start_date" value="${JSON.start_date1}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Effective Date To</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="end_date" name="end_date" value="${JSON.end_date1}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Redemption Date</label> <input
						id="redemption_date" name="redemption_date" type="text"
						class="form-control form-control-sm form-control-primary"
						readonly="readonly" value="${JSON.redemp_date1}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Fin Month</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						name="scheme_fin_month" id="scheme_fin_month" readonly="readonly"
						value="${JSON.scheme_fin_month}">
				</div>
			</div>
			<div class="form-group row">
				<!--  Row 4 Started -->
				<div class="col-md-3">
					<label class="block" for="inputDefault">Overall Volume
						Growth (%)</label> <input type="text"
						class="form-control form-control-sm form-control-primary"
						name="volume_growth" id="volume_growth" readonly="readonly"
						value="${JSON.volume_growth}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Overall Value
						Growth (%)</label> <input type="text"
						class="form-control form-control-sm form-control-primary"
						name="value_growth" id="value_growth" readonly="readonly"
						value="${JSON.value_growth}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Overall Spread (%)</label>
					<input type="text"
						class="form-control form-control-sm form-control-primary"
						name="spraid" id="spraid" readonly="readonly"
						value="${JSON.spraid}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Fin Year</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" readonly="readonly"
						value="${JSON.scheme_fin_yr}">
				</div>
			</div>
			<!--  Row 5 Started -->
			<div class="form-group row">
				<div class="col-md-3">
					<label class="block" for="inputDefault">Linked Scheme for
						Gift</label> <input type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" readonly="readonly"
						value="${JSON.parent_scheme_name}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Level</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						name="scheme_level" id="scheme_level" value="${JSON.scheme_level}" readonly="readonly">
				</div>
			</div>
			<div class="col-md-10">
				<label class="block" for="inputDefault" value="${JSON.objective}">Objective</label>
				<textarea class="form-control form-control-sm form-control-primary"
					rows="3" name="objective" id="objective"
					data-plugin-textarea-autosize>${JSON.objective}</textarea>
			</div>
		</div>
	</div>

	<div class="card">
		<div class="card-header">
			<h5>Budget details</h5>
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
						type="text" class="form-control" value="${JSON.provision_id}">
				</div>
				<div class="col-md-4">
					<label class="block" for="inputDefault">Budget Available</label> <input
						type="text" name="budget_available" id="budget_available"
						class="form-control" value="${JSON.budget_available}">
				</div>
				<div class="col-md-4">
					<label class="block" for="inputDefault">Provision Required
					</label> <input type="text" name="fin_analysis_flag" id="fin_analysis_flag"
						value="${JSON.fin_analysis_flag}" class="form-control" readonly />
					<input type="hidden" name="reference_sch_id" id="reference_sch_id"
						value="${JSON.reference_sch_id}" class="form-control"
						style="font-size: 16px" readonly /> <input type="hidden"
						name="sch_reward_eff_price" id="sch_reward_eff_price"
						value="${JSON.sch_reward_eff_price}" class="form-control"
						style="font-size: 16px" readonly /> <input type="hidden"
						name="confidence_pct" id="confidence_pct"
						value="${JSON.confidence_pct}" class="form-control"
						style="font-size: 16px" readonly /> <input type="hidden"
						name="outflow" id="outflow" value="${JSON.outflow}"
						class="form-control" style="font-size: 16px" readonly />

				</div>
			</div>
		</div>
	</div>

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
							id="appl_regn_code" class="form-control mb-md"
							value="${JSON.appl_regn_code}">
						</select>
					</div>
				</div>
				<div class="col-md-5">
										<label class="block">Selected Region <i
											class="menu-icon fa red"> *</i>
										</label>
										<div>

											<select multiple class="form-control form-control-sm "
												style="height: 170px;" name="sel_regn"
												id="sel_regn">
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
							class="form-control mb-md" required>

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
							name="sel_depo" class="form-control mb-md">
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
					<label class="control-label  no-padding-right">Dealers<i
						class="menu-icon fa red"> *</i>
					</label>
					<div>
						<select multiple style="height: 170px;" name="level" id="level"
							class="form-control mb-md" required readonly>
							<option selected value="">NA</option>
							<%--  <c:forEach var="levels" items="${depo1}"
											varStatus="status">
											<option selected value="${levels}">${levels}</option>
										</c:forEach> --%>
						</select>
					</div>
				</div>

				<div class="col-md-5">
					<label class="control-label  no-padding-right">Selected Dealers<i
						class="menu-icon fa red"> *</i>
					</label>
					<div>
						<select multiple style="height: 170px;" name="sel_level" id="sel_level"
							class="form-control mb-md" required>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>

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
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Created By</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" readonly="readonly"
						value="${lastname}  ${firstname}">
				</div>
				<div class="col-md-3">
					<label class="block" for="inputDefault">Scheme Created On</label> <input
						type="text"
						class="form-control form-control-sm form-control-primary"
						id="inputDisabled" readonly="readonly"
						value="${JSON.creation_date1}">
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-5">
					<label class="block" for="w4-first-name">Customer club
						class</label>
					<div class="form-radio">
						<c:set var="cust_clubclass">${JSON.cust_club_class}</c:set>
						<%
							String cust_clubclass = (String) pageContext.getAttribute("cust_clubclass");
						%>

						<div class="radio radio-inline">

							<%
								if (cust_clubclass.equals("XP")) {
							%>
							<label> <input type="radio" name="cust_club_class"
								value="XP"> <i class="helper"></i>Registered
							</label>
							<%
								} else {
							%>
							<label> <input type="radio" name="cust_club_class"
								value="XP"> <i class="helper"></i>Registered
							</label>
							<%
								}
							%>
						</div>
						<div class="radio radio-inline">
							<%
								if (cust_clubclass.equals("Non XP")) {
							%>
							<label><input type="radio" name="cust_club_class"
								value="Non XP" required="required"> <i class="helper"></i>Non-Registered</label>
							<%
								} else {
							%>
							<label><input type="radio" name="cust_club_class"
								value="Non XP" required="required"> <i class="helper"></i>Non-Registered</label>
							<%
								}
							%>
						</div>
						<div class="radio radio-inline">
							<%
								if (cust_clubclass.equals("")) {
							%>
							<label> <input type="radio" name="cust_club_class"
								checked="checked" value=""> <i class="helper"></i>All
							</label>
							<%
								} else {
							%>
							<label> <input type="radio" name="cust_club_class"
								checked="checked" value=""> <i class="helper"></i>All
							</label>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label">Customer Type</label>
			</div>
			<div class="form-group row">
				<div class="col-md-4">
					<label class="block">Select Customer Type </label>
					<div>
						<select multiple class="form-control form-control-sm "
							style="height: 170px;" name="cust_type" id="cust_type" required>
							<option value="select">--select--</option>
							<option value="All">All</option>
							<option value="15">Prolinks-Industrial</option>
							<option value="3">Ultratech Dealer(3)</option>
							<option value="4">Prolinks Dealer(4)</option>
							<option value="5">Dealer(5)</option>
							<option value="54">Retail Special Dealer</option>
							<option value="55">Retail Site Operations</option>
							<option value="56">Non Paint Dealer-CC</option>
							<option value="57">PXT Dealer(57)</option>
							<option value="58">Distributor-Retail</option>
							<option value="53">Wholesaler(53)</option>
							<option value="6">Contractor(6)</option>
							<option value="65">Retail Projects Strong</option>
							<option value="7">Alternate Distribution(7)</option>
							<option value="1001">Sales</option>
							<option value="66">Prolinks Special Dealer(66)</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<label class="block">Selected Customer Type <i
						class="menu-icon fa red"> *</i>
					</label>
					<div>
						<select multiple style="height: 170px;" id="cust_type_s"
							name="cust_type_s" class="form-control form-control-sm ">
							<option value="15" selected>Prolinks-Industrial</option>
							<option value="3" selected>Ultratech Dealer(3)</option>
							<option value="4" selected>Prolinks Dealer(4)</option>
							<option value="5" selected>Dealer(5)</option>
							<option value="54" selected>Retail Special Dealer</option>
							<option value="55" selected>Retail Site Operations</option>
							<option value="56" selected>Non Paint Dealer-CC</option>
							<option value="57" selected>PXT Dealer(57)</option>
							<option value="58" selected>Distributor-Retail</option>
							<option value="53" selected>Wholesaler(53)</option>
							<option value="6" selected>Contractor(6)</option>
							<option value="65" selected>Retail Projects Strong</option>
							<option value="7" selected>Alternate Distribution(7)</option>
							<option value="1001" selected>Sales</option>
							<option value="66" selected>Prolinks Special Dealer(66)</option>
						</select>
					</div>
				</div>
			</div>
			<div class="border-checkbox-section" hidden>
				<div class="form-group row">

					<%
						Boolean cust_type15 = false;
						Boolean cust_type3 = false;
						Boolean cust_type4 = false;
						Boolean cust_type5 = false;
						Boolean cust_type54 = false;
						Boolean cust_type55 = false;
						Boolean cust_type56 = false;
						Boolean cust_type57 = false;
						Boolean cust_type58 = false;
						Boolean cust_type6 = false;
						Boolean cust_type65 = false;
						Boolean cust_type66 = false;
						Boolean cust_type7 = false;
						Boolean cust_type53 = false;
						Boolean cust_type1001 = false;

						String cust_type = "";
					%>

					<c:forEach var="custtypes" items="${schcusttypes}"
						varStatus="status">

						<c:set var="cust_type" value="${custtypes.cust_type}"></c:set>

						<%
							cust_type = (String) pageContext.getAttribute("cust_type");

								if (cust_type.equals("15")) {
									cust_type15 = true;
								} else if (cust_type.equals("3")) {
									cust_type3 = true;
								} else if (cust_type.equals("4")) {
									cust_type4 = true;
								} else if (cust_type.equals("5")) {
									cust_type5 = true;
								} else if (cust_type.equals("54")) {
									cust_type54 = true;
								} else if (cust_type.equals("55")) {
									cust_type55 = true;
								} else if (cust_type.equals("56")) {
									cust_type56 = true;
								} else if (cust_type.equals("57")) {
									cust_type57 = true;
								} else if (cust_type.equals("58")) {
									cust_type58 = true;
								} else if (cust_type.equals("6")) {
									cust_type6 = true;
								} else if (cust_type.equals("65")) {
									cust_type65 = true;
								} else if (cust_type.equals("66")) {
									cust_type66 = true;
								} else if (cust_type.equals("7")) {
									cust_type7 = true;
								} else if (cust_type.equals("53")) {
									cust_type53 = true;
								} else if (cust_type.equals("1001")) {
									cust_type1001 = true;
								}
						%>
					</c:forEach>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type15) {
							%>
							<input name="cust_type" type="checkbox" id="checkbox1" class=""
								value="15" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" id="checkbox1" class=""
								value="15" />
							<%
								}
							%>
							<label for="border-checkbox-label" for="checkbox1">Prolinks-Industrial
								(15)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type3) {
							%>
							<input name="cust_type" type="checkbox" class="" value="3" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="3" />
							<%
								}
							%>
							<label for="border-checkbox-label">Ultratech Dealer (3)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type4) {
							%>
							<input name="cust_type" type="checkbox" class="" value="4" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="4" />
							<%
								}
							%>
							<label for="border-checkbox-label">Prolinks Dealer (4)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type5) {
							%>
							<input name="cust_type" type="checkbox" class="" value="5" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="5" />
							<%
								}
							%>
							<label for="border-checkbox-label">Dealer (5)</label>
						</div>
					</div>
				</div>
			</div>
			<div class="border-checkbox-section" hidden>
				<div class="form-group row">
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type54) {
							%>
							<input name="cust_type" type="checkbox" class="" value="54" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="54" />
							<%
								}
							%>
							<label for="border-checkbox-label">Retail Special Dealer
								(54)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type55) {
							%>
							<input name="cust_type" type="checkbox" class="" value="55" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="55" />
							<%
								}
							%>
							<label for="border-checkbox-label">Retail Site Operations
								(55)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type56) {
							%>
							<input name="cust_type" type="checkbox" class="" value="56" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="56" />
							<%
								}
							%>
							<label for="border-checkbox-label">Non Paint Dealer - CC
								(56)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type57) {
							%>
							<input name="cust_type" type="checkbox" class="" value="57" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="57" />
							<%
								}
							%><label for="border-checkbox-label">PXT Dealer (57)</label>
						</div>
					</div>
				</div>
			</div>
			<div class="border-checkbox-section" hidden>
				<div class="form-group row">
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type58) {
							%>
							<input name="cust_type" type="checkbox" class="" value="58" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="58" />
							<%
								}
							%><label for="border-checkbox-label">Distributor - Retail
								(58)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type53) {
							%>
							<input name="cust_type" type="checkbox" class="" value="53" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="53" />
							<%
								}
							%>
							<label for="border-checkbox-label">Wholesaler (53)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type6) {
							%>
							<input name="cust_type" type="checkbox" class="" value="6" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="6" />
							<%
								}
							%>
							<label for="border-checkbox-label">Contractor (6)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type65) {
							%>
							<input name="cust_type" type="checkbox" class="" value="65" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="65" />
							<%
								}
							%>
							<label for="border-checkbox-label">Retail Projects Strong
								(65)</label>
						</div>
					</div>
				</div>
			</div>
			<div class="border-checkbox-section" hidden>
				<div class="form-group row">
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type66) {
							%>
							<input name="cust_type" type="checkbox" class="" value="66" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="66" />
							<%
								}
							%>
							<label for="border-checkbox-label">Prolinks Special
								Dealer (66)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<%
								if (cust_type7) {
							%>
							<input name="cust_type" type="checkbox" class="" value="7" />
							<%
								} else {
							%>
							<input name="cust_type" type="checkbox" class="" value="7" />
							<%
								}
							%>
							<label for="border-checkbox-label">Alternate Distribution
								(7)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input name="cust_type" type="checkbox" class="" value="1001"
								checked="checked" /> <label for="border-checkbox-label">Sales</label>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>

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
						onsubmit="return validation(this)" class="form-control"
						multiple="">

				</div>
				<div class="col-md-6">

					<label>Upload Other Document </label> <input type="file"
						name="doc_file1" id="id-input-file-4"
						onsubmit="return validation(this)" class="form-control"
						multiple="">

				</div>
			</div>

		</div>
	</div>

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
			<div class="table-responsive">
				<input type="hidden" id="rowcount1" name="rowcount1" value="">
				<table
					class="table table-bordered table-striped table-condensed mb-none"
					id="dynamic-table1">
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
			<div class="form-group row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<input type="button" class="btn btn-primary btn-sm" value="Add Row"
						onclick="AddRow()"> <input type="button"
						class="btn btn-primary btn-sm" value="Delete Row"
						onclick="delRow(<%=j%>)">
				</div>
			</div>
		</div>
	</div>

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
			<div class="flow-group row">
				<div class="col-md-3">
					<label class="block" for="inputDefault">Total Product
						Outflow of Scheme</label> <input type="text" name="scheme_budget1"
						id="scheme_budget"
						value="<fmt:formatNumber
																				value="${JSON.scheme_budget}"
																				pattern="#,##0.0" />"
						class="form-control" readonly /> <input name="scheme_budget"
						id="scheme_budget1" value="${JSON.scheme_budget}"
						class="form-control" readonly type="hidden" />
				</div>
			</div>
			<div class="flow-group row">
				<div class="col-md-4"
					style="padding-left: 0; padding-right: 0; padding-top: 30px">
					<input type="hidden" id="rowcount3" name="rowcount3" value="">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							id="dynamic-table3">

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
										<td>
											<%--                     <input type="text" value="${grp_reg.sch_prd_line_type}" id="sch_prd_outflow_line_type<%=j2%>" name="sch_prd_outflow_line_type" class="fetchprdlinetype" style="width:100%;" readonly/> --%>

											<select id="sch_prd_outflow_line_type<%=j2%>"
											name="sch_prd_outflow_line_type"
											class="form-control form-control-sm form-control-primary"
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

													<%-- 							<option value="${grp_reg.sch_prd_line_type}">${grp_reg.sch_prd_line_type}</option> --%>

												</c:forEach>


										</select>

										</td>


										<td>
											<%--                 <input type="text" value="${grp_reg.sch_prd_value}" id="sch_product_outflow_id<%=j2%>" name="sch_product_outflow_id" class="fetchprdval" style="width:100%;" readonly/> --%>

											<select id="sch_product_outflow_id<%=j2%>"
											name="sch_product_outflow_id"
											class="form-control form-control-sm form-control-primary"
											value="${grp_reg.sch_prd_value}" style="width: 100%;"
											required>
												<option value="${grp_reg.sch_prd_value}">${grp_reg.sch_prd_value}</option>
										</select>
										</td>

									</tr>
									<%
											j2 = j2 + 1;
										%>
								</c:forEach>


							</tbody>

						</table>
					</div>
				</div>
				<!-- End of Col-mod-3 -->
				<div class="col-md-8"
					style="padding-left: 0; padding-right: 0; padding-top: 30px">

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
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.lly_vol}" groupingUsed = "false" type = "number"/>" id="sch_prd_lly_vol<%=j3%>" name="sch_prd_lly_vol"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="hidden" class="form-control"
											value="<fmt:formatNumber value="${grp_reg.lly_vol}" pattern="###0.00" />"
											id="sch_prd_lly_vol<%=j3%>" name="sch_prd_lly_vol"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											class="form-control form-control-sm form-control-primary"
											type="text" class="form-control mb-md"
											value="<fmt:formatNumber value="${grp_reg.lly_vol_div}" pattern="###0.00" />"
											id="sch_prd_lly_vol_div<%=j3%>" name="sch_prd_lly_vol_div"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />
										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.ly_vol}" groupingUsed = "false" type = "number"/>" id="sch_prd_ly_vol<%=j3%>" name="sch_prd_ly_vol"  style="width:100%;" onkeypress="return 	(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="hidden" class="form-control"
											value="<fmt:formatNumber value="${grp_reg.ly_vol}" pattern="###0.00" />"
											id="sch_prd_ly_vol<%=j3%>" name="sch_prd_ly_vol"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.ly_vol_div}" pattern="###0.00" />"
											id="sch_prd_ly_vol_div<%=j3%>" name="sch_prd_ly_vol_div"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.proj_grwth_vol_pct}" groupingUsed = "false" type = "number"/>" id="proj_grwth_vol_pct<%=j3%>" name="proj_grwth_vol_pct" class="fetchgrwthvolpct"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" required readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.proj_grwth_vol_pct}" pattern="###0.00" />"
											id="proj_grwth_vol_pct<%=j3%>" name="proj_grwth_vol_pct"
											class="fetchgrwthvolpct" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" required />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.proj_ty_vol}" groupingUsed = "false" type = "number"/>" id="sch_prd_ty_vol<%=j3%>" name="sch_prd_ty_vol" class="fetchprdtyvol"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="hidden" class="form-control"
											value="<fmt:formatNumber value="${grp_reg.proj_ty_vol}" pattern="###0.00" />"
											id="sch_prd_ty_vol<%=j3%>" name="sch_prd_ty_vol"
											class="fetchprdtyvol" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.proj_ty_vol_div}" pattern="###0.00" />"
											id="sch_prd_ty_vol_div<%=j3%>" name="sch_prd_ty_vol_div"
											class="fetchprdtyvol_div" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.lly_val}" groupingUsed = "false" type = "number"/>" id="sch_prd_lly_val<%=j3%>" name="sch_prd_lly_val"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="hidden" class="form-control"
											value="<fmt:formatNumber value="${grp_reg.lly_val}" pattern="###0.00" />"
											id="sch_prd_lly_val<%=j3%>" name="sch_prd_lly_val"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.lly_val_div}" pattern="###0.00" />"
											id="sch_prd_lly_val_div<%=j3%>" name="sch_prd_lly_val_div"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.ly_val}" groupingUsed = "false" type = "number"/>" id="sch_prd_ly_val<%=j3%>" name="sch_prd_ly_val"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="hidden" class="form-control"
											value="<fmt:formatNumber value="${grp_reg.ly_val}" pattern="###0.00" />"
											id="sch_prd_ly_val<%=j3%>" name="sch_prd_ly_val"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.ly_val_div}" pattern="###0.00" />"
											id="sch_prd_ly_val_div<%=j3%>" name="sch_prd_ly_val_div"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.proj_grwth_val_pct}" groupingUsed = "false" type = "number"/>" id="proj_grwth_val_pct<%=j3%>" name="proj_grwth_val_pct" class="fetchgrwthvolpct"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" required readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.proj_grwth_val_pct}" pattern="###0.00" />"
											id="proj_grwth_val_pct<%=j3%>" name="proj_grwth_val_pct"
											class="fetchgrwthvalpct form-control mb-md"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" required />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.proj_ty_val}" groupingUsed = "false" type = "number"/>" id="sch_prd_ty_val<%=j3%>" name="sch_prd_ty_val"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="hidden" class="form-control"
											value="<fmt:formatNumber value="${grp_reg.proj_ty_val}" pattern="###0.00" />"
											id="sch_prd_ty_val<%=j3%>" name="sch_prd_ty_val"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly /> <input
											type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.proj_ty_val_div}" pattern="###0.00" />"
											id="sch_prd_ty_val_div<%=j3%>" name="sch_prd_ty_val_div"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_tgt_vol}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_tgt_vol<%=j3%>" name="sch_prd_spread_tgt_vol" class="fetchspdvol"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.spread_tgt_vol}" pattern="###0" />"
											id="sch_prd_spread_tgt_vol<%=j3%>"
											name="sch_prd_spread_tgt_vol" class="fetchspdvol"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_tgt_val}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_tgt_val<%=j3%>" name="sch_prd_spread_tgt_val" class="fetchspdval"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.spread_tgt_val}" pattern="###0" />"
											id="sch_prd_spread_tgt_val<%=j3%>"
											name="sch_prd_spread_tgt_val" class="fetchspdval"
											style="width: 100%;" onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_mtd_ly_vol}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_mtd_ly_vol<%=j3%>" name="sch_prd_spread_mtd_ly_vol"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.spread_mtd_ly_vol}" pattern="###0" />"
											id="sch_prd_spread_mtd_ly_vol<%=j3%>"
											name="sch_prd_spread_mtd_ly_vol" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_mtd_ly_val}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_mtd_ly_val<%=j3%>" name="sch_prd_spread_mtd_ly_val"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.spread_mtd_ly_val}" pattern="###0" />"
											id="sch_prd_spread_mtd_ly_val<%=j3%>"
											name="sch_prd_spread_mtd_ly_val" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.proj_grwth_spd_pct}" groupingUsed = "false" type = "number"/>" id="proj_grwth_spd_pct<%=j3%>" name="proj_grwth_spd_pct" class="fetchgrwthpct"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" required readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.proj_grwth_spd_pct}" pattern="###0.00" />"
											id="proj_grwth_spd_pct<%=j3%>" name="proj_grwth_spd_pct"
											class="fetchgrwthspdpct" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" required />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.spread_mtd_ty_tgt_vol}" groupingUsed = "false" type = "number"/>" id="sch_prd_spread_mtd_ty_tgt_vol<%=j3%>" name="sch_prd_spread_mtd_ty_tgt_vol"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary"
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
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.wt_avg}" pattern="###0.00" />"
											id="sch_prd_wt_avg<%=j3%>" name="sch_prd_wt_avg"
											class="fetchwtavg" style="width: 100%;"
											onkeypress="return isNumber(event);"
											pattern="[0-9]+([\.][0-9]+)?" step="0.01" required />

										</td>
										<td>
											<%--                 		<input type="text" value="<fmt:formatNumber value = "${grp_reg.total_prd_bdgt}" groupingUsed = "false" type = "number"/>" id="sch_prd_total_prd_bdgt<%=j3%>" name="sch_prd_total_prd_bdgt"  style="width:100%;" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" readonly/> --%>
											<input type="text"
											class="form-control form-control-sm form-control-primary"
											value="<fmt:formatNumber value="${grp_reg.total_prd_bdgt}" pattern="###0.00" />"
											id="sch_prd_total_prd_bdgt<%=j3%>"
											name="sch_prd_total_prd_bdgt" style="width: 100%"
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
			<div class="flow-group row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<input type="button" class="btn btn-primary btn-sm" value="Add Row"
						onclick="AddRow2()"> <input type="button"
						class="btn btn-primary btn-sm" value="Delete Row"
						onclick="delRow2(<%=j2%>)">
				</div>
			</div>
		</div>
		<!--  End Of Col -->

	</div>
	<!--  End Of Row -->

	</div>
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
								<td><%=i%> <%--                          <input type="hidden" value="${grp_reg.scheme_doc_id}" id="scheme_doc_id<%=i%>" name="scheme_doc_id" /> --%>
								</td>

								<td>${grp_reg.doc_type}</td>

								<td>${grp_reg.doc_title}</td>

								<td>${grp_reg.revision}</td>
								<td>${grp_reg.doc_upload_date1}</td>
								<td><div class="col-sm-12 col-md-6 col-lg-4 outer-ellipsis"><a href="DowdDocument?Doc_id=${grp_reg.scheme_doc_id}"><i
									class="typcn typcn-download"></i></a></div></td>


							</tr>
							<%
								i = i + 1;
							%>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="form-group row">
				<input type="hidden" name="scheme_id" id="scheme_id"
					value="${JSON.scheme_id}" /> <input type="button" id="show1"
					class="btn btn-primary btn-sm" value="Show All Documents"
					onclick="show_all_doc()" /> <input type="button" id="log1"
					class="btn btn-primary btn-sm" value="Logs" onclick="Log1()" />
			</div>
		</div>

	</div>

	<div class="form-group row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<input type="hidden" name="action" id="action" value=""> <input
				type="button" class="btn btn-primary btn-sm" id="show" value="Save"
				onclick="submitform()"> <input type="button"
				class="btn btn-primary btn-sm" id="log"
				value="Save And Submit For Approval" onclick="SaveApprovalScheme()">
		</div>
	</div>
</form>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
function isNumber(evt) {
	var iKeyCode = (evt.which) ? evt.which : evt.keyCode;

	if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
    
	return false;

	
return true;
}

function deletefile(x,y)
{

var a=confirm("Do you want to proceed?");
if(a==true)
    {
window.location.href="DeleteDoc?Doc_id="+x+"&scheme_id="+y;

    }else
        {

        }
}
</script>
<script>

function addbudget()
{
	 var budget=document.getElementById("manual_provision").value;
	

     document.getElementById("scheme_budget").value=budget; 
     
}

function checkstart()
{
	
	var start_date=$('#start_date').val();
	 var end_date=$('#end_date').val();
	 alert(start_date);
	 alert(end_date);
	
	 if(end_date==null || end_date==0)
		 {
		 var a1= start_date.substr(0,2);
		 var a2 = start_date.substr(3,3);
		 var a3 = start_date.substr(6,8);				
		 var q="-";				
		 var str1=a3.concat(q);		
		 var str2=str1.concat(a2);			
	     var str3=str2.concat(a1);
			var dateOne = new Date(str3);
	
		
		 }
	 else
		 {
		 var a1= start_date.substr(0,2);
		 var a2 = start_date.substr(3,3);
		 var a3 = start_date.substr(6,8);				
		 var q="-";				
		 var str1=a3.concat(q);		
		 var str2=str1.concat(a2);			
	     var str3=str2.concat(a1);
								
			//commising
		 var b1= end_date.substr(0,2);
		 var b2 = end_date.substr(3,3);
		 var b3 = end_date.substr(6,8);			
		 var str5=b3.concat(q);		
		 var str6=str5.concat(b2);			
		 var str7=str6.concat(b1);							
					
		var dateOne = new Date(str3);
		var dateTwo = new Date(str7);

		 if ( dateOne <= dateTwo )
		     {
			   			 			         
		      }	else {	
		    	  			alert("Please Check Start Date should be less than End Date");
							$('#start_date').val("");
							 $('#end_date').val("");
							 $('#redemption_date').val("");
				 	   }
		 }
	    	
}

function checkattend()
{
	
	var start_date=$('#start_date').val();
	 var end_date=$('#end_date').val();

	 if(start_date!=null )
		 {
		//installation	 
		 var s1= start_date.substr(0,2);
		 var s2 = start_date.substr(3,3);
		 var s3 = start_date.substr(6,8);				
		var q="-";				
		var str1=s3.concat(q);		
		var str2=str1.concat(s2);			
		var str3=str2.concat(s1);
			
//commising
		var b1= end_date.substr(0,2);
		 var b2 = end_date.substr(3,3);
		 var b3 = end_date.substr(6,8);			
		 var str5=b3.concat(q);		
		var str6=str5.concat(b2);			
		var str7=str6.concat(b1);



	 	var dateOne = new Date(str3);
       var dateTwo = new Date(str7);

       if ( dateOne <= dateTwo )
       {
    	
    	   var a=document.getElementById("end_date").value;
           //alert(a);
           var month=a.substring(3,5);
           var year=a.substring(6);
           //alert(year);

           if(month=="01")
               {
               var a1="25-02-"+year;
               document.getElementById("redemption_date").value=a1;
               }else if(month=="02")
               {
                   var a1="25-03-"+year;
   document.getElementById("redemption_date").value=a1;
               }else if(month=="03")
               {
                   var a1="25-04-"+year;
   document.getElementById("redemption_date").value=a1;
               }else if(month=="04")
               {
                   var a1="25-05-"+year;
   document.getElementById("redemption_date").value=a1;
               }else if(month=="05")
               {
                   var a1="25-06-"+year;
   document.getElementById("redemption_date").value=a1;
               }else if(month=="06")
               {
                   var a1="25-07-"+year;
   document.getElementById("redemption_date").value=a1;
               }else if(month=="07")
               {
                   var a1="25-08-"+year;
   document.getElementById("redemption_date").value=a1;
               }else if(month=="08")
               {
                   var a1="25-09-"+year;
   document.getElementById("redemption_date").value=a1;
               }else if(month=="09")
               {
                   var a1="25-10-"+year;
   document.getElementById("redemption_date").value=a1;
               }else if(month=="10")
               {
                   var a1="25-11-"+year;
   document.getElementById("redemption_date").value=a1;
               }else if(month=="11")
               {
                   var a1="25-12-"+year;
   document.getElementById("redemption_date").value=a1;
               }else if(month=="12")
               {
               	year = parseInt(year) + 1;
                   var a1="25-01-"+year;
   document.getElementById("redemption_date").value=a1;
               }else {
               	document.getElementById("redemption_date").value="";
               }

	         
        }

		else {		       alert("Please Check Start Date should be less than End Date");
		$('#end_date').val("");
		$('#redemption_date').val("");
		        }

		 }else
			 {
			 alert("Please check Invoice date first");
			 
			 }
	 
				
	 
	 
	
	
       }
    </script>
<script>
function GenerateCode()
{
var fin=document.getElementById("scheme_fin_yr").value;
var sline=document.getElementById("scheme_business_line").value;
var srno=document.getElementById("scheme_srl_no").value;

var scode=fin+"-"+sline+"-"+srno;

document.getElementById("scheme_code").value=scode;
//alert(scode);
}
</script>
<script>
window.onload=function()
{

$("#submit1").show();


}
</script>

<script>
function financialanalysis()
{

 var p=document.getElementById("sch_reward_eff_price").value;
//window.open("primaryfinancialanalysis?price="+p,"Ratting","width=750,height=450,left=250,top=200,toolbar=0,status=0,");


    var sc_name=document.getElementById("scheme_name").value;

    var sc_id=document.getElementById("scheme_id").value;





window.open("primaryfinancialanalysis?scheme_name="+sc_name+"&scheme_id="+sc_id+"&price="+p,"Ratting","width=750,height=550,left=100,top=100,toolbar=0,status=0,");


}
</script>
<script>
function submitform1()
{
	
	 var a=confirm("Please Save the Changes before Submitting. Do you want to proceed for Scheme Request to IT?");
	    if(a==true)
	        {

        var id=document.getElementById("scheme_id").value;
        var budget=document.getElementById("scheme_budget").value;

window.location.href="statusrequested?scheme_id="+id+"&budget="+budget;

	        }else
            {

            }

}
</script>

<script>
    function submitform()
    {
    	
    	var scheme_budget = $('#scheme_budget').val();
    	var fin_analysis_flag = $('#fin_analysis_flag').val();
    	var scheme_name = $('#scheme_name').val();
    	var start_date = $('#start_date').val();
    	alert(start_date);
		var end_date = $('#end_date').val();
		alert(end_date);
		var redemption_date = $('#redemption_date').val();
		alert(redemption_date);
		var objective = $('#objective').val();
		var attribute1 = $('#attribute1').val();
		var provision_id = $('#provision_id').val();
		var budget_available = $('#budget_available').val();
		
		var chkregncode = $('#appl_regn_code').val();
        var chkdepocode = $('#sel_depo').val();
        


        
        var atLeastOneIsChecked = $('input:checkbox').is(':checked');
		
		$('#rowcount1').val($('#dynamic-table1 tr').length-1);

		var count1 = $('#rowcount1').val();
		var gift_group = true;
		var gift_name = true;
		for(i=1; i<=count1; i++){
			 var gift_groupline = $('#gift_group'+i).val();
			 var gift_nameline = $('#gift_name'+i).val();
			
			 if(gift_groupline == '') {
				 gift_group = false;
			 }
			 if(gift_nameline == '') {
				 gift_name = false;
			 }

		}
		

		$('#rowcount3').val($('#dynamic-table3 tr').length-1);

		var count3 = $('#rowcount3').val();
		var sch_prd_outflow_line_type = true;
		var sch_product_outflow_id = true;
		for(i=1; i<=count3; i++){
			 var sch_prd_outflow_line_typeline = $('#sch_prd_outflow_line_type'+i).val();
			 var sch_product_outflow_idline = $('#sch_product_outflow_id'+i).val();
			
			 if(sch_prd_outflow_line_typeline == '') {
				 sch_prd_outflow_line_type = false;
			 }
			 if(sch_product_outflow_id == '') {
				 sch_product_outflow_id = false;
			 }

		}

		
// 		if (scheme_name  == '' || start_date  == '' || end_date  == '' || 
// 				redemption_date  == '' ||   
// 				provision_id  == '' || budget_available  == '' || gift_group == false || gift_name == false ) {
// 	        alert('Please Fill required fields.');
// 	        return false;
// 	    } 
		if (scheme_name  == '' ) {
	        alert('Scheme Name is mandatory');
	        return false;
	    } 
		else
			if (start_date  == '') {
	 	        alert('Effective Date From is mandatory.');
	 	        return false;
	 	    } else
			
	 		if ( end_date  == '') {
	 	        alert('Effective Date To is mandatory.');
	 	        return false;
	 	    } else 
	 	    	if (redemption_date  == '') {
	 	 	        alert('Redemption Date is mandatory.');
	 	 	        return false;
	 		    
	 	 	    } else 
	 	 	    	if (provision_id  == '') {
	 	 	 	        alert('Adex ID is mandatory.');
	 	 	 	        return false;
	 	 		    
	 	 	 	    } else 
	 	 			
	 	 	 		if (budget_available  == '') {
	 	 	 	        alert('Budget Available is mandatory.');
	 	 	 	        return false;
	 	 		    
	 	 	 	    } else 
	 	 	 	    	if (chkregncode == null || chkregncode  == '') {
		 	 	 	        alert('Region is mandatory.');
		 	 	 	        return false;
		 	 		    
		 	 	 	    } else 
		 	 			
		 	 	 	    	if( chkdepocode == null || chkdepocode == ""  )
		                    {
		            		 alert('Please add at least one depot for scheme.');
		            		 return false;
		                    } else
		                    	if(atLeastOneIsChecked == false) {
		                    		
		                 	         alert('Please check at least one customer type.');
		                 	        return false;
		                 		} else
		                    	
// 		                    	if(count1 < 1) {
//		               			alert('Please add atleast one Scheme Reward for Scheme.');
//		             	         e.preventDefault(e);
//		               		}
		                	
//		                 	else
	 	 	 	    	if (gift_group == false) {
		 	 	 	        alert('Reward Group is mandatory.');
		 	 	 	        return false;
		 	 		    
		 	 	 	    } else 
		 	 			
		 	 	 		if (gift_name == false) {
		 	 	 	        alert('Reward Item is mandatory.');
		 	 	 	        return false;
		 	 		    
		 	 	 	    } else 
			
		 	 	 	    	if(count3 < 1) {
		              			alert('Please add atleast one Product Outflow for Scheme.');
		            	         e.preventDefault(e);
		              		}
		            	else
		            		if (sch_prd_outflow_line_type == false) {
			 	 	 	        alert('Product Outflow line type is mandatory.');
			 	 	 	        return false;
			 	 		    
			 	 	 	    } else 
			 	 			
			 	 	 		if (sch_product_outflow_idline == false) {
			 	 	 	        alert('Product Outflow Product value is mandatory.');
			 	 	 	        return false;
			 	 		    
			 	 	 	    } else 
    	if(scheme_budget == 0 && fin_analysis_flag == "N") {
    	         alert('Scheme Provision cannot be 0. Please provide proper value.');
    	         return false;
    	} 
// 		else 
		
// 		if () {
// 	        alert('start date is required.');
// 	        return false;
// 	    } else
		
// 		if () {
// 	        alert('end date is required.');
// 	        return false;
// 	    } else 
		
// 		if () {
// 	        alert('redemption date is required.');
// 	        return false;
	    
// 	    } else 
	    
// 		if () {
// 	        alert('objective is required.');
// 	        return false;
	    
// 	    } else 
		
// 		if () {
// 	        alert('Scheme combination is required.');
// 	        return false;
	    
// 	    } else 
		
// 		if () {
// 	        alert('addex id is required.');
// 	        return false;
	    
// 	    } else 
		
// 		if () {
// 	        alert('budget available is required.');
// 	        return false;
	    
// 	    }
    	
    	else {
    		
    		
    		
    		var aa = confirm('Do you want to update this scheme?');

         if(aa == true)
         {
//         	 var form = $( "#Saveform" );
//         	 form.validate();
        	
//         	   alert( "Valid: " + form.valid() );
 
    		
        	
                $('#Saveform').submit();
    	 
//                 $('#Saveform').valid();
             }
         else {
             return false;
             }
    	}

//          var aa = confirm('Do you want to update this scheme?');
//          if(aa == true)
//          {
//              $('#Saveform').submit();
//              }
//          else {
//                  return false;
//              }
    }
    
    function ApprovalScheme()
    {

        var a=confirm("Please Save the Changes before Submitting. \n Do you want to proceed for Approval of Scheme?");
    if(a==true)
        {
        var scheme_id=document.getElementById("scheme_id").value;
    	window.location.href="approveschememodify?scheme_id="+scheme_id;
        }else
            {

            }
    }
    
    function SaveApprovalScheme()
    {
    	
    	var scheme_budget = $('#scheme_budget').val();
    	/* 
    	if(scheme_budget == 0) {
            alert('Scheme Provision cannot be 0. Please provide proper value.');
    } else { */
    	
    	var scheme_budget = $('#scheme_budget').val();
    	var fin_analysis_flag = $('#fin_analysis_flag').val();
    	var scheme_name = $('#scheme_name').val();
    	var start_date = $('#start_date').val();
		var end_date = $('#end_date').val();
		var redemption_date = $('#redemption_date').val();
		var objective = $('#objective').val();
		var attribute1 = $('#attribute1').val();
		var provision_id = $('#provision_id').val();
		var budget_available = $('#budget_available').val();
		
		var chkregncode = $('#appl_regn_code').val();
        var chkdepocode = $('#sel_depo').val();
        
        var atLeastOneIsChecked = $('input:checkbox').is(':checked');
		
		$('#rowcount1').val($('#dynamic-table1 tr').length-1);

		var count1 = $('#rowcount1').val();
		var gift_group = true;
		var gift_name = true;
		for(i=1; i<=count1; i++){
			 var gift_groupline = $('#gift_group'+i).val();
			 var gift_nameline = $('#gift_name'+i).val();
			 if(gift_groupline == '') {
				 gift_group = false;
			 }
			 if(gift_nameline == '') {
				 gift_name = false;
			 }

		}
		

		$('#rowcount3').val($('#dynamic-table3 tr').length-1);

		var count3 = $('#rowcount3').val();
		var sch_prd_outflow_line_type = true;
		var sch_product_outflow_id = true;
		for(i=1; i<=count3; i++){
			 var sch_prd_outflow_line_typeline = $('#sch_prd_outflow_line_type'+i).val();
			 var sch_product_outflow_idline = $('#sch_product_outflow_id'+i).val();
			
			 if(sch_prd_outflow_line_typeline == '') {
				 sch_prd_outflow_line_type = false;
			 }
			 if(sch_product_outflow_id == '') {
				 sch_product_outflow_id = false;
			 }

		}

		if (scheme_name  == '' ) {
	        alert('Scheme Name is mandatory');
	        return false;
	    } 
		else
			if (start_date  == '') {
	 	        alert('Effective Date From is mandatory.');
	 	        return false;
	 	    } else
			
	 		if ( end_date  == '') {
	 	        alert('Effective Date To is mandatory.');
	 	        return false;
	 	    } else 
	 	    	if (redemption_date  == '') {
	 	 	        alert('Redemption Date is mandatory.');
	 	 	        return false;
	 		    
	 	 	    } else 
	 	 	    	if (provision_id  == '') {
	 	 	 	        alert('Adex ID is mandatory.');
	 	 	 	        return false;
	 	 		    
	 	 	 	    } else 
	 	 			
	 	 	 		if (budget_available  == '') {
	 	 	 	        alert('Budget Available is mandatory.');
	 	 	 	        return false;
	 	 		    
	 	 	 	    } else 
	 	 	 	    	if (chkregncode == null || chkregncode  == '') {
		 	 	 	        alert('Region is mandatory.');
		 	 	 	        return false;
		 	 		    
		 	 	 	    } else 
		 	 			
		 	 	 	    	if( chkdepocode == null || chkdepocode == ""  )
		                    {
		            		 alert('Please add at least one depot for scheme.');
		            		 return false;
		                    } else
		                    	if(atLeastOneIsChecked == false) {
		                    		
		                 	         alert('Please check at least one customer type.');
		                 	        return false;
		                 		} else
		                    	
	 	 	 	    	if (gift_group == false) {
		 	 	 	        alert('Reward Group is mandatory.');
		 	 	 	        return false;
		 	 		    
		 	 	 	    } else 
		 	 			
		 	 	 		if (gift_name == false) {
		 	 	 	        alert('Reward Item is mandatory.');
		 	 	 	        return false;
		 	 		    
		 	 	 	    } else 
			
		 	 	 	    	if(count3 < 1) {
		              			alert('Please add atleast one Product Outflow for Scheme.');
		            	         e.preventDefault(e);
		              		}
		            	else
		            		if (sch_prd_outflow_line_type == false) {
			 	 	 	        alert('Product Outflow line type is mandatory.');
			 	 	 	        return false;
			 	 		    
			 	 	 	    } else 
			 	 			
			 	 	 		if (sch_product_outflow_idline == false) {
			 	 	 	        alert('Product Outflow Product value is mandatory.');
			 	 	 	        return false;
			 	 		    
			 	 	 	    } 
	   	
    	else {
    		 var a=confirm("Do you want to save and proceed for Approval of Scheme?");
    		    if(a==true)
    		     {
    		    	$('#action').val("SaveAndApprove");
    		        $('#Saveform').submit();
    		        
    		        
    		        
    				var scheme_code=document.getElementById("scheme_code").value;
    				
    				

    			//	document.getElementById("scheme_code").value=scode;

    					swal({
    						title : "Done",
    						text : scheme_code,
    						icon : "success"
    					}).then(function() {

    					});
    				
    			
    		        
    		     }
    	}   
   /*   } */
    }
    </script>


<script>
// $('#sch_reward_type').mousedown(function(){
$.ajax({
    url: '${pageContext.request.contextPath}/loadschemegroup1',
    data:({datavalue :'GIFT_GROUP'}),
    success: function(data) {
        var select = $('#sch_reward_type');
        select.find('option').remove();

$('<option>').val("").text("--select--").appendTo(select);
                 $.each(data, function(index, value) {
$('<option>').val(value).text(value).appendTo(select);
        });

    }
  });
// });


$('#sch_reward_type').change(function(){
    var datavalue =$('#sch_reward_type').val();

    $.ajax({
        url: '${pageContext.request.contextPath}/getschemegroup1',
        data:({groupname :datavalue}),
        success: function(data) {
            var select = $('#sch_reward_item');
            select.find('option').remove();

$('<option>').val("").text("--select--").appendTo(select);
                     $.each(data, function(index, value) {
$('<option>').val(value.gift_id).text(value.gift_name).appendTo(select);
            });

        }
      });
    });
    
var budget=$('#scheme_budget').val();

budget = (budget + "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,"); // 43,434
$('#budget').val(budget);
</script>


<script type="text/javascript">

            $(document).ready(function(){     
            	
            	
       		

//                 $('.scheme_fin_yr').mousedown(function()
//                         {
//                     $.ajax({
//                         url: '${pageContext.request.contextPath}/loadfinyear',
//                         success: function(data) {

//                             var select = $('#scheme_fin_yr');
//                             select.find('option').remove();

// 					$('<option>').val("").text("--select--").appendTo(select);
//                                      $.each(data, function(index, value) {
// 					$('<option>').val(value.fin_year).text(value.fin_year).appendTo(select);
//                             });

//                         }
//                       });

//                         });


					 var attribute1 = $('#attribute1');
					 attribute1.find('option').remove();
					 var attribute1val = "${JSON.attribute1}"

					$('<option>').val("").text("--select--").appendTo(attribute1);
                                    if(attribute1val == "1"){
                                    	$('<option selected>').val("1").text("New Product + New Scheme").appendTo(attribute1);
                                    	
                                    }else {
                                    	$('<option>').val("1").text("New Product + New Scheme").appendTo(attribute1);
                                    }
									if(attribute1val == "2"){
										$('<option selected>').val("2").text("New Product + Existing Scheme").appendTo(attribute1);	
                                    }else {
                                    	$('<option>').val("2").text("New Product + Existing Scheme").appendTo(attribute1);
                                    }
									if(attribute1val == "3"){
										$('<option selected>').val("3").text("Existing Product + New Scheme").appendTo(attribute1);
	
									}else {
										$('<option>').val("3").text("Existing Product + New Scheme").appendTo(attribute1);
									}
									if(attribute1val == "4"){
										$('<option selected>').val("4").text("Existing Product + Existing Scheme").appendTo(attribute1);
									}else {
										$('<option>').val("4").text("Existing Product + Existing Scheme").appendTo(attribute1);
									}
									
					
					
					
					
                            

 $('#attribute1').change(function(event) {
                    var schprod = $("select#attribute1").val();
//                     alert(schprod);

                    if(schprod == "1") {
						$("#attribute2").val("New Product + New Scheme");
					}else if(schprod == "2") {
						$("#attribute2").val("New Product + Existing Scheme");
					}else if(schprod == "3") {
						$("#attribute2").val("Existing Product + New Scheme");
					
					}else if(schprod == "4") {
						$("#attribute2").val("Existing Product + Existing Scheme");
					}else {
						$("#attribute2").val("");
					}
					
					if(schprod != "") {
						
							
						
                    var p=document.getElementById("sch_reward_eff_price").value;
                  //window.open("primaryfinancialanalysis?price="+p,"Ratting","width=750,height=450,left=250,top=200,toolbar=0,status=0,");


                      var sc_name=document.getElementById("scheme_name").value;

                      var sc_id=document.getElementById("scheme_id").value;





                  window.open("primaryfinancialanalysis?scheme_name="+sc_name+"&scheme_id="+sc_id+"&price="+p+"&schprod="+schprod,"Ratting","width=750,height=550,left=100,top=100,toolbar=0,status=0,");
					}

       			});



//                 $('.fetchgrpid').mousedown(function()
//                         {

//                      var count = $('.fetchgrpid').index(this)+1;

//                     $.ajax({
//                          url: '${pageContext.request.contextPath}/loadschemegroup1',
//                             data:({datavalue :'GIFT_GROUP'}),
//                             success: function(data) {
//                                 var select = $('#gift_group'+count);
//                                 select.find('option').remove();

// 						$('<option>').val("").text("--select--").appendTo(select);
// 						                                         $.each(data, function(index, value) {
// 						$('<option>').val(value).text(value).appendTo(select);
//                            });

//                             }
//                       });

//                         });
                });

        </script>

<script type="text/javascript">
            $(document).ready(function(){

//                    $('.scheme_business_line').mousedown(function()
//                         {
//                      var lovtype = "BLINE_TYPE";
//                      $.ajax({
//                              url: '${pageContext.request.contextPath}/loadschemebusinessline',
//                              data: ({bline : lovtype}),
//                             success: function(data) {
//                                 var select = $('#scheme_business_line');
//                                // alert(select); -->
//                                 select.find('option').remove();
//                                    $.each(data, function(index, value) {
// 									$('<option>').val(value).text(value).appendTo(select);
//                                 });

//                              }
//                            });

//                         });
                });

        </script>








<script type="text/javascript">
         
         
         $(window).load(function(){
            


        	 function loadLevel()
        	 {
        	 	
        	 var level = ["L0 Level","L1 Level","L2 Level"];
        	 var select = $('#level');

        	 	
        	 	select.find('option').remove();



        	 for( var i = 0; i<level.length; i++)
        	 	
        	 	{
        	 	 $('<option>').val(level[i]).text(level[i]).appendTo(select);
        	 	}

        	 }




//              var region_type = "REGION_TYPE";


//              $.ajax({
//                     url: '${pageContext.request.contextPath}/loadregion',
//                     data: ({region : region_type}),
//                     success: function(data) {
//                         var select = $('#appl_regn_code');
//                              select.find('option').remove();
// 				$('<option>').val("").text("--select--").appendTo(select);
//                           $.each(data, function(index, value) {
//                               if(value == "${JSON.appl_regn_code}") {
//                           $('<option selected>').val(value).text(value).appendTo(select);
//                               }else{
// 				$('<option>').val(value).text(value).appendTo(select);
//                               }
//                         });

//                     }
//                    });

//                 $('#appl_regn_code').change(function(event) {
//                      var region = $("select#appl_regn_code").val();

//                     $.ajax({
//                          url: '${pageContext.request.contextPath}/loaddependentregion',
//                         data: ({ava_region :region}),
//                          success: function(data) {

//                              var select = $('select[name="appl_depot_code1[]"]');

//                             var SelBranchVal = document.getElementById("duallist");
//                             var x = 0;
//                                while(x<SelBranchVal.length)
//                                {
//                                if(SelBranchVal[x].selected)
//                                {
//                                x++;
//                                }
//                                else{
//                                SelBranchVal[x].remove(x);
//                                }
//                                }


//                         var demo1 = $('select[name="appl_depot_code1[]"]').bootstrapDualListbox();

//                               $.each(data, function(index, value) {
// 								$('<option>').val(value.depot_code).text(value.depot_name).appendTo(select);

//                              });
// 								demo1.bootstrapDualListbox('refresh',true);

//                          }
//                       });


//         });
                
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
       		 if(region == '179')
    		 {
    			 loadLevel();
    			 $('#level').change(function(event) {
    			     	
    				 var region = $('#level').val();
    				 var Region = ""+region+"";   
    				
    				
    				 
    				 var e = document.getElementById("level");
    				 var strUser = e.options[e.selectedIndex].text;
    				 var Region2 = ""+strUser+""; 
    				 
    				
    				 
    				 $("#level option:selected").each(function () {
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
    				
    		 }else{
       		
       		 
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
       		 }
         });
         });
         
         
         
         
         



//                 $('#appl_regn_code').mousedown(function()
//                         {
//                     var region_type = "REGION_TYPE";
//                      $.ajax({
//                             url: '${pageContext.request.contextPath}/loadregion',
//                             data: ({region : region_type}),
//                             success: function(data) {
//                                 var select = $('#appl_regn_code');
//                                // alert(select); -->
//                                  select.find('option').remove();
//                                   $.each(data, function(index, value) {
// 									$('<option>').val(value).text(value).appendTo(select);
//                                 });

//                             }
//                            });

//                         });

//                 $('#appl_regn_code').change(function(event) {
//                      var region = $("select#appl_regn_code").val();

//                     $.ajax({
//                          url: '${pageContext.request.contextPath}/loaddependentregion',
//                         data: ({ava_region :region}),
//                          success: function(data) {

//                              var select = $('select[name="appl_depot_code1[]"]');

//                             var SelBranchVal = document.getElementById("duallist");
//                             var x = 0;
//                                while(x<SelBranchVal.length)
//                                {
//                                if(SelBranchVal[x].selected)
//                                {
//                                x++;
//                                }
//                                else{
//                                SelBranchVal[x].remove(x);
//                                }
//                                }


//                         var demo1 = $('select[name="appl_depot_code1[]"]').bootstrapDualListbox();

//                               $.each(data, function(index, value) {
// 					$('<option>').val(value).text(value).appendTo(select);

//                              });
// 								demo1.bootstrapDualListbox('refresh',true);

//                          }
//                       });
//                 });

        </script>

<script>
       
//        $('.fetchprdlinetype').mousedown(function(){
   	 	
//    	 	var count = $('.fetchprdlinetype').index(this)+1;
   	 	
//    	 var prd_line_type = "PRD_OUTFLOW_LINE_TYPE";
// 		$.ajax({
// 		        url: '${pageContext.request.contextPath}/loadschemetype',
// 		        data: ({scheme : prd_line_type}),
// 		       success: function(data) {
// 		           var select = $('#sch_prd_outflow_line_type'+count);
// 		           select.find('option').remove();
// 		           $('<option>').val("").text("--Select--").appendTo(select);
// 		              $.each(data, function(index, value) {
		           	
// 		           			$('<option>').val(value).text(value).appendTo(select);

		           	
// 		           });

// 		        }
// 		      });
   	 	
   	    	 	
   	 	


//    	  });
       
      

   	$('.fetchprdlinetype').change(function(){
   		var count = $('.fetchprdlinetype').index(this)+1;
   	    
   		var datavalue =$('#sch_prd_outflow_line_type'+count).val();
	    
   		if(datavalue == "All Product") {
   	    	
   	    	
            var select = $('#sch_product_outflow_id'+count);
            select.find('option').remove();

            $('<option>').val("").text("--Select--").appendTo(select);
			$('<option>').val("All").text("All Product").appendTo(select);
    
	
		} else
	    if(datavalue == "Product Category") {
	    	
	    	$.ajax({
// 	            url: '${pageContext.request.contextPath}/loadproductcat',
	            url: '${pageContext.request.contextPath}/loadqmisproductgrp',
	            success: function(data) {

	                var select = $('#sch_product_outflow_id'+count);
	                select.find('option').remove();

	    		$('<option>').val("").text("--Select--").appendTo(select);
	                   $.each(data, function(index, value) {
	    		$('<option>').val(value.prd_cat).text(value.prd_cat).appendTo(select);
	                });

	            }
	          });
	    
	    	
	    } else if (datavalue == "Product Code") {
	    $.ajax({
	        url: '${pageContext.request.contextPath}/loadproductcode',
	        success: function(data) {

	            var select = $('#sch_product_outflow_id'+count);
	            select.find('option').remove();

			$('<option>').val("").text("--Select--").appendTo(select);
	               $.each(data, function(index, value) {
			$('<option>').val(value.prd_code).text(value.prd_code).appendTo(select);
	            });

	        }
	      });
	    } else  {
	    	var select = $('#sch_product_outflow_id'+count);
	        select.find('option').remove();
	        $('<option>').val("").text("--Select--").appendTo(select);
	    }
	    
	    var sch_prd_lly_vol = document.getElementById("sch_prd_lly_vol"+count);
	    sch_prd_lly_vol.value = "0";
	    var sch_prd_lly_vol_div = document.getElementById("sch_prd_lly_vol_div"+count);
	    sch_prd_lly_vol_div.value = "0";

	    var sch_prd_ly_vol = document.getElementById("sch_prd_ly_vol"+count);
		  sch_prd_ly_vol.value = "0";
		  var sch_prd_ly_vol_div = document.getElementById("sch_prd_ly_vol_div"+count);
		  sch_prd_ly_vol_div.value = "0";
		  
		  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
		  proj_grwth_vol_pct.value = "0";
		  proj_grwth_vol_pct.readOnly = true;
		  
		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
		  sch_prd_ty_vol.value = "0";
		  sch_prd_ty_vol.readOnly = true;
		  var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
		  sch_prd_ty_vol_div.value = "0";
		  sch_prd_ty_vol_div.readOnly = true;
	    
	    var sch_prd_lly_val = document.getElementById("sch_prd_lly_val"+count);
		  sch_prd_lly_val.value = "0";
		  var sch_prd_lly_val_div = document.getElementById("sch_prd_lly_val_div"+count);
		  sch_prd_lly_val_div.value = "0";
		  
		  var sch_prd_ly_val = document.getElementById("sch_prd_ly_val"+count);
		  sch_prd_ly_val.value = "0";
		  var sch_prd_ly_val_div = document.getElementById("sch_prd_ly_val_div"+count);
		  sch_prd_ly_val_div.value = "0";
		  
		  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
		  proj_grwth_val_pct.value = "0";
		  proj_grwth_val_pct.readOnly = true;
		  
		  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
		  sch_prd_ty_val.value = "0";
		  sch_prd_ty_val.readOnly = true;
		  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
		  sch_prd_ty_val_div.value = "0";
		  sch_prd_ty_val_div.readOnly = true;
		  
		  var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
		  sch_prd_spread_tgt_vol.value = "0";
		  sch_prd_spread_tgt_vol.readOnly = true;
		  
		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
		  sch_prd_spread_tgt_val.value = "0";
		  sch_prd_spread_tgt_val.readOnly = true;
		  
		  var sch_prd_spread_mtd_ly_vol = document.getElementById("sch_prd_spread_mtd_ly_vol"+count);
		  sch_prd_spread_mtd_ly_vol.value = "0";
		  
		  var sch_prd_spread_mtd_ly_val = document.getElementById("sch_prd_spread_mtd_ly_val"+count);
		  sch_prd_spread_mtd_ly_val.value = "0";
		  
		  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
		  proj_grwth_spd_pct.value = "0";
		  proj_grwth_spd_pct.readOnly = true;
		  
		  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
		  sch_prd_spread_mtd_ty_tgt_vol.value = "0";
		  
		  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
		  sch_prd_spread_mtd_ty_tgt_val.value = "0";
		  
		  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
		  sch_prd_wt_avg.value = "0";
		  sch_prd_wt_avg.readOnly = true;
		  
		  var sch_prd_total_prd_bdgt = document.getElementById("sch_prd_total_prd_bdgt"+count);
		  sch_prd_total_prd_bdgt.value = "0";
		  
		  prdoutflowTotal();
   	});

   	$('.fetchprdval').change(function(){
   		var count = $('.fetchprdval').index(this)+1;
   	    
   		$('#loading'+count).show();
		$('#sch_prd_outflow_id'+count).hide();
		
		var sch_prd_lly_vol = document.getElementById("sch_prd_lly_vol"+count);
	    sch_prd_lly_vol.value = "0";
	    var sch_prd_lly_vol_div = document.getElementById("sch_prd_lly_vol_div"+count);
	    sch_prd_lly_vol_div.value = "0";
		
	    var sch_prd_ly_vol = document.getElementById("sch_prd_ly_vol"+count);
		sch_prd_ly_vol.value = "0";
		var sch_prd_ly_vol_div = document.getElementById("sch_prd_ly_vol_div"+count);
		sch_prd_ly_vol_div.value = "0";
		
		var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
		proj_grwth_vol_pct.value = "0";
		proj_grwth_vol_pct.readOnly = true;
		
		var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
		sch_prd_ty_vol.value = "0";
		sch_prd_ty_vol.readOnly = true;
		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
		sch_prd_ty_vol_div.value = "0";
		sch_prd_ty_vol_div.readOnly = true;
		
	    var sch_prd_lly_val = document.getElementById("sch_prd_lly_val"+count);
		sch_prd_lly_val.value = "0";
		var sch_prd_lly_val_div = document.getElementById("sch_prd_lly_val_div"+count);
		sch_prd_lly_val_div.value = "0";
		
		var sch_prd_ly_val = document.getElementById("sch_prd_ly_val"+count);
		sch_prd_ly_val.value = "0";
		var sch_prd_ly_val_div = document.getElementById("sch_prd_ly_val_div"+count);
		sch_prd_ly_val_div.value = "0";
		
		var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
		proj_grwth_val_pct.value = "0";
		proj_grwth_val_pct.readOnly = true;
		
		var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
		sch_prd_ty_val.value = "0";
		sch_prd_ty_val.readOnly = true;
		var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
		sch_prd_ty_val_div.value = "0";
		sch_prd_ty_val_div.readOnly = true;
		
		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
		sch_prd_spread_tgt_vol.value = "0";
		sch_prd_spread_tgt_vol.readOnly = true;
		  
		var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
		sch_prd_spread_tgt_val.value = "0";
		sch_prd_spread_tgt_val.readOnly = true;
		
		var sch_prd_spread_mtd_ly_vol = document.getElementById("sch_prd_spread_mtd_ly_vol"+count);
		sch_prd_spread_mtd_ly_vol.value = "0";
		
		var sch_prd_spread_mtd_ly_val = document.getElementById("sch_prd_spread_mtd_ly_val"+count);
		sch_prd_spread_mtd_ly_val.value = "0";
		
		var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
		proj_grwth_spd_pct.value = "0";
		proj_grwth_spd_pct.readOnly = true;
		
		var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
		sch_prd_spread_mtd_ty_tgt_vol.value = "0";
		
		var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
		sch_prd_spread_mtd_ty_tgt_val.value = "0";
		
		var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
		sch_prd_wt_avg.value = "0";
		sch_prd_wt_avg.readOnly = true;
		
		var sch_prd_total_prd_bdgt = document.getElementById("sch_prd_total_prd_bdgt"+count);
		sch_prd_total_prd_bdgt.value = "0";
		
		prdoutflowTotal();
	    
		var datavalue =$('#sch_prd_outflow_line_type'+count).val();
	    var prdvalue =$('#sch_product_outflow_id'+count).val();
	    
	    var sch_prd_spread_tgt_vol_v =$('#sch_prd_spread_tgt_vol'+count).val();
	    var sch_prd_spread_tgt_val_v =$('#sch_prd_spread_tgt_val'+count).val();
	    
	    var startdate =$('#start_date').val();
	    var enddate =$('#end_date').val();
	    var depotcodes =String($('#sel_depo').val());
	    alert("------111---->>"+depotcodes);
	    var custtypes = jQuery.map($(':checkbox[name=cust_type]:checked'), function (n, i) {
	        return n.value;
	    }).join(',');
	    
//	     alert(custtypes);

//	     $('[name="cust_type"]').each( function (){
//	         if($(this).prop('checked') == true){
//	             alert($(this).val());
//	         }
//	     });
//	     var custtypes = $( "input[type=checkbox][name=cust_type]" ).val();
//	     alert(custtypes);
	   
	   
	    	
	    	$.ajax({
	            url: '${pageContext.request.contextPath}/loadproductoutflow',
	            data: ({datavalue : datavalue,prdvalue : prdvalue,
	            		startdate : startdate,enddate : enddate,
	            		depotcodes : depotcodes,custtypes : custtypes,
	            		sch_prd_spread_tgt_vol : sch_prd_spread_tgt_vol_v,
	            		sch_prd_spread_tgt_val : sch_prd_spread_tgt_val_v}),
	            success: function(data) {

	            	$('#sch_prd_lly_vol'+count).val(data.LLY_VOL);
	            	if(data.LLY_VOL != 0) {
	            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL / 1000);
	            	} else {
	            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL);
	            	}
	            	
	            	$('#sch_prd_lly_val'+count).val(data.LLY_VAL);
					if(data.LLY_VAL != 0) {
						$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL / 10000000);
	            	} else {
	            		$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL);
	            	}
	            	
	            	$('#sch_prd_ly_vol'+count).val(data.LY_VOL);
					if(data.LY_VOL != 0) {
						$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL / 1000);
	            	} else {
	            		$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL);
	            	}
	            	
	            	$('#sch_prd_ly_val'+count).val(data.LY_VAL);
					if(data.LY_VAL != 0) {
						$('#sch_prd_ly_val_div'+count).val(data.LY_VAL / 10000000);
	            	} else {
	            		$('#sch_prd_ly_val_div'+count).val(data.LY_VAL);
	            	}
	            	$('#sch_prd_spread_mtd_ly_vol'+count).val(data.SPREAD_MTD_LY_VOL);
	            	$('#sch_prd_spread_mtd_ly_val'+count).val(data.SPREAD_MTD_LY_VAL);
	            	
	            	
	            	if(data.LLY_VOL == 0 && data.LLY_VAL == 0 && data.LY_VOL == 0 && data.LY_VAL == 0) {
	          		
	            		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
	                	sch_prd_spread_tgt_vol.readOnly = false;
	            		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
	            		  sch_prd_spread_tgt_val.readOnly = false;
	                	
	          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
	          		  sch_prd_ty_vol.readOnly = false;
	          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
	        		  sch_prd_ty_vol_div.readOnly = false;
	                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
	                	  sch_prd_ty_val.readOnly = false;
	                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
	                	  sch_prd_ty_val_div.readOnly = false;
	                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
	                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = false;
	                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
	                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = false;
	                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
	                	  proj_grwth_vol_pct.readOnly = true;
	                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
	                	  proj_grwth_val_pct.readOnly = true;
	                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
	                	  proj_grwth_spd_pct.readOnly = true;
	                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
	                	  sch_prd_wt_avg.readOnly = false;
	          	  
	          		  
	          	  } else {
	          		  
	          		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
	            	sch_prd_spread_tgt_vol.readOnly = false;
	        		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
	        		  sch_prd_spread_tgt_val.readOnly = false;
	            	
	          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
	          		  sch_prd_ty_vol.readOnly = true;
	          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
	        		  sch_prd_ty_vol_div.readOnly = true;
	                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
	                	  sch_prd_ty_val.readOnly = true;
	                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
	                	  sch_prd_ty_val_div.readOnly = true;
	                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
	                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = true;
	                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
	                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = true;
	                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
	                	  proj_grwth_vol_pct.readOnly = false;
	                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
	                	  proj_grwth_val_pct.readOnly = false;
	                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
	                	  proj_grwth_spd_pct.readOnly = false;
	                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
	                	  sch_prd_wt_avg.readOnly = false;
	          	  }
	            	
	            	$('#loading'+count).hide();
	            	$('#sch_prd_outflow_id'+count).show();

	            	prdoutflowgrwth(count);
	            }
	          });
	    	
	     
	    	
//	     	  if($('#sch_prd_lly_vol'+count).val() == 0 && 
//	     			  $('#sch_prd_lly_val'+count).val() == 0 &&
//	       				$('#sch_prd_ly_vol'+count).val() == 0 &&
//	       					$('#sch_prd_ly_val'+count).val() == 0) {
	    		  
//	     		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
//	     		  sch_prd_ty_vol.readOnly = false;
//	           	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
//	           	  sch_prd_ty_val.readOnly = false;
	    	  
	    		  
//	     	  } else {
//	     		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
//	     		  sch_prd_ty_vol.readOnly = true;
//	           	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
//	           	  sch_prd_ty_val.readOnly = true;
//	     	  }


   			
   	    
   	    	
   	    
   	  
   	   
   	});
   	
   	$('.fetchspdvol').blur(function(){
   		
   		var count = $('.fetchspdvol').index(this)+1;
		
		$('#loading'+count).show();
		$('#sch_prd_outflow_id'+count).hide();
		
		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
		sch_prd_spread_tgt_vol.readOnly = true;
		  
		var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
		sch_prd_spread_tgt_val.readOnly = true;
		
		var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
		proj_grwth_vol_pct.readOnly = true;
		
		var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
		proj_grwth_val_pct.readOnly = true;
		
		var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
		proj_grwth_spd_pct.readOnly = true;
		
		var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
		sch_prd_ty_vol.readOnly = true;
		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
		sch_prd_ty_vol_div.readOnly = true;
		
		var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
		sch_prd_ty_val.readOnly = true;
		var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
		sch_prd_ty_val_div.readOnly = true;
		
		var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
		sch_prd_wt_avg.readOnly = true;
		
	    
		var datavalue =$('#sch_prd_outflow_line_type'+count).val();
	    var prdvalue =$('#sch_product_outflow_id'+count).val();
	    
	    var sch_prd_spread_tgt_vol_v =$('#sch_prd_spread_tgt_vol'+count).val();
	    var sch_prd_spread_tgt_val_v =$('#sch_prd_spread_tgt_val'+count).val();
	    
	    var startdate =$('#start_date').val();
	    var enddate =$('#end_date').val();
	    var depotcodes =String($('#sel_depo').val());
	    var custtypes = jQuery.map($(':checkbox[name=cust_type]:checked'), function (n, i) {
	        return n.value;
	    }).join(',');
	   
	   
	    	
	    	$.ajax({
	            url: '${pageContext.request.contextPath}/loadproductoutflow',
	            data: ({datavalue : datavalue,prdvalue : prdvalue,
	            		startdate : startdate,enddate : enddate,
	            		depotcodes : depotcodes,custtypes : custtypes,
	            		sch_prd_spread_tgt_vol : sch_prd_spread_tgt_vol_v,
	            		sch_prd_spread_tgt_val : sch_prd_spread_tgt_val_v}),
	            success: function(data) {

	            	$('#sch_prd_lly_vol'+count).val(data.LLY_VOL);
	            	if(data.LLY_VOL != 0) {
	            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL / 1000);
	            	} else {
	            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL);
	            	}
	            	$('#sch_prd_lly_val'+count).val(data.LLY_VAL);
	            	if(data.LLY_VAL != 0) {
						$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL / 10000000);
	            	} else {
	            		$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL);
	            	}
	            	$('#sch_prd_ly_vol'+count).val(data.LY_VOL);
	            	if(data.LY_VOL != 0) {
						$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL / 1000);
	            	} else {
	            		$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL);
	            	}
	            	$('#sch_prd_ly_val'+count).val(data.LY_VAL);
	            	if(data.LY_VAL != 0) {
						$('#sch_prd_ly_val_div'+count).val(data.LY_VAL / 10000000);
	            	} else {
	            		$('#sch_prd_ly_val_div'+count).val(data.LY_VAL);
	            	}
	            	$('#sch_prd_spread_mtd_ly_vol'+count).val(data.SPREAD_MTD_LY_VOL);
	            	$('#sch_prd_spread_mtd_ly_val'+count).val(data.SPREAD_MTD_LY_VAL);
	            	
	            	
	            	if(data.LLY_VOL == 0 && data.LLY_VAL == 0 && data.LY_VOL == 0 && data.LY_VAL == 0) {
	          		
	            		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
	                	sch_prd_spread_tgt_vol.readOnly = false;
	            		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
	            		  sch_prd_spread_tgt_val.readOnly = false;
	                	
	          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
	          		  sch_prd_ty_vol.readOnly = false;
	          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
	        		  sch_prd_ty_vol_div.readOnly = false;
	                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
	                	  sch_prd_ty_val.readOnly = false;
	                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
	                	  sch_prd_ty_val_div.readOnly = false;
	                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
	                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = false;
	                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
	                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = false;
	                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
	                	  proj_grwth_vol_pct.readOnly = true;
	                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
	                	  proj_grwth_val_pct.readOnly = true;
	                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
	                	  proj_grwth_spd_pct.readOnly = true;
	                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
	                	  sch_prd_wt_avg.readOnly = false;
	          	  
	          		  
	          	  } else {
	          		  
	          		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
	            	sch_prd_spread_tgt_vol.readOnly = false;
	        		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
	        		  sch_prd_spread_tgt_val.readOnly = false;
	            	
	          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
	          		  sch_prd_ty_vol.readOnly = true;
	          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
	        		  sch_prd_ty_vol_div.readOnly = true;
	                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
	                	  sch_prd_ty_val.readOnly = true;
	                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
	                	  sch_prd_ty_val_div.readOnly = true;
	                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
	                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = true;
	                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
	                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = true;
	                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
	                	  proj_grwth_vol_pct.readOnly = false;
	                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
	                	  proj_grwth_val_pct.readOnly = false;
	                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
	                	  proj_grwth_spd_pct.readOnly = false;
	                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
	                	  sch_prd_wt_avg.readOnly = false;
	          	  }
	            	
	            	$('#loading'+count).hide();
	            	$('#sch_prd_outflow_id'+count).show();

	            	prdoutflowgrwth(count);
	            }
	          });

		
	    	



	});




	$('.fetchspdval').blur(function(){
		
		var count = $('.fetchspdval').index(this)+1;
		
		$('#loading'+count).show();
		$('#sch_prd_outflow_id'+count).hide();
		
		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
		sch_prd_spread_tgt_vol.readOnly = true;
		  
		var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
		sch_prd_spread_tgt_val.readOnly = true;
		
		var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
		proj_grwth_vol_pct.readOnly = true;
		
		var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
		proj_grwth_val_pct.readOnly = true;
		
		var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
		proj_grwth_spd_pct.readOnly = true;
		
		var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
		sch_prd_ty_vol.readOnly = true;
		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
		sch_prd_ty_vol_div.readOnly = true;
		
		var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
		sch_prd_ty_val.readOnly = true;
		var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
		sch_prd_ty_val_div.readOnly = true;
		
		var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
		sch_prd_wt_avg.readOnly = true;
		
	   
		var datavalue =$('#sch_prd_outflow_line_type'+count).val();
	    var prdvalue =$('#sch_product_outflow_id'+count).val();
	    
	    var sch_prd_spread_tgt_vol_v =$('#sch_prd_spread_tgt_vol'+count).val();
	    var sch_prd_spread_tgt_val_v =$('#sch_prd_spread_tgt_val'+count).val();
	    
	    var startdate =$('#start_date').val();
	    var enddate =$('#end_date').val();
	    var depotcodes =String($('#sel_depo').val());
	    var custtypes = jQuery.map($(':checkbox[name=cust_type]:checked'), function (n, i) {
	        return n.value;
	    }).join(',');
	   
	   
	    	
	    	$.ajax({
	            url: '${pageContext.request.contextPath}/loadproductoutflow',
	            data: ({datavalue : datavalue,prdvalue : prdvalue,
	            		startdate : startdate,enddate : enddate,
	            		depotcodes : depotcodes,custtypes : custtypes,
	            		sch_prd_spread_tgt_vol : sch_prd_spread_tgt_vol_v,
	            		sch_prd_spread_tgt_val : sch_prd_spread_tgt_val_v}),
	            success: function(data) {

	            	$('#sch_prd_lly_vol'+count).val(data.LLY_VOL);
	            	if(data.LLY_VOL != 0) {
	            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL / 1000);
	            	} else {
	            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL);
	            	}
	            	$('#sch_prd_lly_val'+count).val(data.LLY_VAL);
	            	if(data.LLY_VAL != 0) {
						$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL / 10000000);
	            	} else {
	            		$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL);
	            	}
	            	$('#sch_prd_ly_vol'+count).val(data.LY_VOL);
	            	if(data.LY_VOL != 0) {
						$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL / 1000);
	            	} else {
	            		$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL);
	            	}
	            	$('#sch_prd_ly_val'+count).val(data.LY_VAL);
	            	if(data.LY_VAL != 0) {
						$('#sch_prd_ly_val_div'+count).val(data.LY_VAL / 10000000);
	            	} else {
	            		$('#sch_prd_ly_val_div'+count).val(data.LY_VAL);
	            	}
	            	$('#sch_prd_spread_mtd_ly_vol'+count).val(data.SPREAD_MTD_LY_VOL);
	            	$('#sch_prd_spread_mtd_ly_val'+count).val(data.SPREAD_MTD_LY_VAL);
	            	
	            	
	            	if(data.LLY_VOL == 0 && data.LLY_VAL == 0 && data.LY_VOL == 0 && data.LY_VAL == 0) {
	          		
	            		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
	                	sch_prd_spread_tgt_vol.readOnly = false;
	            		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
	            		  sch_prd_spread_tgt_val.readOnly = false;
	                	
	          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
	          		  sch_prd_ty_vol.readOnly = false;
	          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
	        		  sch_prd_ty_vol_div.readOnly = false;
	                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
	                	  sch_prd_ty_val.readOnly = false;
	                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
	                	  sch_prd_ty_val_div.readOnly = false;
	                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
	                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = false;
	                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
	                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = false;
	                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
	                	  proj_grwth_vol_pct.readOnly = true;
	                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
	                	  proj_grwth_val_pct.readOnly = true;
	                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
	                	  proj_grwth_spd_pct.readOnly = true;
	                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
	                	  sch_prd_wt_avg.readOnly = false;
	          	  
	          		  
	          	  } else {
	          		  
	          		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
	            	sch_prd_spread_tgt_vol.readOnly = false;
	        		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
	        		  sch_prd_spread_tgt_val.readOnly = false;
	            	
	          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
	          		  sch_prd_ty_vol.readOnly = true;
	          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
	        		  sch_prd_ty_vol_div.readOnly = true;
	                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
	                	  sch_prd_ty_val.readOnly = true;
	                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
	                	  sch_prd_ty_val_div.readOnly = true;
	                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
	                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = true;
	                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
	                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = true;
	                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
	                	  proj_grwth_vol_pct.readOnly = false;
	                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
	                	  proj_grwth_val_pct.readOnly = false;
	                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
	                	  proj_grwth_spd_pct.readOnly = false;
	                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
	                	  sch_prd_wt_avg.readOnly = false;
	          	  }
	            	
	            	$('#loading'+count).hide();
	            	$('#sch_prd_outflow_id'+count).show();

	            	prdoutflowgrwth(count);
	            }
	          });
	    	
	    	

		
		
		


	}); 




   	$('.fetchgrwthvolpct').blur(function(){
   		var count = $('.fetchgrwthvolpct').index(this)+1;
   		
   		var sch_prd_ly_vol= parseFloat($('#sch_prd_ly_vol'+count).val());
   		var sch_prd_ly_vol_div= parseFloat($('#sch_prd_ly_vol_div'+count).val());
   		var proj_grwth_vol_pct= parseFloat($('#proj_grwth_vol_pct'+count).val());
   		var pct = parseFloat(proj_grwth_vol_pct) + 100;
   		
   		if(sch_prd_ly_vol != 0) {
   			var sch_prd_ty_vol = (sch_prd_ly_vol * pct / 100).toFixed(2);
   		} else {
   			var sch_prd_ty_vol = (proj_grwth_vol_pct).toFixed(2);
   		}
   		$('#sch_prd_ty_vol'+count).val(sch_prd_ty_vol);
   		if(sch_prd_ly_vol_div != 0) {
   			var sch_prd_ty_vol_div = (sch_prd_ly_vol_div * pct / 100).toFixed(2);	
   		} else {
   			if(proj_grwth_vol_pct != 0) {
   				var sch_prd_ty_vol_div = (proj_grwth_vol_pct / 1000).toFixed(2);
   			} else {
   				var sch_prd_ty_vol_div = (proj_grwth_vol_pct).toFixed(2);
   			}
   		}
   		$('#sch_prd_ty_vol_div'+count).val(sch_prd_ty_vol_div);
		
		var sch_prd_wt_avg= parseFloat($('#sch_prd_wt_avg'+count).val());
		var sch_prd_total_prd_bdgt = (sch_prd_ty_vol * sch_prd_wt_avg).toFixed(2); 
		$('#sch_prd_total_prd_bdgt'+count).val(sch_prd_total_prd_bdgt);
		
		 prdoutflowTotal();



   	}); 
   	
   	$('.fetchgrwthvalpct').blur(function(){
   		var count = $('.fetchgrwthvalpct').index(this)+1;
   		
   		var sch_prd_ly_val= parseFloat($('#sch_prd_ly_val'+count).val());
   		var sch_prd_ly_val_div= parseFloat($('#sch_prd_ly_val_div'+count).val());
   		var proj_grwth_val_pct= parseFloat($('#proj_grwth_val_pct'+count).val());
   		var pct = parseFloat(proj_grwth_val_pct) + 100;
   		
   		if(sch_prd_ly_val != 0) {
   			var sch_prd_ty_val = (sch_prd_ly_val * pct / 100).toFixed(2);	
   		} else {
   			var sch_prd_ty_val = (proj_grwth_val_pct).toFixed(2);
   		}
   		$('#sch_prd_ty_val'+count).val(sch_prd_ty_val);
   		if(sch_prd_ly_val_div != 0) {
   			var sch_prd_ty_val_div = (sch_prd_ly_val_div * pct / 100).toFixed(2);	
   		} else {
   			if(proj_grwth_val_pct != 0) {
   				var sch_prd_ty_val_div = (proj_grwth_val_pct / 10000000).toFixed(2);	
   			} else {
   				var sch_prd_ty_val_div = (proj_grwth_val_pct).toFixed(2);
   			}
   			
   		}
   		$('#sch_prd_ty_val_div'+count).val(sch_prd_ty_val_div);
		
		

   	}); 
   	
   	$('.fetchgrwthspdpct').blur(function(){
   		var count = $('.fetchgrwthspdpct').index(this)+1;
   		
   		var sch_prd_spread_mtd_ly_vol= parseFloat($('#sch_prd_spread_mtd_ly_vol'+count).val());
		var sch_prd_spread_mtd_ly_val= parseFloat($('#sch_prd_spread_mtd_ly_val'+count).val());
		var proj_grwth_spd_pct= parseFloat($('#proj_grwth_spd_pct'+count).val());
		var pct = parseFloat(proj_grwth_spd_pct) + 100;
		
		var sch_prd_spread_mtd_ty_tgt_vol = parseInt(sch_prd_spread_mtd_ly_vol * pct / 100);
		$('#sch_prd_spread_mtd_ty_tgt_vol'+count).val(sch_prd_spread_mtd_ty_tgt_vol);
		var sch_prd_spread_mtd_ty_tgt_val = parseInt(sch_prd_spread_mtd_ly_val * pct / 100);
		$('#sch_prd_spread_mtd_ty_tgt_val'+count).val(sch_prd_spread_mtd_ty_tgt_val);
		
		


   	}); 
   	
   	$('.fetchprdtyvol').blur(function(){
   		var count = $('.fetchprdtyvol').index(this)+1;
   		
   		var sch_prd_ty_vol= parseFloat($('#sch_prd_ty_vol'+count).val());
   		var sch_prd_wt_avg= parseFloat($('#sch_prd_wt_avg'+count).val());
   		
   		if(proj_grwth_val_pct != 0) {
   			var sch_prd_ty_vol_div= (sch_prd_ty_vol / 1000).toFixed(2);	
   		} else {
   			var sch_prd_ty_vol_div= (sch_prd_ty_vol).toFixed(2);
   		}
   		$('#sch_prd_ty_vol_div'+count).val(sch_prd_ty_vol_div);
   		
   		var sch_prd_total_prd_bdgt = (sch_prd_ty_vol * sch_prd_wt_avg).toFixed(2); 
   		$('#sch_prd_total_prd_bdgt'+count).val(sch_prd_total_prd_bdgt);
		
		 prdoutflowTotal();

   	}); 
   	
   	$('.fetchprdtyvol_div').blur(function(){
   		var count = $('.fetchprdtyvol_div').index(this)+1;
   		
   		var sch_prd_ty_vol_div= parseFloat($('#sch_prd_ty_vol_div'+count).val());
   		var sch_prd_wt_avg= parseFloat($('#sch_prd_wt_avg'+count).val());
   		
   		var sch_prd_ty_vol= (sch_prd_ty_vol_div * 1000).toFixed(2);
   		$('#sch_prd_ty_vol'+count).val(sch_prd_ty_vol);
   		
   		var sch_prd_total_prd_bdgt = (sch_prd_ty_vol * sch_prd_wt_avg).toFixed(2); 
   		$('#sch_prd_total_prd_bdgt'+count).val(sch_prd_total_prd_bdgt);
		
		 prdoutflowTotal();

   	}); 

   	$('.fetchwtavg').blur(function(){
   		var count = $('.fetchwtavg').index(this)+1;
   		
   		var sch_prd_ty_vol= parseFloat($('#sch_prd_ty_vol'+count).val());
		var sch_prd_wt_avg= parseFloat($('#sch_prd_wt_avg'+count).val());
		
		var sch_prd_total_prd_bdgt = (sch_prd_ty_vol * sch_prd_wt_avg).toFixed(2); 
		$('#sch_prd_total_prd_bdgt'+count).val(sch_prd_total_prd_bdgt);
		
		 prdoutflowTotal();

   	}); 

       
      

    	 

       
       function delRow2(cnt) {
    		
    		$('#rowcount3').val($('#dynamic-table3 tr').length-1);
    		var count = $('#rowcount3').val();
    		
    		
    		if(count >= cnt)
    			{ 		
    				 document.getElementById("dynamic-table3").deleteRow(count);
    				 document.getElementById("dynamic-table4").deleteRow(count);	
    				 
    			}
    		prdoutflowTotal();
    	}
    	function AddRow2()
    	{

    		$('#dynamic-table3 tr').last().after('<tr>'
    				+'<td ><center>'
    				+'<div id="loading'+$('#dynamic-table3 tr').length+'">'
    				+'<img src="resources/login_assets/Loading1.gif" alt="BASS" style="width:70%;height:15%;margin-left: 16%;margin-top: 0%;" class="">'
    				+'</div>'
    				+'<div id="sch_prd_outflow_id'+$('#dynamic-table3 tr').length+'">'
    		        +($('#dynamic-table3 tr').length)+'<input type="hidden" id="sch_prd_outflow_unique_id'+$('#dynamic-table3 tr').length+'" name="sch_prd_outflow_unique_id"/>'
    		        +'</div>'
    		        +'</center></td>'
    		        +'<td ><select class="form-control mb-md" name="sch_prd_outflow_line_type" id="sch_prd_outflow_line_type'+$('#dynamic-table3 tr').length+'" class="col-xs-12 col-sm-4" required><option value="">--Select--</option></select></td>'
    		        +'<td ><select class="form-control mb-md" name="sch_product_outflow_id" id="sch_product_outflow_id'+$('#dynamic-table3 tr').length+'" class="col-xs-12 col-sm-4" required><option value="">--Select--</option></select></td>'
    		        +'</tr>'
    		        );
    		        
    		$('#dynamic-table4 tr').last().after('<tr>'
    				+'<td ><input type="hidden" id="sch_prd_lly_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_lly_vol" class="col-xs-12 col-sm-4" value="0" readonly/>'
    				+'<input type="text" class="form-control" id="sch_prd_lly_vol_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_lly_vol_div" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
    				+'<td ><input type="hidden" id="sch_prd_ly_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_ly_vol" class="col-xs-12 col-sm-4" value="0" readonly/>'
    				+'<input type="text" class="form-control" id="sch_prd_ly_vol_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_ly_vol_div" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
    				+'<td ><input type="text" class="form-control" style="width:100%;" id="proj_grwth_vol_pct'+$('#dynamic-table4 tr').length+'" value="0" name="proj_grwth_vol_pct" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'		
    				+'<td ><input type="hidden" id="sch_prd_ty_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_ty_vol" class="col-xs-12 col-sm-4" value="0" readonly required/>'
    				+'<input type="text" class="form-control" id="sch_prd_ty_vol_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_ty_vol_div" class="col-xs-12 col-sm-4" value="0" readonly required/></td>'
    				+'<td ><input type="hidden" id="sch_prd_lly_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_lly_val" class="col-xs-12 col-sm-4" value="0" readonly/>'
    				+'<input type="text" class="form-control" id="sch_prd_lly_val_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_lly_val_div" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
    		        +'<td ><input type="hidden" id="sch_prd_ly_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_ly_val" class="col-xs-12 col-sm-4" value="0" readonly/>'
    		        +'<input type="text" class="form-control" id="sch_prd_ly_val_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_ly_val_div" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
    		        +'<td ><input type="text" class="form-control" class= "" style="width:100%;" id="proj_grwth_val_pct'+$('#dynamic-table4 tr').length+'" value="0" name="proj_grwth_val_pct" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'
    		        +'<td ><input type="hidden" id="sch_prd_ty_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_ty_val" class="col-xs-12 col-sm-4" value="0" readonly required/>'
    		        +'<input type="text" class="form-control" id="sch_prd_ty_val_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_ty_val_div" class="col-xs-12 col-sm-4" value="0" readonly required/></td>'
    		        +'<td ><input type="text" class="form-control" style="width:100%;" id="sch_prd_spread_tgt_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_tgt_vol" value="0" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'
    		        +'<td ><input type="text" class="form-control" style="width:100%;" id="sch_prd_spread_tgt_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_tgt_val" value="0" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'
    		        +'<td ><input type="text" class="form-control" id="sch_prd_spread_mtd_ly_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_mtd_ly_vol" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
    		        +'<td ><input type="text" class="form-control" id="sch_prd_spread_mtd_ly_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_mtd_ly_val" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
    		        +'<td ><input type="text" class="form-control"  style="width:100%;" id="proj_grwth_spd_pct'+$('#dynamic-table4 tr').length+'" value="0" name="proj_grwth_spd_pct" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'
    		        +'<td ><input type="text" class="form-control" id="sch_prd_spread_mtd_ty_tgt_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_mtd_ty_tgt_vol" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
    		        +'<td ><input type="text" class="form-control" id="sch_prd_spread_mtd_ty_tgt_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_mtd_ty_tgt_val" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
    		        +'<td ><input type="text" class="form-control"  style="width:100%;" id="sch_prd_wt_avg'+$('#dynamic-table4 tr').length+'" value="0" name="sch_prd_wt_avg" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'
    		        +'<td ><input type="text" class="form-control" id="sch_prd_total_prd_bdgt'+$('#dynamic-table4 tr').length+'" name="sch_prd_total_prd_bdgt" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
    		        +'</tr>'
    		        );

    		$('#rowcount3').val($('#dynamic-table3 tr').length-1);
    		var count = $('#rowcount3').val();

    		$('#loading'+count).hide();

    		var prd_line_type = "PRD_OUTFLOW_LINE_TYPE";
    		$.ajax({
    		        url: '${pageContext.request.contextPath}/loadschemetype',
    		        data: ({scheme : prd_line_type}),
    		       success: function(data) {
    		           var select = $('#sch_prd_outflow_line_type'+count);
    		           select.find('option').remove();
    		           $('<option>').val("").text("--Select--").appendTo(select);
    		              $.each(data, function(index, value) {
    		           	
    		           			$('<option>').val(value).text(value).appendTo(select);

    		           	
    		           });

    		        }
    		      });

    		$('#sch_prd_outflow_line_type'+count).change(function(){
    		    var datavalue =$('#sch_prd_outflow_line_type'+count).val();
    		    
    		    if(datavalue == "All Product") {
    		    	
    		    	
                    var select = $('#sch_product_outflow_id'+count);
                    select.find('option').remove();

                    $('<option>').val("").text("--Select--").appendTo(select);
        			$('<option>').val("All").text("All Product").appendTo(select);
            
        	
        		} else
    		    if(datavalue == "Product Category") {
    		    	
    		    	$.ajax({
//     		            url: '${pageContext.request.contextPath}/loadproductcat',
    		            url: '${pageContext.request.contextPath}/loadqmisproductgrp',
    		            success: function(data) {

    		                var select = $('#sch_product_outflow_id'+count);
    		                select.find('option').remove();

    		    		$('<option>').val("").text("--Select--").appendTo(select);
    		                   $.each(data, function(index, value) {
    		    		$('<option>').val(value.prd_cat).text(value.prd_cat).appendTo(select);
    		                });

    		            }
    		          });
    		    
    		    	
    		    } else if (datavalue == "Product Code") {
    		    $.ajax({
    		        url: '${pageContext.request.contextPath}/loadproductcode',
    		        success: function(data) {

    		            var select = $('#sch_product_outflow_id'+count);
    		            select.find('option').remove();

    				$('<option>').val("").text("--Select--").appendTo(select);
    		               $.each(data, function(index, value) {
    				$('<option>').val(value.prd_code).text(value.prd_code).appendTo(select);
    		            });

    		        }
    		      });
    		    } else  {
    		    	var select = $('#sch_product_outflow_id'+count);
    		        select.find('option').remove();
    		        $('<option>').val("").text("--Select--").appendTo(select);
    		    }
    		    
    		    var sch_prd_lly_vol = document.getElementById("sch_prd_lly_vol"+count);
    		    sch_prd_lly_vol.value = "0";
    		    var sch_prd_lly_vol_div = document.getElementById("sch_prd_lly_vol_div"+count);
    		    sch_prd_lly_vol_div.value = "0";

    		    var sch_prd_ly_vol = document.getElementById("sch_prd_ly_vol"+count);
    			  sch_prd_ly_vol.value = "0";
    			  var sch_prd_ly_vol_div = document.getElementById("sch_prd_ly_vol_div"+count);
    			  sch_prd_ly_vol_div.value = "0";
    			  
    			  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
    			  proj_grwth_vol_pct.value = "0";
    			  proj_grwth_vol_pct.readOnly = true;
    			  
    			  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
    			  sch_prd_ty_vol.value = "0";
    			  sch_prd_ty_vol.readOnly = true;
    			  var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
    			  sch_prd_ty_vol_div.value = "0";
    			  sch_prd_ty_vol_div.readOnly = true;
    		    
    		    var sch_prd_lly_val = document.getElementById("sch_prd_lly_val"+count);
    			  sch_prd_lly_val.value = "0";
    			  var sch_prd_lly_val_div = document.getElementById("sch_prd_lly_val_div"+count);
    			  sch_prd_lly_val_div.value = "0";
    			  
    			  var sch_prd_ly_val = document.getElementById("sch_prd_ly_val"+count);
    			  sch_prd_ly_val.value = "0";
    			  var sch_prd_ly_val_div = document.getElementById("sch_prd_ly_val_div"+count);
    			  sch_prd_ly_val_div.value = "0";
    			  
    			  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
    			  proj_grwth_val_pct.value = "0";
    			  proj_grwth_val_pct.readOnly = true;
    			  
    			  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
    			  sch_prd_ty_val.value = "0";
    			  sch_prd_ty_val.readOnly = true;
    			  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
    			  sch_prd_ty_val_div.value = "0";
    			  sch_prd_ty_val_div.readOnly = true;
    			  
    			  var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
    			  sch_prd_spread_tgt_vol.value = "0";
    			  sch_prd_spread_tgt_vol.readOnly = true;
    			  
    			  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
    			  sch_prd_spread_tgt_val.value = "0";
    			  sch_prd_spread_tgt_val.readOnly = true;
    			  
    			  var sch_prd_spread_mtd_ly_vol = document.getElementById("sch_prd_spread_mtd_ly_vol"+count);
    			  sch_prd_spread_mtd_ly_vol.value = "0";
    			  
    			  var sch_prd_spread_mtd_ly_val = document.getElementById("sch_prd_spread_mtd_ly_val"+count);
    			  sch_prd_spread_mtd_ly_val.value = "0";
    			  
    			  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
    			  proj_grwth_spd_pct.value = "0";
    			  proj_grwth_spd_pct.readOnly = true;
    			  
    			  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
    			  sch_prd_spread_mtd_ty_tgt_vol.value = "0";
    			  
    			  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
    			  sch_prd_spread_mtd_ty_tgt_val.value = "0";
    			  
    			  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
    			  sch_prd_wt_avg.value = "0";
    			  sch_prd_wt_avg.readOnly = true;
    			  
    			  var sch_prd_total_prd_bdgt = document.getElementById("sch_prd_total_prd_bdgt"+count);
    			  sch_prd_total_prd_bdgt.value = "0";
    			  
    			  prdoutflowTotal();
    		});

    		$('#sch_product_outflow_id'+count).change(function(){
    		    
    			$('#loading'+count).show();
    			$('#sch_prd_outflow_id'+count).hide();
    			
    			var sch_prd_lly_vol = document.getElementById("sch_prd_lly_vol"+count);
    		    sch_prd_lly_vol.value = "0";
    		    var sch_prd_lly_vol_div = document.getElementById("sch_prd_lly_vol_div"+count);
    		    sch_prd_lly_vol_div.value = "0";
    			
    		    var sch_prd_ly_vol = document.getElementById("sch_prd_ly_vol"+count);
    			sch_prd_ly_vol.value = "0";
    			var sch_prd_ly_vol_div = document.getElementById("sch_prd_ly_vol_div"+count);
    			sch_prd_ly_vol_div.value = "0";
    			
    			var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
    			proj_grwth_vol_pct.value = "0";
    			proj_grwth_vol_pct.readOnly = true;
    			
    			var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
    			sch_prd_ty_vol.value = "0";
    			sch_prd_ty_vol.readOnly = true;
    			var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
    			sch_prd_ty_vol_div.value = "0";
    			sch_prd_ty_vol_div.readOnly = true;
    			
    		    var sch_prd_lly_val = document.getElementById("sch_prd_lly_val"+count);
    			sch_prd_lly_val.value = "0";
    			var sch_prd_lly_val_div = document.getElementById("sch_prd_lly_val_div"+count);
    			sch_prd_lly_val_div.value = "0";
    			
    			var sch_prd_ly_val = document.getElementById("sch_prd_ly_val"+count);
    			sch_prd_ly_val.value = "0";
    			var sch_prd_ly_val_div = document.getElementById("sch_prd_ly_val_div"+count);
    			sch_prd_ly_val_div.value = "0";
    			
    			var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
    			proj_grwth_val_pct.value = "0";
    			proj_grwth_val_pct.readOnly = true;
    			
    			var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
    			sch_prd_ty_val.value = "0";
    			sch_prd_ty_val.readOnly = true;
    			var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
    			sch_prd_ty_val_div.value = "0";
    			sch_prd_ty_val_div.readOnly = true;
    			
    			var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
    			sch_prd_spread_tgt_vol.value = "0";
    			sch_prd_spread_tgt_vol.readOnly = true;
    			  
    			var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
    			sch_prd_spread_tgt_val.value = "0";
    			sch_prd_spread_tgt_val.readOnly = true;
    			
    			var sch_prd_spread_mtd_ly_vol = document.getElementById("sch_prd_spread_mtd_ly_vol"+count);
    			sch_prd_spread_mtd_ly_vol.value = "0";
    			
    			var sch_prd_spread_mtd_ly_val = document.getElementById("sch_prd_spread_mtd_ly_val"+count);
    			sch_prd_spread_mtd_ly_val.value = "0";
    			
    			var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
    			proj_grwth_spd_pct.value = "0";
    			proj_grwth_spd_pct.readOnly = true;
    			
    			var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
    			sch_prd_spread_mtd_ty_tgt_vol.value = "0";
    			
    			var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
    			sch_prd_spread_mtd_ty_tgt_val.value = "0";
    			
    			var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
    			sch_prd_wt_avg.value = "0";
    			sch_prd_wt_avg.readOnly = true;
    			
    			var sch_prd_total_prd_bdgt = document.getElementById("sch_prd_total_prd_bdgt"+count);
    			sch_prd_total_prd_bdgt.value = "0";
    			
    			prdoutflowTotal();
    		    
    			var datavalue =$('#sch_prd_outflow_line_type'+count).val();
    		    var prdvalue =$('#sch_product_outflow_id'+count).val();
    		    
    		    var sch_prd_spread_tgt_vol_v =$('#sch_prd_spread_tgt_vol'+count).val();
    		    var sch_prd_spread_tgt_val_v =$('#sch_prd_spread_tgt_val'+count).val();
    		    
    		    var startdate =$('#start_date').val();
    		    var enddate =$('#end_date').val();
    		    var depotcodes =String($('#sel_depo').val());
    		    var custtypes = jQuery.map($(':checkbox[name=cust_type]:checked'), function (n, i) {
    		        return n.value;
    		    }).join(',');
    		    
//    		     alert(custtypes);

//    		     $('[name="cust_type"]').each( function (){
//    		         if($(this).prop('checked') == true){
//    		             alert($(this).val());
//    		         }
//    		     });
//    		     var custtypes = $( "input[type=checkbox][name=cust_type]" ).val();
//    		     alert(custtypes);
    		   
    		   
    		    	
    		    	$.ajax({
    		            url: '${pageContext.request.contextPath}/loadproductoutflow',
    		            data: ({datavalue : datavalue,prdvalue : prdvalue,
    		            		startdate : startdate,enddate : enddate,
    		            		depotcodes : depotcodes,custtypes : custtypes,
    		            		sch_prd_spread_tgt_vol : sch_prd_spread_tgt_vol_v,
    		            		sch_prd_spread_tgt_val : sch_prd_spread_tgt_val_v}),
    		            success: function(data) {

    		            	$('#sch_prd_lly_vol'+count).val(data.LLY_VOL);
    		            	if(data.LLY_VOL != 0) {
    		            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL / 1000);
    		            	} else {
    		            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL);
    		            	}
    		            	
    		            	$('#sch_prd_lly_val'+count).val(data.LLY_VAL);
    						if(data.LLY_VAL != 0) {
    							$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL / 10000000);
    		            	} else {
    		            		$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL);
    		            	}
    		            	
    		            	$('#sch_prd_ly_vol'+count).val(data.LY_VOL);
    						if(data.LY_VOL != 0) {
    							$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL / 1000);
    		            	} else {
    		            		$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL);
    		            	}
    		            	
    		            	$('#sch_prd_ly_val'+count).val(data.LY_VAL);
    						if(data.LY_VAL != 0) {
    							$('#sch_prd_ly_val_div'+count).val(data.LY_VAL / 10000000);
    		            	} else {
    		            		$('#sch_prd_ly_val_div'+count).val(data.LY_VAL);
    		            	}
    		            	$('#sch_prd_spread_mtd_ly_vol'+count).val(data.SPREAD_MTD_LY_VOL);
    		            	$('#sch_prd_spread_mtd_ly_val'+count).val(data.SPREAD_MTD_LY_VAL);
    		            	
    		            	
    		            	if(data.LLY_VOL == 0 && data.LLY_VAL == 0 && data.LY_VOL == 0 && data.LY_VAL == 0) {
    		          		
    		            		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
    		                	sch_prd_spread_tgt_vol.readOnly = false;
    		            		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
    		            		  sch_prd_spread_tgt_val.readOnly = false;
    		                	
    		          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
    		          		  sch_prd_ty_vol.readOnly = false;
    		          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
    		        		  sch_prd_ty_vol_div.readOnly = false;
    		                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
    		                	  sch_prd_ty_val.readOnly = false;
    		                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
    		                	  sch_prd_ty_val_div.readOnly = false;
    		                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
    		                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = false;
    		                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
    		                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = false;
    		                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
    		                	  proj_grwth_vol_pct.readOnly = true;
    		                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
    		                	  proj_grwth_val_pct.readOnly = true;
    		                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
    		                	  proj_grwth_spd_pct.readOnly = true;
    		                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
    		                	  sch_prd_wt_avg.readOnly = false;
    		          	  
    		          		  
    		          	  } else {
    		          		  
    		          		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
    		            	sch_prd_spread_tgt_vol.readOnly = false;
    		        		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
    		        		  sch_prd_spread_tgt_val.readOnly = false;
    		            	
    		          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
    		          		  sch_prd_ty_vol.readOnly = true;
    		          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
    		        		  sch_prd_ty_vol_div.readOnly = true;
    		                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
    		                	  sch_prd_ty_val.readOnly = true;
    		                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
    		                	  sch_prd_ty_val_div.readOnly = true;
    		                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
    		                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = true;
    		                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
    		                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = true;
    		                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
    		                	  proj_grwth_vol_pct.readOnly = false;
    		                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
    		                	  proj_grwth_val_pct.readOnly = false;
    		                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
    		                	  proj_grwth_spd_pct.readOnly = false;
    		                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
    		                	  sch_prd_wt_avg.readOnly = false;
    		          	  }
    		            	
    		            	$('#loading'+count).hide();
    		            	$('#sch_prd_outflow_id'+count).show();

    		            	prdoutflowgrwth(count);
    		            }
    		          });
    		    	
    		     
    		    	
//    		     	  if($('#sch_prd_lly_vol'+count).val() == 0 && 
//    		     			  $('#sch_prd_lly_val'+count).val() == 0 &&
//    		       				$('#sch_prd_ly_vol'+count).val() == 0 &&
//    		       					$('#sch_prd_ly_val'+count).val() == 0) {
    		    		  
//    		     		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
//    		     		  sch_prd_ty_vol.readOnly = false;
//    		           	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
//    		           	  sch_prd_ty_val.readOnly = false;
    		    	  
    		    		  
//    		     	  } else {
//    		     		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
//    		     		  sch_prd_ty_vol.readOnly = true;
//    		           	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
//    		           	  sch_prd_ty_val.readOnly = true;
//    		     	  }


    				
    		    
    		    	
    		    
    		  
    		   
    		});
    	
    		$('#sch_prd_spread_tgt_vol'+count).blur(function(){
    			
    			$('#loading'+count).show();
    			$('#sch_prd_outflow_id'+count).hide();
    			
    			var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
    			sch_prd_spread_tgt_vol.readOnly = true;
    			  
    			var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
    			sch_prd_spread_tgt_val.readOnly = true;
    			
    			var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
    			proj_grwth_vol_pct.readOnly = true;
    			
    			var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
    			proj_grwth_val_pct.readOnly = true;
    			
    			var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
    			proj_grwth_spd_pct.readOnly = true;
    			
    			var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
    			sch_prd_ty_vol.readOnly = true;
    			var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
    			sch_prd_ty_vol_div.readOnly = true;
    			
    			var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
    			sch_prd_ty_val.readOnly = true;
    			var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
    			sch_prd_ty_val_div.readOnly = true;
    			
    			var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
    			sch_prd_wt_avg.readOnly = true;
    			
    		    
    			var datavalue =$('#sch_prd_outflow_line_type'+count).val();
    		    var prdvalue =$('#sch_product_outflow_id'+count).val();
    		    
    		    var sch_prd_spread_tgt_vol_v =$('#sch_prd_spread_tgt_vol'+count).val();
    		    var sch_prd_spread_tgt_val_v =$('#sch_prd_spread_tgt_val'+count).val();
    		    
    		    var startdate =$('#start_date').val();
    		    var enddate =$('#end_date').val();
    		    var depotcodes =String($('#sel_depo').val());
    		    var custtypes = jQuery.map($(':checkbox[name=cust_type]:checked'), function (n, i) {
    		        return n.value;
    		    }).join(',');
    		   
    		   
    		    	
    		    	$.ajax({
    		            url: '${pageContext.request.contextPath}/loadproductoutflow',
    		            data: ({datavalue : datavalue,prdvalue : prdvalue,
    		            		startdate : startdate,enddate : enddate,
    		            		depotcodes : depotcodes,custtypes : custtypes,
    		            		sch_prd_spread_tgt_vol : sch_prd_spread_tgt_vol_v,
    		            		sch_prd_spread_tgt_val : sch_prd_spread_tgt_val_v}),
    		            success: function(data) {

    		            	$('#sch_prd_lly_vol'+count).val(data.LLY_VOL);
    		            	if(data.LLY_VOL != 0) {
    		            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL / 1000);
    		            	} else {
    		            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL);
    		            	}
    		            	$('#sch_prd_lly_val'+count).val(data.LLY_VAL);
    		            	if(data.LLY_VAL != 0) {
    							$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL / 10000000);
    		            	} else {
    		            		$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL);
    		            	}
    		            	$('#sch_prd_ly_vol'+count).val(data.LY_VOL);
    		            	if(data.LY_VOL != 0) {
    							$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL / 1000);
    		            	} else {
    		            		$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL);
    		            	}
    		            	$('#sch_prd_ly_val'+count).val(data.LY_VAL);
    		            	if(data.LY_VAL != 0) {
    							$('#sch_prd_ly_val_div'+count).val(data.LY_VAL / 10000000);
    		            	} else {
    		            		$('#sch_prd_ly_val_div'+count).val(data.LY_VAL);
    		            	}
    		            	$('#sch_prd_spread_mtd_ly_vol'+count).val(data.SPREAD_MTD_LY_VOL);
    		            	$('#sch_prd_spread_mtd_ly_val'+count).val(data.SPREAD_MTD_LY_VAL);
    		            	
    		            	
    		            	if(data.LLY_VOL == 0 && data.LLY_VAL == 0 && data.LY_VOL == 0 && data.LY_VAL == 0) {
    		          		
    		            		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
    		                	sch_prd_spread_tgt_vol.readOnly = false;
    		            		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
    		            		  sch_prd_spread_tgt_val.readOnly = false;
    		                	
    		          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
    		          		  sch_prd_ty_vol.readOnly = false;
    		          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
    		        		  sch_prd_ty_vol_div.readOnly = false;
    		                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
    		                	  sch_prd_ty_val.readOnly = false;
    		                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
    		                	  sch_prd_ty_val_div.readOnly = false;
    		                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
    		                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = false;
    		                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
    		                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = false;
    		                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
    		                	  proj_grwth_vol_pct.readOnly = true;
    		                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
    		                	  proj_grwth_val_pct.readOnly = true;
    		                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
    		                	  proj_grwth_spd_pct.readOnly = true;
    		                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
    		                	  sch_prd_wt_avg.readOnly = false;
    		          	  
    		          		  
    		          	  } else {
    		          		  
    		          		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
    		            	sch_prd_spread_tgt_vol.readOnly = false;
    		        		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
    		        		  sch_prd_spread_tgt_val.readOnly = false;
    		            	
    		          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
    		          		  sch_prd_ty_vol.readOnly = true;
    		          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
    		        		  sch_prd_ty_vol_div.readOnly = true;
    		                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
    		                	  sch_prd_ty_val.readOnly = true;
    		                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
    		                	  sch_prd_ty_val_div.readOnly = true;
    		                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
    		                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = true;
    		                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
    		                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = true;
    		                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
    		                	  proj_grwth_vol_pct.readOnly = false;
    		                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
    		                	  proj_grwth_val_pct.readOnly = false;
    		                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
    		                	  proj_grwth_spd_pct.readOnly = false;
    		                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
    		                	  sch_prd_wt_avg.readOnly = false;
    		          	  }
    		            	
    		            	$('#loading'+count).hide();
    		            	$('#sch_prd_outflow_id'+count).show();

    		            	prdoutflowgrwth(count);
    		            }
    		          });

    			
    		    	



    		});




    		$('#sch_prd_spread_tgt_val'+count).blur(function(){
    			
    			$('#loading'+count).show();
    			$('#sch_prd_outflow_id'+count).hide();
    			
    			var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
    			sch_prd_spread_tgt_vol.readOnly = true;
    			  
    			var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
    			sch_prd_spread_tgt_val.readOnly = true;
    			
    			var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
    			proj_grwth_vol_pct.readOnly = true;
    			
    			var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
    			proj_grwth_val_pct.readOnly = true;
    			
    			var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
    			proj_grwth_spd_pct.readOnly = true;
    			
    			var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
    			sch_prd_ty_vol.readOnly = true;
    			var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
    			sch_prd_ty_vol_div.readOnly = true;
    			
    			var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
    			sch_prd_ty_val.readOnly = true;
    			var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
    			sch_prd_ty_val_div.readOnly = true;
    			
    			var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
    			sch_prd_wt_avg.readOnly = true;
    			
    		   
    			var datavalue =$('#sch_prd_outflow_line_type'+count).val();
    		    var prdvalue =$('#sch_product_outflow_id'+count).val();
    		    
    		    var sch_prd_spread_tgt_vol_v =$('#sch_prd_spread_tgt_vol'+count).val();
    		    var sch_prd_spread_tgt_val_v =$('#sch_prd_spread_tgt_val'+count).val();
    		    
    		    var startdate =$('#start_date').val();
    		    console.log(srartdate);
    		    var enddate =$('#end_date').val();
    		    console.log(enddate);
    		    var depotcodes =String($('#sel_depo').val());
    		    var custtypes = jQuery.map($(':checkbox[name=cust_type]:checked'), function (n, i) {
    		        return n.value;
    		    }).join(',');
    		   
    		   
    		    	
    		    	$.ajax({
    		            url: '${pageContext.request.contextPath}/loadproductoutflow',
    		            data: ({datavalue : datavalue,prdvalue : prdvalue,
    		            		startdate : startdate,enddate : enddate,
    		            		depotcodes : depotcodes,custtypes : custtypes,
    		            		sch_prd_spread_tgt_vol : sch_prd_spread_tgt_vol_v,
    		            		sch_prd_spread_tgt_val : sch_prd_spread_tgt_val_v}),
    		            success: function(data) {

    		            	$('#sch_prd_lly_vol'+count).val(data.LLY_VOL);
    		            	if(data.LLY_VOL != 0) {
    		            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL / 1000);
    		            	} else {
    		            		$('#sch_prd_lly_vol_div'+count).val(data.LLY_VOL);
    		            	}
    		            	$('#sch_prd_lly_val'+count).val(data.LLY_VAL);
    		            	if(data.LLY_VAL != 0) {
    							$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL / 10000000);
    		            	} else {
    		            		$('#sch_prd_lly_val_div'+count).val(data.LLY_VAL);
    		            	}
    		            	$('#sch_prd_ly_vol'+count).val(data.LY_VOL);
    		            	if(data.LY_VOL != 0) {
    							$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL / 1000);
    		            	} else {
    		            		$('#sch_prd_ly_vol_div'+count).val(data.LY_VOL);
    		            	}
    		            	$('#sch_prd_ly_val'+count).val(data.LY_VAL);
    		            	if(data.LY_VAL != 0) {
    							$('#sch_prd_ly_val_div'+count).val(data.LY_VAL / 10000000);
    		            	} else {
    		            		$('#sch_prd_ly_val_div'+count).val(data.LY_VAL);
    		            	}
    		            	$('#sch_prd_spread_mtd_ly_vol'+count).val(data.SPREAD_MTD_LY_VOL);
    		            	$('#sch_prd_spread_mtd_ly_val'+count).val(data.SPREAD_MTD_LY_VAL);
    		            	
    		            	
    		            	if(data.LLY_VOL == 0 && data.LLY_VAL == 0 && data.LY_VOL == 0 && data.LY_VAL == 0) {
    		          		
    		            		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
    		                	sch_prd_spread_tgt_vol.readOnly = false;
    		            		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
    		            		  sch_prd_spread_tgt_val.readOnly = false;
    		                	
    		          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
    		          		  sch_prd_ty_vol.readOnly = false;
    		          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
    		        		  sch_prd_ty_vol_div.readOnly = false;
    		                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
    		                	  sch_prd_ty_val.readOnly = false;
    		                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
    		                	  sch_prd_ty_val_div.readOnly = false;
    		                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
    		                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = false;
    		                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
    		                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = false;
    		                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
    		                	  proj_grwth_vol_pct.readOnly = true;
    		                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
    		                	  proj_grwth_val_pct.readOnly = true;
    		                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
    		                	  proj_grwth_spd_pct.readOnly = true;
    		                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
    		                	  sch_prd_wt_avg.readOnly = false;
    		          	  
    		          		  
    		          	  } else {
    		          		  
    		          		var sch_prd_spread_tgt_vol = document.getElementById("sch_prd_spread_tgt_vol"+count);
    		            	sch_prd_spread_tgt_vol.readOnly = false;
    		        		  var sch_prd_spread_tgt_val = document.getElementById("sch_prd_spread_tgt_val"+count);
    		        		  sch_prd_spread_tgt_val.readOnly = false;
    		            	
    		          		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
    		          		  sch_prd_ty_vol.readOnly = true;
    		          		var sch_prd_ty_vol_div = document.getElementById("sch_prd_ty_vol_div"+count);
    		        		  sch_prd_ty_vol_div.readOnly = true;
    		                	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
    		                	  sch_prd_ty_val.readOnly = true;
    		                	  var sch_prd_ty_val_div = document.getElementById("sch_prd_ty_val_div"+count);
    		                	  sch_prd_ty_val_div.readOnly = true;
    		                	  var sch_prd_spread_mtd_ty_tgt_vol = document.getElementById("sch_prd_spread_mtd_ty_tgt_vol"+count);
    		                	  sch_prd_spread_mtd_ty_tgt_vol.readOnly = true;
    		                    	  var sch_prd_spread_mtd_ty_tgt_val = document.getElementById("sch_prd_spread_mtd_ty_tgt_val"+count);
    		                    	  sch_prd_spread_mtd_ty_tgt_val.readOnly = true;
    		                	  var proj_grwth_vol_pct = document.getElementById("proj_grwth_vol_pct"+count);
    		                	  proj_grwth_vol_pct.readOnly = false;
    		                	  var proj_grwth_val_pct = document.getElementById("proj_grwth_val_pct"+count);
    		                	  proj_grwth_val_pct.readOnly = false;
    		                	  var proj_grwth_spd_pct = document.getElementById("proj_grwth_spd_pct"+count);
    		                	  proj_grwth_spd_pct.readOnly = false;
    		                	  var sch_prd_wt_avg = document.getElementById("sch_prd_wt_avg"+count);
    		                	  sch_prd_wt_avg.readOnly = false;
    		          	  }
    		            	
    		            	$('#loading'+count).hide();
    		            	$('#sch_prd_outflow_id'+count).show();

    		            	prdoutflowgrwth(count);
    		            }
    		          });
    		    	
    		    	

    			
    			
    			


    		}); 




    		$('#proj_grwth_vol_pct'+count).blur(function(){
    			
    			var sch_prd_ly_vol= parseFloat($('#sch_prd_ly_vol'+count).val());
    			var sch_prd_ly_vol_div= parseFloat($('#sch_prd_ly_vol_div'+count).val());
    			var proj_grwth_vol_pct= parseFloat($('#proj_grwth_vol_pct'+count).val());
    			var pct = parseFloat(proj_grwth_vol_pct) + 100;
    			
    			if(sch_prd_ly_vol != 0) {
    				var sch_prd_ty_vol = (sch_prd_ly_vol * pct / 100).toFixed(2);
    			} else {
    				var sch_prd_ty_vol = (proj_grwth_vol_pct).toFixed(2);
    			}
    			$('#sch_prd_ty_vol'+count).val(sch_prd_ty_vol);
    			if(sch_prd_ly_vol_div != 0) {
    				var sch_prd_ty_vol_div = (sch_prd_ly_vol_div * pct / 100).toFixed(2);	
    			} else {
    				if(proj_grwth_vol_pct != 0) {
    					var sch_prd_ty_vol_div = (proj_grwth_vol_pct / 1000).toFixed(2);
    				} else {
    					var sch_prd_ty_vol_div = (proj_grwth_vol_pct).toFixed(2);
    				}
    			}
    			$('#sch_prd_ty_vol_div'+count).val(sch_prd_ty_vol_div);
    			
    			var sch_prd_wt_avg= parseFloat($('#sch_prd_wt_avg'+count).val());
    			var sch_prd_total_prd_bdgt = (sch_prd_ty_vol * sch_prd_wt_avg).toFixed(2); 
    			$('#sch_prd_total_prd_bdgt'+count).val(sch_prd_total_prd_bdgt);
    			
    			 prdoutflowTotal();



    		}); 

    		$('#proj_grwth_val_pct'+count).blur(function(){
    			
    			var sch_prd_ly_val= parseFloat($('#sch_prd_ly_val'+count).val());
    			var sch_prd_ly_val_div= parseFloat($('#sch_prd_ly_val_div'+count).val());
    			var proj_grwth_val_pct= parseFloat($('#proj_grwth_val_pct'+count).val());
    			var pct = parseFloat(proj_grwth_val_pct) + 100;
    			
    			if(sch_prd_ly_val != 0) {
    				var sch_prd_ty_val = (sch_prd_ly_val * pct / 100).toFixed(2);	
    			} else {
    				var sch_prd_ty_val = (proj_grwth_val_pct).toFixed(2);
    			}
    			$('#sch_prd_ty_val'+count).val(sch_prd_ty_val);
    			if(sch_prd_ly_val_div != 0) {
    				var sch_prd_ty_val_div = (sch_prd_ly_val_div * pct / 100).toFixed(2);	
    			} else {
    				if(proj_grwth_val_pct != 0) {
    					var sch_prd_ty_val_div = (proj_grwth_val_pct / 10000000).toFixed(2);	
    				} else {
    					var sch_prd_ty_val_div = (proj_grwth_val_pct).toFixed(2);
    				}
    				
    			}
    			$('#sch_prd_ty_val_div'+count).val(sch_prd_ty_val_div);
    			
    			


    		}); 

    		$('#proj_grwth_spd_pct'+count).blur(function(){
    			
    			var sch_prd_spread_mtd_ly_vol= parseFloat($('#sch_prd_spread_mtd_ly_vol'+count).val());
    			var sch_prd_spread_mtd_ly_val= parseFloat($('#sch_prd_spread_mtd_ly_val'+count).val());
    			var proj_grwth_spd_pct= parseFloat($('#proj_grwth_spd_pct'+count).val());
    			var pct = parseFloat(proj_grwth_spd_pct) + 100;
    			
    			var sch_prd_spread_mtd_ty_tgt_vol = parseInt(sch_prd_spread_mtd_ly_vol * pct / 100);
    			$('#sch_prd_spread_mtd_ty_tgt_vol'+count).val(sch_prd_spread_mtd_ty_tgt_vol);
    			var sch_prd_spread_mtd_ty_tgt_val = parseInt(sch_prd_spread_mtd_ly_val * pct / 100);
    			$('#sch_prd_spread_mtd_ty_tgt_val'+count).val(sch_prd_spread_mtd_ty_tgt_val);
    			
    			


    		}); 
    		
    		$('#sch_prd_ty_vol'+count).blur(function(){
    			
    			var sch_prd_ty_vol= parseFloat($('#sch_prd_ty_vol'+count).val());
    			var sch_prd_wt_avg= parseFloat($('#sch_prd_wt_avg'+count).val());
    			
    			if(proj_grwth_val_pct != 0) {
    				var sch_prd_ty_vol_div= (sch_prd_ty_vol / 1000).toFixed(2);	
    			} else {
    				var sch_prd_ty_vol_div= (sch_prd_ty_vol).toFixed(2);
    			}
    			$('#sch_prd_ty_vol_div'+count).val(sch_prd_ty_vol_div);
    			
    			var sch_prd_total_prd_bdgt = (sch_prd_ty_vol * sch_prd_wt_avg).toFixed(2); 
    			$('#sch_prd_total_prd_bdgt'+count).val(sch_prd_total_prd_bdgt);
    			
    			 prdoutflowTotal();

    		}); 
    		
    		$('#sch_prd_ty_vol_div'+count).blur(function(){
    			
    			var sch_prd_ty_vol_div= parseFloat($('#sch_prd_ty_vol_div'+count).val());
    			var sch_prd_wt_avg= parseFloat($('#sch_prd_wt_avg'+count).val());
    			
    			var sch_prd_ty_vol= (sch_prd_ty_vol_div * 1000).toFixed(2);
    			$('#sch_prd_ty_vol'+count).val(sch_prd_ty_vol);
    			
    			var sch_prd_total_prd_bdgt = (sch_prd_ty_vol * sch_prd_wt_avg).toFixed(2); 
    			$('#sch_prd_total_prd_bdgt'+count).val(sch_prd_total_prd_bdgt);
    			
    			 prdoutflowTotal();

    		});


    		$('#sch_prd_wt_avg'+count).blur(function(){
    			
    			var sch_prd_ty_vol= parseFloat($('#sch_prd_ty_vol'+count).val());
    			var sch_prd_wt_avg= parseFloat($('#sch_prd_wt_avg'+count).val());
    			
    			var sch_prd_total_prd_bdgt = (sch_prd_ty_vol * sch_prd_wt_avg).toFixed(2); 
    			$('#sch_prd_total_prd_bdgt'+count).val(sch_prd_total_prd_bdgt);
    			
    			 prdoutflowTotal();

    		}); 


    	

    				

    		

    	} // end of addrow2
    	
    	function prdoutflowgrwth(count){
    		
    		
    		var sch_prd_ly_vol= parseFloat($('#sch_prd_ly_vol'+count).val());
    		var sch_prd_ly_vol_div= parseFloat($('#sch_prd_ly_vol_div'+count).val());
    		var sch_prd_ly_val= parseFloat($('#sch_prd_ly_val'+count).val());
    		var sch_prd_ly_val_div= parseFloat($('#sch_prd_ly_val_div'+count).val());
    		var sch_prd_spread_mtd_ly_vol= parseFloat($('#sch_prd_spread_mtd_ly_vol'+count).val());
    		var sch_prd_spread_mtd_ly_val= parseFloat($('#sch_prd_spread_mtd_ly_val'+count).val());
    		var proj_grwth_vol_pct= parseFloat($('#proj_grwth_vol_pct'+count).val());
    		var proj_grwth_val_pct= parseFloat($('#proj_grwth_val_pct'+count).val());
    		var proj_grwth_spd_pct= parseFloat($('#proj_grwth_spd_pct'+count).val());
    		var pct_vol = parseFloat(proj_grwth_vol_pct) + 100;
    		var pct_val = parseFloat(proj_grwth_val_pct) + 100;
    		var pct_spd = parseFloat(proj_grwth_spd_pct) + 100;
    		
    		if(sch_prd_ly_vol != 0) {
    			var sch_prd_ty_vol = (sch_prd_ly_vol * pct_vol / 100).toFixed(2);	
    		} else {
    			var sch_prd_ty_vol = (proj_grwth_vol_pct).toFixed(2);
    		}
    		$('#sch_prd_ty_vol'+count).val(sch_prd_ty_vol);
    		if(sch_prd_ly_vol_div != 0) {
    			var sch_prd_ty_vol_div = (sch_prd_ly_vol_div * pct_vol / 100).toFixed(2);	
    		} else {
    			if(proj_grwth_vol_pct != 0) {
    				var sch_prd_ty_vol_div = (proj_grwth_vol_pct / 1000).toFixed(2);
    			} else {
    				var sch_prd_ty_vol_div = (proj_grwth_vol_pct).toFixed(2);
    			}
    		}
    		$('#sch_prd_ty_vol_div'+count).val(sch_prd_ty_vol_div);
    		if(sch_prd_ly_val != 0) {
    			var sch_prd_ty_val = (sch_prd_ly_val * pct_val / 100).toFixed(2);	
    		} else {
    			var sch_prd_ty_val = (proj_grwth_val_pct).toFixed(2);
    		}
    		$('#sch_prd_ty_val'+count).val(sch_prd_ty_val);
    		if(sch_prd_ly_val_div != 0) {
    			var sch_prd_ty_val_div = (sch_prd_ly_val_div * pct_val / 100).toFixed(2);	
    		} else {
    			if(proj_grwth_val_pct != 0) {
    				var sch_prd_ty_val_div = (proj_grwth_val_pct / 10000000).toFixed(2);	
    			} else {
    				var sch_prd_ty_val_div = (proj_grwth_val_pct).toFixed(2);
    			}
    		}
    		$('#sch_prd_ty_val_div'+count).val(sch_prd_ty_val_div);
    		var sch_prd_spread_mtd_ty_tgt_vol = parseInt(sch_prd_spread_mtd_ly_vol * pct_spd / 100);
    		$('#sch_prd_spread_mtd_ty_tgt_vol'+count).val(sch_prd_spread_mtd_ty_tgt_vol);
    		var sch_prd_spread_mtd_ty_tgt_val = parseInt(sch_prd_spread_mtd_ly_val * pct_spd / 100);
    		$('#sch_prd_spread_mtd_ty_tgt_val'+count).val(sch_prd_spread_mtd_ty_tgt_val);
    		
    		var sch_prd_wt_avg= parseFloat($('#sch_prd_wt_avg'+count).val());
    		var sch_prd_total_prd_bdgt = (sch_prd_ty_vol * sch_prd_wt_avg).toFixed(2); 
    		$('#sch_prd_total_prd_bdgt'+count).val(sch_prd_total_prd_bdgt);

    		
    		 prdoutflowTotal();
    	}

    	
    	function prdoutflowTotal(){
    		
    		
    		$('#rowcount3').val($('#dynamic-table3 tr').length-1);
    		var count3 = $('#rowcount3').val();
    			
    		var total = 0;
    		$('#total_prd_outflow').val(total);
    		var lineTotal=0;
    		var i=1;
    		
    		for(i=1; i<=count3; i++){
    			 lineTotal = $('#sch_prd_total_prd_bdgt'+i).val();
    			
    			 total = Number(total)+Number(lineTotal);

    		}
    		
    		var totalsum = (total).toFixed(2);
    		
    		$('#total_prd_outflow').val(totalsum);
    		$('#total_prd_outflow1').val(totalsum);
    		$('#scheme_budget').val(totalsum);
    		$('#scheme_budget1').val(totalsum);
    	}

       
       
       </script>


<script>

// function AddPrdTyp(rowno)
// {

// var count = rowno;

$('.fetchgrpid1').mousedown(function(){
	
	var count = $('.fetchgrpid1').index(this)+1;

var prd_line_type = "PRD_LINE_TYPE";
$.ajax({
        url: '${pageContext.request.contextPath}/loadschemetype',
        data: ({scheme : prd_line_type}),
       success: function(data) {
           var select = $('#sch_prd_line_type'+count);
           select.find('option').remove();
           $('<option>').val("").text("--Select--").appendTo(select);
              $.each(data, function(index, value) {
           	
           			$('<option>').val(value).text(value).appendTo(select);

           	
           });

        }
      });
});

$('.fetchgrpid1').change(function(){	
	var count = $('.fetchgrpid1').index(this)+1;

// $('#sch_prd_line_type'+count).change(function(){
    var datavalue =$('#sch_prd_line_type'+count).val();
    
    if(datavalue == "All") {
        var select = $('#sch_product_id'+count);
        select.find('option').remove();

		$('<option>').val("All").text("All").appendTo(select);

    }
    else if(datavalue == "Product Category") {
    	
    	$.ajax({
            url: '${pageContext.request.contextPath}/loadproductcat',
            success: function(data) {

                var select = $('#sch_product_id'+count);
                select.find('option').remove();

    		$('<option>').val("").text("--Select--").appendTo(select);
                   $.each(data, function(index, value) {
    		$('<option>').val(value.prd_cat).text(value.prd_cat).appendTo(select);
                });

            }
          });
    
    	
    } else if (datavalue == "Product Code") {
    $.ajax({
        url: '${pageContext.request.contextPath}/loadproductcode',
        success: function(data) {

            var select = $('#sch_product_id'+count);
            select.find('option').remove();

		$('<option>').val("").text("--Select--").appendTo(select);
               $.each(data, function(index, value) {
		$('<option>').val(value.prd_code).text(value.prd_code).appendTo(select);
            });

        }
      });
    }
// });
});



// }


function AddRow1()
{

$('#dynamic-table2 tr').last().after('<tr><td><center>'+($('#dynamic-table2 tr').length-1)+'<input type="hidden" id="sch_prd_unique_id'+$('#dynamic-table2 tr').length+'" name="sch_prd_unique_id"></center></td><td><select name="sch_prd_line_type" id="sch_prd_line_type'+$('#dynamic-table2 tr').length+'" class="col-xs-12 col-sm-4"><option value="">--Select--</option></select></td><td><select name="sch_product_id" id="sch_product_id'+$('#dynamic-table2 tr').length+'" class="col-xs-12 col-sm-4"><option value="">--Select--</option></select></td><td><input type="text" id="sch_prd_exceptions'+$('#dynamic-table2 tr').length+'" name="sch_prd_exceptions" class="col-xs-12 col-sm-4"></td><td><input type="text" style="width:100%;" id="vol_grwth_pct'+$('#dynamic-table2 tr').length+'" value="" name="vol_grwth_pct" class= "calvolgrwthavg" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" /></td><td><input type="text" style="width:100%;" id="val_grwth_pct'+$('#dynamic-table2 tr').length+'" value="" name="val_grwth_pct" class= "calvalgrwthavg" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" /></td><td><input type="text" style="width:100%;" id="spread_pct'+$('#dynamic-table2 tr').length+'" value="" name="spread_pct" class= "calspreadavg" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" /></td><td><input type="text" style="width:100%;" id="spend_per_ltr'+$('#dynamic-table2 tr').length+'" value="" name="spend_per_ltr" onkeypress="return isNumber(event);" pattern="[0-9]+([\.][0-9]+)?" step="0.01" /></td></tr>');

$('#rowcount2').val($('#dynamic-table2 tr').length-1);
var count = $('#rowcount2').val();

// $.ajax({
//     url: '${pageContext.request.contextPath}/loadproductcode',
//     success: function(data) {

//         var select = $('#sch_product_id'+count);
//         select.find('option').remove();

// 	$('<option>').val("").text("--Select--").appendTo(select);
//            $.each(data, function(index, value) {
// 	$('<option>').val(value.prd_code).text(value.prd_code).appendTo(select);
//         });

//     }
//   });

var prd_line_type = "PRD_LINE_TYPE";
$.ajax({
        url: '${pageContext.request.contextPath}/loadschemetype',
        data: ({scheme : prd_line_type}),
       success: function(data) {
           var select = $('#sch_prd_line_type'+count);
           select.find('option').remove();
           $('<option>').val("").text("--Select--").appendTo(select);
              $.each(data, function(index, value) {
           	
           			$('<option>').val(value).text(value).appendTo(select);

           	
           });

        }
      });

$('#sch_prd_line_type'+count).change(function(){
    var datavalue =$('#sch_prd_line_type'+count).val();
    
    if(datavalue == "All") {
        var select = $('#sch_product_id'+count);
        select.find('option').remove();

		$('<option>').val("All").text("All").appendTo(select);

    }
    else if(datavalue == "Product Category") {
    	
    	$.ajax({
            url: '${pageContext.request.contextPath}/loadproductcat',
            success: function(data) {

                var select = $('#sch_product_id'+count);
                select.find('option').remove();

    		$('<option>').val("").text("--Select--").appendTo(select);
                   $.each(data, function(index, value) {
    		$('<option>').val(value.prd_cat).text(value.prd_cat).appendTo(select);
                });

            }
          });
    
    	
    } else if (datavalue == "Product Code") {
    $.ajax({
        url: '${pageContext.request.contextPath}/loadproductcode',
        success: function(data) {

            var select = $('#sch_product_id'+count);
            select.find('option').remove();

		$('<option>').val("").text("--Select--").appendTo(select);
               $.each(data, function(index, value) {
		$('<option>').val(value.prd_code).text(value.prd_code).appendTo(select);
            });

        }
      });
    }
});

$('.calvolgrwthavg').blur(function(){
	


	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
	var count = $('#rowcount2').val();

	 var cnt = $('.calvolgrwthavg').index(this)+1+1;
	
	 var avg=0;
	var vol_gwt = $('#volume_growth').val();
	var vol_gwt_pct = $('#vol_grwth_pct'+cnt).val();	    	
//	if(cnt == 1)
//	{
//			if(vol_gwt > vol_gwt_pct)
//			{
//				// alert("hii");
//			}
//			else{
//				alert("Check Entered Value");
//			}
	    				
//	}else{

		var sum = 0;					
		for(var i=2;i<=count;i++)
			{
				var data = parseFloat($('#vol_grwth_pct'+i).val());	
				
				sum = sum  + data;	
			}
		
		avg = sum /(count-1);
		
		if(vol_gwt >= avg)
		{
		}
		else{
			alert("Percentage value not matching with header");
			$('#vol_grwth_pct'+cnt).val("0");
		} 
		
//	}
}); 

$('.calvalgrwthavg').blur(function(){

	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
	var count = $('#rowcount2').val();

	 var cnt = $('.calvalgrwthavg').index(this)+1+1;
	// alert(cnt);
	var avg=0;
	var val_gwt = $('#value_growth').val();
	var val_gwt_pct = $('#val_grwth_pct'+cnt).val();
	    	
//	if(cnt == 1)
//	{
//			if(val_gwt > val_gwt_pct)
//			{
//				// alert("hii");
//			}
//			else{
//				alert("Check Entered Value");
//			}
	    				
//	}else{

		var sum = 0;					
		for(var i=2;i<=count;i++)
			{
				var data = parseFloat($('#val_grwth_pct'+i).val());	
				
				sum = sum  + data;							
			}
		
		avg = sum /(count-1);
		
		if(val_gwt >= avg)
		{
		
		}
		else{
			alert("Percentage value not matching with header");
			$('#val_grwth_pct'+cnt).val("0");
		}
		
//	}
}); 

$('.calspreadavg').blur(function(){

	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
	var count = $('#rowcount2').val();

	 var cnt = $('.calspreadavg').index(this)+1+1;
	// alert(cnt);
	var avg=0;
	var spread = $('#spraid').val();
	var spread_pct = $('#spread_pct'+cnt).val();
	    	
//	if(cnt == 1) 
//	{
//			if(spread > spread_pct)
//			{
//				// alert("hii");
//			}
//			else{
//				alert("Check Entered Value");
//			}
	    				
//	}else{

		var sum = 0;					
		for(var i=2;i<=count;i++)
			{
				var data = parseFloat($('#spread_pct'+i).val());	
				
				sum = sum  + data;							
			}
		
		avg = sum /(count-1);
		
		if(spread >= avg)
		{
		
		}
		else{
			alert("Percentage value not matching with header");
			$('#spread_pct'+cnt).val("0");
		}
		
//	}
}); 





}

$('.calvolgrwthavg').blur(function(){
	


	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
	var count = $('#rowcount2').val() - 1;
	
	 var cnt = $('.calvolgrwthavg').index(this)+1;
	 var avg=0;
	var vol_gwt = $('#volume_growth').val();
	var vol_gwt_pct = $('#vol_grwth_pct'+cnt).val();
	
//	if(cnt == 1)
//	{
//			if(vol_gwt > vol_gwt_pct)
//			{
//				// alert("hii");
//			}
//			else{
//				alert("Check Entered Value");
//			}
	    				
//	}else{

		var sum = 0;					
		for(var i=1;i<=count;i++)
			{
				var data = parseFloat($('#vol_grwth_pct'+i).val());	
				sum = sum  + data;	
			}
		
		avg = sum /count;
		
		if(vol_gwt >= avg)
		{
		}
		else{
			alert("Percentage value not matching with header");
			$('#vol_grwth_pct'+cnt).val("0");
		} 
		
//	}
}); 

$('.calvalgrwthavg').blur(function(){

	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
	var count = $('#rowcount2').val() - 1;

	 var cnt = $('.calvalgrwthavg').index(this)+1;
	// alert(cnt);
	var avg=0;
	var val_gwt = $('#value_growth').val();
	var val_gwt_pct = $('#val_grwth_pct'+cnt).val();
	    	
//	if(cnt == 1)
//	{
//			if(val_gwt > val_gwt_pct)
//			{
//				// alert("hii");
//			}
//			else{
//				alert("Check Entered Value");
//			}
	    				
//	}else{

		var sum = 0;					
		for(var i=1;i<=count;i++)
			{
				var data = parseFloat($('#val_grwth_pct'+i).val());	
				
				sum = sum  + data;							
			}
		
		avg = sum /count;
		
		if(val_gwt >= avg)
		{
		
		}
		else{
			alert("Percentage value not matching with header");
			$('#val_grwth_pct'+cnt).val("0");
		}
		
//	}
}); 

$('.calspreadavg').blur(function(){

	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
	var count = $('#rowcount2').val() - 1;

	 var cnt = $('.calspreadavg').index(this)+1;
	// alert(cnt);
	var avg=0;
	var spread = $('#spraid').val();
	var spread_pct = $('#spread_pct'+cnt).val();
	    	
//	if(cnt == 1) 
//	{
//			if(spread > spread_pct)
//			{
//				// alert("hii");
//			}
//			else{
//				alert("Check Entered Value");
//			}
	    				
//	}else{

		var sum = 0;					
		for(var i=1;i<=count;i++)
			{
				var data = parseFloat($('#spread_pct'+i).val());	
				
				sum = sum  + data;							
			}
		
		avg = sum /count;
		
		if(spread >= avg)
		{
		
		}
		else{
			alert("Percentage value not matching with header");
			$('#spread_pct'+cnt).val("0");
		}
		
//	}
}); 

</script>

<script>

function delRow(cnt) {
	
	$('#rowcount1').val($('#dynamic-table1 tr').length - 1);
	var count = $('#rowcount1').val();
	

	if(count >= cnt)
		{ 		
			 document.getElementById("dynamic-table1").deleteRow(count);
	 			
			
		}
	
	
}

function AddRow()           
{
	$('#dynamic-table1 tr').last().after('<tr>'
			+'<td ><center>'+($('#dynamic-table1 tr').length)+'<input type="hidden" id="gift_id'+$('#dynamic-table1 tr').length+'" name="gift_id"></center></td>'
			+'<td ><select class="form-control mb-md" name="gift_group" id="gift_group'+$('#dynamic-table1 tr').length+'" class="col-xs-12 col-sm-4" required><option value="">--Select--</option></select></td>'
			+'<td ><select class="form-control mb-md" name="gift_name" id="gift_name'+$('#dynamic-table1 tr').length+'" class="col-xs-12 col-sm-4" required><option value="">--Select--</option></select></td>'
			+'<td ><input class="form-control" type="text" style="width:100%;" id="gift_code'+$('#dynamic-table1 tr').length+'" value="" name="gift_code" readonly/></td>'
			+'<td ><input class="form-control" type="text" style="width:100%;" id="effective_price'+$('#dynamic-table1 tr').length+'" value="" name="effective_price" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" readonly/></td>'
			+'</tr>');

$('#rowcount1').val($('#dynamic-table1 tr').length-1);

var count = $('#rowcount1').val();
  
	$.ajax({
	    url: '${pageContext.request.contextPath}/loadschemegroup1',	
	    data:({datavalue :'GIFT_GROUP'}),
	    success: function(data) {				        	
	    	var select = $('#gift_group'+count);
	    	select.find('option').remove();
	    	
	    	$('<option>').val("").text("--Select--").appendTo(select);
	           	  $.each(data, function(index, value) {		        	
	    	  $('<option>').val(value).text(value).appendTo(select);
	    	});	
	    }
	  });
	
	$('#gift_group'+count).change(function(){	
		var datavalue =$('#gift_group'+count).val();
	$.ajax({
	    url: '${pageContext.request.contextPath}/getschemegroup1',	
	    data:({groupname :datavalue}),
	    success: function(data) {				        	
	    	var select = $('#gift_name'+count);
	    	select.find('option').remove();
	    	
	    	$('<option>').val("").text("--Select--").appendTo(select);
	           	  $.each(data, function(index, value) {		        	
	    	  $('<option>').val(value.gift_id).text(value.gift_name).appendTo(select);
	    	});
	
	    }
	  });
	$('#gift_code'+count).val("");
    $('#effective_price'+count).val("");
	 });
	
	 $('#gift_name'+count).change(function(){
	        var datavalue =$('#gift_name'+count).val();
	    $.ajax({
	        url: '${pageContext.request.contextPath}/getgiftcode',
	        data:({groupname :datavalue}),
	        success: function(data) {
	        	$('#gift_code'+count).val(data.gift_code);
	            $('#effective_price'+count).val(data.effective_price);
	        }
	      });
	     });
}

		
// 		$('.fetchgrpid').mousedown(function(){
// 			var count = $('.fetchgrpid').index(this)+1;
// 			var gift_group =$('#gift_group'+count).val();
// 		$.ajax({
// 		    url: '${pageContext.request.contextPath}/loadschemegroup1',	
// 		    data:({datavalue :'GIFT_GROUP'}),
// 		    success: function(data) {				        	
// 		    	var select = $('#gift_group'+count);
// 		    	select.find('option').remove();
		    	
// 		    	$('<option>').val("").text("--Select--").appendTo(select);
// 		           	  $.each(data, function(index, value) {	
// // 		           		  if(gift_group == value) {
// // 		    	  $('<option selected>').val(value).text(value).appendTo(select);
// // 		           		  }
// // 		           		  else {
// 		           			$('<option>').val(value).text(value).appendTo(select);
// // 		           		  }
// 		    	});
		
// 		    }
// 		  });
// 		});
		
		$('.fetchgrpid').change(function(){	
			
			var count = $('.fetchgrpid').index(this)+1;
			var datavalue =$('#gift_group'+count).val();
		$.ajax({
		    url: '${pageContext.request.contextPath}/getschemegroup1',	
		    data:({groupname :datavalue}),
		    success: function(data) {				        	
		    	var select = $('#gift_name'+count);
		    	select.find('option').remove();
		    	
		    	$('<option>').val("").text("--Select--").appendTo(select);
		           	  $.each(data, function(index, value) {		        	
		    	  $('<option>').val(value.gift_id).text(value.gift_name).appendTo(select);
		    	});
		    }
		  });
		$('#gift_code'+count).val("");
	    $('#effective_price'+count).val("");
		 });	
		
		
$('.fetchcode').change(function(){	
			
			var count = $('.fetchcode').index(this)+1;
			 var datavalue =$('#gift_name'+count).val();
			    $.ajax({
			        url: '${pageContext.request.contextPath}/getgiftcode',
			        data:({groupname :datavalue}),
			        success: function(data) {
			        	$('#gift_code'+count).val(data.gift_code);
			            $('#effective_price'+count).val(data.effective_price);
			        }
			      });
		 });	

// 		$('.fetchgrpid1').mousedown(function(){
// 			var count = $('.fetchgrpid1').index(this)+1;
// 			 $.ajax({
// 			        url: '${pageContext.request.contextPath}/loadproductcode',     
// 			        success: function(data) {

// 			            var select = $('#sch_product_id'+count);
// 			            select.find('option').remove();

// 					$('<option>').val("").text("--Select--").appendTo(select);
// 			                     $.each(data, function(index, value) {
// 					$('<option>').val(value.sch_product_code).text(value.sch_product_code).appendTo(select);
// 			            });

// 			        }
// 			      });   
// 		});
		
</script>

<!----------------------------------------------------------script for show all documnts---------------------------------------------------------------- -->

<script type="text/javascript">

     function show_all_doc()

     {
       var aa=$('#show').val();

       var s_id=document.getElementById("scheme_id").value;

        // window.location.href="show_doc";

       window.open("show_doc?scheme_id="+s_id,"Ratting","width=750,height=550,left=250,top=200,toolbar=0,status=0,");

     }
     
      function Log1()

     {
       var aa=$('#log').val();
 
       var s_id=document.getElementById("scheme_id").value;
       console.log("HII");
      

        // window.location.href="show_doc";

       window.open("show_log?scheme_id="+s_id,"Ratting","width=750,height=550,left=250,top=200,toolbar=0,status=0");

     }

</script>


<!----------------------------------------------------------script for show all logs---------------------------------------------------------------- -->

<script type="text/javascript">

     function log1()

     {
       var aa=$('#log').val();
 
       var s_id=document.getElementById("scheme_id").value;
      

        // window.location.href="show_doc";

       window.open("show_log?scheme_id="+s_id,"Ratting","width=750,height=550,left=250,top=200,toolbar=0,status=0");

     }
     
</script>



