<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.util.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script> -->
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.stock.min.js"></script>
<title>BSAT-R3</title>
</head>
<body>
 
                                    <div class="row">
                                            <!-- task, page, download counter  start -->
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-yellow update-card">
                                                    <div class="card-block"><a href="schemehistoryforit?status=Incomplete">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${incomplete}</h4>
                                                                <h6 class="text-white m-b-0">WIP Schemes</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-1" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                   <!--  <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-green update-card">
                                                    <div class="card-block"><a href="schemehistoryforit?status=Pending for Approval">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${approvalpending}</h4>
                                                                <h6 class="text-white m-b-0">Approval Pending</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-2" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                   <!--  <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-pink update-card">
                                                    <div class="card-block"><a href="schemehistoryforit?status=Requested">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${requested}</h4>
                                                                <h6 class="text-white m-b-0">Requested to RA</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-3" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                   <!--  <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-lite-green update-card">
                                                    <div class="card-block"><a href="schemehistoryforit?status=Pending for RG Approval">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${provisioned}</h4>
                                                                <h6 class="text-white m-b-0">Provisioned</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-4" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                    <!-- <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div>
                                             <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-n_green update-card">
                                                    <div class="card-block"><a href="schemehistoryforit?status=Ready To Launch">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${launch}</h4>
                                                                <h6 class="text-white m-b-0">Ready to launch</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-5" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                   <!--  <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div>
                                             <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-n_pink update-card">
                                                    <div class="card-block"><a href="schemehistoryforit?status=Active">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${active}</h4>
                                                                <h6 class="text-white m-b-0">Active</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-6" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                   <!--  <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div>
                                             <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-purple update-card">
                                                    <div class="card-block"><a href="schemehistoryforit?status=Freezed">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${freezed}</h4>
                                                                <h6 class="text-white m-b-0">Freezed</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-7" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                   <!--  <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div>
                                             <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-lime update-card">
                                                    <div class="card-block"><a href="schemehistoryforit?status=Closed">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${closed}</h4>
                                                                <h6 class="text-white m-b-0">Redeemed And Closed</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-8" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                   <!--  <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div>
                                             <%-- <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-deep_purple update-card">
                                                    <div class="card-block"><a href="schemehistoryforit">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${review}</h4>
                                                                <h6 class="text-white m-b-0">Ready For Financial Analysis</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-9" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                   <!--  <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div> --%>
                                            <%--  <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-teal update-card">
                                                    <div class="card-block"><a href="schemehistoryforit">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${redemptionReady}</h4>
                                                                <h6 class="text-white m-b-0">Inactive Prior Redemption</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-10" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                   <!--  <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div> --%>
                                           <%--  <div class="col-xl-3 col-md-6">
                                                <div class="card bg-c-pink update-card">
                                                    <div class="card-block"><a href="schemehistoryforit?status=Processed">
                                                        <div class="row align-items-end">
                                                            <div class="col-8">
                                                                <h4 class="text-white">${processed}</h4>
                                                                <h6 class="text-white m-b-0">Inactive Post Redemption</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <canvas id="update-chart-11" height="50"></canvas>
                                                            </div>
                                                        </div></a>
                                                    </div>
                                                   <!--  <div class="card-footer">
                                                        <p class="text-white m-b-0"><i class="feather icon-clock text-white f-14 m-r-10"></i>update : 2:15 am</p>
                                                    </div> -->
                                                </div>
                                            </div> --%>
                                            <!-- task, page, download counter  end -->
                                            <!--  sale analytics start -->
                                           <div class="col-xl-9 col-md-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>Sales Analytics</h5>
                                                      <!--   <span class="text-muted">For more details about usage, please refer <a href="https://www.amcharts.com/online-store/" target="_blank">amCharts</a> licences.</span> -->
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="feather icon-maximize full-card"></i></li>
                                                                <li><i class="feather icon-minus minimize-card"></i></li>
                                                                <li><i class="feather icon-trash-2 close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                    <div id="chartContainer" style="height: 400px; max-width: 920px; margin: 0px auto;"></div>
                                                       <!--  <div id="sales-analytics" style="height: 265px;"></div> -->
                                                    </div>
                                                </div>
                                            </div>
                                            <%-- <div class="col-xl-6 col-md-6">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>New Users</h5>
                                                    </div>
                                                    <div class="card-block">
                                                        <canvas id="newuserchart" height="250"></canvas>
                                                    </div>
                                                    <div class="card-footer ">
                                                        <div class="row text-center b-t-default">
                                                            <div class="col-4 b-r-default m-t-15">
                                                                <h5>${incomplete}</h5>
                                                                <p class="text-muted m-b-0">Incomplete</p>
                                                            </div>
                                                             <div class="col-4 b-r-default m-t-15">
                                                                <h5>${active}</h5>
                                                                <p class="text-muted m-b-0">complete</p>
                                                            </div>
                                                            <div class="col-4 b-r-default m-t-15">
                                                                <h5>6%</h5>
                                                                <p class="text-muted m-b-0">Unsatisfied</p>
                                                            </div>
                                                            <div class="col-4 m-t-15">
                                                                <h5>9%</h5>
                                                                <p class="text-muted m-b-0">NA</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> --%>
                                            <!--  sale analytics end -->
                                             <div class="col-xl-3">
                                               <div class="card">
                                                    <div class="card-header">
                                                        <h5>Server load</h5>
