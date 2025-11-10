using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace UserInformationSystem
{
    public partial class AchievementsList : System.Web.UI.Page
    {
        string connStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\chris\\source\\repos\\UserInformationSystem\\App_Data\\UserData.mdf;Integrated Security=True";

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
                    LoadAchievements();
                }
            }
        }

        private void LoadAchievements()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                // Get UserID for current user
                string getIdQuery = "SELECT UserID FROM Users WHERE Username=@Username";
                SqlCommand getIdCmd = new SqlCommand(getIdQuery, con);
                getIdCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());

                con.Open();
                object userIdObj = getIdCmd.ExecuteScalar();
                con.Close();

                if (userIdObj != null)
                {
                    int userId = Convert.ToInt32(userIdObj);

                    string query = "SELECT * FROM Achievements WHERE UserID=@UserID";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    da.SelectCommand.Parameters.AddWithValue("@UserID", userId);

                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        gvAchievements.DataSource = dt;
                        gvAchievements.DataBind();
                        lblMessage.Text = "";
                    }
                    else
                    {
                        gvAchievements.DataSource = null;
                        gvAchievements.DataBind();
                        lblMessage.Text = "No achievements found.";
                    }
                }
            }
        }

        // Edit Mode
        protected void gvAchievements_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvAchievements.EditIndex = e.NewEditIndex;
            LoadAchievements();
        }

        // Cancel Edit
        protected void gvAchievements_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvAchievements.EditIndex = -1;
            LoadAchievements();
        }

        // Update Record
        protected void gvAchievements_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int achievementId = Convert.ToInt32(gvAchievements.DataKeys[e.RowIndex].Value);

            string examType = ((System.Web.UI.WebControls.TextBox)gvAchievements.Rows[e.RowIndex].Cells[0].Controls[0]).Text;
            string institute = ((System.Web.UI.WebControls.TextBox)gvAchievements.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string board = ((System.Web.UI.WebControls.TextBox)gvAchievements.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string year = ((System.Web.UI.WebControls.TextBox)gvAchievements.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string percent = ((System.Web.UI.WebControls.TextBox)gvAchievements.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string info = ((System.Web.UI.WebControls.TextBox)gvAchievements.Rows[e.RowIndex].Cells[5].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "UPDATE Achievements SET ExamType=@ExamType, InstituteName=@InstituteName, BoardUniversity=@BoardUniversity, PassingYear=@PassingYear, Percentage=@Percentage, AdditionalInfo=@AdditionalInfo WHERE AchievementID=@AchievementID";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@ExamType", examType);
                cmd.Parameters.AddWithValue("@InstituteName", institute);
                cmd.Parameters.AddWithValue("@BoardUniversity", board);
                cmd.Parameters.AddWithValue("@PassingYear", year);
                cmd.Parameters.AddWithValue("@Percentage", percent);
                cmd.Parameters.AddWithValue("@AdditionalInfo", info);
                cmd.Parameters.AddWithValue("@AchievementID", achievementId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvAchievements.EditIndex = -1;
            LoadAchievements();
            lblMessage.Text = "Achievement updated successfully!";
        }

        // Delete Record
        protected void gvAchievements_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int achievementId = Convert.ToInt32(gvAchievements.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Achievements WHERE AchievementID=@AchievementID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@AchievementID", achievementId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadAchievements();
            lblMessage.Text = "Achievement deleted successfully!";
        }
    }
}
