<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
   // $( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' }).val();
  } );
  
  $( function() {
	//    $( "#datepicker1" ).datepicker({ dateFormat: 'dd-mm-yy' }).val();
	  } );
  </script>

<!-- <section role="main" class="content-body">
	<header class="page-header">
		<h2>Reward Processing</h2>

		<div class="right-wrapper pull-right">
			<ol class="breadcrumbs">
				<li><a href=""> <i class="fa fa-home"></i>
				</a></li>
				<li><span>Report</span></li>
				<li><span>MIS Report</span></li>
			</ol>

			<a class="sidebar-right-toggle" data-open="sidebar-right">
				</a>
		</div>
	</header>
 -->



<form class="form-horizontal form-bordered"
	action="generateRewardAnalysisReport" method="post" id="Saveform">
	 <!-- Page-header start -->
                                <div class="page-header" style="background-color: #027BC6;line-height: 2em;">
                                    <div class="row align-items-end">
                                        <div class="col-lg-8">
                                            <div class="page-header-title">
                                                <div class="d-inline" style="padding-left: 1em;">
                                                    <h4 style="color: white;">MIS Report</h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="page-header-breadcrumb" style="padding-right: 1em;">
                                                <ul class="breadcrumb-title">
                                                    <li class="breadcrumb-item">
                                                        <a href=""> <i class="feather icon-home"></i> </a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!">Report</a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!">MIS Report</a>
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
					<label class="control-label">ML Group</label> <select
						class="form-control input-sm mb-md populate" data-plugin-selectTwo
						name="ML_Group" id="ML_Group" required="required">
						<option>--Select--</option>
					</select>
				</div>

				<div class="col-md-4">
					<label class="control-label">From Date</label> <input
						class="form-control" required placeholder="From Date" type="text"
						id="datepicker" onblur="changedateformat1()">
				</div>

				<div class="col-md-4">
					<label class="control-label">To Date</label> <input
						class="form-control" required placeholder="To Date" type="text"
						id="datepicker1" onblur="changedateformat2()">
				</div>
			</div>
		</div>
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

	<div class="flow-group row">
		<div class="col-md-4"></div>
			<div class="col-md-6">
			<button class="btn btn-primary btn-sm" id="action4" value="Show Report"
				onclick="searchinfo()">Show Report</button>
			<button class="btn btn-primary btn-sm" id="action5" value="Download Report"
				onclick="downloadreport()">Download Report</button>
		</div>
	</div>
<div class="form-group row"></div>
	<!-- start: page -->
	<div class="card">
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
					<th class="text-center" style="min-width: 100px;">LY VOL</th>
					<th class="text-center" style="min-width: 100px;">TY VOL</th>
					<th class="text-center" style="min-width: 100px;">VOL GR%</th>
					<th class="text-center" style="min-width: 100px;">LY VAL</th>
					<th class="text-center" style="min-width: 100px;">TY VAL</th>
					<th class="text-center" style="min-width: 100px;">VAL GR%</th>
					<th class="text-center" style="min-width: 200px;">TOTAL SCHEME OUTFLOW</th>
					<th class="text-center" style="min-width: 100px;">Details</th>
				</tr>
			</thead>
			<tbody>
				<%
							int j = 1;
						%>
				<c:forEach var="info" items="${Info_grid4}" varStatus="status">
					<tr>

						<td class="text-center" ><fmt:formatNumber value="${info.ly_vol}"
								pattern="###0.00" /></td>
						<td class="text-center" ><fmt:formatNumber value="${info.ty_vol}"
								pattern="###0.00" /></td>
						<td class="text-center" >${info.vol_gr}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.ly_val}"
								pattern="###0.00" /></td>
						<td class="text-center" ><fmt:formatNumber value="${info.ty_val}"
								pattern="###0.00" /></td>
						<td class="text-center" >${info.val_gr}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.total_scheme_outflow}"
								pattern="###0.00" /></td>
						<td style="min-width: 100px; font-size: 13px !important;"><input
							type="button" class="btn btn-primary  center"
							onclick="CheckUserStatusGrid()" id="details"
							style="margin-left: 12%" value="Details"></td>

					</tr>
					<%
								j = j + 1;
							%>
				</c:forEach>
			</tbody>
		</table>

		<div class="wizard-actions">
			<input type="hidden" name="action" id="action" value="">
		</div>

	</div>
