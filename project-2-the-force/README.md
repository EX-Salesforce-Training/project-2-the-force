# The Language Emporium
### A place for learners and tutors to meet up and find educational content for learning new languages

#### Built with Salesforce

## Languages and Technologies
 - Salesforce Platform
 - Apex
 - Javascript
 - CSS
 - HTML

## Version Control
 - Git
 - Github
 - Salesforce Developer Experience CLI and Visual Studio Code Extension

[Documentation](https://github.com/EX-Salesforce-Training/project-1-hard-days-byte/wiki/documentation)

## Setup

 - For this organization, you will need a fresh playground to work in. 
 - After creating the playground make sure you have the username from this specific playground and create a new password(Get Your Login Credentials from Playground Starter page).
 - Turn on Digital Experiences in this Playground
    - Type Digital Experiences in Quick Find
    - Click on Digital Experiences Settings
    - Enable Digital Experiences
    - choose a unique domain name
 - Clone this repo to a local instance
 - Open TheLanguageEmporium folder in Visual Studio Code
 - Use SFDX to authorize an organization in this project
 - Use your playground specific username and password to log in
 - USe SFDX to deploy the project to your org (Deploy this source to Org)
 - In Digital Experiences create a new site
    - From Setup go to Digital Experiences -> Sites
    - Create a New Site by clicking New
    - Scroll down and click Salesforce Tabs + VisualForce template
    - Click "Get Started"
    - Name the site "The Language Emporium"
 - Change the home page to LandingPage
    - Go into Administration from this new site workspace
    - Click on Pages
    - Change Home Page to "VisualForce Page"
    - Search pages for "Landing Page"
    - Save
 - You should now be able to view the Landing Page for The Language Emporium from the link in settings
 - Activating the site will open it to for guest users
## Setup Users
1.) Create Profile: Clone External Identity called 'Learner'
2.) Create Role: Product Template, under CEO, create a Role called 'Learner Manager'
3.) Assign yourself to the Learner Manager Role
4.) Create an Account: 'Learner Account' [This will hold the contacts created as new users register on the site]
5.) Copy the Account ID of the Account you just created
6.) Go to Digital Experiences and set up visualforce pages- Go to administration 
7.)Under Members - move your Learner Profile to allow it to view 
8.)Under Setup -> Digital Experience -> Settings -> Administration ( Where you are) -> Login and Registration go through this page,
  - allow standard profiles for sign up and external use. 
  - Login Page Type = VisualForce Page (select SiteLogin),
  -  allow self register,
  -   Registration Page- config-VisualForce Page(SiteRegister) 
  -   Profile : Learner 
  -   Account: Learner Account 
9.) Go to Force: Allow Object and Field Permissions for the Custom Objects/Fields and Account, Contact
10.) Under visualforce pages, select the pages to view also ( Pages can be found in documentation also, be sure to move site register and site login also! )
11.)Go to Developer Console:
12.) Open Site RegisterController- Change id PORTAL_ACCOUNT_ID = (your Account ID that you copied earlier- ACCOUNT ID not profile!!)
 
