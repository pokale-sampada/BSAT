<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="<c:url value='/resources/assets/js/bootstrap-multiselect.min.js'/>"
	type="text/javascript"></script>
<script src="<c:url value='/resources/assets/js/select2.min.js'/>"
	type="text/javascript"></script>
<script
	src="<c:url value='/resources/assets/js/jquery.bootstrap-duallistbox.min.js'/>"
	type="text/javascript"></script>
<script>
<!-- Page-header start -->
<div class="page-header"
	style="background-color: #027BC6; line-height: 2em;">
	<div class="row align-items-end">
		<div class="col-lg-8">
			<div class="page-header-title">
				<div class="d-inline" style="padding-left: 1em;">
					<h4 style="color: white;">New User Registration</h4>

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
					<li class="breadcrumb-item"><a href="#!">User Registration</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- Page-header end -->
<form id="Regi" action="NewRegistration" class="form-horizontal"
	method="post">
	<div class="card">
		<div class="card-header">
			<h5>User Credentials</h5>
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
					<label class="block">User Name<span class="required">*</span></label>
					<input type="text" name="user_name" id="user_name"
						pattern="[A-Z,a-z,0-9]{1,25}"
						title="only number, uppercase and lowercase letters allowed"
						class="form-control form-control-sm form-control-primary"
						placeholder="eg.: John Doe" required />
				</div>
				<div class="col-md-3">
					<label class="block">Password <span class="required">*</span></label>
					<input type="Password" name="password" id="password1"
						pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}"
						title="Must contain at least one number, one symbol and one uppercase and lowercase letter, and at least 8 or more characters"
						class="form-control form-control-sm form-control-primary"
						placeholder="eg.: John Doe" required />
				</div>
				<div class="col-md-3">
					<label class="block">Confirm Password <span
						class="required">*</span></label> <input type="Password" name="password1"
						id="password2" onblur="CheckPassword()"
						pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}"
						title="Must contain at least one number, one symbol and one uppercase and lowercase letter, and at least 8 or more characters"
						class="form-control form-control-sm form-control-primary"
						placeholder="eg.: John Doe" required />
				</div>

				<div class="col-md-3">
					<label class="block" for="inputSuccess">Menu Group</label> <select
						data-plugin-selectTwo
						class="form-control form-control-sm form-control-primary populate placeholder"
						name="menu_group_id" id="menu_group_id"
						data-plugin-options='{ "placeholder": "Select a State", "allowClear": true }'
						required>
						<option>--Select--</option>
					</select>
				</div>
				
			</div>
			<div class="form-group row">
				<div class="col-md-3">
					<label class="block" for="inputSuccess">User Profile <span
						class="required">*</span>
					</label> <select data-plugin-selectTwo
						class="form-control form-control-sm form-control-primary populate placeholder"
						name="profile_id" id="profile_id"
						data-plugin-options='{ "placeholder": "Select a State", "allowClear": true }'>
						<option>--Select--</option>
					</select>

				</div>

                <input type="hidden" id="user_type" name="user_type">
                
                
				<div class="col-md-3" id="activeDiretory">
					<label class="block" for="inputSuccess">Link Active
						Directory</label> <select data-plugin-selectTwo
						class="form-control form-control-sm form-control-primary populate placeholder"
						name="active_directory_id" id="active_directory_id" array="ADList"
						data-plugin-options='{ "placeholder": "Select a State", "allowClear": true }'>
						<option value="">--Select--</option>
						<c:forEach var="adID" items="${ADList}">
							<option value="${adID.ad_id}">
								<c:out value="${adID.ad_id}" />
							</option>
						</c:forEach>

					</select>
				</div>
				<div class="col-md-4">
					<label class="block">User Status</label> <input
						class="form-control form-control-sm form-control-primary"
						id="active" type="hidden" name="active" />
					<div class="form-check form-switch">
						<input type="checkbox" name="user_status" id="user_status"
							class="js-primary" data-switchery="true"
							onchange="CheckUserStatus()" />
					</div>
				</div>
			</div>
			<br><br>
			------------------
			
			NewUserRegistration
			
			
			<table>
							<tr>
								<td><label
									class="col-sm-6 control-label no-padding-top blue"
									style="margin-left: 30%; margin-bottom: 5%; margin-top: -5%"
									for="duallist"> Available Menu </label></td>
								<td><label
									class="col-sm-6 control-label no-padding-top blue"
									style="margin-left: 100%; margin-bottom: 5%; margin-top: -5%"
									for="duallist"> Selected Menu </label></td>
								<td></td>
							</tr>
						</table>
						<div class="col-sm-12">
							<select multiple="multiple" size="10" class="dual1"
								name="appl_menu_multiple_select" id="appl_menu_multiple_select">

							</select>
						</div>
			
			-------------
			<div id="deporegion" class="form-group row">
				<div class="col-md-4">
					<label class="block">Region<span class="required">*</span></label>
					<input type="text" name="region_code" id="region_code"
						class="form-control form-control-sm form-control-primary" />
				</div>
				<div class="col-md-4">
					<label class="block">Distributors Code<span
						class="required">*</span></label> <input type="text" name="depot_code"
						id="depot_code"
						class="form-control form-control-sm form-control-primary" />
				</div>
				<div class="col-md-4">
					<label class="block">Territory Code<span class="required">*</span></label>
					<input type="text" name="terr_code" id="terr_code"
						class="form-control form-control-sm form-control-primary" />
				</div>

			</div>

			<div id="marketingsuper" class="form-group row">
				<div class="col-md-6">
					<label class="block">Marketing Supervisor <span
						class="required">*</span></label> <input type="text" name="supervisor_id"
						id="supervisor_id"
						class="form-control form-control-sm form-control-primary" />
				</div>
				<div class="col-md-6">
					<label class="block">Territory Code<span class="required">*</span></label>
					<input type="text" name="pmg_ml_group" id="pmg_ml_group"
						class="form-control form-control-sm form-control-primary" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-md-6" id="start">
					<spring:bind path="lookup.active_start_date">
						<label class="block">Start Date <span class="required">*</span></label>
						<div class="input-group input-append date">

							<input type="text"
								class="form-control form-control-sm form-control-primary datePicker"
								id="start_date" data-plugin-datepicker name="start_date"
								data-date-format="dd-mm-yyyy" onchange="checkattend()" /> <span
								class="input-group-addon"> <i class="fa fa-calendar"></i>
							</span>
						</div>
					</spring:bind>
				</div>

				<div class="col-md-6" id="end">
					<spring:bind path="lookup.active_end_date">
						<label class="block"> End Date <span class="required">*</span></label>
						<div class="input-group input-append date" id="datePicker1">

							<input type="text"
								class="form-control form-control-sm form-control-primary"
								id="end_date" data-plugin-datepicker name="end_date"
								data-date-format="dd-mm-yyyy" readonly /> <span
								class="input-group-addon"> <i class="fa fa-calendar"></i>
							</span>
						</div>
					</spring:bind>
				</div>
			</div>
		</div>
	</div>
	<div class="card">
		<div class="card-header">
			<h5>User Personal Information</h5>
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
				<input name="user_id" id="user_id" type="hidden" />
				<div class="col-md-4">
					<label class="block">First Name<span class="required">*</span></label>
					<input type="text" name="first_name" id="first_name"
						class="form-control form-control-sm form-control-primary"
						placeholder="eg.: John" required />

				</div>

				<div class="col-md-4">
					<label class="block">Middle Name</label> <input type="text"
						name="middle_name" id="middle_name"
						class="form-control form-control-sm form-control-primary"
						placeholder="eg.: Mike" />

				</div>

				<div class="col-md-4">
					<label class="block">Last Name</label> <input type="text"
						name="last_name" id="last_name"
						class="form-control form-control-sm form-control-primary"
						placeholder="eg.: Doe" />

				</div>

			</div>
			<div class="form-group row">
				<div class="col-md-4">
					<label class="block">Contact Number</label> <input type="text"
						name="contact_number" id="contact_number"
						class="form-control form-control-sm form-control-primary"
						placeholder="eg.: 123" />

				</div>
				<div class="col-md-4">
					<label class="block">E-mail Address<span class="required">*</span></label>
					<input type="text" name="email_address" id="email_address"
						onblur="validateEmail(this);"
						class="form-control form-control-sm form-control-primary"
						placeholder="eg.: JohnDoe@ABC" required />

				</div>
				<div class="col-md-4"></div>

			</div>
		</div>
	</div>
	<footer class="panel-footer">
		<div class="row" style="text-align: center">
			<div class="col-md-12">
				<button type="submit" class="btn btn-sm btn-primary"
					onclick="return confirmValidate()">Submit</button>
				<button type="reset" class="btn btn-sm btn-default">Reset</button>
			</div>
		</div>
	</footer>