</div>
	<div class="card">
		<div class="card-header">
			<h5>Club Outflow Details</h5>
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
			id="datatable-editable2"
			data-url="assets/ajax/ajax-datatables-sample.json">
			<thead>
				<tr>
					<th class="text-center" style="min-width: 100px;">CUST CLUB</th>
					<th class="text-center" style="min-width: 100px;">LY VOL</th>
					<th class="text-center" style="min-width: 100px;">TY VOL</th>
					<th class="text-center" style="min-width: 100px;">VOL GR%</th>
					<th class="text-center" style="min-width: 100px;">LY VAL</th>
					<th class="text-center" style="min-width: 100px;">TY VAL</th>
					<th class="text-center" style="min-width: 100px;">VAL GR%</th>
					<th class="text-center" style="min-width: 200px;">TOTAL SCHEME OUTFLOW</th>
				</tr>
			</thead>
			<tbody>
				<%
							int j1 = 1;
						%>
				<c:forEach var="info" items="${Info_grid3}" varStatus="status">
					<tr>
						<td class="text-center" >${info.cust_club}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.ly_vol}"
								pattern="###0.00" /></td>
						<td class="text-center" ><fmt:formatNumber value="${info.ty_vol}"
								pattern="###0.00" /></td>
						<td class="text-center" >${info.vol_gr}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.ly_val}"
								pattern="###0.00" /></td>
						<td class="text-center" ><fmt:formatNumber value="${info.ty_val}"
								pattern="###0.00" /></td>
						<td class="text-center" >${info.val_gr}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.total_scheme_outflow}"
								pattern="###0.00" /></td>
					</tr>
					<%
								j1 = j1 + 1;
							%>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	<div class="card">
		<div class="card-header">
			<h5>Region Outflow Details</h5>
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
			id="datatable-editable3"
			data-url="assets/ajax/ajax-datatables-sample.json">
			<thead>
				<tr>
					<th class="text-center" style="min-width: 100px;">REGN</th>
					<th class="text-center" style="min-width: 100px;">CUST CLUB</th>
					<th class="text-center" style="min-width: 100px;">LY VOL</th>
					<th class="text-center" style="min-width: 100px;">TY VOL</th>
					<th class="text-center" style="min-width: 100px;">VOL GR%</th>
					<th class="text-center" style="min-width: 100px;">LY VAL</th>
					<th class="text-center" style="min-width: 100px;">TY VAL</th>
					<th class="text-center" style="min-width: 100px;">VAL GR%</th>
					<th class="text-center" style="min-width: 200px;">TOTAL SCHEME OUTFLOW</th>
				</tr>
			</thead>
			<tbody>
				<%
							int j2 = 1;
						%>
				<c:forEach var="info" items="${Info_grid2}" varStatus="status">
					<tr>
						<td class="text-center" >${info.regn}</td>
						<td class="text-center" >${info.cust_club}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.ly_vol}"
								pattern="###0.00" /></td>
						<td class="text-center" ><fmt:formatNumber value="${info.ty_vol}"
								pattern="###0.00" /></td>
						<td class="text-center" >${info.vol_gr}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.ly_val}"
								pattern="###0.00" /></td>
						<td class="text-center" ><fmt:formatNumber value="${info.ty_val}"
								pattern="###0.00" /></td>
						<td class="text-center" >${info.val_gr}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.total_scheme_outflow}"
								pattern="###0.00" /></td>
					</tr>
					<%
								j2 = j2 + 1;
							%>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>

	<div class="card">
		<div class="card-header">
			<h5>Distributors Outflow Details</h5>
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
			id="datatable-editable4"
			data-url="assets/ajax/ajax-datatables-sample.json">
			<thead>
				<tr>
					<th class="text-center" style="min-width: 100px;">REGN</th>
					<th class="text-center" style="min-width: 100px;">Distributors</th>
					<th class="text-center" style="min-width: 100px;">CUST CLUB</th>
					<th class="text-center" style="min-width: 100px;">LY VOL</th>
					<th class="text-center" style="min-width: 100px;">TY VOL</th>
					<th class="text-center" style="min-width: 100px;">VOL GR%</th>
					<th class="text-center" style="min-width: 100px;">LY VAL</th>
					<th class="text-center" style="min-width: 100px;">TY VAL</th>
					<th class="text-center" style="min-width: 100px;">VAL GR%</th>
					<th class="text-center" style="min-width: 200px;">TOTAL SCHEME OUTFLOW</th>
				</tr>
			</thead>
			<tbody>
				<%
							int j3 = 1;
						%>
				<c:forEach var="info" items="${Info_grid1}" varStatus="status">
					<tr>
						<td class="text-center" >${info.regn}</td>
						<td class="text-center" >${info.depot}</td>
						<td class="text-center" >${info.cust_club}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.ly_vol}"
								pattern="###0.00" /></td>
						<td class="text-center" ><fmt:formatNumber value="${info.ty_vol}"
								pattern="###0.00" /></td>
						<td class="text-center" >${info.vol_gr}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.ly_val}"
								pattern="###0.00" /></td>
						<td class="text-center" ><fmt:formatNumber value="${info.ty_val}"
								pattern="###0.00" /></td>
						<td class="text-center" >${info.val_gr}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.total_scheme_outflow}"
								pattern="###0.00" /></td>
					</tr>
					<%
								j3 = j3 + 1;
							%>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
	<div class="card">
		<div class="card-header">
			<h5>Customer Outflow Details</h5>
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
			id="datatable-editable5"
			data-url="assets/ajax/ajax-datatables-sample.json">
			<thead>
				<tr>
					<th class="text-center" style="min-width: 100px;">REGN</th>
					<th class="text-center" style="min-width: 100px;">Distributors</th>
					<th class="text-center" style="min-width: 100px;">CUST CODE</th>
					<th class="text-center" style="min-width: 100px;">CUST NAME</th>
					<th class="text-center" style="min-width: 100px;">CUST CLUB</th>
					<th class="text-center" style="min-width: 100px;">LY VOL</th>
					<th class="text-center" style="min-width: 100px;">TY VOL</th>
					<th class="text-center" style="min-width: 100px;">VOL GR%</th>
					<th class="text-center" style="min-width: 100px;">LY VAL</th>
					<th class="text-center" style="min-width: 100px;">TY VAL</th>
					<th class="text-center" style="min-width: 100px;">VAL GR%</th>
					<th class="text-center" style="min-width: 200px;">TOTAL SCHEME OUTFLOW</th>
				</tr>
			</thead>
			<tbody>
				<%
							int j4 = 1;
						%>
				<c:forEach var="info" items="${Info_grid}" varStatus="status">
					<tr>
						<td class="text-center" >${info.regn}</td>
						<td class="text-center" >${info.depot}</td>
						<td class="text-center" >${info.cust_code}</td>
						<td class="text-center" >${info.cust_name}</td>
						<td class="text-center" >${info.cust_club}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.ly_vol}"
								pattern="###0.00" /></td>
						<td class="text-center" ><fmt:formatNumber value="${info.ty_vol}"
								pattern="###0.00" /></td>
						<td class="text-center" >${info.vol_gr}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.ly_val}"
								pattern="###0.00" /></td>
						<td class="text-center" ><fmt:formatNumber value="${info.ty_val}"
								pattern="###0.00" /></td>
						<td class="text-center" >${info.val_gr}</td>
						<td class="text-center" ><fmt:formatNumber value="${info.total_scheme_outflow}"
								pattern="###0.00" /></td>
					</tr>
					<%
								j4 = j4 + 1;
							%>
				</c:forEach>
			</tbody>
		</table>
	</div></div>
