//ID:700678947
//Name:Avinash Gale Narla
//Date:July 14,2018
//Final Project

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Payments : System.Web.UI.Page
{
    //variables declaration
    double price;
    double chkn;
    double veg;
    double meat;
    double fish;
    string readValue;
    string userName;
    string emailId;
    string selectSQL;
    double orderID;
    
    string Name;
    string orderType = "Pick Up";
    string deliveryAddress = "Gale's Restaurant </br> 509, Anderson Street,Warrensburg,Missouri,64093</br>Ph:+1 660-441-9379";
    string delDate;
    string paymentType = "Debit Card";
    //constant value
    const double DELIVERY_CHARGE = 2;

    //declare connection string for the new database created as NewDB
    private string connectionString =
  WebConfigurationManager.ConnectionStrings["NewDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        //Session varible for the username to display
        if (Session["userName"] != null)
        {
            userName = Session["userName"].ToString();
        }
        //Load maximum orderID from database and add 1 to store for new order as viewstate
        if (ViewState["orderID"] != null)
        {
            orderID = (double)(ViewState["orderID"]);
        }

        lblOutput.Text = "Your Order Details !!!</br>";
        //QueryString methods to retrieve the values
        foreach (String key in Request.QueryString.AllKeys)
        {

            if (key == "charge")
            {
                price = double.Parse(Request.QueryString["charge"]);
                lblPrice.Text = "Total Price :" + price.ToString() + "</br>";
            }
            if (key == "chkn")
            {
                chkn = double.Parse(Request.QueryString["chkn"]);
                lblOutput.Text += "Chicken Biryani :" + chkn.ToString() + "</br>";
            }
            if (key == "veg")
            {
                veg = double.Parse(Request.QueryString["veg"]);
                lblOutput.Text += "Veg Biryani :" + veg.ToString() + "</br>";
            }
            if (key == "meat")
            {
                meat = double.Parse(Request.QueryString["meat"]);
                lblOutput.Text += "Meat Biryani :" + meat.ToString() + "</br>";
            }
            if (key == "fish")
            {
                fish = double.Parse(Request.QueryString["fish"]);
                lblOutput.Text += "Fish Biryani :" + fish.ToString() + "</br>";
            }
        }
    }

    protected void radOrderType_SelectedIndexChanged(object sender, EventArgs e)
    {
        //If radio button is changed then the adress box should be enabled/disabled
        if (radOrderType.SelectedIndex == 0)
        {
            txtDelAddress.Enabled = false;
            lblOrderType.Text = "Pick Up is Not available on Sunday";
        }
        else
        {
            txtDelAddress.Enabled = true;
            lblOrderType.Text = "Delivery is not available on Weekends and Delivery Fee is $2.";
        }
    }
    protected void radPayment_SelectedIndexChanged(object sender, EventArgs e)
    {
        //If radio button is changed then the Pin box should be enabled/disabled
        if (radPayment.SelectedIndex == 0)
        {
            txtPin.Enabled = false;
        }
        else
        {
            txtPin.Enabled = true;
        }
    }

    protected void calDelivery_SelectionChanged(object sender, EventArgs e)
    {
        //if delivery date is less then equal to 2 days
        if (calDelivery.SelectedDate > DateTime.Now.Add(new TimeSpan(3, 0, 0, 0)))
        {
            lblError.Text = "Delivery date must be at least 3 days from now";
        }
        else
        {
            lblError.Text = " ";
        }
    }

    protected void calDelivery_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date.Date < DateTime.Now.Date)
        {
            //if date selected is for past days
            e.Day.IsSelectable = false;
            e.Cell.ToolTip = "Not Available";
        }

        if (radOrderType.SelectedIndex == 0)
        {
            //if pick up
            if (e.Day.Date.DayOfWeek == 0 || e.Day.Date.Year > DateTime.Now.Year)
            {
                //disable sunday and next year also
                e.Day.IsSelectable = false;
                e.Cell.ToolTip = "Not Available";
            }

        }
        else
        {//if delivery
            if (e.Day.IsWeekend || e.Day.Date.Year > DateTime.Now.Year)
            {//disable weekends
                e.Day.IsSelectable = false;
                e.Cell.ToolTip = "Not Available";
            }
        }
    }

    protected void btnCompletePayment_Click(object sender, EventArgs e)
    {
        try
        {//exception handling
            if (!string.IsNullOrWhiteSpace(txtName.Text))
            {//check if not empty
                Name = txtName.Text;
                if (radOrderType.SelectedIndex != -1)
                {
                    if (radOrderType.SelectedIndex == 1)
                    {
                        orderType = "Delivery";
                        price = price + DELIVERY_CHARGE;
                        deliveryAddress = txtDelAddress.Text;
                    }
                    if ((txtDelAddress.Text.Length > 0 && radOrderType.SelectedIndex == 1) || radOrderType.SelectedIndex == 0)
                    {
                        //if text address is not empty
                        if (calDelivery.SelectedDate.Date != DateTime.MinValue.Date)
                        {
                            //if delivery date is selected
                            delDate = calDelivery.SelectedDate.Date.ToShortDateString();
                            if (radPayment.SelectedIndex == 0)
                            {
                                paymentType = "Credit Card";
                            }

                            /////////////////////    CODE  Calculation       //////////////////
                            selectSQL = "SELECT Count(OrderId) as Count FROM Orders ";
                            getOrderCount(selectSQL);//call getordercount method
                            orderID = double.Parse(readValue);
                            orderID += 1;//increment 1 to make as next order

                            lblConf.Text = "Thanks for the payment!! Here is Your Confirmation." + "</br>" +
                                "Your Order ID:" + orderID.ToString() + "</br>" +
                                "User Name:    " + userName + "</br>" +
                                "Deliver To:    " + Name + "</br>" +
                                "Email ID:     " + txtEmail.Text + "</br>" +
                                "Order Type:   " + orderType + "</br>" +
                                "Address:      " + deliveryAddress + "</br>" +
                                "Delivery Date:" + delDate + "</br>" +
                                "Payment Type: " + paymentType;
                            ViewState["orderID"] = orderID;
                            //insert into database
                            InsertData();
                        }
                        else
                        {
                            lblError.Text = "Select a Date";
                        }
                    }
                    else
                    {
                        lblError.Text = "Delivery Adrress is required";
                    }
                }
                else
                {
                    lblError.Text = "Select a Delivery Type";
                }
            }
            else
            {
                lblError.Text = "Enter a Valid Name";
            }
        }
        catch
        {
            lblError.Text = "Please fix the Errors";
        }
    }  
         protected void InsertData()
         {
            // Define ADO.NET objects.
            string insertSQL;
            insertSQL = "INSERT INTO Orders (";
            insertSQL += "OrderId, OrderType, ";
            insertSQL += "DeliveryAddress, DeliveryDate, PaymentType, TotalPrice, Details, UserName) ";
            insertSQL += "VALUES (";
            insertSQL += "@OrderId, @OrderType, ";
            insertSQL += "@DeliveryAddress, @DeliveryDate, @PaymentType, @TotalPrice, @Details, @UserName)";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(insertSQL, con);
        

        // Add the parameters.
            cmd.Parameters.AddWithValue("@OrderId", orderID);
            cmd.Parameters.AddWithValue("@OrderType", orderType);
            cmd.Parameters.AddWithValue("@DeliveryAddress", deliveryAddress);
            cmd.Parameters.AddWithValue("@DeliveryDate", delDate);
            cmd.Parameters.AddWithValue("@PaymentType", paymentType);
            cmd.Parameters.AddWithValue("@TotalPrice", price);
            cmd.Parameters.AddWithValue("@Details", lblOutput.Text);
            cmd.Parameters.AddWithValue("@UserName", userName);

            // Try to open the database and execute the update.
            int added = 0;
            try
            {
                con.Open();
                added = cmd.ExecuteNonQuery();
                lblError.Text = "Your Order is pushed into our pockets.";
            }
            catch (Exception err)
            {
            lblError.Text = "Error inserting record. ";
            lblError.Text += err.Message;
            }
            finally
            {
                con.Close();
            }
       } 
        
     

    protected void getOrderCount(string selectSQL)
    {
        // string selectSQL;
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        // Try to open database and read information.
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            reader.Read();

            // Fill the controls.
            readValue = reader["Count"].ToString();
            reader.Close();
            lblError.Text = "";
        }
        catch (Exception err)
        {
            lblError.Text = "Error getting Order Count. ";
            lblError.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //inserting comments for the order
        string comment = null;
        if (!string.IsNullOrWhiteSpace(txtName.Text))
        {//check for non empty values
            comment = txtFeedback.Text;
        }
        else
        {
            lblError.Text = "Please Enter a Correct Value";
        }
            string insertSQL;
        insertSQL = "INSERT INTO CommentsTB (";
        insertSQL += "OrderId, Comment) ";
        insertSQL += "VALUES (";
        insertSQL += "@OrderId, @Comment)";

 
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(insertSQL, con);

        // Add the parameters.
        cmd.Parameters.AddWithValue("@OrderId", orderID);
        cmd.Parameters.AddWithValue("@Comment", comment);

        // Try to open the database and execute the update.
        int added = 0;
        try
        {
            con.Open();
            added = cmd.ExecuteNonQuery();
            lblError.Text = "Thank you for the Comments.";
        }
        catch (Exception err)
        {
            lblError.Text = "Error inserting record. ";
            lblError.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
     protected void btnReset_Click(object sender, EventArgs e)
     {
         txtName.Text = null;
         txtEmail.Text = null;
         radOrderType.SelectedIndex = -1;
         txtDelAddress.Text = null;
         calDelivery.SelectedDates.Clear();
         radPayment.SelectedIndex = -1;
         txtCredit.Text = null;
         ddExpMonth.SelectedIndex = -1;
         txtYear.Text = null;
         txtCvv.Text = null;
         txtYear.Text = null;
         lblOrderType.Text = null;
         lblOutput.Text = null;
         lblPrice.Text = null;
         lblError.Text = null;
     }

}