<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

	<!-- Page-header start -->
	<div class="page-header"
		style="background-color: #027BC6; line-height: 2em;">
		<div class="row align-items-end">
			<div class="col-lg-8">
				<div class="page-header-title">
					<div class="d-inline" style="padding-left: 1em;">
						<h4 style="color: white;">Product Outflow</h4>

					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="page-header-breadcrumb" style="padding-right: 1em;">
					<ul class="breadcrumb-title">
						<li class="breadcrumb-item"><a href="marketing"> <i
								class="feather icon-home"></i>
						</a></li>
						<!--  <li class="breadcrumb-item"><a href="#!">Report</a>
                                                    </li> -->
						<li class="breadcrumb-item"><a href="prdoutcalci">Product
								Outflow</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Page-header end -->

	<div class="card">
		<div class="card-header">
			<h5>Product Outflow Calculator</h5>
			<div class="card-header-right">
				<ul class="list-unstyled card-option">
					<li><i class="feather icon-maximize full-card"></i></li>
					<li><i class="feather icon-minus minimize-card"></i></li>
					<li><i class="feather icon-trash-2 close-card"></i></li>
				</ul>
			</div>
		</div>
		<div class="card-block">
			<input type="hidden" name="scheme_id" id="scheme_id" value="" />

			<!-- <div class="tab-content" style="margin-top: -6%"> -->
			<div id="w4-account" class="tab-pane active">

				<!-- ------------ First Row -----------  -->
				<div class="form-group">
					<label class="block"> Scheme Details<span class="required">*</span>
					</label>
				</div>
				<div class="form-group row">
					<div class="col-md-6">
						Effective Date From
						<br>
						<br>
						<div class="input-group" id="datePicker1">
							<span class="input-group-addon"> <i class="fa fa-calendar"></i>
							</span> <input type=date data-plugin-datepicker class="form-control"
								id="start_date" onblur="changedateformat1()"
								onchange="checkstart()" name="start_date"
								placeholder="Start Date">
						</div>
					</div>
					<div class="col-md-6">
						Effective Date To
						<br>
						<br>
						<div class="input-group" id="datePicker">
							<span class="input-group-addon"> <i class="fa fa-calendar"></i>
							</span> <input type="date" data-plugin-datepicker class="form-control"
								id="end_date" placeholder="End Date" name="end_date" required
								type="text" onchange="changedateformat2(),checkattend()"
								onblur="calredempt()">
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="block"><b>Selected Distributors</b></label>
			</div>
			<div class="form-group row">
				<div class="col-md-4">
					<label class="block  no-padding-right">Region <span
						class="required">*</span>
					</label>
					<div>
						<select multiple style="height: 170px;" name="appl_regn_code"
							id="appl_regn_code" class="form-control form-control-sm "
							required>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<label class="block  no-padding-right">Distributors <span
						class="required">*</span>
					</label>
					<div>
						<select multiple style="height: 170px;" name="depot" id="depot"
							class="form-control form-control-sm " required>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<label class="block">Selected Distributors <i
						class="menu-icon fa red required"> *</i>
					</label>
					<div>
						<select multiple style="height: 170px;" id="sel_depo"
							name="sel_depo" class="form-control form-control-sm ">
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="block"><b>Customer Type </b><span
					class="required">*</span> </label>
			</div>
			<div class="border-checkbox-section">
				<div class="form-group row">
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" name="cust_type"
								value="15" id="checkbox0"> <label class="border-checkbox-label"
								for="checkbox0">Prolinks-Industrial(15)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox1"
								name="cust_type" value="3" checked="checked"> <label
								class="border-checkbox-label" for="checkbox1">Ultratech
								Dealer(3)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox2"
								name="cust_type" value="4"> <label
								class="border-checkbox-label" for="checkbox2">Prolinks
								Dealer(4)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox3"
								name="cust_type" value="5"> <label
								class="border-checkbox-label" for="checkbox3">Dealer(5)</label>
						</div>
					</div>
				</div>
			</div>
			<div class="border-checkbox-section">
				<div class="form-group row">
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" name="cust_type"
								value="54" id="checkbox4" checked="checked"> <label
								class="border-checkbox-label" for="checkbox4">Retail
								Special Dealer(54)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox5"
								name="cust_type" value="55" checked="checked"> <label
								class="border-checkbox-label" for="checkbox5">Retail
								Site Operations(55)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox6"
								name="cust_type" value="56"> <label
								class="border-checkbox-label" for="checkbox6">Non Paint
								Dealer-CC(56)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox7"
								name="cust_type" value="57"> <label
								class="border-checkbox-label" for="checkbox7">PXT
								Dealer(57)</label>
						</div>
					</div>
				</div>
			</div>
			<div class="border-checkbox-section">
				<div class="form-group row">
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" name="cust_type"
								value="58" id="checkbox8"> <label
								class="border-checkbox-label" for="checkbox8">Distributor-Retail(58)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox9"
								name="cust_type" value="53" checked="checked"> <label
								class="border-checkbox-label" for="checkbox9">Wholesaler(53)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox10"
								name="cust_type" value="6"> <label
								class="border-checkbox-label" for="checkbox10">Contractor(6)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox11"
								name="cust_type" value="65" checked="checked"> <label
								class="border-checkbox-label" for="checkbox11">Retail
								Projects Strong(65)</label>
						</div>
					</div>
				</div>
			</div>
			<div class="border-checkbox-section">
				<div class="form-group row">
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox12"
								name="cust_type" value="7" checked="checked"> <label
								class="border-checkbox-label" for="checkbox12">Alternate
								Distribution(7)</label>
						</div>
					</div>
					<div class="col-md-3">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" id="checkbox13"
								name="cust_type" value="1001"> <label
								class="border-checkbox-label" for="checkbox13">Sales</label>
						</div>
					</div>
					<div class="col-md-4">
						<div class="border-checkbox-group border-checkbox-group-primary">
							<input class="border-checkbox" type="checkbox" name="cust_type"
								value="66" id="checkbox14"><label class="border-checkbox-label"
								for="checkbox14">Prolinks Special Dealer(66)</label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="block"><b>Product Outflow Details </b><span
				class="required">*</span> </label>
		</div>
		<div class="form-group">
			<div class="col-md-4">
				<label class="block">Total Product Outflow of Scheme</label> <input
					type="text" name="total_prd_outflow" class="form-control"
					id="total_prd_outflow" value="0" readonly="readonly">
			</div>
		</div>

		<div class="form-group row">

			<div class="col-md-6">
				<div class="table-responsive">
					<input type="hidden" id="rowcount3" name="rowcount3" value="">
					<table class="table table-striped table-bordered nowrap"
						id="dynamic-table3">
						<thead>
							<tr>
								<th style="width: 3%; padding: 8px 4px 8px 4px;">SR.NO</th>
								<th style="width: 11%; padding: 8px 5px 8px 5px;">PRD LINE
									TYPE</th>
								<th style="width: 11%; padding: 8px 15px 8px 15px;">PRODUCT</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-6" style="overflow-x: auto;">
				<div class="table-responsive">
					<table id="dynamic-table4"
						class="table table-striped table-bordered nowrap">
						<thead>
							<tr>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">LLY VOL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">LY VOL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">TGT GWT
									VOL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">PROJ
									VOL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">LLY VAL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">LY VAL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">TGT GWT
									VAL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">PROJ
									VAL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">SPD TGT
									VOL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">SPD TGT
									VAL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">SPD LY
									VOL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">SPD LY
									VAL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">TGT GWT
									SPD</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">SPD TY
									TGT VOL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">SPD TY
									TGT VAL</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">WT AVG</th>
								<th style="width: 11%; padding: 8px 10px 8px 10px;">PRD
									BDGT</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- </div> -->
		<div class="form-group">
			<div class="col-md-6">
				<input type="button" class="btn btn-primary btn-sm" value="Add Row"
					onclick="AddRow2()"> <input type="button"
					class="btn btn-primary btn-sm" value="Delete Row"
					onclick="delRow2()">
			</div>
		</div>
	</div>
	<script>
	$(window).load(function() {

		$('.required').css({
			'color' : 'red'
		});
		
		
		    $.ajax({
         	url: '${pageContext.request.contextPath}/loadDSRregion',
             success: function(data) {
             	var select = $('#appl_regn_code');
                 select.find('option').remove();
					$('<option>').val("").text("--select--").appendTo(select);
           	    $.each(data, function(index, value) {
						$('<option>').val(value).text(value).appendTo(select);
                 });

             }
         });
		
	});
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
	
	
	<script type='text/javascript'>
         $(document).ready(function() {
         
         
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
         
        $(document).on('change','#depot',function(){
        /*  $('#depot').change(function(event) { */
         	
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
    window.onload=function checkbuttons()
    {

        var count=${count};
        //alert("count "+count);
        if(count==20)
            {
            $("#submit1").hide();
            $("#save").hide();
            }else
                {

        $("#submit1").hide();
//         $("#FinancialAnalysis").hide();
                }
    }
    </script>



	<script>
//     function validateobjective()
//     {
//         var len=document.getElementById("objective").value;

//          var n = len.length;

//         if(n<10)
//             {
//             alert("Please enter valid description");
//             $("#objective").css('border', '1px solid red');
//             }else
//                 {
//                 $("#objective").css('border', '1px solid gray');
//                 }
//     }


//     function validateprovision()
//     {
//         var len=document.getElementById("provision_comments").value;

//          var n = len.length;

//         if(n<10)
//             {
//             alert("Please enter valid description");
//             $("#provision_comments").css('border', '1px solid red');
//             }else
//                 {
//                 $("#provision_comments").css('border', '1px solid gray');
//                 }
//     }



    function submitform()
    {
    	
    	
    	
    	var scheme_budget = $('#scheme_budget').val();
    	var fin_analysis_flag = $('#fin_analysis_flag').val();
    	$("form").submit(function(){
    		  if(scheme_budget == "0" && fin_analysis_flag == "N") {
    			  alert('Scheme Provision cannot be 0. Please provide proper value.');
    		     return false;
    		  } 
//     		  else if(calpercent()) {
//     			  return false;
//     		  }
    		  else {
    			  var aa = confirm('Do you want to create this scheme?');

    		         if(aa == true)
    		         {

    			  this.submit();
    	             }
    		         else {

    		             return false;
    	             }

    		  }
    		});
    	
    }

    </script>

	<script type='text/javascript'>
         $(document).ready(function() {
         
         
                    
         
         
            //option A
            $("form").submit(function(e){
            	var scheme_budget = $('#scheme_budget').val();
            	var fin_analysis_flag = $('#fin_analysis_flag').val();
            	var chkdepocode = $('#duallist').val();
            	var atLeastOneIsChecked = $('input:checkbox').is(':checked');
            	var growth = calgrowthpercent();
            	var volchk = calvolpercent();
            	var valchk = calvalpercent();
            	var sprchk = calspreafpercent();
            	$('#rowcount1').val($('#dynamic-table1 tr').length-1);
            	var count1 = $('#rowcount1').val();
            	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
            	var count2 = $('#rowcount2').val();
            	$('#rowcount3').val($('#dynamic-table3 tr').length-1);
            	var count3 = $('#rowcount3').val();
            	
            	
            	if( chkdepocode == null || chkdepocode == ""  )
                    {
            		 alert('Please add at least one depot for scheme.');
          	         e.preventDefault(e);
                    } else
            	if(atLeastOneIsChecked == false) {
            		
          	         alert('Please check at least one customer type.');
          	         e.preventDefault(e);
          	} else
//           		if(count1 < 2) {
//           			alert('Please add atleast one Scheme Reward for Scheme.');
//         	         e.preventDefault(e);
//           		}
            	
//             	else
          		if(growth == false) {
          			alert('Please revisit the growth percentage');
        	         e.preventDefault(e);
          		}
          		else
//               		if(count2 < 2) {
//               			alert('Please add atleast one Product Details for Scheme.');
//             	         e.preventDefault(e);
//               		}
//           		else
              		if(count3 < 2) {
              			alert('Please add atleast one Product Outflow for Scheme.');
            	         e.preventDefault(e);
              		}
            	else
//           		if(volchk == false) {
//           			alert('Average of Volume growth in Line not matching with Overall Volume growth in Header');
//          	         e.preventDefault(e);
//           		}
//           		else
//               		if(valchk == false) {
//               			alert('Average of Value growth in Line not matching with Overall Value growth in Header');
//              	         e.preventDefault(e);
//               		}
//               		else
//                   		if(sprchk == false) {
//                   			alert('Average of Spread in Line not matching with Overall Spread in Header');
//                  	         e.preventDefault(e);
//                   		}else
            	
            	if((scheme_budget == "0" || scheme_budget == "0.00") && fin_analysis_flag == "N") {
            		
            	         alert('Scheme Provision cannot be 0. Please provide proper value.');
            	         e.preventDefault(e);
            	} else 
            		 {
            		
            		var aa = confirm('Do you want to create this scheme?');

                 if(aa == true)
                 {
        // //                 $('#Saveform').submit();
                     }
                 else {
        // //                  alert('submit intercepted');
                         e.preventDefault(e);
//                      return false;
                     }
            	}

            });
        });
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
			 var s1= start_date.substr(0,4);
		 var s2 = start_date.substr(5,6);
		 var s3 = start_date.substr(8,10);
		
		var q="-";				
		var str1=s1.concat(q);		
		var str2=str1.concat(s2.substr(0,2).concat(q));	
		
		var str3=str2.concat(s3);
				
//commising
			var b1= end_date.substr(0,4);
		 var b2 = end_date.substr(5,6);
		 var b3 = end_date.substr(8,10);			
		 var str5=b1.concat(q);		
		var str6=str5.concat(b2.substr(0,2).concat(q));			
		var str7=str6.concat(b3);
	
	
		 	var dateOne = new Date(str3);
	       var dateTwo = new Date(str7);

	       if ( dateOne <= dateTwo )
	       {
	    	
	    	   var a=document.getElementById("end_date").value;
	          // alert(a);
	           var month=a.substring(5,7);
	           var year=a.substring(0,4);
	         //  alert(year);

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





	<script type="text/javascript">
//         jQuery(function($) {

//               var demo1 = $('select[name="appl_depot_code1[]"]').bootstrapDualListbox({infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
//               var container1 = demo1.bootstrapDualListbox('getContainer');
//                 container1.find('.btn').addClass('btn-white btn-info btn-bold');
//               $(document).one('ajaxloadstart.page', function(e) {
//                     $('[class*=select2]').remove();
// $('select[name="appl_depot_code1[]"]').bootstrapDualListbox('destroy');
//                     $('.rating').raty('destroy');
//                     $('.multiselect').multiselect('destroy');
//                 });

// //               var demo2 = $('.demo2').bootstrapDualListbox({
// //                   nonSelectedListLabel: 'Non-selected',
// //                   selectedListLabel: 'Selected',
// //                   preserveSelectionOnMove: 'moved',
// //                   moveOnSelect: false,
// //                   nonSelectedFilter: 'ion ([7-9]|[1][0-2])'
// //                 });

//             $('#id-disable-check').on('click', function() {
//                 var inp = $('#form-input-readonly').get(0);
//                 if (inp.hasAttribute('disabled')) {
//                     inp.setAttribute('readonly', 'true');
//                     inp.removeAttribute('disabled');
//                     inp.value = "This text field is readonly!";
//                 } else {
//                     inp.setAttribute('disabled', 'disabled');
//                     inp.removeAttribute('readonly');
//                     inp.value = "This text field is disabled!";
//                 }
//             });
    </script>


	<script type="text/javascript">
        jQuery(function($) {

              var demo1 = $('select[name="appl_depot_code1[]"]').bootstrapDualListbox({
                  infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
              var container1 = demo1.bootstrapDualListbox('getContainer');
                container1.find('.btn').addClass('btn-white btn-info btn-bold');
                demo1.bootstrapDualListbox('refresh', true);
              $(document).one('ajaxloadstart.page', function(e) {
$('select[name="appl_depot_code1[]"]').bootstrapDualListbox('destroy');

                });

//               var demo2 = $('.demo2').bootstrapDualListbox({
//                   nonSelectedListLabel: 'Non-selected',
//                   selectedListLabel: 'Selected',
//                   preserveSelectionOnMove: 'moved',
//                   moveOnSelect: false,
//                   nonSelectedFilter: 'ion ([7-9]|[1][0-2])'
//                 });

            $('#id-disable-check').on('click', function() {
                var inp = $('#form-input-readonly').get(0);
                if (inp.hasAttribute('disabled')) {
                    inp.setAttribute('readonly', 'true');
                    inp.removeAttribute('disabled');
                    inp.value = "This text field is readonly!";
                } else {
                    inp.setAttribute('disabled', 'disabled');
                    inp.removeAttribute('readonly');
                    inp.value = "This text field is disabled!";
                }
            });

            $('#id-input-file-3').ace_file_input({
                style:'well',
                btn_choose:'Drop files here or click to choose',
                btn_change:null,
                no_icon:'ace-icon fa fa-cloud-upload',
                droppable:true,
                thumbnail:'small'//large | fit
                //,icon_remove:null//set null, to hide remove/reset button
                /**,before_change:function(files, dropped) {
                    //Check an example below
                    //or examples/file-upload.html
                    return true;
                }*/
                /**,before_remove : function() {
                    return true;
                }*/
                ,
                preview_error : function(filename, error_code) {
                    //name of the file that failed
                    //error_code values
                    //1 = 'FILE_LOAD_FAILED',
                    //2 = 'IMAGE_LOAD_FAILED',
                    //3 = 'THUMBNAIL_FAILED'
                    //alert(error_code);
                }

            }).on('change', function(){
                //console.log($(this).data('ace_input_files'));
                //console.log($(this).data('ace_input_method'));
            });

            $('#id-input-file-4').ace_file_input({
                style:'well',
                btn_choose:'Drop files here or click to choose',
                btn_change:null,
                no_icon:'ace-icon fa fa-cloud-upload',
                droppable:true,
                thumbnail:'small'//large | fit
                //,icon_remove:null//set null, to hide remove/reset button
                /**,before_change:function(files, dropped) {
                    //Check an example below
                    //or examples/file-upload.html
                    return true;
                }*/
                /**,before_remove : function() {
                    return true;
                }*/
                ,
                preview_error : function(filename, error_code) {
                    //name of the file that failed
                    //error_code values
                    //1 = 'FILE_LOAD_FAILED',
                    //2 = 'IMAGE_LOAD_FAILED',
                    //3 = 'THUMBNAIL_FAILED'
                    //alert(error_code);
                }

            }).on('change', function(){
                //console.log($(this).data('ace_input_files'));
                //console.log($(this).data('ace_input_method'));
            });

            if (!ace.vars['touch']) {
                $('.chosen-select').chosen({
                    allow_single_deselect : true
                });
                //resize the chosen on window resize

                $(window).off('resize.chosen').on('resize.chosen', function() {
                    $('.chosen-select').each(function() {
                        var $this = $(this);
                        $this.next().css({
                            'width' : $this.parent().width()
                        });
                    })
                }).trigger('resize.chosen');
                //resize chosen on sidebar collapse/expand
                $(document).on('settings.ace.chosen',
                        function(e, event_name, event_val) {
                            if (event_name != 'sidebar_collapsed')
                                return;
                            $('.chosen-select').each(function() {
                                var $this = $(this);
                                $this.next().css({
                                    'width' : $this.parent().width()
                                });
                            })
                        });

                $('#chosen-multiple-style .btn').on(
                        'click',
                        function(e) {
                            var target = $(this).find('input[type=radio]');
                            var which = parseInt(target.val());
                            if (which == 2)
$('#form-field-select-4').addClass(
                                        'tag-input-style');
                            else
$('#form-field-select-4').removeClass(
                                        'tag-input-style');
                        });
            }

            $('[data-rel=tooltip]').tooltip({
                container : 'body'
            });
            $('[data-rel=popover]').popover({
                container : 'body'
            });

            $('textarea[class*=autosize]').autosize({
                append : "\n"
            });
            $('textarea.limited').inputlimiter({
                remText : '%n character%s remaining...',
                limitText : 'max allowed : %n.'
            });

            $.mask.definitions['~'] = '[+-]';
            $('.input-mask-date').mask('99/99/9999');
            $('.input-mask-phone').mask('(999) 999-9999');
            $('.input-mask-eyescript').mask('~9.99 ~9.99 999');
            $(".input-mask-product").mask("a*-999-a999", {
                placeholder : " ",
                completed : function() {
                    alert("You typed the following: " + this.val());
                }
            });

            $("#input-size-slider").css('width', '200px').slider(
                    {
                        value : 1,
                        range : "min",
                        min : 1,
                        max : 8,
                        step : 1,
                        slide : function(event, ui) {
                            var sizing = [ '', 'input-sm', 'input-lg',
                                    'input-mini', 'input-small',
                                    'input-medium', 'input-large',
                                    'input-xlarge', 'input-xxlarge' ];
                            var val = parseInt(ui.value);
                            $('#form-field-4').attr('class', sizing[val]).val(
                                    '.' + sizing[val]);
                        }
                    });

            $("#input-span-slider").slider(
                    {
                        value : 1,
                        range : "min",
                        min : 1,
                        max : 12,
                        step : 1,
                        slide : function(event, ui) {
                            var val = parseInt(ui.value);
                            $('#form-field-5').attr('class', 'col-xs-' + val)
                                    .val('.col-xs-' + val);
                        }
                    });

            //"jQuery UI Slider"
            //range slider tooltip example
            $("#slider-range")
                    .css('height', '200px')
                    .slider(
                            {
                                orientation : "vertical",
                                range : true,
                                min : 0,
                                max : 100,
                                values : [ 17, 67 ],
                                slide : function(event, ui) {
                                    var val = ui.values[$(ui.handle).index() - 1]
                                            + "";

                                    if (!ui.handle.firstChild) {
                                        $(
                                                "<div class='tooltip right in' style='display:none;left:16px;top:-6px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>")
.prependTo(ui.handle);
                                    }
$(ui.handle.firstChild).show().children()
                                            .eq(1).text(val);
                                }
}).find('span.ui-slider-handle').on('blur',
                            function() {
                                $(this.firstChild).hide();
                            });

            $("#slider-range-max").slider({
                range : "max",
                min : 1,
                max : 10,
                value : 2
            });

            $("#slider-eq > span").css({
                width : '90%',
                'float' : 'left',
                margin : '15px'
            }).each(function() {
                // read initial values from markup and remove that
                var value = parseInt($(this).text(), 10);
                $(this).empty().slider({
                    value : value,
                    range : "min",
                    animate : true

                });
            });

            $("#slider-eq > span.ui-slider-purple").slider('disable');//disable third item

            $('#id-input-file-1 , #id-input-file-2').ace_file_input({
                no_file : 'No File ...',
                btn_choose : 'Choose',
                btn_change : 'Change',
                droppable : false,
                onchange : null,
                thumbnail : false
            //| true | large
            //whitelist:'gif|png|jpg|jpeg'
            //blacklist:'exe|php'
            //onchange:''
            //
            });
            //pre-show a file name, for example a previously selected file
//$('#id-input-file-1').ace_file_input('show_file_list', ['myfile.txt'])

            $('#id-input-file-3').ace_file_input({
                style : 'well',
                btn_choose : 'Drop files here or click to choose',
                btn_change : null,
                no_icon : 'ace-icon fa fa-cloud-upload',
                droppable : true,
                thumbnail : 'small'//large | fit
                //,icon_remove:null//set null, to hide remove/reset button
                /**,before_change:function(files, dropped) {
                    //Check an example below
                    //or examples/file-upload.html
                    return true;
                }*/
                /**,before_remove : function() {
                    return true;
                }*/
                ,
                preview_error : function(filename, error_code) {
                    //name of the file that failed
                    //error_code values
                    //1 = 'FILE_LOAD_FAILED',
                    //2 = 'IMAGE_LOAD_FAILED',
                    //3 = 'THUMBNAIL_FAILED'
                    //alert(error_code);
                }

            }).on('change', function() {
                //console.log($(this).data('ace_input_files'));
                //console.log($(this).data('ace_input_method'));
            });

            //$('#id-input-file-3')
            //.ace_file_input('show_file_list', [
            //{type: 'image', name: 'name of image', path: 'http://path/to/image/for/preview'},
            //{type: 'file', name: 'hello.txt'}
            //]);

            //dynamically change allowed formats by changing allowExt && allowMime function
            $('#id-file-format').removeAttr('checked').on(
                    'change',
                    function() {
                        var whitelist_ext, whitelist_mime;
                        var btn_choose
                        var no_icon
                        if (this.checked) {
                            btn_choose = "Drop images here or click to choose";
                            no_icon = "ace-icon fa fa-picture-o";

                            whitelist_ext = [ "jpeg", "jpg", "png", "gif",
                                    "bmp" ];
                            whitelist_mime = [ "image/jpg", "image/jpeg",
                                    "image/png", "image/gif", "image/bmp" ];
                        } else {
                            btn_choose = "Drop files here or click to choose";
                            no_icon = "ace-icon fa fa-cloud-upload";

                            whitelist_ext = null;//all extensions are acceptable
                            whitelist_mime = null;//all mimes are acceptable
                        }
                        var file_input = $('#id-input-file-3');
file_input.ace_file_input('update_settings', {
                            'btn_choose' : btn_choose,
                            'no_icon' : no_icon,
                            'allowExt' : whitelist_ext,
                            'allowMime' : whitelist_mime
                        })
                        file_input.ace_file_input('reset_input');

file_input.off('file.error.ace').on('file.error.ace',
                                function(e, info) {
//console.log(info.file_count);//number of selected files
//console.log(info.invalid_count);//number of invalid files
//console.log(info.error_list);//a list of errors in the following format

                                    //info.error_count['ext']
                                    //info.error_count['mime']
                                    //info.error_count['size']

                                    //info.error_list['ext']  = [list of file names with invalid extension]
                                    //info.error_list['mime'] = [list of file names with invalid mimetype]
                                    //info.error_list['size'] = [list of file names with invalid size]

                                    /**
                                    if( !info.dropped ) {
                                        //perhapse reset file field if files have been selected, and there are invalid files among them
                                        //when files are dropped, only valid files will be added to our file array
                                        e.preventDefault();//it will rest input
                                    }
                                     */

                                    //if files have been selected (not dropped), you can choose to reset input
                                    //because browser keeps all selected files anyway and this cannot be changed
                                    //we can only reset file field to become empty again
                                    //on any case you still should check files with your server side script
                                    //because any arbitrary file can be uploaded by user and it's not safe to rely on browser-side measures
                                });

                    });

            $('#spinner1').ace_spinner({
                value : 0,
                min : 0,
                max : 200,
                step : 10,
                btn_up_class : 'btn-info',
                btn_down_class : 'btn-info'
            }).closest('.ace-spinner').on('changed.fu.spinbox', function() {
                //alert($('#spinner1').val())
            });
            $('#spinner2').ace_spinner({
                value : 0,
                min : 0,
                max : 10000,
                step : 100,
                touch_spinner : true,
                icon_up : 'ace-icon fa fa-caret-up bigger-110',
                icon_down : 'ace-icon fa fa-caret-down bigger-110'
            });
            $('#spinner3').ace_spinner({
                value : 0,
                min : -100,
                max : 100,
                step : 10,
                on_sides : true,
                icon_up : 'ace-icon fa fa-plus bigger-110',
                icon_down : 'ace-icon fa fa-minus bigger-110',
                btn_up_class : 'btn-success',
                btn_down_class : 'btn-danger'
            });
            $('#spinner4').ace_spinner({
                value : 0,
                min : -100,
                max : 100,
                step : 10,
                on_sides : true,
                icon_up : 'ace-icon fa fa-plus',
                icon_down : 'ace-icon fa fa-minus',
                btn_up_class : 'btn-purple',
                btn_down_class : 'btn-purple'
            });

//$('#spinner1').ace_spinner('disable').ace_spinner('value', 11);
            //or
//$('#spinner1').closest('.ace-spinner').spinner('disable').spinner('enable').spinner('value', 11);//disable, enable or change value
//$('#spinner1').closest('.ace-spinner').spinner('value', 0);//reset to 0

            //datepicker plugin
            //link
            $('.date-picker').datepicker({
                autoclose : true,
                todayHighlight : true
            })
            //show datepicker when clicking on the icon
            .next().on(ace.click_event, function() {
                $(this).prev().focus();
            });

            //or change it into a date range picker
            $('.input-daterange').datepicker({
                autoclose : true
            });

            //to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
            $('input[name=date-range-picker]').daterangepicker({
                'applyClass' : 'btn-sm btn-success',
                'cancelClass' : 'btn-sm btn-default',
                locale : {
                    applyLabel : 'Apply',
                    cancelLabel : 'Cancel',
                }
            }).prev().on(ace.click_event, function() {
                $(this).next().focus();
            });

            $('#timepicker1').timepicker({
                minuteStep : 1,
                showSeconds : true,
                showMeridian : false
            }).next().on(ace.click_event, function() {
                $(this).prev().focus();
            });

$('#date-timepicker1').datetimepicker().next().on(ace.click_event,
                    function() {
                        $(this).prev().focus();
                    });

            $('#colorpicker1').colorpicker();

            $('#simple-colorpicker-1').ace_colorpicker();
            //$('#simple-colorpicker-1').ace_colorpicker('pick', 2);//select 2nd color
            //$('#simple-colorpicker-1').ace_colorpicker('pick', '#fbe983');//select #fbe983 color
            //var picker = $('#simple-colorpicker-1').data('ace_colorpicker')
            //picker.pick('red', true);//insert the color if it doesn't exist

            $(".knob").knob();

            var tag_input = $('#form-field-tags');
            try {
                tag_input.tag({
                    placeholder : tag_input.attr('placeholder'),
                    //enable typeahead by specifying the source array
                    source : ace.vars['US_STATES'],//defined in ace.js >> ace.enable_search_ahead
                /**
                //or fetch data from database, fetch those that match "query"
                source: function(query, process) {
                  $.ajax({url: 'remote_source.php?q='+encodeURIComponent(query)})
                  .done(function(result_items){
                    process(result_items);
                  });
                }
                 */
                })

                //programmatically add a new
                var $tag_obj = $('#form-field-tags').data('tag');
                $tag_obj.add('Programmatically Added');
            } catch (e) {
                //display a textarea for old IE, because it doesn't support this plugin or another one I tried!
                tag_input.after(
                        '<textarea id="' + tag_input.attr('id') + '" name="'
                                + tag_input.attr('name') + '" rows="3">'
                                + tag_input.val() + '</textarea>').remove();
                //$('#form-field-tags').autosize({append: "\n"});
            }

            /////////
            $('#modal-form input[type=file]').ace_file_input({
                style : 'well',
                btn_choose : 'Drop files here or click to choose',
                btn_change : null,
                no_icon : 'ace-icon fa fa-cloud-upload',
                droppable : true,
                thumbnail : 'large'
            })

            //chosen plugin inside a modal will have a zero width because the select element is originally hidden
            //and its width cannot be determined.
            //so we set the width after modal is show
            $('#modal-form').on(
                    'shown.bs.modal',
                    function() {
                        if (!ace.vars['touch']) {
$(this).find('.chosen-container').each(
                                    function() {
$(this).find('a:first-child').css(
                                                'width', '210px');
$(this).find('.chosen-drop').css(
                                                'width', '210px');
$(this).find('.chosen-search input')
                                                .css('width', '200px');
                                    });
                        }
                    })
            /**
            //or you can activate the chosen plugin after modal is shown
            //this way select element becomes visible with dimensions and chosen works as expected
            $('#modal-form').on('shown', function () {
                $(this).find('.modal-chosen').chosen();
            })
             */

            $(document)
                    .one(
                            'ajaxloadstart.page',
                            function(e) {
$('textarea[class*=autosize]').trigger(
                                        'autosize.destroy');
$('.limiterBox,.autosizejs').remove();
                                $(
'.daterangepicker.dropdown-menu,.colorpicker.dropdown-menu,.bootstrap-datetimepicker-widget.dropdown-menu')
                                        .remove();
                            });

        });
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
        	autoclose : true, 
        	format : 'dd-mm-yyyy',
//             startDate : sysdate,
            //endDate : sysdate

        });
//         .on('changeDate', function(e) {
//             // Revalidate the date field
//             $('#eventForm').formValidation('revalidateField', 'date');
//         });

        $('#datePicker1').datepicker({
        	
        	autoclose : true,        
            format : 'dd-mm-yyyy',
            //startDate : sysdate

        });
//         .on('changeDate', function(e) {
//             // Revalidate the date field
//             $('#eventForm').formValidation('revalidateField', 'date');
//         });

//         $('#datePicker2').datepicker({
//             format : 'dd-mm-yyyy',
//             //startDate : sysdate

//         }).on('changeDate', function(e) {
//             // Revalidate the date field
//             $('#eventForm').formValidation('revalidateField', 'date');
//         });
    </script>

	<script>

function delRow2() {
	
	$('#rowcount3').val($('#dynamic-table3 tr').length-1);
	var count = $('#rowcount3').val();
	
	
	if(count > 0)
		{ 		
			 document.getElementById("dynamic-table3").deleteRow(count);
			 document.getElementById("dynamic-table4").deleteRow(count);
	 			
			 
		}
	prdoutflowTotal();
}


/* <select class="form-control mb-md" name="scheme_name"
	id="scheme_name" required>
</select> */


function AddRow2()
{

	
	$('#dynamic-table3 tr').last().after('<tr>'
			+'<td ><center>'
			+'<div id="loading'+$('#dynamic-table3 tr').length+'">'
			+'<img src="../files/assets/images/Loading1.gif" alt="BASS" style="width:70%;height:15%;margin-left: 16%;margin-top: 0%;" class="">'
			+'</div>'
			+'<div id="sch_prd_outflow_id'+$('#dynamic-table3 tr').length+'">'
	        +($('#dynamic-table3 tr').length)+'<input type="hidden" id="sch_prd_outflow_unique_id'+$('#dynamic-table3 tr').length+'" name="sch_prd_outflow_unique_id"/>'
	        +'</div>'
	        +'</center></td>'
	        +'<td ><select class="form-control form-control-sm " name="sch_prd_outflow_line_type" id="sch_prd_outflow_line_type'+$('#dynamic-table3 tr').length+'" class="col-xs-12 col-sm-4" required><option value="">--Select--</option></select></td>'
	        +'<td ><select class="form-control form-control-sm " name="sch_product_outflow_id" id="sch_product_outflow_id'+$('#dynamic-table3 tr').length+'" class="col-xs-12 col-sm-4" required><option value="">--Select--</option></select></td>'
	        +'</tr>'
	        );
	        
	$('#dynamic-table4 tr').last().after('<tr>'
			+'<td ><input type="hidden" id="sch_prd_lly_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_lly_vol" class="col-xs-12 col-sm-4" value="0" readonly/>'
			+'<input type="text" class="form-control form-control-sm" id="sch_prd_lly_vol_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_lly_vol_div" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
			+'<td ><input type="hidden" id="sch_prd_ly_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_ly_vol" class="col-xs-12 col-sm-4" value="0" readonly/>'
			+'<input type="text" class="form-control form-control-sm" id="sch_prd_ly_vol_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_ly_vol_div" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
			+'<td ><input type="text" class="form-control form-control-sm" style="width:100%;" id="proj_grwth_vol_pct'+$('#dynamic-table4 tr').length+'" value="0" name="proj_grwth_vol_pct" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'		
			+'<td ><input type="hidden" id="sch_prd_ty_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_ty_vol" class="col-xs-12 col-sm-4" value="0" readonly required/>'
			+'<input type="text" class="form-control form-control-sm" id="sch_prd_ty_vol_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_ty_vol_div" class="col-xs-12 col-sm-4" value="0" readonly required/></td>'
			+'<td ><input type="hidden" id="sch_prd_lly_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_lly_val" class="col-xs-12 col-sm-4" value="0" readonly/>'
			+'<input type="text" class="form-control form-control-sm" id="sch_prd_lly_val_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_lly_val_div" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
	        +'<td ><input type="hidden" id="sch_prd_ly_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_ly_val" class="col-xs-12 col-sm-4" value="0" readonly/>'
	        +'<input type="text" class="form-control form-control-sm" id="sch_prd_ly_val_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_ly_val_div" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
	        +'<td ><input type="text" class="form-control form-control-sm" class= "" style="width:100%;" id="proj_grwth_val_pct'+$('#dynamic-table4 tr').length+'" value="0" name="proj_grwth_val_pct" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'
	        +'<td ><input type="hidden" id="sch_prd_ty_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_ty_val" class="col-xs-12 col-sm-4" value="0" readonly required/>'
	        +'<input type="text" class="form-control form-control-sm" id="sch_prd_ty_val_div'+$('#dynamic-table4 tr').length+'" name="sch_prd_ty_val_div" class="col-xs-12 col-sm-4" value="0" readonly required/></td>'
	        +'<td ><input type="text" class="form-control form-control-sm" style="width:100%;" id="sch_prd_spread_tgt_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_tgt_vol" value="0" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'
	        +'<td ><input type="text" class="form-control form-control-sm" style="width:100%;" id="sch_prd_spread_tgt_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_tgt_val" value="0" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'
	        +'<td ><input type="text" class="form-control form-control-sm" id="sch_prd_spread_mtd_ly_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_mtd_ly_vol" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
	        +'<td ><input type="text" class="form-control form-control-sm" id="sch_prd_spread_mtd_ly_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_mtd_ly_val" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
	        +'<td ><input type="text" class="form-control form-control-sm"  style="width:100%;" id="proj_grwth_spd_pct'+$('#dynamic-table4 tr').length+'" value="0" name="proj_grwth_spd_pct" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'
	        +'<td ><input type="text" class="form-control form-control-sm" id="sch_prd_spread_mtd_ty_tgt_vol'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_mtd_ty_tgt_vol" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
	        +'<td ><input type="text" class="form-control form-control-sm" id="sch_prd_spread_mtd_ty_tgt_val'+$('#dynamic-table4 tr').length+'" name="sch_prd_spread_mtd_ty_tgt_val" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
	        +'<td ><input type="text" class="form-control form-control-sm"  style="width:100%;" id="sch_prd_wt_avg'+$('#dynamic-table4 tr').length+'" value="0" name="sch_prd_wt_avg" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required readonly/></td>'
	        +'<td ><input type="text" class="form-control form-control-sm" id="sch_prd_total_prd_bdgt'+$('#dynamic-table4 tr').length+'" name="sch_prd_total_prd_bdgt" class="col-xs-12 col-sm-4" value="0" readonly/></td>'
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
//             url: '${pageContext.request.contextPath}/loadproductcat',
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
    
    var from_date=document.getElementById("start_date").value;
	
	var mm = from_date.substring(5,7);
	var dd = from_date.substring(8,10);
	var yy = from_date.substring(0,4);

    
    var startdate = dd+"-"+mm+"-"+yy;
    
	var to_date=document.getElementById("end_date").value;
	
	var mm1 = to_date.substring(5,7);
	var dd1 = to_date.substring(8,10);
	var yy1 = to_date.substring(0,4);
	
    var enddate = dd1+"-"+mm1+"-"+yy1;
     var zones2 = $('#sel_depo').val();
     var depotcodes2 = ""+zones2+"";
    var custtypes = jQuery.map($(':checkbox[name=cust_type]:checked'), function (n, i) {
        return n.value;
    }).join(',');
    
//     alert(custtypes);

//     $('[name="cust_type"]').each( function (){
//         if($(this).prop('checked') == true){
//             alert($(this).val());
//         }
//     });
//     var custtypes = $( "input[type=checkbox][name=cust_type]" ).val();
//     alert(custtypes);
   
   
    	
    	$.ajax({
            url: '${pageContext.request.contextPath}/loadproductoutflow',
            data: ({datavalue : datavalue,prdvalue : prdvalue,
            		startdate : startdate,enddate : enddate,
            		depotcodes : depotcodes2,custtypes : custtypes,
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
    	
     
    	
//     	  if($('#sch_prd_lly_vol'+count).val() == 0 && 
//     			  $('#sch_prd_lly_val'+count).val() == 0 &&
//       				$('#sch_prd_ly_vol'+count).val() == 0 &&
//       					$('#sch_prd_ly_val'+count).val() == 0) {
    		  
//     		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
//     		  sch_prd_ty_vol.readOnly = false;
//           	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
//           	  sch_prd_ty_val.readOnly = false;
    	  
    		  
//     	  } else {
//     		  var sch_prd_ty_vol = document.getElementById("sch_prd_ty_vol"+count);
//     		  sch_prd_ty_vol.readOnly = true;
//           	  var sch_prd_ty_val = document.getElementById("sch_prd_ty_val"+count);
//           	  sch_prd_ty_val.readOnly = true;
//     	  }


		
    
    	
    
  
   
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
    var depotcodes =String($('#duallist').val());
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
    var enddate =$('#end_date').val();
    var depotcodes =String($('#duallist').val());
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




			

	

}

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
	$('#scheme_budget').val(totalsum);
}





</script>


	<script>

function delRow1() {
	
	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
	var count = $('#rowcount2').val();
	
	
	if(count > 1)
		{ 		
			 document.getElementById("dynamic-table2").deleteRow(count);
	 			
			 
		}
}
function AddRow1()
{

$('#dynamic-table2 tr').last().after('<tr>'
		+'<td ><center>'+($('#dynamic-table2 tr').length-1)+'<input type="hidden" id="sch_prd_unique_id'+$('#dynamic-table2 tr').length+'" name="sch_prd_unique_id"></center></td>'
		+'<td ><select name="sch_prd_line_type" id="sch_prd_line_type'+$('#dynamic-table2 tr').length+'" class="col-xs-12 col-sm-4" required><option value="">--Select--</option></select></td>'
		+'<td ><select name="sch_product_id" id="sch_product_id'+$('#dynamic-table2 tr').length+'" class="col-xs-12 col-sm-4" required><option value="">--Select--</option></select></td>'
		+'<td ><input type="text" id="sch_prd_exceptions'+$('#dynamic-table2 tr').length+'" name="sch_prd_exceptions" class="col-xs-12 col-sm-4"></td>'
		+'<td ><input type="text" class= "calvolgrwthavg" style="width:100%;" id="vol_grwth_pct'+$('#dynamic-table2 tr').length+'" value="0" name="vol_grwth_pct" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required/></td>'
		+'<td ><input type="text" class= "calvalgrwthavg" style="width:100%;" id="val_grwth_pct'+$('#dynamic-table2 tr').length+'" value="0" name="val_grwth_pct" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required/></td>'
		+'<td ><input type="text" class= "calspreadavg" id="spread_pct'+$('#dynamic-table2 tr').length+'" value="0" name="spread_pct" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required/></td>'
		+'<td ><input type="text" style="width:100%;" id="spend_per_ltr'+$('#dynamic-table2 tr').length+'" value="0" name="spend_per_ltr" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" required/></td>'
		+'</tr>');

$('#rowcount2').val($('#dynamic-table2 tr').length-1);
var count = $('#rowcount2').val();

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
    } else  {
    	var select = $('#sch_product_id'+count);
        select.find('option').remove();
        $('<option>').val("").text("--Select--").appendTo(select);
    }
});


// $('.calvolgrwthavg').blur(function(){
	


// 	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
// 	var count = $('#rowcount2').val();

// 	 var cnt = $('.calvolgrwthavg').index(this)+1+1;
	
// 	 var avg=0;
// 	var vol_gwt = $('#volume_growth').val();
// 	var vol_gwt_pct = $('#vol_grwth_pct'+cnt).val();	    	
// //	if(cnt == 1)
// //	{
// //			if(vol_gwt > vol_gwt_pct)
// //			{
// //				// alert("hii");
// //			}
// //			else{
// //				alert("Check Entered Value");
// //			}
	    				
// //	}else{

// 		var sum = 0;					
// 		for(var i=2;i<=count;i++)
// 			{
// 				var data = parseFloat($('#vol_grwth_pct'+i).val());	
				
// 				sum = sum  + data;	
// 			}
		
// 		avg = sum /(count-1);
		
// 		if(vol_gwt == avg)
// 		{
// 		}
// 		else{
// 			alert("Percentage value not matching with header");
// 			$('#vol_grwth_pct'+cnt).val("0");
// 		} 
		
// //	}
// }); 

// $('.calvalgrwthavg').blur(function(){

// 	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
// 	var count = $('#rowcount2').val();

// 	 var cnt = $('.calvalgrwthavg').index(this)+1+1;
// 	// alert(cnt);
// 	var avg=0;
// 	var val_gwt = $('#value_growth').val();
// 	var val_gwt_pct = $('#val_grwth_pct'+cnt).val();
	    	
// //	if(cnt == 1)
// //	{
// //			if(val_gwt > val_gwt_pct)
// //			{
// //				// alert("hii");
// //			}
// //			else{
// //				alert("Check Entered Value");
// //			}
	    				
// //	}else{

// 		var sum = 0;					
// 		for(var i=2;i<=count;i++)
// 			{
// 				var data = parseFloat($('#val_grwth_pct'+i).val());	
				
// 				sum = sum  + data;							
// 			}
		
// 		avg = sum /(count-1);
		
// 		if(val_gwt == avg)
// 		{
		
// 		}
// 		else{
// 			alert("Percentage value not matching with header");
// 			$('#val_grwth_pct'+cnt).val("0");
// 		}
		
// //	}
// }); 

// $('.calspreadavg').blur(function(){

// 	$('#rowcount2').val($('#dynamic-table2 tr').length-1);
// 	var count = $('#rowcount2').val();

// 	 var cnt = $('.calspreadavg').index(this)+1+1;
// 	// alert(cnt);
// 	var avg=0;
// 	var spread = $('#spraid').val();
// 	var spread_pct = $('#spread_pct'+cnt).val();
	    	
// //	if(cnt == 1) 
// //	{
// //			if(spread > spread_pct)
// //			{
// //				// alert("hii");
// //			}
// //			else{
// //				alert("Check Entered Value");
// //			}
	    				
// //	}else{

// 		var sum = 0;					
// 		for(var i=2;i<=count;i++)
// 			{
// 				var data = parseFloat($('#spread_pct'+i).val());	
				
// 				sum = sum  + data;							
// 			}
		
// 		avg = sum /(count-1);
		
// 		if(spread == avg)
// 		{
		
// 		}
// 		else{
// 			alert("Percentage value not matching with header");
// 			$('#spread_pct'+cnt).val("0");
// 		}
		
// //	}
// }); 

}

function calgrowthpercent() {
	var vol_gwt = $('#volume_growth').val();
	var val_gwt = $('#value_growth').val();
	var spread = $('#spraid').val();
	
	var sum = parseFloat(vol_gwt) + parseFloat(val_gwt) + parseFloat(spread);
	
	if(sum > 0) {
		return true;
	}
	else {
		return false;
	}
	
}

function calvolpercent()
{

		


		$('#rowcount2').val($('#dynamic-table2 tr').length-1);
		var count = $('#rowcount2').val();

		
		 var avg=0;
		var vol_gwt = $('#volume_growth').val();

			var sum = 0;					
			for(var i=2;i<=count;i++)
				{
					var data = parseFloat($('#vol_grwth_pct'+i).val());	
					
					sum = sum  + data;	
				}
			
			avg = sum /(count-1);
			
			if(vol_gwt == avg)
			{
			
			return true;
			}
			else{
// 				alert("Percentage value not matching with header");
				for(var i=2;i<=count;i++)
				{
					$('#vol_grwth_pct'+i).val("0");	
					
						
				}
				return false;
			} 
			
}
function calvalpercent() {

		$('#rowcount2').val($('#dynamic-table2 tr').length-1);
		var count = $('#rowcount2').val();

		var avg=0;
		var val_gwt = $('#value_growth').val();

			var sum = 0;					
			for(var i=2;i<=count;i++)
				{
					var data = parseFloat($('#val_grwth_pct'+i).val());	
					
					sum = sum  + data;							
				}
			
			avg = sum /(count-1);
			
			if(val_gwt == avg)
			{
				return true;
			}
			else{
// 				alert("Percentage value not matching with header");
				for(var i=2;i<=count;i++)
				{
					$('#val_grwth_pct'+i).val("0");	
					
											
				}
				return false;
			}
			
}

function calspreafpercent() {
	
		$('#rowcount2').val($('#dynamic-table2 tr').length-1);
		var count = $('#rowcount2').val();

		var avg=0;
		var spread = $('#spraid').val();

			var sum = 0;					
			for(var i=2;i<=count;i++)
				{
					var data = parseFloat($('#spread_pct'+i).val());	
					
					sum = sum  + data;							
				}
			
			avg = sum /(count-1);
			
			if(spread == avg)
			{
				return true;
			}
			else{
// 				alert("Percentage value not matching with header");
				for(var i=2;i<=count;i++)
				{
					$('#spread_pct'+i).val("0");	
					
					sum = sum  + data;							
				}
				return false;
			}
			

	

}





</script>

	<script>

function delRow() {
	
	$('#rowcount1').val($('#dynamic-table1 tr').length-1);
	var count = $('#rowcount1').val();
	
	if(count > 1)
		{ 		
			 document.getElementById("dynamic-table1").deleteRow(count);
	 			
			 
		}
}

function AddRow()
{
$('#dynamic-table1 tr').last().after('<tr>'
		+'<td ><center>'+($('#dynamic-table1 tr').length-1)+'<input type="hidden" id="gift_id'+$('#dynamic-table1 tr').length+'" name="gift_id"></center></td>'
		+'<td ><select name="gift_group" id="gift_group'+$('#dynamic-table1 tr').length+'" class="col-xs-12 col-sm-4" required><option value="">--Select--</option></select></td>'
		+'<td ><select name="gift_name" id="gift_name'+$('#dynamic-table1 tr').length+'" class="col-xs-12 col-sm-4" required><option value="">--Select--</option></select></td>'
		+'<td ><input type="text" style="width:100%;" id="gift_code'+$('#dynamic-table1 tr').length+'" value="" name="gift_code" readonly/></td>'
		+'<td ><input type="text" style="width:100%;" id="effective_price'+$('#dynamic-table1 tr').length+'" value="" name="effective_price" onkeypress="return isNumber(event);" pattern="[0-9]+([\.,][0-9]+)?" step="0.01" readonly required/></td>'
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
    
    // Number Validation
	
    
}

function isNumber(evt) {
	var iKeyCode = (evt.which) ? evt.which : evt.keyCode;

	if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
    
	return false;

	
return true;
}    


        $('.fetchgrpid').mousedown(function(){
            var count = $('.fetchgrpid').index(this)+1;
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
        });

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
         });
</script>

	<script>
$(window).load(function(){

    var fullDate = new Date();

     var n = fullDate.toString();
    var m=n.substring(4,7);

    var twoDigitMonth=0;

    if(m=='Jan' || m=='an')
        {
        twoDigitMonth=01;
        }else if(m=='Feb' || m=='eb')
            {
            twoDigitMonth=02;
            }else if(m=='Mar' || m=='ar'){
                twoDigitMonth=03;
            }else if(m=='Apr' || m=='pr'){
                twoDigitMonth=04;
            }else if(m=='May' || m=='ay'){
                twoDigitMonth=05;
            }else if(m=='Jun' || m=='un'){
                twoDigitMonth=06;
            }else if(m=='Jul' || m=='ul'){
                twoDigitMonth=07;
            }else if(m=='Aug' || m=='ug'){
                twoDigitMonth=08;
            }else if(m=='Sep' || m=='ep'){
                twoDigitMonth=09;
            }else if(m=='Oct' || m=='ct'){
                twoDigitMonth=10;
            }else if(m=='Nov' || m=='ov'){
                twoDigitMonth=11;
            }else if(m=='Dec' || m=='ec'){
                twoDigitMonth=12;
            }else{}



    var twoDigitDate = fullDate.getDate()+"";
    if(twoDigitDate.length==1)    twoDigitDate="0" +twoDigitDate;

    var currentDate = twoDigitDate + "-" + twoDigitMonth + "-" + fullDate.getFullYear();

    document.getElementById("created_on").value=currentDate;
    //alert(currentDate);
});

</script>
	<script>       
        
        function changedateformat1(){
        	
        	/* var from_date=document.getElementById("start_date").value;
	
	var mm = from_date.substring(0,2);
	var dd = from_date.substring(3,5);
	var yy = from_date.substring(6,10);
	
	document.getElementById("start_date").value = dd+"-"+mm+"-"+yy; */
}

function changedateformat2(){
	/* var to_date=document.getElementById("end_date").value;
	
	var mm = to_date.substring(0,2);
	var dd = to_date.substring(3,5);
	var yy = to_date.substring(6,10);
	
	document.getElementById("end_date").value = dd+"-"+mm+"-"+yy; */
}
	
</script>



	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="resources/newportal/multiselect/jquery.transfer.js"></script>


	<script>

$(window).load(function() {

	$('.required').css({
		'color' : 'red'
	});
	
	
   alert("Hiii....Region is selected");
	
	});
	
	
    $(document).ready(function() {
    
    
    alert("Hiii....Region is Document selected");
    

        	
    	
            $.ajax({
            	url: '${pageContext.request.contextPath}/loadfinyear',
                success: function(data) {
                	var select = $('#scheme_fin_yr');
                    select.find('option').remove();
					$('<option>').val("").text("--Select--").appendTo(select);
                    $.each(data, function(index, value) {
                    	if(value.current_yr_flag == "Y") {
							$('<option selected>').val(value.fin_year).text(value.fin_year).appendTo(select);
                        }
                        else {
                        	$('<option>').val(value.fin_year).text(value.fin_year).appendTo(select);
                        }
                    });

                }
            });





            var lovtype = "BLINE_TYPE";
            $.ajax({
            	url: '${pageContext.request.contextPath}/loadschemebusinessline',
                data: ({bline : lovtype}),
                success: function(data) {
                	var select = $('#scheme_business_line');
                    select.find('option').remove();
// 					$('<option>').val("").text("--Select--").appendTo(select);
                    $.each(data, function(index, value) {
						$('<option>').val(value).text(value).appendTo(select);
                    });

                }
            });
             
            
             
            var scheme_business_line = $("select#scheme_business_line").val();
            var scheme_fin_yr = $("select#scheme_fin_yr").val();
            $.ajax({
            	url: '${pageContext.request.contextPath}/getparentschemename',	
            	data: ({sbl : scheme_business_line,sfy : scheme_fin_yr}),
            	success: function(data) {				        	
            	    	
            		var select = $('#parent_scheme_code');
            	    select.find('option').remove();
            	    $('<option>').val("").text("--Select--").appendTo(select);
            	    $.each(data, function(index, value) {	
            	    	$('<option>').val(value.scheme_id).text(value.scheme_name).appendTo(select);
            	           		 
            	    });

            	}
            });
             
             
             
            $('#scheme_type').change(function(event) {
            	 
            	var schemetyp = $("select#scheme_type").val();
            	 
            	var lovtype = "BLINE_TYPE";
                $.ajax({
                	url: '${pageContext.request.contextPath}/loadschemebusinessline',
                    data: ({bline : lovtype}),
                    success: function(data) {
                    	var select = $('#scheme_business_line');
                        select.find('option').remove();
                            
                        if(schemetyp == "CN59") {
                        	$('<option>').val("").text("--Select--").appendTo(select);
                            $.each(data, function(index, value) {
                            	if(value == "CN59") {
                            		$('<option>').val(value).text(value).appendTo(select);
                            	}
                            });
                        }else {
                        	$('<option>').val("").text("--Select--").appendTo(select);
                            $.each(data, function(index, value) {
								$('<option>').val(value).text(value).appendTo(select);
                            });
                        }
                        
                        GenerateCode();
                    }
                });
            	 
            });



            var lovtype = "SCHEME_TYPE";
            $.ajax({
            	url: '${pageContext.request.contextPath}/loadschemetype',
                data: ({scheme : lovtype}),
                success: function(data) {
                	var select = $('#scheme_type');
                    select.find('option').remove();
                    $.each(data, function(index, value) {
                    	if(value == 'DEALER')  
                        {
     						$('<option selected>').val(value).text(value).appendTo(select);

                        }else{
         					$('<option>').val(value).text(value).appendTo(select);

                        }
							
                    });

                }
            });

             
            var custype = "PRNT_CUST_TYPE";
            $.ajax({
            	url: '${pageContext.request.contextPath}/loadcusttype',
                data: ({custype : custype}),
                success: function(data) {
                	var select = $('#attribute3');
                    select.find('option').remove();
                    $.each(data, function(index, value) {
                    	var nos = '';
                        var custypeno = value;
                        	                          	
                        $('<option>').val(value.ITEM_CODE).text(value.ITEM_CODEDESCRIPTION).appendTo(select);

                        	
                    });

                }
            });
             
            $('#scheme_business_line').change(function(event) {
            	var scheme_business_line = $("select#scheme_business_line").val();
            	var scheme_fin_yr = $("select#scheme_fin_yr").val();
            	$.ajax({
            		url: '${pageContext.request.contextPath}/getparentschemename',	
            	    data: ({sbl : scheme_business_line,sfy : scheme_fin_yr}),
            	    success: function(data) {				        	
            	    	
            	    	var select = $('#parent_scheme_code');
            	    	select.find('option').remove();
            	    	$('<option>').val("").text("--Select--").appendTo(select);
            	        $.each(data, function(index, value) {	
            	        	$('<option>').val(value.scheme_id).text(value.scheme_name).appendTo(select);
            	           		 
            	    	});

            	    }
            	});
            });
             
            $('#scheme_fin_yr').change(function(event) {
            	var scheme_business_line = $("select#scheme_business_line").val();
            	var scheme_fin_yr = $("select#scheme_fin_yr").val();
            	$.ajax({
            		url: '${pageContext.request.contextPath}/getparentschemename',	
            	    data: ({sbl : scheme_business_line,sfy : scheme_fin_yr}),
            	    success: function(data) {				        	
            	    	
            	    	var select = $('#parent_scheme_code');
            	    	select.find('option').remove();
            	    	$('<option>').val("").text("--Select--").appendTo(select);
            	        $.each(data, function(index, value) {	
            	        	$('<option>').val(value.scheme_id).text(value.scheme_name).appendTo(select);
            	           		 
            	    	});

            	    }
            	});
            });
             
            $('#scheme_fin_month').change(function(event) {
            	var scheme_business_line = $("select#scheme_business_line").val();
            	var scheme_fin_yr = $("select#scheme_fin_yr").val();
            	$.ajax({
            		url: '${pageContext.request.contextPath}/getparentschemename',	
            	    data: ({sbl : scheme_business_line,sfy : scheme_fin_yr}),
            	    success: function(data) {				        	
            	    	
            	    	var select = $('#parent_scheme_code');
            	    	select.find('option').remove();
            	    	$('<option>').val("").text("--Select--").appendTo(select);
            	        $.each(data, function(index, value) {	
            	        	$('<option>').val(value.scheme_id).text(value.scheme_name).appendTo(select);
            	           		 
            	    	});

            	    }
            	});
            });

            
         $.ajax({
         	url: '${pageContext.request.contextPath}/loadDSRregion',
             success: function(data) {
             	var select = $('#appl_regn_code');
                 select.find('option').remove();
					$('<option>').val("").text("--select--").appendTo(select);
           	    $.each(data, function(index, value) {
						$('<option>').val(value).text(value).appendTo(select);
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
         
        $(document).on('change','#depot',function(){
        /*  $('#depot').change(function(event) { */
         	
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
            $('#attribute1').change(function(event) {
            	var schprod = $("select#attribute1").val();

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
						

                    var sc_name=document.getElementById("scheme_name").value;

                    var sc_id=document.getElementById("scheme_id").value;

                  	window.open("primaryfinancialanalysis?scheme_name="+sc_name+"&scheme_id="+sc_id+"&schprod="+schprod,"Ratting","width=750,height=550,left=100,top=100,toolbar=0,status=0,");
				}

       		});
   
        });

       $(document).ready(function(){    
        	
        	GenerateCode();
        	
              AddRow();
              AddRow1();
              AddRow2();
              
              

        });
 
    </script>



	</div>
	</div>
</body>
</html>