</form>
<!-- end: page -->
</section>

<script src="resources/newportal/vendor/jquery/jquery.js"></script>

<script>
		$(document).ready(function() {
			$('#datatable-editable').DataTable({
		        fixedHeader: true
		    });
			$('.col-xs-12.col-sm-12').css({
				'overflow-x' : 'auto'
			});
		});
		
		$(document).ready(function() {
			$('#datatable-editable2').DataTable({
		        fixedHeader: true
		    });
			$('.col-xs-12.col-sm-12').css({
				'overflow-x' : 'auto!important'
			});
		});
		
		$(document).ready(function() {
			$('#datatable-editable3').DataTable({
		        fixedHeader: true
		    });
			$('.col-xs-12.col-sm-12').css({
				'overflow-x' : 'auto'
			});
		});
		
		$(document).ready(function() {
			$('#datatable-editable4').DataTable({
		        fixedHeader: true
		    });
			$('.col-xs-12.col-sm-12').css({
				'overflow-x' : 'auto'
			});
		});
		
		$(document).ready(function() {
			$('#datatable-editable5').DataTable({
		        fixedHeader: true
		    });
			$('.col-xs-12.col-sm-12').css({
				'overflow-x' : 'auto'
			});
		});
</script>


<script>

function downloadreport()
{
	var ml_group=document.getElementById("ML_Group").value;	
	var from_date=document.getElementById("datepicker").value;
	var to_date=document.getElementById("datepicker1").value;
	if(ml_group == "" && from_date == "" && to_date == ""){
		alert("Please select ML Group and dates");
	}else{
		
		window.location.href="downloadMISReportSP?ml_group="+ml_group+"&from_date="+from_date+"&to_date="+to_date;
	}	
}