</form>
<%-- <section role="main" class="content-body">
	<header class="page-header">
		<!-- <h2>Create Scheme</h2> -->
		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li><a href="admin"> <i class="fa fa-home"></i>
				</a></li>
				<li><span>Setups</span></li>
				<li><span>User Registration</span></li>
				<!-- <li><span>Create Scheme</span></li> -->
			</ol>

			<a class="sidebar-right-toggle" data-open="sidebar-right"></a>
		</div>
	</header>

	<!-- start: page -->
	<div class="row">
		<div class="col-md-12">
			<form id="Regi" action="NewRegistration" class="form-horizontal"
				method="post">
				<div class="form-group">
				<input type="hidden" name="test" id="test" value="" /> <input
					name="user_id" id="user_id" type="hidden" />
				<section class="panel">
					<header class="panel-heading">
						<div class="panel-actions">
							<a href="#"></a>
							<!-- <a href="#"
								class="fa fa-times"></a> -->
						</div>

						<h2 class="panel-title">User Credentials</h2>
						<input type="hidden" name="test" id="test" value="" /> <input
							name="user_id" id="user_id" type="hidden" />
					</header>
					<div class="panel-body">
						<div class="form-group">

							<div class="col-md-4">
								<label class="block">User Name<span
									class="required">*</span></label> <input type="text" name="user_name"
									id="user_name" pattern="[A-Z,a-z,0-9]{1,25}"
									title="only number, uppercase and lowercase letters allowed"
									class="form-control form-control-sm form-control-primary" placeholder="eg.: John Doe" required />
							</div>
							<div class="col-md-4">
								<label class="block">Password <span
									class="required">*</span></label> <input type="Password"
									name="password" id="password1"
									pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}"
									title="Must contain at least one number, one symbol and one uppercase and lowercase letter, and at least 8 or more characters"
									class="form-control form-control-sm form-control-primary" placeholder="eg.: John Doe" required />
							</div>
							<div class="col-md-4">
								<label class="block">Confirm Password <span class="required">*</span></label> <input type="Password"
									name="password1" id="password2" onblur="CheckPassword()"
									pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}"
									title="Must contain at least one number, one symbol and one uppercase and lowercase letter, and at least 8 or more characters"
									class="form-control form-control-sm form-control-primary" placeholder="eg.: John Doe" required />
							</div>

							<div class="col-md-4">
								<label class="block" for="inputSuccess">Menu
									Group</label> <select data-plugin-selectTwo
									class="form-control form-control-sm form-control-primary populate placeholder" name="menu_group_id"
									id="menu_group_id"
									data-plugin-options='{ "placeholder": "Select a State", "allowClear": true }'
									required>
									<option>--Select--</option>
								</select>
							</div>

							<div class="col-md-4">
								<label class="block" for="inputSuccess">User
									Profile <span class="required">*</span>
								</label> <select data-plugin-selectTwo
									class="form-control form-control-sm form-control-primary populate placeholder" name="profile_id"
									id="profile_id"
									data-plugin-options='{ "placeholder": "Select a State", "allowClear": true }'>
									<option>--Select--</option>
								</select>

							</div>

							<div class="col-md-4" id="activeDiretory">
								<label class="block" for="inputSuccess">Link
									Active Directory</label> <select data-plugin-selectTwo
									class="form-control form-control-sm form-control-primary populate placeholder"
									name="active_directory_id" id="active_directory_id"
									array="ADList"
									data-plugin-options='{ "placeholder": "Select a State", "allowClear": true }'>
									<option value="">--Select--</option>
									<c:forEach var="adID" items="${ADList}">
										<option value="${adID.ad_id}">
											<c:out value="${adID.ad_id}" />
										</option>
									</c:forEach>

								</select>
							</div>
							<div id="deporegion" class="col-md-12">
								<div class="col-md-4">
									<label class="block">Region<span
										class="required">*</span></label> <input type="text"
										name="region_code" id="region_code" class="form-control form-control-sm form-control-primary" />
								</div>
								<div class="col-md-4">
									<label class="block">Distributors Code<span
										class="required">*</span></label> <input type="text" name="depot_code"
										id="depot_code" class="form-control form-control-sm form-control-primary" />
								</div>
								<div class="col-md-4">
									<label class="block">Territory Code<span
										class="required">*</span></label> <input type="text" name="terr_code"
										id="terr_code" class="form-control form-control-sm form-control-primary" />
								</div>

							</div>

							<div id="marketingsuper" class="col-md-12">
								 <div class="col-md-6">
									<label class="block">Marketing Supervisor <span
										class="required">*</span></label> <input type="text" name="supervisor_id"
										id="supervisor_id" class="form-control form-control-sm form-control-primary" />
								</div>
								<div class="col-md-6">
									<label class="block">Territory Code<span
										class="required">*</span></label> <input type="text" name="pmg_ml_group"
										id="pmg_ml_group" class="form-control form-control-sm form-control-primary" />
								</div>		
							</div>
							

								<div class="col-md-12" >
									<div class="col-md-6" id="start">
										<spring:bind path="lookup.active_start_date">
											<label class="block">Start Date <span
												class="required">*</span></label>
											<div class="input-group input-append date">

												<input type="text" class="form-control form-control-sm form-control-primary datePicker"
													id="start_date" data-plugin-datepicker
												
													name="start_date" data-date-format="dd-mm-yyyy"
													onchange="checkattend()" /> <span
													class="input-group-addon"> <i class="fa fa-calendar"></i>
												</span>
											</div>
										</spring:bind>
									 </div>
									
									<div class="col-md-6" id="end">
										<spring:bind path="lookup.active_end_date">
											<label class="block"> End Date <span
												class="required">*</span></label>
											<div class="input-group input-append date" id="datePicker1">

												<input type="text" class="form-control form-control-sm form-control-primary" id="end_date"
													data-plugin-datepicker
													
													name="end_date" data-date-format="dd-mm-yyyy"
													readonly /> <span class="input-group-addon"> <i
													class="fa fa-calendar"></i>
												</span>
											</div>
										</spring:bind>
									 </div> 
								</div>


							<div class="col-md-12">
								<label class="block">User Status</label>
								<input class="form-control form-control-sm form-control-primary" id="active" type="hidden"
								name="active"/>
								<div class="switch switch-primary">
									<input type="checkbox" name="user_status" id="user_status"
										data-plugin-ios-switch onchange="CheckUserStatus()" />
								</div>
							</div>

							

						</div>
					</div>
				</section>
				<section class="panel">
					<header class="panel-heading">
						<div class="panel-actions">
							<a href="#"></a>
						</div>

						<h2 class="panel-title">User Personal Information</h2>
					</header>

					<div class="panel-body">

						

							<div class="col-md-12">
								<div class="col-md-4">
									<label class="block">First Name<span
										class="required">*</span></label> <input type="text" name="first_name"
										id="first_name" class="form-control form-control-sm form-control-primary" placeholder="eg.: John"
										required />

								</div>

								<div class="col-md-4">
									<label class="block">Middle Name</label> <input
										type="text" name="middle_name" id="middle_name"
										class="form-control form-control-sm form-control-primary" placeholder="eg.: Mike" />

								</div>

								<div class="col-md-4">
									<label class="block">Last Name</label> <input
										type="text" name="last_name" id="last_name"
										class="form-control form-control-sm form-control-primary" placeholder="eg.: Doe" />

								</div>
							</div>
							<div class="col-md-12">
								<div class="col-md-4">
									<label class="block">Contact Number</label> <input
										type="text" name="contact_number" id="contact_number"
										class="form-control form-control-sm form-control-primary" placeholder="eg.: 123" />

								</div>

								<div class="col-md-4">
									<label class="block">E-mail Address<span
										class="required">*</span></label> <input type="text"
										name="email_address" id="email_address"
										onblur="validateEmail(this);" class="form-control form-control-sm form-control-primary"
										placeholder="eg.: JohnDoe@ABC" required />

								</div>
								<div class="col-md-4"></div>

							</div>
						</div>
					
				</section>
				<footer class="panel-footer">
					<div class="row" style="text-align: center">
						<div class="col-md-12">
							<button type="submit" class="btn btn-primary"
								onclick="return confirmValidate()">Submit</button>
							<button type="reset" class="btn btn-default">Reset</button>
						</div>
					</div>
				</footer>
