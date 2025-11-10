<%@ Page Title="Achievements List" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AchievementsList.aspx.cs" Inherits="UserInformationSystem.AchievementsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .achievements-container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #0078D7;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #0078D7;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            font-weight: 600;
        }

        .btn-edit {
            background-color: #0078D7;
        }

        .btn-edit:hover {
            background-color: #005a9e;
        }

        .btn-delete {
            background-color: #d9534f;
        }

        .btn-delete:hover {
            background-color: #b52b27;
        }

        .no-records {
            text-align: center;
            color: #555;
            margin-top: 20px;
            font-style: italic;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="achievements-container">
        <h2>Your Achievements</h2>

        <asp:GridView ID="gvAchievements" runat="server" AutoGenerateColumns="False" CssClass="table"
            OnRowEditing="gvAchievements_RowEditing" OnRowDeleting="gvAchievements_RowDeleting"
            OnRowCancelingEdit="gvAchievements_RowCancelingEdit" OnRowUpdating="gvAchievements_RowUpdating"
            DataKeyNames="AchievementID">
            <Columns>
                <asp:BoundField DataField="ExamType" HeaderText="Exam Type" />
                <asp:BoundField DataField="InstituteName" HeaderText="Institute" />
                <asp:BoundField DataField="BoardUniversity" HeaderText="Board/University" />
                <asp:BoundField DataField="PassingYear" HeaderText="Year" />
                <asp:BoundField DataField="Percentage" HeaderText="Percentage/CGPA" />
                <asp:BoundField DataField="AdditionalInfo" HeaderText="Additional Info" />

                <asp:CommandField ShowEditButton="True" EditText="Edit" CancelText="Cancel" UpdateText="Save" />
                <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblMessage" runat="server" CssClass="no-records"></asp:Label>
    </div>
</asp:Content>
