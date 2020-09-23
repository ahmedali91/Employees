using DAL;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeesWebForm
{
    public partial class About : Page
    {
        DAL.DataAccess dataAccess = new DAL.DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserID"].ToString() == "")
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
                Response.Cache.SetNoStore();
                Response.Redirect("Default.aspx");

            }
            if (!IsPostBack)
            {
                LoadEmployees();
                LoadJobs();
            }


        }
        private void LoadEmployees()
        {
            rpter_Employees.DataSource = dataAccess.GetEmployees();
            rpter_Employees.DataBind();
        }
     
        private void LoadJobs()
        {
            
            DropDownList_Jobs.DataSource = dataAccess.GetJobs();
            DropDownList_Jobs.DataValueField = "JobID";
            DropDownList_Jobs.DataTextField = "JobTitle";
            DropDownList_Jobs.DataBind();

           
        }
        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Default.aspx");

        }



        protected void btn_delete_Click(object sender, EventArgs e)
        {
            try
            {
                string str = "";
                str = "swal({";
                str += "title: 'Delete Employee',";
                str += " text: 'All Employee Data will be removed',";
                str += " type: 'warning',";
                str += " showCancelButton: true,";
                str += " confirmButtonColor: '#DD6B55',";
                str += " confirmButtonText: ' Delete',";
                str += " cancelButtonText: 'Cancel',";
                str += " closeOnConfirm: false";
                str += " },";
                str += " function(){";
                str += "  document.getElementById('MainContent_btnDeleteSure').click();";
                str += " });";

                var btn = (Button)sender;

                var item = (RepeaterItem)btn.NamingContainer;
                var lblID = (Label)item.FindControl("lbl_EmployeeID");
                txtID.Value = lblID.Text;

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", str, true);

            }
            catch (Exception)
            {
            }
        }

        protected void btnDeleteSure_Click(object sender, EventArgs e)
        {

            try
            {
               var employee= dataAccess.DeleteEmployee(Convert.ToInt32(txtID.Value));
                if (employee != null)
                {
                    txtID.Value = "";
                    LoadEmployees();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal('Employee deleted Successfully', '', 'success');", true);
                    
                }
            }
            catch(Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal('"+ex.Message+"', '', 'error');", true);
            }
           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //get emp data from form controls
            try
            {
                var socialId = tb_SocialID.Text;
                var name = tb_Name.Text;
                var gender = rb_Gender_male.Checked;
                var job = Convert.ToInt32(DropDownList_Jobs.SelectedValue);
                // check data
                if (socialId.Length != 10 || socialId.IsNullOrWhiteSpace() || name.IsNullOrWhiteSpace())
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal('Please Enter Valid Data', '', 'error');", true);
                }
                else
                {
                    var emp = dataAccess.GetEmployeeBySocialID(socialId);
                    if (emp == null)
                    {
                        Employee newEmp = new Employee
                        {
                            EmployeeName = name,
                            SocialID = socialId,
                            Gender = gender,
                            JobID=job
                        };
                        dataAccess.AddEmployee(newEmp);
                        LoadEmployees();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal('Employee Added Successfully  ', '', 'success');", true);
                    }

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal('Employee already exist  ', '', 'error');", true);
                }
            }
            catch( Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal('" + ex.Message + "', '', 'error');", true);
            }
          

        }
    }
}