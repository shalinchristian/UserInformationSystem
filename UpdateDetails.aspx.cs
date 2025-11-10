using System;
using System.Data.SqlClient;
using System.IO;

namespace UserInformationSystem
{
    public partial class UpdateDetails : System.Web.UI.Page
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
                    LoadUserDetails();
                }
            }
        }

        private void LoadUserDetails()
        {
            string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\chris\\source\\repos\\UserInformationSystem\\App_Data\\UserData.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT Email, PhoneNumber, Address, Pincode, City, State, PhotoPath FROM Users WHERE Username=@Username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtEmail.Text = reader["Email"].ToString();
                    txtPhone.Text = reader["PhoneNumber"].ToString();
                    txtAddress.Text = reader["Address"].ToString();
                    txtPincode.Text = reader["Pincode"].ToString();
                    ddlCity.SelectedValue = reader["City"].ToString();
                    ddlState.SelectedValue = reader["State"].ToString();

                    string photoPath = reader["PhotoPath"].ToString();
                    imgProfile.ImageUrl = !string.IsNullOrEmpty(photoPath) ? photoPath : "~/Uploads/default.png";
                }
                con.Close();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\chris\\source\\repos\\UserInformationSystem\\App_Data\\UserData.mdf;Integrated Security=True";

                string photoPath = imgProfile.ImageUrl; // keep old one by default

                if (fuPhoto.HasFile)
                {
                    string folderPath = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);

                    photoPath = "~/Uploads/" + Path.GetFileName(fuPhoto.FileName);
                    fuPhoto.SaveAs(Server.MapPath(photoPath));
                }

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "UPDATE Users SET Email=@Email, PhoneNumber=@PhoneNumber, Address=@Address, Pincode=@Pincode, City=@City, State=@State, PhotoPath=@PhotoPath WHERE Username=@Username";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@Pincode", txtPincode.Text);
                    cmd.Parameters.AddWithValue("@City", ddlCity.SelectedValue);
                    cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue);
                    cmd.Parameters.AddWithValue("@PhotoPath", photoPath);
                    cmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                Response.Write("<script>alert('Details updated successfully!');window.location='Profile.aspx';</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}
