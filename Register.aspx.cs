using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; 
using System.IO;             

namespace UserInformationSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\chris\\source\\repos\\UserInformationSystem\\App_Data\\UserData.mdf;Integrated Security=True";

                string photoPath = "";
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
                    string query = "INSERT INTO Users (FirstName, LastName, Gender, PhotoPath, Birthdate, Email, PhoneNumber, Address, Pincode, City, State, Username, Password) " +
                                   "VALUES (@FirstName, @LastName, @Gender, @PhotoPath, @Birthdate, @Email, @PhoneNumber, @Address, @Pincode, @City, @State, @Username, @Password)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@Gender", rblGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@PhotoPath", photoPath);

                    // Validate and parse Birthdate safely
                    DateTime birthdate;
                    if (DateTime.TryParse(txtBirthdate.Text, out birthdate))
                        cmd.Parameters.AddWithValue("@Birthdate", birthdate);
                    else
                        cmd.Parameters.AddWithValue("@Birthdate", DBNull.Value);

                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@Pincode", txtPincode.Text);
                    cmd.Parameters.AddWithValue("@City", ddlCity.SelectedValue);
                    cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue);
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                Response.Write("<script>alert('Registration successful!');window.location='Login.aspx';</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = txtLastName.Text = txtEmail.Text = txtPhone.Text = txtAddress.Text =
            txtPincode.Text = txtUsername.Text = txtPassword.Text = "";
            ddlCity.SelectedIndex = 0;
            ddlState.SelectedIndex = 0;
            rblGender.ClearSelection();
        }
    }
}
