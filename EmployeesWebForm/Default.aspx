<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmployeesWebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<form id="login" runat="server">--%>
    
        <div class="container body-content" style="padding-top: 60px;">

            <div class="form-horizontal">




                <table class="tableLogin" cellpadding="20" style="font-size:1.0em;">
                    <tr>
                        <td style="text-align: center; color: #01703d; font-weight: 700; font-size:1.5em; border-bottom: 2px solid #c9921b;" class="auto-style1">Login</td>
                    </tr>
                    <tr>

                        <td style="background: #EDEDED; padding-top: 30px; align-items: center; text-align: center;" class="auto-style2">

                            <table style="width: 100%; text-align: center;" cellpadding="5">

                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="UserName" CssClass="control-label" ></asp:Label>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtUserLogin" runat="server" CssClass="form-controlLogin" placeholder="UserName" Width="158px"></asp:TextBox>


                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtUserLogin" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text=" Password" CssClass="control-label"></asp:Label>

                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-controlLogin" placeholder="Password" TextMode="Password" Width="152px"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                    </td>

                                </tr>
                            </table>



                            <asp:Label ID="lblError" runat="server" Text="UserName Or Password Not Correct" ForeColor="red" Visible="false"></asp:Label>

                        </td>

                    </tr>

                    <tr>
                        <td style="text-align: center; color: #adadad; font-weight: 700; font-size: 16px; border-bottom: 2px solid #c9921b;" class="auto-style1">

                            <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-default" ValidationGroup="Login" OnClick="btnLogin_Click"></asp:Button>


                        </td>
                    </tr>

                </table>
                </>


                <br />
                <br />








            </div>



        </div>





   <%-- </form>--%>
</asp:Content>