</div>
			</form>

			<!-- <div class="wizard-actions">

			<button type="submit" class="btn btn-success center"
				onclick="return confirmValidate()">Register User</button>
					</div>
 -->
		</div>
		<!-- col-md-6 -->
	</div>


</section> --%>
<script src="resources/newportal/vendor/jquery/jquery.js"></script>
<script>
function callMethod()
{
	
	var name1 = $("select#profile_id").val();
	$.ajax({
		url: '${pageContext.request.contextPath}/testmenu',
	 	 data: ({name :name1}),
	     success: function(data) {
	    	 alert("onchange is runninbg");
	   	  var select = $('select[name="appl_menu_multiple_select"]');
	      var multi_select_menu = $('select[name="appl_menu_multiple_select"]').bootstrapDualListbox();
	      var container1 = multi_select_menu.bootstrapDualListbox('getContainer');
	      container1.find('.btn').addClass('btn-white btn-info btn-bold');
	      $.each(data, function(index, value) {
	    	  $('<option>').val(value.menu_header_id).text(value.header_name).appendTo(select);
	      });
	      multi_select_menu.bootstrapDualListbox('refresh',true);
	     
	     }
		});
}
</script>




<script type="text/javascript">
	function confirmValidate() {
		if (document.getElementById("active_directory_id").value == ""
				&& document.getElementById("password1").value == ""
				&& document.getElementById("password2").value == "") {
			alert("Please enter password or select Active Directory ID");
			return false;
		} else if ((document.getElementById("password1").value == "" && document
				.getElementById("password2").value != "")
				|| (document.getElementById("password1").value != "" && document
						.getElementById("password2").value == "")) {
			alert("Password doesn't matched");
			return false;
		} else {
			return true;
		}
	}

	$(window)
			.load(
					function() {
						alert("hii shilpi Running --------")

						$("#deporegion").hide();
						$("#marketingsuper").hide();
						$("#start").hide();
						$("#end").hide();

						$
								.ajax({
									url : '${pageContext.request.contextPath}/loadmenugroupname',

									success : function(data) {
										var select = $('#menu_group_id');
										// alert(select);
										select.find('option').remove();
										$('<option>').val("")
												.text("--select--").appendTo(
														select);
										$.each(data, function(index, value) {
											$('<option>').val(
													value.menu_group_id).text(
													value.group_name).appendTo(
													select);
										});

									}
								});

						$
								.ajax({
									url : '${pageContext.request.contextPath}/loaduserprofile',

									success : function(data) {
										var select = $('#profile_id');
										// alert(select);
										select.find('option').remove();
										$('<option>').val("")
												.text("--select--").appendTo(
														select);
										$.each(data, function(index, value) {
											$('<option>').val(value.profile_id)
													.text(value.profile_name)
													.appendTo(select);
										});

									}
								});

						$
								.ajax({
									url : '${pageContext.request.contextPath}/loadregioncode',
									success : function(data) {

										var select = $('#region_code');
										select.find('option').remove();
										$('<option>').val("")
												.text("--Select--").appendTo(
														select);
										$.each(data, function(index, value) {

											$('<option>').val(value)
													.text(value).appendTo(
															select);

										});

									}
								});

						var selectdepo = $('#depot_code');
						selectdepo.find('option').remove();
						$('<option>').val("").text("--Select--").appendTo(
								selectdepo);

						$
								.ajax({
									url : '${pageContext.request.contextPath}/loadsupervisor',
									success : function(data) {

										var select = $('#supervisor_id');
										select.find('option').remove();
										$('<option>').val("")
												.text("--Select--").appendTo(
														select);
										$.each(data, function(index, value) {

											$('<option>').val(value.user_id)
													.text(value.user_name)
													.appendTo(select);

										});

									}
								});

						var lovtype = "BLINE_TYPE";
						$
								.ajax({
									url : '${pageContext.request.contextPath}/loadbusinessline',
									data : ({
										bline : lovtype
									}),
									success : function(data) {
										var select = $('#pmg_ml_group');
										select.find('option').remove();
										$('<option>').val("")
												.text("--Select--").appendTo(
														select);
										$.each(data, function(index, value) {
											$('<option>').val(value)
													.text(value).appendTo(
															select);
										});

									}
								});

					});

	// 	window.onload=function()
	// 	{

	// 	$("#deporegion").hide();

	// 	}

	$('#profile_id')
			.change(
					function(event) {
						var profile_id = $("select#profile_id").val();
						$("#regn_tsi").hide();
						if (profile_id != "") {

							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadusertype',
										data : ({
											profile_id : profile_id
										}),
										success : function(data) {

											$('#user_type').val(data);

										}
									});
						} else {
							$('#user_type').val("");
						}

						if (profile_id == "2" || profile_id == "5"
								|| profile_id == "1" || profile_id == "12") {

							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadsupervisor',
										success : function(data) {

											var select = $('#supervisor_id');
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
																				value.user_id)
																		.text(
																				value.user_name)
																		.appendTo(
																				select);

															});

										}
									});

							var lovtype = "BLINE_TYPE";
							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadbusinessline',
										data : ({
											bline : lovtype
										}),
										success : function(data) {
											var select = $('#pmg_ml_group');
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
																				value)
																		.text(
																				value)
																		.appendTo(
																				select);
															});

										}
									});

							$("#marketingsuper").hide();

							$("#deporegion").show();

						} else if (profile_id == "6") {

							var selectdepo = $('#depot_code');
							selectdepo.find('option').remove();
							$('<option>').val("").text("--Select--").appendTo(
									selectdepo);

							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadregioncode',
										success : function(data) {

											var select = $('#region_code');
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
																				value)
																		.text(
																				value)
																		.appendTo(
																				select);

															});

										}
									});

							$("#marketingsuper").show();

							$("#deporegion").hide();

						} else {

							var selectdepo = $('#depot_code');
							selectdepo.find('option').remove();
							$('<option>').val("").text("--Select--").appendTo(
									selectdepo);

							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadregioncode',
										success : function(data) {

											var select = $('#region_code');
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
																				value)
																		.text(
																				value)
																		.appendTo(
																				select);

															});

										}
									});

							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadsupervisor',
										success : function(data) {

											var select = $('#supervisor_id');
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
																				value.user_id)
																		.text(
																				value.user_name)
																		.appendTo(
																				select);

															});

										}
									});

							var lovtype = "BLINE_TYPE";
							$
									.ajax({
										url : '${pageContext.request.contextPath}/loadbusinessline',
										data : ({
											bline : lovtype
										}),
										success : function(data) {
											var select = $('#pmg_ml_group');
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
																				value)
																		.text(
																				value)
																		.appendTo(
																				select);
															});

										}
									});

							$("#marketingsuper").hide();
							$("#deporegion").hide();
						}

						if (profile_id == "5") {
							$("#regn_depo").hide();
						}
						if (profile_id == "12") {
							$("#regn_depo").show();
							$("#regn_tsi").show();
						}
					});

	$('#region_code').change(
			function(event) {
				var region_code = $("select#region_code").val();
				$.ajax({
					url : '${pageContext.request.contextPath}/loaddepotcode',
					data : ({
						region_code : region_code
					}),
					success : function(data) {

						var select = $('#depot_code');
						select.find('option').remove();
						$('<option>').val("").text("--Select--").appendTo(
								select);
						$.each(data, function(index, value) {

							$('<option>').val(value.depot_code).text(
									value.depot_name).appendTo(select);

						});

					}
				});

			});

	$('#depot_code').change(
			function(event) {
				var profile_id = $("select#profile_id").val();
				var region_code = $("select#region_code").val();
				var depot_code = $("select#depot_code").val();
				$.ajax({
					url : '${pageContext.request.contextPath}/loadtsicode',
					data : ({
						depot_code : depot_code
					}),
					success : function(data) {

						var select = $('#terr_code');
						select.find('option').remove();
						$('<option>').val("").text("--Select--").appendTo(
								select);
						$.each(data, function(index, value) {

							$('<option>').val(value.terr_code).text(
									value.terr_name).appendTo(select);

						});

					}
				});

			});
	$('#user_name')
			.blur(
					function() {
						var UserName = $('#user_name').val();
						$
								.ajax({
									url : '${pageContext.request.contextPath}/FindUserPresence',
									data : ({
										UserName : UserName
									}),
									success : function(data) {

										var r;

										if (data.name != null) {

											alert("This User Name is already exist, Please give uniqe username")

											// 												if (data.name != null) {
											// 													r = confirm("This User Name is already exist, Do you Want to Update?");
											// 												}
											//alert("This UserName is already present, Do you Want to Update");
											// var r = confirm("This UserName is already present, Do you Want to Update");
											// 												if (r == true) {

											// 													document
											// 															.getElementById("user_name").value = UserName;
											// 													document
											// 															.getElementById("user_id").value = data.user_id;
											// 													document
											// 															.getElementById("password1").value = data.password;
											// 													document
											// 															.getElementById("password2").value = data.password;
											// 													var v = data.userstatus;
											// 													//alert(data.userstatus)
											// 													if (v == 'Y') {
											// 														//document.getElementById("user_status").value=data.password;
											// 														document
											// 																.getElementById("user_status").checked = true;
											// 													} else if (v == 'N') {
											// 														document
											// 																.getElementById("user_status").checked = false;
											// 													}
											// 													//alert(v);
											// 													document
											// 															.getElementById("user_status").value = v;

											// // 													document
											// // 															.getElementById("user_role").value = data.user_role;
											// 													if(data.start_date != null){
											// 													document
											// 															.getElementById("start_date").value = data.start_date;
											// 													}
											// 													if(data.end_date != null){
											// 													document
											// 															.getElementById("end_date").value = data.end_date;
											// 													}
											// 													if(data.first_name != null){
											// 													document
											// 															.getElementById("first_name").value = data.first_name;
											// 													}
											// 													if(data.middle_name != null){
											// 													document
											// 															.getElementById("middle_name").value = data.middle_name;
											// 													}
											// 													if(data.last_name != null){
											// 													document
											// 															.getElementById("last_name").value = data.last_name;
											// 													}
											// 													if(data.contact_number != null){
											// 													document
											// 															.getElementById("contact_number").value = data.contact_number;
											// 													}
											// 													if(data.email_address != null){
											// 													document
											// 															.getElementById("email_address").value = data.email_address;
											// 													}
											// 													if(data.profile_id != 0){
											// 													document
											// 															.getElementById("profile_id").value = data.profile_id;
											// 													}
											// 													if(data.user_type != null){
											// 													document
											// 														.getElementById("user_type").value = data.user_type;
											// 													}

											// 													$('#test').val("Y");

											// 												} else {

											// 													var aa = $('#test')
											// 															.val("N");
											document
													.getElementById("user_name").value = "";
											//alert(aa);
											//alert("User is not Available Please Create new user");
											// 												}

										}

									}
								});
					});
