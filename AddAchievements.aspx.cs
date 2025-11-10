using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UserInformationSystem
{
    public partial class AddAchievements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\chris\\source\\repos\\UserInformationSystem\\App_Data\\UserData.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // Retrieve UserID from Users table using Username
                string getIdQuery = "SELECT UserID FROM Users WHERE Username=@Username";
                SqlCommand getIdCmd = new SqlCommand(getIdQuery, con);
                getIdCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());

                con.Open();
                object userIdObj = getIdCmd.ExecuteScalar();
                con.Close();

                if (userIdObj != null)
                {
                    int userId = Convert.ToInt32(userIdObj);

                    string query = "INSERT INTO Achievements (UserID, ExamType, InstituteName, BoardUniversity, PassingYear, Percentage, AdditionalInfo) " +
                                   "VALUES (@UserID, @ExamType, @InstituteName, @BoardUniversity, @PassingYear, @Percentage, @AdditionalInfo)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@ExamType", ddlExamType.SelectedValue);
                    cmd.Parameters.AddWithValue("@InstituteName", txtInstitute.Text);
                    cmd.Parameters.AddWithValue("@BoardUniversity", txtBoard.Text);
                    cmd.Parameters.AddWithValue("@PassingYear", txtYear.Text);
                    cmd.Parameters.AddWithValue("@Percentage", txtPercentage.Text);
                    cmd.Parameters.AddWithValue("@AdditionalInfo", txtInfo.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Achievement added successfully!');window.location='AchievementsList.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('User not found! Please log in again.');window.location='Login.aspx';</script>");
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlExamType.SelectedIndex = 0;
            txtInstitute.Text = txtBoard.Text = txtYear.Text = txtPercentage.Text = txtInfo.Text = "";
        }
    }
}
