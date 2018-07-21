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

public partial class User_Products : System.Web.UI.Page
{
    //all the variables used are declared here
    double charge = 0;
    double chknQunatity;
    double vegQunatity;
    double meatQunatity;
    double fishQunatity;
    double quantity;
    //flags declaration
    Boolean cquan;
    Boolean vquan;
    Boolean fquan;
    Boolean mquan;
    Boolean cprice;
    //variables for editing cart
    double vscq;
    double vsvq;
    double vsmq;
    double vsfq;
    //price constants
    const double chknPrice = 15;
    const double vegPrice = 12;
    const double meatPrice = 25;
    const double fishPrice = 18;

    protected void Page_Load(object sender, EventArgs e)
    {
        //validations required to validation mode
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        //check the values when the page is loaded 
        if (ViewState["charge"] != null)
        {
            charge = (double)(ViewState["charge"]);
        }
        if (ViewState["chknQunatity"] != null)
        {
            vscq = (double)(ViewState["chknQunatity"]);
        }
        if (ViewState["vegQunatity"] != null)
        {
            vsvq = (double)(ViewState["vegQunatity"]);
        }
        if (ViewState["meatQunatity"] != null)
        {
            vsmq = (double)(ViewState["meatQunatity"]);
        }
        if (ViewState["fishQunatity"] != null)
        {
            vsfq = (double)(ViewState["fishQunatity"]);
        }

    }
    protected void Page_PreRender(object sender, EventArgs e)
    {

        //Store total charge and other values in the ViewState
        ViewState["charge"] = charge;
        if (cquan)
        {
            ViewState["chknQunatity"] = quantity;
        }
        else
        {
            ViewState["chknQunatity"] = vscq;
        }
        if (vquan)
        {
            ViewState["vegQunatity"] = quantity;
        }
        else
        {
            ViewState["vegQunatity"] = vsvq;
        }
        if (mquan)
        {
            ViewState["meatQunatity"] = quantity;
        }
        else
        {
            ViewState["meatQunatity"] = vsmq;
        }
        if (fquan)
        {
            ViewState["fishQunatity"] = quantity;
        }
        else
        {
            ViewState["fishQunatity"] = vsfq;
        }
    }
    protected void btnAddCart_Click(object sender, EventArgs e)
    {
        lblErr.Text = null;
        //check for the items
        chknQunatity = ddChknQuantity.SelectedIndex;
        vegQunatity = ddVegQuantity.SelectedIndex;
        meatQunatity = ddMeatQuantity.SelectedIndex;
        fishQunatity = ddFishQuantity.SelectedIndex;

        if ((chknQunatity != 0) || (vegQunatity != 0) || (meatQunatity != 0) || (fishQunatity != 0))
        {
            //if atleast one item is selected
            vscq = vscq + chknQunatity;
            vsvq = vsvq + vegQunatity;
            vsmq = vsmq + meatQunatity;
            vsfq = vsfq + fishQunatity;
            //calculate price
            charge = charge + (chknQunatity * chknPrice) + (vegQunatity * vegPrice) +
                             (meatQunatity * meatPrice) + (fishQunatity * fishPrice);
            //display them in labels
            lblOutput.Text = charge.ToString();
            lblContents.Text = "Chicken Biryani :" + vscq.ToString() + "</br>" +
                               "Veg Biryani :" + vsvq.ToString() + "</br>" +
                               "Meat Quantity :" + vsmq.ToString() + "</br>" +
                               "Fish Quantity :" + vsfq.ToString();

            //reset all the items and quantities selected after adding to the cart
            ddChknQuantity.SelectedIndex = -1;
            ddVegQuantity.SelectedIndex = -1;
            ddMeatQuantity.SelectedIndex = -1;
            ddFishQuantity.SelectedIndex = -1;
        }
        else
        {
            lblErr.Text = "Please add atleast one item to the cart";
        }
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        lblErr.Text = null;

        if ((vscq != 0) || (vsvq != 0) || (vsmq != 0) || (vsfq != 0))
        {//check for the empty cart
            //Query String Information Handling
            
            string url = "payments.aspx?";
            url += "charge=" + charge.ToString() + "&";
            if (vscq != 0)
            {
                url += "chkn=" + vscq.ToString() + "&";
            }
            if (vsvq != 0)
            {
                url += "veg=" + vsvq.ToString() + "&";
            }
            if (vsmq != 0)
            {
                url += "meat=" + vsmq.ToString() + "&";
            }
            if (vsfq != 0)
            {
                url += "fish=" + vsfq.ToString();

            }
            Response.Redirect(url);
        }
        else
        {
            lblErr.Text = "Please add this item to the cart and click place order";
        }

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        // string item = null;
        if (!string.IsNullOrWhiteSpace(txtEditCart.Text))
        {//if text box is not empty
            quantity = double.Parse(txtEditCart.Text);
            lblErr.Text = null;

            if (ddEditCart.SelectedIndex != -1)
            {
                //if atleast one item is selected
                if (ddEditCart.SelectedIndex == 0)
                {
                    if (vscq != 0)
                    {//check if this item is in cart
                        cquan = true;//flag is set
                        vscq = quantity;
                        //store this item into state
                        ViewState["chknQunatity"] = quantity;
                    }
                    else
                    {
                        lblErr.Text = "Please add this item to the cart and proceed";
                    }
                }
                //repeat for every value
                if (ddEditCart.SelectedIndex == 1)
                {
                    if (vsvq != 0)
                    {
                        vquan = true;
                        vsvq = quantity;
                        ViewState["vegQunatity"] = quantity;
                    }
                    else
                    {
                        lblErr.Text = "Please add this item to the cart and proceed";
                    }
                }
                if (ddEditCart.SelectedIndex == 2)
                {
                    if (vsfq != 0)
                    {
                        fquan = true;
                        vsfq = quantity;
                        ViewState["fisQunatity"] = quantity;
                    }
                    else
                    {
                        lblErr.Text = "Please add this item to the cart and proceed";
                    }
                }
                if (ddEditCart.SelectedIndex == 3)
                {
                    if (vsmq != 0)
                    {
                        mquan = true;
                        vsmq = quantity;
                        ViewState["meatQunatity"] = quantity;
                    }
                    else
                    {
                        lblErr.Text = "Please add this item to the cart and proceed";
                    }
                }
            }
            else
            {
                lblErr.Text = "Please select an item to edit";
            }
            lblEdited.Text = "Cart Edited" + "</br>";
            lblContents.Text =" Chicken Biryani :" + vscq.ToString() + "</br>" +
                       "Veg Biryani :" + vsvq.ToString() + "</br>" +
                       "Meat Quantity :" + vsmq.ToString() + "</br>" +
                       "Fish Quantity :" + vsfq.ToString();
        }

        else
        {

            lblErr.Text = "Please Enter quantity to edit.";

        }
        //calculation of price after editing the cart
        charge = (vscq * chknPrice) + (vsvq * vegPrice) +
                 (vsmq * meatPrice) + (vsfq * fishPrice);

        lblOutput.Text = charge.ToString();
    }

}