</script>

<script type="text/javascript">
	function CheckPassword() {
		var pass1 = $('#password1').val();
		var pass2 = $('#password2').val();

		if (pass1 == pass2) {
			document.getElementById("password2").style.borderColor = "#C0C0C0";
		} else {
			alert("Password doesn't Not Match ");
			document.getElementById("password2").style.borderColor = "#FF0000";
			document.getElementById("password2").value = "";
		}
	}

	function CheckUserStatus() {

		if (document.getElementById("user_status").checked == true) {
			document.getElementById("active").value = 'Y';

			//	alert(document.getElementById("user_status").value );
		} else if (document.getElementById("user_status").checked == false) {
			document.getElementById("active").value = 'N';
			//	alert(document.getElementById("user_status").value );
		}
	}
</script>
<script>
	$(document).ready(function() {
		//alert("working======== ");		
		var a = document.getElementById("").value;
		alert("======" + a);
		if (document.getElementById("active").value == 'Y') {
			document.getElementById("user_status").checked = true;

			//	alert(document.getElementById("user_status").value );
		} else if (document.getElementById("active").value == 'N') {
			document.getElementById("user_status").checked = false;
			//	alert(document.getElementById("user_status").value );
		}

	});
</script>

<script type="text/javascript" language="javascript">
	function validateEmail(emailField) {
		var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

		if (reg.test(emailField.value) == false) {
			alert('Invalid Email Address');
			document.getElementById("email_address").value = "";
			return false;
		}

		return true;
	}
</script>
<script>
	var a = new Date().getDate();
	var a1 = a.toString();
	var b = new Date().getMonth() + 1;
	var b1 = b.toString();
	var c = new Date().getFullYear();
	var c1 = c.toString();

	var q = "-";
	var d = a1.concat(q);
	var d1 = d.concat(b1);
	var d2 = d1.concat(q);
	var sysdate = d2.concat(c1);

	$('#datePicker').datepicker({
		format : 'dd-mm-yyyy',
		startDate : sysdate,
	// 			endDate : sysdate

	}).on('changeDate', function(e) {
		// Revalidate the date field
		$('#eventForm').formValidation('revalidateField', 'date');
	});

	$('#datePicker1').datepicker({
		format : 'dd-mm-yyyy',
		startDate : sysdate

	}).on('changeDate', function(e) {
		// Revalidate the date field
		$('#eventForm').formValidation('revalidateField', 'date');
	});
</script>
