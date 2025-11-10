using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UserInformationSystem
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    LoadProfileData(Session["Username"].ToString());
                }
            }
        }

        private void LoadProfileData(string username)
        {
            string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\chris\\source\\repos\\UserInformationSystem\\App_Data\\UserData.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Users WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    lblFullName.Text = dr["FirstName"].ToString() + " " + dr["LastName"].ToString();
                    lblGender.Text = dr["Gender"].ToString();
                    lblBirthdate.Text = Convert.ToDateTime(dr["Birthdate"]).ToString("dd-MM-yyyy");
                    lblEmail.Text = dr["Email"].ToString();
                    lblPhone.Text = dr["PhoneNumber"].ToString();
                    lblAddress.Text = dr["Address"].ToString();
                    lblPincode.Text = dr["Pincode"].ToString();
                    lblCity.Text = dr["City"].ToString();
                    lblState.Text = dr["State"].ToString();
                    lblUsername.Text = dr["Username"].ToString();

                    if (!string.IsNullOrEmpty(dr["PhotoPath"].ToString()))
                        imgPhoto.ImageUrl = dr["PhotoPath"].ToString();
                    else
                        imgPhoto.ImageUrl = "~/Images/default-user.png"; // fallback image
                }
                dr.Close();
                con.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateDetails.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\chris\\source\\repos\\UserInformationSystem\\App_Data\\UserData.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Users WHERE Username=@Username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            Session.Clear();
            Response.Write("<script>alert('Your account has been deleted.');window.location='Register.aspx';</script>");
        }
    }
}