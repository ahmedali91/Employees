using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace EmployeesWebForm
{
    public partial class _Default : Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
         var user=   dataAccess.GetUser(txtUserLogin.Text, txtPassword.Text);
            if(user!=null)
            {
                Session["UserID"] = user.ID;
                Session["UserName"] = user.UserName;
                Session["Name"] = user.Name;
                Response.Redirect("Employees.aspx");
            }
            lblError.Visible = true;
        }
    }
}