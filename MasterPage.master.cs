//ID:700678947
//Name:Avinash Gale Narla
//Date:July 14,2018
//Final Project

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if the user is logged in then display the username in login status
        string name;
        if (Session["userName"] != null)
        {
            name = Session["userName"].ToString();
            lblName.Text = Session["userName"].ToString();
        }
        else
        {//else display as guest
            lblName.Text = "Guest"; 
            }
    }

}
