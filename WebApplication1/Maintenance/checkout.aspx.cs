using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1.Maintenance
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //validator for date txtbox
            CompareValidator1.ValueToCompare = DateTime.Now.ToShortDateString();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Declare objects
                SqlConnection conn;
                SqlCommand comm;

                // Initialize connection
                string connectionString = ConfigurationManager.ConnectionStrings["disk_inventoryjkConnectionString2"].ConnectionString;
                conn = new SqlConnection(connectionString);

                // Create command
                comm = new SqlCommand(
                   "EXECUTE sp_ins_checkout @borrower_id, @disk_id, @checkout_date", conn);

                // Add parameter
                comm.Parameters.Add("@borrower_id", System.Data.SqlDbType.Int);
                comm.Parameters["@borrower_id"].Value = ddlBorrower.SelectedValue;
                comm.Parameters.Add("@disk_id", System.Data.SqlDbType.Int);
                comm.Parameters["@disk_id"].Value = ddlDisk.SelectedValue;
                comm.Parameters.Add("@checkout_date", System.Data.SqlDbType.Date);
                comm.Parameters["@checkout_date"].Value = txtDate.Text;
                // Enclose database code in Try-Catch-Finally

                try
                {
                    // Open the connection
                    conn.Open();

                    // Execute the command
                    comm.ExecuteNonQuery();

                    // Display completed message
                    Label1.Text = "*** New Item Checked out: " + ddlBorrower.SelectedItem
                        + " & Disk:" + ddlDisk.SelectedItem+" ***";

                    //reset ddl and txtbox to blank
                    ddlDisk.DataBind();
                    ddlBorrower.Text = "";
                    txtDate.Text = "";

                }
                catch (SqlException ex)
                {
                    // Display error message
                    string str;
                    str = "Source:" + ex.Source;
                    str += "\n" + "Number:" + ex.Number.ToString();
                    str += "\n" + "Message:" + ex.Message;
                    str += "\n" + "Class:" + ex.Class.ToString();
                    str += "\n" + "Procedure:" + ex.Procedure.ToString();
                    str += "\n" + "Line Number:" + ex.LineNumber.ToString();
                    str += "\n" + "Server:" + ex.Server.ToString();
                    // Display error message
                    Label1.Text = str;
                }
                finally
                {
                    // Close the connection
                    conn.Close();
                }
            }
        }

     
        //DropDownlist Borrower & Disk Default option text
        protected void ddlDisk_DataBound(object sender, EventArgs e)
        {
            ddlDisk.Items.Insert(0, new ListItem("*** Select Option ***", String.Empty));

        }

        protected void ddlBorrower_DataBound(object sender, EventArgs e)
        {
            ddlBorrower.Items.Insert(0, new ListItem("*** Select Option ***", String.Empty));

        }
    }
}