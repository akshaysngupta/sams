<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="Classes/includes.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manager | Home</title>
    <meta charset="UTF-8">
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="css/bootstrap-formhelpers.css" rel="stylesheet" media="screen">
</head>

<body>
    <div class="container-fluid">
        <div class="row alert alert-info">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="text-center">Students' Auditorium Management System</h1>
            </div>
        </div>
        <div class="row">

            <div class="col-md-1 col-sm-1 col-md-offset-1 col-sm-offset-1 hidden-xs">
                <ul class="nav nav-pills nav-stacked alert alert-info" style="position:fixed">
                  <li class="active"><a href="#table_show">Show Details</a></li>
                  <li><a href="#book">Book Show</a></li>
                  <li><a href="#newlogin">Create Login</a></li>
                  <li><a href="#deletelogin">Delete Login</a></li>
                  <li><a href="#updatelogin">Update Login</a></li>
                  <li><a href="#pay">Pay Commission</a></li>
                  <li><a href="#showreport">Get Show Report</a></li>
                  <li><a href="#table_report">Finance Report</a></li>
                  <li><a href="#table_transaction">Transaction Details</a></li>
                  <li><a href="#table_expense">Expense Details</a></li>
                  <li><a href="#table_employee">Employee Details</a></li>
                </ul>
            </div>

            <div class="col-md-6 col-md-offset-1 col-sm-6 col-sm-offset-1 col-xs-12">

                <div class="row alert alert-success">
                    <h3 class="text-center">
                        <strong>
                            Manager Home
                        </strong>
                    </h3>
                    <p class="text-center">Welcome <%=session.getAttribute("user").toString()%>!</p>
                    <a href="Logout.jsp"><strong>Logout</strong></a>
                </div>

                <div class="row">
                    <h3 class="text-center">Show Details</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_show">
                            <tr class="info">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Price - Ord</th>
                                <th>Price - Bal</th>
                                <th>Seats - Ord</th>
                                <th>Seats - Bal</th>
                                <th>Percent Commission</th>
                            </tr>
                            <%
                            ShowTable st = new ShowTable();
                            List<Show> sl = st.listShow();
                            for(int i=0;i<sl.size();i++)
                            {
                            %>
                                <tr>
                                    <td><%=sl.get(i).sId%></td>
                                    <td><%=sl.get(i).sName%></td>
                                    <td><%=sl.get(i).sDate%></td>
                                    <td><%=sl.get(i).eDate%></td>
                                    <td><%=sl.get(i).pOrd%></td>
                                    <td><%=sl.get(i).pBal%></td>
                                    <td><%=sl.get(i).mOrd%></td>
                                    <td><%=sl.get(i).mBal%></td>
                                    <td><%=sl.get(i).pCommission%></td>
                                </tr>
                            <% } %>
                        </table>
                    </div>
                </div>

                <div class="row alert alert-info" id="book">
                    <h3 class="text-center">Book New Show</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_manager.jsp">
                        <input type="hidden" name="opr" value=1>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Show Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="book_name" placeholder="Show Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Start Date</label>
                            <div class="col-sm-8">
                                <div class="bfh-datepicker" data-format="d-m-y" data-date="today" id="book_start">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">End Date</label>
                            <div class="col-sm-8">
                                <div class="bfh-datepicker" data-format="d-m-y" data-date="today" id="book_end">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max Price - Balcony</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon">Rs.</span>
                                    <input type="text" class="form-control" name="book_pricebal" placeholder="Max Price - Balcony">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max price - Ordinary</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon">Rs.</span>
                                    <input type="text" class="form-control" name="book_priceord" placeholder="Max price - Ordinary">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max seats - Balcony</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control bfh-number" name="book_seatbal">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Max seats - Ordinary</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control bfh-number" name="book_seatord">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Percent Commission</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control bfh-number" data-max="100" name="book_pcommission">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Book Show</button>
                            </div>
                        </div>
                    </form>
                </div>


                <div class="row alert alert-info" id="newlogin">
                    <h3 class="text-center">Create New Salesperson Login</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_manager.jsp">
                        <input type="hidden" name="opr" value=2>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Employee Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="newlogin_name" placeholder="Employee Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Password</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="newlogin_pwd" placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Create Login</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row alert alert-info" id="deletelogin">
                    <h3 class="text-center">Delete Existing Salesperson Login</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_manager.jsp">
                        <input type="hidden" name="opr" value=3>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">User ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="deletelogin_userid" placeholder="User ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Delete Login</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row alert alert-info" id="updatelogin">
                    <h3 class="text-center">Update Existing Salesperson Details</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_manager.jsp">
                        <input type="hidden" name="opr" value=4>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">User ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="updatelogin_userid" placeholder="User ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">New Password</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="updatelogin_pwd" placeholder="New Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Update</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row alert alert-info" id="pay">
                    <h3 class="text-center">Pay Commission</h3>
                    <form class="form-horizontal" role="form" method="POST" action="actions/action_manager.jsp">
                        <input type="hidden" name="opr" value=5>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Employee ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="pay_eid" placeholder="Employee ID">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Amount to Pay</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <span class="input-group-addon">Rs.</span>
                                    <input type="text" class="form-control" name="pay_amt" placeholder="Amount to Pay">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Pay Commission</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row alert alert-info" id="showreport">
                    <h3 class="text-center">Generate Show Report</h3>
                    <form class="form-horizontal" role="form" method="POST" action="showReport.jsp">
                        <input type="hidden" name="opr" value=6>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-4 control-label">Show ID</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="showreport_id" placeholder="Employee ID">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-default">Generate</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="row">
                    <h2 class="text-center" id="table_report"><strong>Financial Report</strong></h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <tr class="info">
                                <th>Commission(-)</th>
                                <th>Expense(-)</th>
                                <th>Tickets(+)</th>
                                <th>Net Profit(+)</th>
                            </tr>
                            <%
                            EmployeeTable et = new EmployeeTable();
                            ExpenseTable ext = new ExpenseTable();
                            TransactionTable tt = new TransactionTable();
                            %>
                                <tr>
                                    <td><%=et.totalCommission()%></td>
                                    <td><%=ext.totalExpense()%></td>
                                    <td><%=tt.totalTransaction()%></td>
                                    <td><%=et.netProfit()%></td>
                                </tr>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <h3 class="text-center">Transaction Details</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_transaction">
                            <tr class="info">
                                <th>Transaction ID</th>
                                <th>Show ID</th>
                                <th>Employee ID</th>
                                <th>Booking Date</th>
                                <th>Seats - Ord</th>
                                <th>Seats - Bal</th>
                                <th>Amount</th>
                                <th>Refund</th>
                            </tr>
                            <%
                            List<Transaction> tl = tt.listAllTransaction();
                            for(int i=0;i<tl.size();i++)
                            {
                            %>
                                <tr>
                                    <td><%=tl.get(i).tId%></td>
                                    <td><%=tl.get(i).sId%></td>
                                    <td><%=tl.get(i).eId%></td>
                                    <td><%=tl.get(i).bDate%></td>
                                    <td><%=tl.get(i).nOrd%></td>
                                    <td><%=tl.get(i).nBal%></td>
                                    <td><%=tl.get(i).amount%></td>
                                    <td><%=tt.refundAmount(tl.get(i))%></td>
                                </tr>
                            <% } %>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <h3 class="text-center">Expenses Details</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_expense">
                            <tr class="info">
                                <th>Expense ID</th>
                                <th>Show ID</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Date</th>
                                <th>Amount</th>
                            </tr>
                            <%
                            List<Expense> exl = ext.listExpense();
                            for(int i=0;i<exl.size();i++)
                            {
                            %>
                                <tr>
                                    <td><%=exl.get(i).exId%></td>
                                    <td><%=exl.get(i).sId%></td>
                                    <td><%=exl.get(i).exTitle%></td>
                                    <td><%=exl.get(i).exDescription%></td>
                                    <td><%=exl.get(i).exDate%></td>
                                    <td><%=exl.get(i).amount%></td>
                                </tr>
                            <% } %>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <h3 class="text-center">Employee Details</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_employee">
                            <tr class="info">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Amount to be Paid</th>
                            </tr>
                            <%
                            EmployeeTable ee = new EmployeeTable();
                            List<Employee> el = ee.listEmployee();
                            for(int i=0;i<el.size();i++)
                            {
                            %>
                                <tr>
                                    <td><%=el.get(i).eId%></td>
                                    <td><%=el.get(i).eName%></td>
                                    <td><%=((el.get(i).eType==0)?"Manager":((el.get(i).eType==1)?"Clerk":"Salesperson"))%></td>
                                    <td><%=el.get(i).eCommission-el.get(i).ePaid%></td>
                                </tr>
                            <% } %>
                        </table>
                    </div>
                </div>


            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap JavaScript -->

    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-formhelpers.js"></script>
    
    <script>
        
        $( document ).ready(function() {
            $('#book_start').find('div.input-group').find('input').attr("name", "book_sdate");
            $('#book_end').find('div.input-group').find('input').attr("name", "book_edate");
            // change color if no seats available
            $('#table_show tr').each(function() {
                var temp1 = $(this).find("td").eq(6).html();
                var temp2 = $(this).find("td").eq(7).html();
                if(temp1 == "0" && temp2 == "0")
                    $(this).attr("class","danger");
            });
        });
    </script>
    <script>
    $('li').click(function() {
        if (!$(this).hasClass('active')) {
            $('li.active').removeClass('active');
            $(this).addClass('active');
        }
    });
    </script>

</body>

</html>