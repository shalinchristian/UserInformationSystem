<%@ Page Title="Update Details" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateDetails.aspx.cs" Inherits="UserInformationSystem.UpdateDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .update-container {
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

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="email"], input[type="number"], select, textarea {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            resize: none;
        }

        .profile-pic {
            text-align: center;
            margin-bottom: 15px;
        }

        .profile-pic img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #0078D7;
            margin-bottom: 10px;
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

        .btn-secondary {
            background-color: #777;
        }

        .btn-secondary:hover {
            background-color: #555;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="update-container">
        <h2>Update Your Details</h2>

        <div class="profile-pic">
            <asp:Image ID="imgProfile" runat="server" ImageUrl="~/Uploads/default.png" AlternateText="Profile Picture" />
            <br />
            <asp:FileUpload ID="fuPhoto" runat="server" />
        </div>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

        <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <asp:TextBox ID="txtPhone" runat="server" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Address</label>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Pincode</label>
            <asp:TextBox ID="txtPincode" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>City</label>
            <asp:DropDownList ID="ddlCity" runat="server">
                <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                <asp:ListItem Text="Anand" Value="Anand"></asp:ListItem>
                <asp:ListItem Text="Nadiad" Value="Nadiad"></asp:ListItem>
                <asp:ListItem Text="Vadodara" Value="Vadodara"></asp:ListItem>
                <asp:ListItem Text="Ahmedabad" Value="Ahmedabad"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>State</label>
            <asp:DropDownList ID="ddlState" runat="server">
                <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                <asp:ListItem Text="Gujarat" Value="Gujarat"></asp:ListItem>
                <asp:ListItem Text="Maharashtra" Value="Maharashtra"></asp:ListItem>
                <asp:ListItem Text="Rajasthan" Value="Rajasthan"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="btn-group">
            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" CausesValidation="False" />
        </div>
    </div>
</asp:Content>
