<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="EmployeesWebForm.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="Container" dir="ltr">
        <div class="row col-md-12" style="border-bottom: 1px solid #c9921b">
            <p class="col-md-6" style="float: left; font-size: 2.5em">Welcome <%:  Session["Name"]  %>.</p>
            <asp:Button ID="btn_Logout" runat="server" Text="تسجيل خروج" CssClass="btn btn-danger  col-md-1 " OnClick="btn_Logout_Click" />

        </div>
        <div class="row col-md-12" style="margin-top: 25px;">
            <div class="form-horizontal" dir="ltr">
                <h4>&nbsp;&nbsp;</h4>

                <div class="form-group" dir="ltr">
                    <div class="col-md-6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="tb_Name" ForeColor="Red" ValidationGroup="SaveApp"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-md-4">
                        <asp:TextBox ID="tb_Name" runat="server" CssClass="form-control"></asp:TextBox>

                    </div>

                    <asp:Label ID="Label1" runat="server" Text="Name " CssClass="control-label col-md-2"></asp:Label>
                </div>

                <div class="form-group" dir="ltr">
                    <div class="col-md-6">
                         <asp:RegularExpressionValidator ID="valSocial" runat="server"
                            ControlToValidate="tb_SocialID"
                            ErrorMessage="Minimum Social ID length is 10"
                            ValidationExpression=".{10}.*" ForeColor="Red" ValidationGroup="SaveApp" >
                            </asp:RegularExpressionValidator>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                            ControlToValidate="tb_SocialID" runat="server"
                            ErrorMessage="Only Numbers allowed"
                            ValidationExpression="\d+" ForeColor="Red" ValidationGroup="SaveApp">
                        </asp:RegularExpressionValidator>
                    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="tb_SocialID" ForeColor="Red" ValidationGroup="SaveApp"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-md-4">
                        <asp:TextBox ID="tb_SocialID" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>

                    </div>

                    <asp:Label ID="Label2" runat="server" Text="SocialID " CssClass="control-label col-md-2"></asp:Label>
                </div>


                <div class="form-group" dir="ltr">
                    <div class="col-md-6">
                     
                    </div>

                    <div class="col-md-4">

                        <asp:DropDownList ID="DropDownList_Jobs" runat="server"></asp:DropDownList>
                    </div>

                    <asp:Label ID="Label3" runat="server" Text="Job " CssClass="control-label col-md-2"></asp:Label>
                </div>
                <div class="form-group">


                    <div class="col-md-6">
                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="cmbUserTypeID" ForeColor="Red" ValidationGroup="SaveApp"></asp:RequiredFieldValidator>--%>
                    </div>
                    <div class="col-md-4">
                        <asp:RadioButton ID="rb_Gender_male" runat="server" Checked="true" Text="Male" GroupName="gender" />
                        <asp:RadioButton ID="rb_Gender_female" runat="server" Text="Female" GroupName="gender" />

                    </div>
                    <asp:Label ID="Label6" runat="server" Text="Gender" CssClass="control-label col-md-2"></asp:Label>
                </div>

                <div class="form-group">
                    <div class=" col-md-10">

                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="SaveApp" class="btn btn-default" OnClick="btnSave_Click" Width="100px" />





                    </div>
                </div>

            </div>
        </div>




        <div class="row col-md-12" style="margin-top: 25px;">
            <div class="row">
                <p style="text-align: center; font-size: 2.0em">Employees List</p>
            </div>
            <table id="table" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th style="text-align: center;">Delete</th>
                        <th style="text-align: center;">Gender</th>
                        <th style="text-align: center;">Job</th>
                        <th style="text-align: center;">Name</th>
                        <th style="text-align: center;">SocialID</th>





                    </tr>
                </thead>
                <tbody>
                    <asp:HiddenField ID="txtID" runat="server" />
                    <asp:Repeater ID="rpter_Employees" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="lbl_EmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>' Visible="false"></asp:Label>
                            <tr>
                                <td style="text-align: center;">
                                    <asp:Button ID="btn_delete" CssClass="btn btn-danger" Text="Delete" runat="server" OnClick="btn_delete_Click" />
                                    <%-- <a href="Student_Reg_Info.aspx?id=<%# Eval("EmployeeID") %>" style="font-weight: bold;" target="_blank"><button></button></a>--%>

                                </td>
                                <td style="text-align: center;">
                                    <%#   (bool)Eval("Gender") ==true ? "Male" :"Female"  %>
                     
                                </td>
                                <td style="text-align: center;">
                                    <%# Eval("Job.JobTitle") %>
                     
                                </td>
                                <td style="text-align: center;">
                                    <%# Eval("EmployeeName") %>
                                </td>
                                <td style="text-align: center;">
                                    <%# Eval("SocialID") %>
                   
                                </td>






                            </tr>

                        </ItemTemplate>

                    </asp:Repeater>





                </tbody>

            </table>

        </div>

    </div>
    <asp:Button ID="btnDeleteSure" runat="server" Text="-----" Style="display: none;" OnClick="btnDeleteSure_Click" />
</asp:Content>
