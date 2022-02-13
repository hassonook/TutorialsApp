There are two types of installation one is for development with visual studio the second is to install for production in IIS web server
Install for development
1. install SQL SERVER Database 2019 (for development is free) 
2. install SQL Server Management Studio
3. Open SQL Server Management Studio and Create Database with name [Tutorials]
4- Open Tutorials.sql file with Sql Management studio and Excute the code to create database objects.
5. Install Visual Studio 2019 or the latest 2022 (Community version free)
6. Open Visual Studio and in first window choose Clone Repository. in Repository loaction paste this link [https://github.com/hassonook/TutorialsApp.git]
7.After clone done project will be created in visual studio you can run it from visual studio 


Install In IIS Server for production
1- Do steps 1-4 above
2- Install IIS Server in your Computer if is not installed
3- go to github with the link in step 6 above
4- Download the code as ZIP folder
5- Extract th zip folder to get TutorialsApp folder with contents
6- Copy TutorialsApp Foder to C:\inetpub\wwwroot
7- from start menu open IIS manager
8- in Connection at the left right click default Web Site>Manage Website>Advanced Settings
9- in Advanced Setting change the Physical Path from C:\inetpub\wwwroot To C:\inetpub\wwwroot\TutorialsApp
10- mahe sure the iis server status start and open the browser and access the system by http://localhost/
