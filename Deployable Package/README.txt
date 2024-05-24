This project "Document Management" was developed using the following technology stack:

1. **Front End**
   - Angular - version 16
   - Developed in Visual Studio Code

2. **Back End**
   - ASP.NET Core Web API with C# - version .NET 8
   - Developed in Visual Studio 2022

3. **Database**
   - Microsoft SQL Server - Version 19




**Steps to Deploy and Run the Application:**

1. Download the project from this GitHub link: [Document Management Project](https://github.com/rajasekit/Doc-Mngt-Deploy-Package)
2. Open SSMS and run the DBScript.sql
3. Open SSMS and verify that the DocumentManagement database is created along with the following tables:
   - CaseTransactions
   - Documents
4. Deploy documentmanagement.server and documentmanagement.client in web server
5. Open appsettings.json in Deploy documentmanagement.server and update the "DefaultConnection" and "FrontEndOrigin"
6. Open main_____.js, find for port number 7265 and replace with the API server port number.



**Application Flow:**

1. Choose one or more files and click on "Update Files". Once uploaded, the grid below will be updated with the uploaded documents.
2. Click the "Download" button provided in the grid to find the document in the download folder.
3. Use pagination to navigate and view all uploaded documents.