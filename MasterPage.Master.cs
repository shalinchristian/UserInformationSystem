using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Web.UI.WebControls;

namespace UserInformationSystem
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateNavigation();
            }
        }

        private void UpdateNavigation()
        {
            if (Session["Username"] != null)
            {
 
                lblUser.Text = "Welcome, " + Session["Username"].ToString();


                lnkRegister.Visible = false;
                lnkLogin.Visible = false;
                lnkProfile.Visible = true;
                lnkUpdateDetails.Visible = true;
                lnkAddAchievements.Visible = true;
                lnkAchievementsList.Visible = true;
                lnkLogout.Visible = true;
                lnkHome.Visible = true;
            }
            else
            {
                lblUser.Text = "";
                lnkRegister.Visible = true;
                lnkLogin.Visible = true;
                lnkProfile.Visible = false;
                lnkUpdateDetails.Visible = false;
                lnkAddAchievements.Visible = false;
                lnkAchievementsList.Visible = false;
                lnkLogout.Visible = false;
                lnkHome.Visible = true; 
            }
        }
    }
}