<!--                                                         <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span> -->

                                                    </div>
                                                    <div class="card-block">
                                                        <div id="server-load" style="height:300px"></div>
                                                    </div>
                                                </div>
                                            </div> 
<!--                                              <div class="row"> -->
                                            <div class="col-md-12 col-lg-6">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>Scheme Activity Status</h5>
                                                       <!--  <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span> -->

                                                    </div>
                                                    <div class="card-block">
                                                        <div id="chart_Exploading" style="width: 100%; height: 300px;"></div>
                                                    </div>
                                                </div>
                                            </div>
                                           
                                      <!--   </div> -->
                                        <div class="col-xl-6 col-md-12">
                                                <div class="card user-card-full">
                                                    <div class="row m-l-0 m-r-0">
                                                        <div class="col-sm-4 bg-c-lite-green user-profile">
                                                            <div class="card-block text-center text-white">
                                                                <div class="m-b-25">
                                                                    <img src="..\files\assets\images\avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
                                                                </div>
                                                                <h6 class="f-w-600">Jeny William</h6>
                                                                <p>Web Designer</p>
                                                                <i class="feather icon-edit m-t-10 f-16"></i>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <div class="card-block">
                                                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <p class="m-b-10 f-w-600">Email</p>
                                                                        <h6 class="text-muted f-w-400"><a href="..\..\..\cdn-cgi\l\email-protection.htm" class="__cf_email__" data-cfemail="3a505f54437a5d575b535614595557">[email&#160;protected]</a></h6>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <p class="m-b-10 f-w-600">Phone</p>
                                                                        <h6 class="text-muted f-w-400">0023-333-526136</h6>
                                                                    </div>
                                                                </div>
                                                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Projects</h6>
                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <p class="m-b-10 f-w-600">Recent</p>
                                                                        <h6 class="text-muted f-w-400">Guruable Admin</h6>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <p class="m-b-10 f-w-600">Most Viewed</p>
                                                                        <h6 class="text-muted f-w-400">Able Pro Admin</h6>
                                                                    </div>
                                                                </div>
                                                                <ul class="social-link list-unstyled m-t-40 m-b-10">
                                                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook"><i class="feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                                                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter"><i class="feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                                                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram"><i class="feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- wather user -->
                                             <!-- Donut chart start -->
                                           <!--  <div class="col-md-12 col-lg-6">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>Donut chart</h5>
                                                        <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>

                                                    </div>
                                                    <div class="card-block">
                                                        <div id="donut-example"></div>
                                                    </div>
                                                </div>
                                            </div> -->
                                            <!-- Donut chart Ends -->

                                           <%--  <div class="col-xl-8 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Application Sales</h5>
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
                                                            <table class="table table-hover  table-borderless">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            <div class="chk-option">
                                                                                <div class="checkbox-fade fade-in-primary">
                                                                                    <label class="check-task">
                                                                                        <input type="checkbox" value="">
                                                                                        <span class="cr">
                                                                                            <i class="cr-icon feather icon-check txt-default"></i>
                                                                                        </span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            Application</th>
                                                                        <th>Sales</th>
                                                                        <th>Change</th>
                                                                        <th>Avg Price</th>
                                                                        <th>Total</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="chk-option">
                                                                                <div class="checkbox-fade fade-in-primary">
                                                                                    <label class="check-task">
                                                                                        <input type="checkbox" value="">
                                                                                        <span class="cr">
                                                                                            <i class="cr-icon feather icon-check txt-default"></i>
                                                                                        </span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="d-inline-block align-middle">
                                                                                <h6>Able Pro</h6>
                                                                                <p class="text-muted m-b-0">Powerful Admin Theme</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>16,300</td>
                                                                        <td><canvas id="app-sale1" height="50" width="100"></canvas></td>
                                                                        <td>$53</td>
                                                                        <td class="text-c-blue">$15,652</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="chk-option">
                                                                                <div class="checkbox-fade fade-in-primary">
                                                                                    <label class="check-task">
                                                                                        <input type="checkbox" value="">
                                                                                        <span class="cr">
                                                                                            <i class="cr-icon feather icon-check txt-default"></i>
                                                                                        </span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="d-inline-block align-middle">
                                                                                <h6>Photoshop</h6>
                                                                                <p class="text-muted m-b-0">Design Software</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>26,421</td>
                                                                        <td><canvas id="app-sale2" height="50" width="100"></canvas></td>
                                                                        <td>$35</td>
                                                                        <td class="text-c-blue">$18,785</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="chk-option">
                                                                                <div class="checkbox-fade fade-in-primary">
                                                                                    <label class="check-task">
                                                                                        <input type="checkbox" value="">
                                                                                        <span class="cr">
                                                                                            <i class="cr-icon feather icon-check txt-default"></i>
                                                                                        </span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="d-inline-block align-middle">
                                                                                <h6>Guruable</h6>
                                                                                <p class="text-muted m-b-0">Best Admin Template</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>8,265</td>
                                                                        <td><canvas id="app-sale3" height="50" width="100"></canvas></td>
                                                                        <td>$98</td>
                                                                        <td class="text-c-blue">$9,652</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="chk-option">
                                                                                <div class="checkbox-fade fade-in-primary">
                                                                                    <label class="check-task">
                                                                                        <input type="checkbox" value="">
                                                                                        <span class="cr">
                                                                                            <i class="cr-icon feather icon-check txt-default"></i>
                                                                                        </span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="d-inline-block align-middle">
                                                                                <h6>Flatable</h6>
                                                                                <p class="text-muted m-b-0">Admin App</p>
                                                                            </div>
                                                                        </td>
                                                                        <td>10,652</td>
                                                                        <td><canvas id="app-sale4" height="50" width="100"></canvas></td>
                                                                        <td>$20</td>
                                                                        <td class="text-c-blue">$7,856</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <div class="text-center">
                                                                <a href="#!" class=" b-b-primary text-primary">View all Projects</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            --%>
                                           <!--  <div class="col-xl-4 col-md-12">
                                                <div class="card user-activity-card">
                                                    <div class="card-header">
                                                        <h5>User Activity</h5>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="row m-b-25">
                                                            <div class="col-auto p-r-0">
                                                                <div class="u-img">
                                                                    <img src="..\files\assets\images\breadcrumb-bg.jpg" alt="user image" class="img-radius cover-img">
                                                                    <img src="..\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius profile-img">
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <h6 class="m-b-5">John Deo</h6>
                                                                <p class="text-muted m-b-0">Lorem Ipsum is simply dummy text.</p>
                                                                <p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>
                                                            </div>
                                                        </div>
                                                        <div class="row m-b-25">
                                                            <div class="col-auto p-r-0">
                                                                <div class="u-img">
                                                                    <img src="..\files\assets\images\breadcrumb-bg.jpg" alt="user image" class="img-radius cover-img">
                                                                    <img src="..\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius profile-img">
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <h6 class="m-b-5">John Deo</h6>
                                                                <p class="text-muted m-b-0">Lorem Ipsum is simply dummy text.</p>
                                                                <p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>
                                                            </div>
                                                        </div>
                                                        <div class="row m-b-25">
                                                            <div class="col-auto p-r-0">
                                                                <div class="u-img">
                                                                    <img src="..\files\assets\images\breadcrumb-bg.jpg" alt="user image" class="img-radius cover-img">
                                                                    <img src="..\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius profile-img">
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <h6 class="m-b-5">John Deo</h6>
                                                                <p class="text-muted m-b-0">Lorem Ipsum is simply dummy text.</p>
                                                                <p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>
                                                            </div>
                                                        </div>
                                                        <div class="row m-b-5">
                                                            <div class="col-auto p-r-0">
                                                                <div class="u-img">
                                                                    <img src="..\files\assets\images\breadcrumb-bg.jpg" alt="user image" class="img-radius cover-img">
                                                                    <img src="..\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius profile-img">
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <h6 class="m-b-5">John Deo</h6>
                                                                <p class="text-muted m-b-0">Lorem Ipsum is simply dummy text.</p>
                                                                <p class="text-muted m-b-0"><i class="feather icon-clock m-r-10"></i>2 min ago</p>
                                                            </div>
                                                        </div>

                                                        <div class="text-center">
                                                            <a href="#!" class="b-b-primary text-primary">View all Projects</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                           -->  <!-- wather user -->
                                           <!--  <div class="col-xl-6 col-md-12">
                                                <div class="card latest-update-card">
                                                    <div class="card-header">
                                                        <h5>Latest Updates</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="latest-update-box">
                                                            <div class="row p-b-15">
                                                                <div class="col-auto text-right update-meta">
                                                                    <p class="text-muted m-b-0 d-inline">4 hrs ago</p>
                                                                    <i class="feather icon-briefcase bg-simple-c-pink update-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6>+ 5 New Products were added!</h6>
                                                                    <p class="text-muted m-b-0">Congratulations!</p>
                                                                </div>
                                                            </div>
                                                            <div class="row p-b-15">
                                                                <div class="col-auto text-right update-meta">
                                                                    <p class="text-muted m-b-0 d-inline">1 day ago</p>
                                                                    <i class="feather icon-check bg-simple-c-yellow  update-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6>Database backup completed!</h6>
                                                                    <p class="text-muted m-b-0">Download the <span class="text-c-blue">latest backup</span>.</p>
                                                                </div>
                                                            </div>
                                                            <div class="row p-b-0">
                                                                <div class="col-auto text-right update-meta">
                                                                    <p class="text-muted m-b-0 d-inline">2 day ago</p>
                                                                    <i class="feather icon-facebook bg-simple-c-green update-icon"></i>
                                                                </div>
                                                                <div class="col">
                                                                    <h6>+1 Friend Requests</h6>
                                                                    <p class="text-muted m-b-10">This is great, keep it up!</p>
                                                                    <div class="table-responsive">
                                                                        <table class="table table-hover m-b-0">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="b-none">
                                                                                        <a href="#!" class="align-middle">
                                                                                        <img src="..\files\assets\images\avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                                                        <div class="d-inline-block">
                                                                                            <h6>Jeny William</h6>
                                                                                            <p class="text-muted m-b-0">Graphic Designer</p>
                                                                                        </div>
                                                                                    </a>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="text-center">
                                                            <a href="#!" class="b-b-primary text-primary">View all Projects</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                           --> <!--  <div class="col-xl-6 col-md-12">
                                                <div class="card user-card-full">
                                                    <div class="row m-l-0 m-r-0">
                                                        <div class="col-sm-4 bg-c-lite-green user-profile">
                                                            <div class="card-block text-center text-white">
                                                                <div class="m-b-25">
                                                                    <img src="..\files\assets\images\avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
                                                                </div>
                                                                <h6 class="f-w-600">Jeny William</h6>
                                                                <p>Web Designer</p>
                                                                <i class="feather icon-edit m-t-10 f-16"></i>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <div class="card-block">
                                                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <p class="m-b-10 f-w-600">Email</p>
                                                                        <h6 class="text-muted f-w-400"><a href="..\..\..\cdn-cgi\l\email-protection.htm" class="__cf_email__" data-cfemail="3a505f54437a5d575b535614595557">[email&#160;protected]</a></h6>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <p class="m-b-10 f-w-600">Phone</p>
                                                                        <h6 class="text-muted f-w-400">0023-333-526136</h6>
                                                                    </div>
                                                                </div>
                                                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Projects</h6>
                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <p class="m-b-10 f-w-600">Recent</p>
                                                                        <h6 class="text-muted f-w-400">Guruable Admin</h6>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <p class="m-b-10 f-w-600">Most Viewed</p>
                                                                        <h6 class="text-muted f-w-400">Able Pro Admin</h6>
                                                                    </div>
                                                                </div>
                                                                <ul class="social-link list-unstyled m-t-40 m-b-10">
                                                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook"><i class="feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                                                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter"><i class="feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                                                                    <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram"><i class="feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            --> <!-- wather user -->

                                            <!-- social download  start -->
                                          <!--   <div class="col-xl-4 col-md-6">
                                                <div class="card social-card bg-simple-c-blue">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-auto">
                                                                <i class="feather icon-mail f-34 text-c-blue social-icon"></i>
                                                            </div>
                                                            <div class="col">
                                                                <h6 class="m-b-0">Mail</h6>
                                                                <p>231.2w downloads</p>
                                                                <p class="m-b-0">Lorem Ipsum is simply dummy text of the printing</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="#!" class="download-icon"><i class="feather icon-arrow-down"></i></a>
                                                </div>
                                            </div> -->
                                            <!-- <div class="col-xl-4 col-md-6">
                                                <div class="card social-card bg-simple-c-pink">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-auto">
                                                                <i class="feather icon-twitter f-34 text-c-pink social-icon"></i>
                                                            </div>
                                                            <div class="col">
                                                                <h6 class="m-b-0">twitter</h6>
                                                                <p>231.2w downloads</p>
                                                                <p class="m-b-0">Lorem Ipsum is simply dummy text of the printing</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="#!" class="download-icon"><i class="feather icon-arrow-down"></i></a>
                                                </div>
                                            </div> -->
                                           <!--  <div class="col-xl-4 col-md-12">
                                                <div class="card social-card bg-simple-c-green">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-auto">
                                                                <i class="feather icon-instagram f-34 text-c-green social-icon"></i>
                                                            </div>
                                                            <div class="col">
                                                                <h6 class="m-b-0">Instagram</h6>
                                                                <p>231.2w downloads</p>
                                                                <p class="m-b-0">Lorem Ipsum is simply dummy text of the printing</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="#!" class="download-icon"><i class="feather icon-arrow-down"></i></a>
                                                </div>
                                            </div> -->
                                            <!-- social download  end -->

                                        </div>
                                        
<script type="text/javascript">
window.onload = function () {
  var dataPoints1 = [], dataPoints2 = [];
  var stockChart = new CanvasJS.StockChart("chartContainer",{
    theme: "light2",
    animationEnabled: true,
    title:{
      text:""
    },
    subtitles: [{
      text: "Budget vs Actual Sales"
    }],
    charts: [{
      axisY: {
        title: "Sales value in Rs."
      },
      toolTip: {
        shared: true
      },
      legend: {
            cursor: "pointer",
            itemclick: function (e) {
              if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible)
                e.dataSeries.visible = false;
              else
                e.dataSeries.visible = true;
              e.chart.render();
            }
        },
      data: [{
        showInLegend: true,
        name: "Budget Sales in Rs",
        yValueFormatString: "#,##0",
        xValueType: "dateTime",
        dataPoints : dataPoints1
      },{
        showInLegend: true,
        name: "Actual Sales in Rs",
        yValueFormatString: "#,##0",
        dataPoints : dataPoints2
      }]
    }],
    rangeSelector: {
      enabled: false
    },
    navigator: {
      data: [{
        dataPoints: dataPoints1
      }],
      slider: {
        minimum: new Date(2018, 00, 15),
        maximum: new Date(2018, 02, 01)
      }
    }
  });
 /*  $.getJSON("https://canvasjs.com/data/docs/btcvolume2018.json", function(data) {
    for(var i = 0; i < data.length; i++){
      dataPoints1.push({x: new Date(data[i].date), y: Number(data[i].volume_btc_usd)});
      dataPoints2.push({x: new Date(data[i].date), y: Number(data[i].volume_btc_eur)});
    }
    stockChart.render();
  }); */
  $.get('${pageContext.request.contextPath}/getSalesData', {
     }, function(data) {
    	 for(var i = 0; i < data.length; i++){
    	      dataPoints1.push({x: new Date(data[i].s_date), y: Number(data[i].budget_value)});
    	      dataPoints2.push({x: new Date(data[i].s_date), y: Number(data[i].actual_value)});
    	    }
    	    stockChart.render();
    	 
     }
     );
  
  var myChartGauge = echarts.init(document.getElementById('server-load'));

  var optionGauge = {

          tooltip : {
              formatter: "{b} : {c}%"
          },
          toolbox: {
              show : false,
              feature : {
                  mark : {show: false},
                  restore : {show: false},
                  saveAsImage : {show: true}
              }
          },
          series : [
              {
                  name:'Server Load',
                  type:'gauge',
                  center: ['50%', '50%'],
                  radius: ['0%', '100%'],
                  axisLine: {
                      show: true,
                      lineStyle: {
                          color: [
                              [0.2, '#93BE52'],
                              [0.8, '#4680ff'],
                              [1, '#FC6180']
                          ],
                          width: 10
                      }
                  }  ,
                  title: {
                      show : false,
                      offsetCenter: [0, '120%'],
                      textStyle: {
                          color: '#93BE52',
                          fontSize : 15
                      }
                  }  ,
                  detail: {
                      show : true,
                      backgroundColor: 'rgba(0,0,0,0)',
                      borderWidth: 0,
                      borderColor: '#ccc',
                      width: 100,
                      height: 40,
                      offsetCenter: [0, '40%'],
                      formatter:'{value}%',
                      textStyle: {
                          color: 'auto',
                          fontSize : 20
                      }
                  },

                  data:[{value: 50, name: 'Server Load (MB)'}]
              }
       ]
};

gauge_load_chart(optionGauge);
var timeTicket = setInterval(function (){

gauge_load_chart(optionGauge);
},2000);


function gauge_load_chart(optionGauge){

optionGauge.series[0].data[0].value = (Math.random()*100).toFixed(2) - 0;
myChartGauge.setOption(optionGauge,true);
}


  }
</script>
</body>
</html>