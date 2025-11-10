<%@ Page Title="Add Achievements" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddAchievements.aspx.cs" Inherits="UserInformationSystem.AddAchievements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .achieve-container {
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
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            resize: none;
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
    <div class="achieve-container">
        <h2>Add Achievement</h2>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

        <div class="form-group">
            <label>Exam Type</label>
            <asp:DropDownList ID="ddlExamType" runat="server">
                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                <asp:ListItem Text="SSC" Value="SSC"></asp:ListItem>
                <asp:ListItem Text="HSC" Value="HSC"></asp:ListItem>
                <asp:ListItem Text="UG" Value="UG"></asp:ListItem>
                <asp:ListItem Text="PG" Value="PG"></asp:ListItem>
                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Institute Name</label>
            <asp:TextBox ID="txtInstitute" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Board / University</label>
            <asp:TextBox ID="txtBoard" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Passing Year</label>
            <asp:TextBox ID="txtYear" runat="server" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Percentage / CGPA</label>
            <asp:TextBox ID="txtPercentage" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Additional Info</label>
            <asp:TextBox ID="txtInfo" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
        </div>

        <div class="btn-group">
            <asp:Button ID="btnAdd" runat="server" Text="Add Achievement" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-reset" OnClick="btnReset_Click" CausesValidation="False" />
        </div>
    </div>
</asp:Content>
