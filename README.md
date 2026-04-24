<ins>**Introduction:**</ins>
- The Application mainly focuses on Read-Only capabilities, but no the transactional Capabilities. In this we will be using the existing data source like database tables for us to mainly focus on building the DDL source and its Read capabilities.
- In the further developments of this application, we will be implementing the following:
  * Define the data model for the OData service
  * Add value helps to the data model
  * Use text associations to display texts for elements like ids
  * Add search capabilities to the data model.
  
<ins>**Let's Begin:**</ins>
- Before we begin with developing the application, we will look at How this application looks like:
  * We will be using certian DDL source (Travel, Booking, Connections), by making the end-user to navigate to all through these.
  * The reasosn for doing the above such is to make the application user friendly, where the DDL source will be in association with other       DDL sources for the free flow of navigation by the end-user.
 
<ins>**Background Information:**</ins>
- **DDL Source :** Since we will be working on read-only application, as a DDL source we will be using the CDS View's as it has capabilities to fetch the data from the data sources.
- **Metadata Extensions :** To make our read-only application beautify to the outside world, we can use annotattions to make the application much more interactive for read capabilities.
