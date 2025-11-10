<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="UserInformationSystem.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .home-container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            color: #0078D7;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            font-size: 16px;
        }

        .quick-links {
            margin-top: 30px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
        }

        .card {
            width: 180px;
            height: 130px;
            background-color: #0078D7;
            color: white;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .card:hover {
            background-color: #005a9e;
            transform: translateY(-4px);
        }

        .footer-note {
            margin-top: 40px;
            color: #777;
            font-size: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-container">
        <h2>Welcome, <asp:Label ID="lblUsername" runat="server" Text="User"></asp:Label> 👋</h2>
        <p>Manage your profile, achievements, and account details all in one place.</p>

        <div class="quick-links">
            <a href="Profile.aspx" class="card">Profile</a>
            <a href="UpdateDetails.aspx" class="card">Update Details</a>
            <a href="AddAchievements.aspx" class="card">Add Achievement</a>
            <a href="AchievementsList.aspx" class="card">View Achievements</a>
            <a href="Logout.aspx" class="card">Logout</a>
        </div>

        <div class="footer-note">
            <p>Powered by ASP.NET | Developed for CAUC507 - Programming with .NET Architecture</p>
        </div>
    </div>
</asp:Content>
