using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UserInformationSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\chris\\source\\repos\\UserInformationSystem\\App_Data\\UserData.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Username=@Username AND Password=@Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                con.Open();
                int count = (int)cmd.ExecuteScalar();
                con.Close();

                if (count == 1)
                {
                    // Store session
                    Session["Username"] = txtUsername.Text;

                    // Optional cookie if "Remember Me" checked
                    if (chkRemember.Checked)
                    {
                        Response.Cookies["Username"].Value = txtUsername.Text;
                        Response.Cookies["Username"].Expires = DateTime.Now.AddDays(5);
                    }

                    Response.Write("<script>alert('Login successful!');window.location='Profile.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Invalid username or password!');</script>");
                }
            }
        }
    }
}
