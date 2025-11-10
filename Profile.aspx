<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="UserInformationSystem.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-container {
            max-width: 700px;
            margin: 40px auto;
            background: white;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #0078D7;
            margin-bottom: 20px;
        }

        .profile-photo {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-photo img {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #0078D7;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px 8px;
            border-bottom: 1px solid #ddd;
        }

        td.label {
            font-weight: 600;
            color: #333;
            width: 35%;
        }

        .btn-group {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            margin: 0 10px;
            font-weight: 600;
        }

        .btn-primary {
            background-color: #0078D7;
        }

        .btn-primary:hover {
            background-color: #005a9e;
        }

        .btn-danger {
            background-color: #d9534f;
        }

        .btn-danger:hover {
            background-color: #b52b27;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <h2>Your Profile</h2>

        <div class="profile-photo">
            <asp:Image ID="imgPhoto" runat="server" AlternateText="User Photo" />
        </div>

        <table>
            <tr><td class="label">Full Name:</td><td><asp:Label ID="lblFullName" runat="server" /></td></tr>
            <tr><td class="label">Gender:</td><td><asp:Label ID="lblGender" runat="server" /></td></tr>
            <tr><td class="label">Birthdate:</td><td><asp:Label ID="lblBirthdate" runat="server" /></td></tr>
            <tr><td class="label">Email:</td><td><asp:Label ID="lblEmail" runat="server" /></td></tr>
            <tr><td class="label">Phone Number:</td><td><asp:Label ID="lblPhone" runat="server" /></td></tr>
            <tr><td class="label">Address:</td><td><asp:Label ID="lblAddress" runat="server" /></td></tr>
            <tr><td class="label">Pincode:</td><td><asp:Label ID="lblPincode" runat="server" /></td></tr>
            <tr><td class="label">City:</td><td><asp:Label ID="lblCity" runat="server" /></td></tr>
            <tr><td class="label">State:</td><td><asp:Label ID="lblState" runat="server" /></td></tr>
            <tr><td class="label">Username:</td><td><asp:Label ID="lblUsername" runat="server" /></td></tr>
        </table>

        <div class="btn-group">
            <asp:Button ID="btnUpdate" runat="server" Text="Update Details" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete Account" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
        </div>
    </div>
</asp:Content>
