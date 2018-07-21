//ID:700678947
//Name:Avinash Gale Narla
//Date:July 14,2018
//Final Project

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Make everything unvisible untill user clicks
        GVOrders.Visible = false;
        ListView1.Visible = false;
        LVUserOrders.Visible = false;
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        //make visible when click event is clicked
        GVOrders.Visible = true;
    }

    protected void btnAllUsers_Click(object sender, EventArgs e)
    {

        //make visible when click event is clicked
        ListView1.Visible = true;
    }


    protected void btnUserOrders_Click(object sender, EventArgs e)
    {

        //make visible when click event is clicked
        LVUserOrders.Visible = true;
    }
}
