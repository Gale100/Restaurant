//ID:700678947
//Name:Avinash Gale Narla
//Date:July 14,2018
//Final Project

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        //if role exists on page load then do some operations
        if (!Roles.RoleExists("Admin"))
        {
            Roles.CreateRole("Admin");
        }
        if (!Roles.RoleExists("User"))
        {
            Roles.CreateRole("User");
        }
    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        Session["userName"] = CreateUserWizard1.UserName;
        if (chkAdmin.Checked)
        {//if marketing is selected thhen add that user to this role
            Roles.AddUserToRole(CreateUserWizard1.UserName, "Admin");
            Response.Redirect("~/Admin/Admin.aspx");
            
        }
        else
        {
            //if CR is selected thhen add that user to this role
            Roles.AddUserToRole(CreateUserWizard1.UserName, "User");
            Response.Redirect("~/User/Products.aspx");

        }
    }

    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        Session["userName"] = Login1.UserName;
        //If user belongs to marketing then give access to marketing page
        if (User.IsInRole("Admin"))
        { Response.Redirect("~/Admin/Admin.aspx"); }
        //If user belongs to CR then give access to orders page
        if (User.IsInRole("User"))
        { Response.Redirect("~/User/Products.aspx"); }
    }
}
