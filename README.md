# flow-references
Graph Visualisation of MuleSoft Anypoint Studio Flow References using D3.js


Mulesoft Anypoint Studio & Alchemy.js
Graph Visualisation of MuleSoft Flow References using D3.js

Published on January 16, 2017


"A picture is worth a thousand words" refers to the notion that a complex idea can be conveyed with just a single image.

As a MuleSoft Anypoint Studio developer, you may have felt the need for an overview of a project's flow references? Which flow references which flow? The following two screenshots illustrate what can be generated.



Background

MuleSoft's next major release Mule 4.0 (Project Mozart), amongst other things, focuses on the citizen developer, to enable non-developers to develop APIs with a new web based design tool.

In keeping with the visual design aspect to citizen development, I thought it an interesting after work exercise, to try and visualise flow references, within Anypoint Studio by:

Utilising the Mule Server 3.8.2 EE runtime as a standalone client
Parse a Mule project's XML configuration files
Generate a GraphJSON file
Harness Alchemy.js, a D3 based open source library to graph visualize the flow references
----------------------------------------------------------------------------------------------------------

Current Scope

How many methods can you think of, by which a flow/sub-flow/batch can be referenced/invoked/triggered? The following are supported:

Flow Reference Component
Dataweave 'Lookup' (Inline & File)
Message Filter 'onUnaccepted' property
Java Component 'lookupFlowConstruct'
Execute Batch
But there are more for you to support and share

MEL Dataweave function Lookup
Shared VM connector domain project
Add application jar file as a dependency and import the flow as a Spring bean
and many more no doubt...
----------------------------------------------------------------------------------------------------------

Walkthrough


----------------------------------------------------------------------------------------------------------


Step 1. Run project flow-references as a Mule Application.

Tested with 3.8.2 EE runtime. Latest and the greatest and earlier versions WILL FAIL. No licence required to run EE locally on your PC.

----------------------------------------------------------------------------------------------------------


Step 2. On deployment "Choose Alchemy Template Format" dialog will pop up. Select one of the 4 options which correspond to the templates which can be found in the project folder .//flow-references/src/main/resources/template/

Get playing with your own look and feel and create your own, with reference to Alchemy Examples and Alchemy Docs

----------------------------------------------------------------------------------------------------------


Step 3. Next you will be prompted to select the app directory of your chosen Mule project such as C:\Mule\myWorkSpace\myProject\src\main\app

This should be the app folder containing a project's XML Mule Configuration files.

----------------------------------------------------------------------------------------------------------

Step 4. At any time you fail to choose an option, or an application error occurs, you will be met with the following enquiry dialog, where you can select the Cancel button to exit the application, or where appropriate, select the Ok button to try and remedy the situation.


----------------------------------------------------------------------------------------------------------


Step 5. Processing should occur followed by an end dialog.

Your created Alchemy html page should be automatically launched to your desktop via your associated browser and located in .//flow-references/src/main/resources/htmlFolder

----------------------------------------------------------------------------------------------------------

Notes on your Alchemy based html page

Name and destination folder can be configured in /flow-references/src/main/app/mule-app.properties

The method in which a flow has been referenced is indicated by edge colours. Purple for Execute Batch
A node's central colour indicates the element type such as flow or a batch
A node's border colour indicates the config file it belongs to
----------------------------------------------------------------------------------------------------------

Thank you for your interest









