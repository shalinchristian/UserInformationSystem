<%@ Page Title="Logout" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="UserInformationSystem.Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .logout-container {
            max-width: 400px;
            margin: 100px auto;
            background: white;
            padding: 40px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            color: #0078D7;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            margin-bottom: 20px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            font-weight: 600;
            background-color: #0078D7;
        }

        .btn:hover {
            background-color: #005a9e;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="logout-container">
        <h2>Logout</h2>
        <p>You have been logged out successfully.</p>
        <asp:Button ID="btnLoginAgain" runat="server" Text="Login Again" CssClass="btn" OnClick="btnLoginAgain_Click" />
    </div>
</asp:Content>