function searchinfo()
{
	var ml_group=document.getElementById("ML_Group").value;	
	var from_date=document.getElementById("datepicker").value;
	var to_date=document.getElementById("datepicker1").value;
	if(ml_group == "" && from_date == "" && to_date == ""){
		alert("Please select ML Group and dates");
	}else{

		window.location.href="MISReportSP?ml_group="+ml_group+"&from_date="+from_date+"&to_date="+to_date;
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

function checkstart()
{
	
	var start_date=$('#start_date').val();
	 var end_date=$('#end_date').val();
	
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

function changedateformat1(){
	var from_date=document.getElementById("datepicker").value;
	
	var mm = from_date.substring(0,2);
	var dd = from_date.substring(3,5);
	var yy = from_date.substring(6,10);
	
	document.getElementById("datepicker").value = dd+"-"+mm+"-"+yy;
}

function changedateformat2(){
	var to_date=document.getElementById("datepicker1").value;
	
	var mm = to_date.substring(0,2);
	var dd = to_date.substring(3,5);
	var yy = to_date.substring(6,10);
	
	document.getElementById("datepicker1").value = dd+"-"+mm+"-"+yy;
}

function CheckUserStatusGrid()
{
	var ml_group=document.getElementById("ML_Group").value;	
	var from_date=document.getElementById("datepicker").value;
	var to_date=document.getElementById("datepicker1").value;
	if(ml_group == "" && from_date == "" && to_date == ""){
		alert("Please select ML Group and dates");
	}else{

		var x = screen.availWidth-20;
		var y = screen.availHeight-40;

		window.open("MISReportDetailsSP?ml_group="+ml_group+"&from_date="+from_date+"&to_date="+to_date,"Ratting","width="+x+",height="+y+",left=0,top=0,toolbar=0,status=0,");

		//window.location.href="MISReportDetails?ml_group="+ml_group+"&from_date="+from_date+"&to_date="+to_date;
	}
}

</script>

<script>
				$(window).load(function(){
			
				
					 
						$.ajax({
// 						    url: '${pageContext.request.contextPath}/getschemename4',
						    url: '${pageContext.request.contextPath}/getMLGroup',
						    success: function(data) {				        	
						    	var select = $('#ML_Group');
						    	select.find('option').remove();
						    	$('<option>').val("").text("--Select--").appendTo(select);
						           	  $.each(data, function(index, value) {
						           		if(value.ml == "${ML_Group}"){
						    	  			$('<option selected>').val(value.ml).text(value.ml).appendTo(select);
						           		  }else{
						           			$('<option>').val(value.ml).text(value.ml).appendTo(select);
						           		  }
						    	});
						
						    }
						  });
					 	document.getElementById("datepicker").value = "${datepicker}";
					 	document.getElementById("datepicker1").value = "${datepicker1}";
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

