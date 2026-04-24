<ins>**Introduction:**</ins>
- The Application mainly focuses on Read-Only capabilities, but not the transactional Capabilities. In this we will be using the existing data source like database tables for us to mainly focus on building the DDL source and its Read capabilities.
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
- **Associations & Joins:** In-order to navigate between the entites or Nodes of our read-only application, and make a link between the entities we use Association in this development.

<ins>**Defining CDS Views:**</ins>
- First and Foremost requisition we need to build the read-only RAP Application are:
  * Data Source
  * DDL Source
  * Service Definition
  * Service Binding
- Coming the layed level application, we will have only 2 layers on top of Data source:
  * Basic Interface View : Self Explanatory
  * Consumption View     : Self Explanatory
    
 <ins>**Development Design**</ins>
 - **Step-1**
   * Choose the right data source on which the data models has to be built. In our application we were more focused to Connection and          Flight data.
     + Connection Entity : **/DMO/CONNECTION**
     + Flight Entity     : **/DMO/FLIGHT**
 - **Step-2**
   * We will need to build an Basic Interface View on top of our Connection and Flight data source.
     + **/DMO/CONNECTION**&emsp;--> Create Basic-Interface View
     + **/DMO/FLIGHT**&emsp;&emsp;&emsp;&emsp;--> Create Basic-Interface View
 - **Step-3**
   * Enable the association between the DDL Source,which will establish a bridge between Connection node and Flight node.
 - **Step-4**
   * Once the association is done on the Basic-Interface view level, we will bring up the level to Consumption view along with the             associations wheich were done in Basic-Interface View.
 - **Step-5**
   * Maintain the required annotations in the MDE level to beautify your front-end part of the application and to add additional readable      features.
 - **Step-6**
   *Exposing our application to the outside world through Service Definition and Binding as a V2 or V4 OData service.
  



