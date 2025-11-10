<%@ Page Title="User Registration" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UserInformationSystem.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .register-container {
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

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="file"] {
            border: none;
        }

        .gender-group {
            display: flex;
            gap: 15px;
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

        .btn-reset {
            background-color: #777;
        }

        .btn-reset:hover {
            background-color: #555;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register-container">
        <h2>User Registration</h2>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

        <div class="form-group">
            <label>First Name</label>
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtFirstName" ErrorMessage="First name required" ForeColor="Red" runat="server" />
        </div>

        <div class="form-group">
            <label>Last Name</label>
            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtLastName" ErrorMessage="Last name required" ForeColor="Red" runat="server" />
        </div>

        <div class="form-group">
            <label>Gender</label>
            <div class="gender-group">
                <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>

        <div class="form-group">
            <label>Photograph</label>
            <asp:FileUpload ID="fuPhoto" runat="server" />
        </div>

        <div class="form-group">
            <label>Birthdate</label>
            <asp:TextBox ID="txtBirthdate" runat="server" TextMode="Date"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="Email required" ForeColor="Red" runat="server" />
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

        <div class="form-group">
            <label>Username</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtUsername" ErrorMessage="Username required" ForeColor="Red" runat="server" />
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtPassword" ErrorMessage="Password required" ForeColor="Red" runat="server" />
        </div>

        <div class="btn-group">
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-reset" OnClick="btnReset_Click" CausesValidation="False" />
        </div>
    </div>
</asp:Content>
