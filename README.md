:one:<ins>**Introduction:**</ins>
- The Application mainly focuses on Read-Only capabilities, but not the transactional Capabilities. In this we will be using the existing data source like database tables for us to mainly focus on building the DDL source and its Read capabilities.
- In the further developments of this application, we will be implementing the following:
  * Define the data model for the OData service
  * Add value helps to the data model
  * Use text associations to display texts for elements like ids
  * Add search capabilities to the data model.
  
:two:<ins>**Let's Begin:**</ins>
- Before we begin with developing the application, we will look at How this application looks like:
  * We will be using certian DDL source (Travel, Booking, Connections), by making the end-user to navigate to all through these.
  * The reasosn for doing the above such is to make the application user friendly, where the DDL source will be in association with other       DDL sources for the free flow of navigation by the end-user.
 
:three:<ins>**Background Information:**</ins>
- **DDL Source :** Since we will be working on read-only application, as a DDL source we will be using the CDS View's as it has capabilities to fetch the data from the data sources.
- **Metadata Extensions :** To make our read-only application beautify to the outside world, we can use annotattions to make the application much more interactive for read capabilities.
- **Associations & Joins:** In-order to navigate between the entites or Nodes of our read-only application, and make a link between the entities we use Association in this development.

:four:<ins>**Defining CDS Views:**</ins>
- First and Foremost requisition we need to build the read-only RAP Application are:
  * Data Source
  * DDL Source
  * Service Definition
  * Service Binding
- Coming the layed level application, we will have only 2 layers on top of Data source:
  * Basic Interface View : Self Explanatory
  * Consumption View     : Self Explanatory
    
 :five:<ins>**Design Part of Application**</ins>
 - **Step-1**
   * Choose the right data source on which the data models has to be built. In our application we were more focused to Connection and          Flight data.
     + Connection Entity : **/DMO/CONNECTION**
     + Flight Entity     : **/DMO/FLIGHT**
 - **Step-2**
   * We will need to build an Basic Interface View on top of our Connection and Flight data source.
     + **/DMO/CONNECTION**&emsp;--> Create Basic-Interface View
     + **/DMO/FLIGHT**&emsp;&emsp;&emsp;&emsp;--> Create Basic-Interface View
 - **Step-3**
   * Enable the association between the DDL Source,which will establish a bridge between Connection node and Flight node to navigate.
 - **Step-4**
   * Once the association is done on the Basic-Interface view level, we will bring up the level to Consumption view along with the             associations wheich were done in Basic-Interface View.
 - **Step-5**
   * Maintain the required annotations in the MDE level to beautify your front-end part of the application and to add additional readable      features.
 - **Step-6**
   * Exposing our application to the outside world through Service Definition and Binding as a V2 or V4 OData service.
  
> [!IMPORTANT]
> The Consumption view for the Connection entity is the starting point for this read-only application.

> [!WARNING]
> **Basic-Interface View** : ZRO_Connection and ZRO_Flight has named it mistakenly without any _B_ or _I_ in its name. It supposed to       be ZRO_I_Connection and ZRO_I_Flight.
> You never do the same mistake which I have done. Later point of time in huge developments, these naming conventions place a key role in understanding the flow.

:six:<ins>**Association**</ins> 
- Association's are the On-Demand request by the user. It acts as an Unidirectional navigation from a Source model to target model.
- In our read-only application we will be using the assiciation to navigate from Connections node to Flight node, to check What flight are connection.

> [!TIP]
> The associations on interface and consumption level enable the navigation from the connection overview list page to flight details object page.

:seven:<ins>**Metadata Extension's**</ins>
- UI information is always specified on the consumption layer of the CDS view stack.
- To display the data from the data model on the UI, you have to add metadata extensions for us to consume and the corresponding UI
  annotations.To allow Metadata Extensions allowed for the datamodels to be consumed to display the data, we have to add an annotaion on the Consumption view's as: **@Metadata.allowExtension: True**

:eight:<ins>**UI Annotation's**</ins>
- There are hell lot of annotations in the RAP development which cannot be discussed in one go. I would recommand you to check it out some of the annotaions [here](https://help.sap.com/docs/abap-cloud/abap-rap/defining-ui-annotations?version=sap_btp). I will discuss about the these UI annotations and will maintain a dedicated repositories.

:nine:<ins>**Improving User Experience On Read-Only Application**</ins>
- To make it much more easier to the end-users while assigning the values to the selection field's, we can provide the functioanlities like autosuggest the values or F4-Help or Drop-down.
- For this read-only application, I have enables the F4 for the both the selection fields in the List Page.
  * In order to provide the F4 functionality in the RAP level, we must provide an annotation in the consumption view level:
    + **@Consumption.valuehelpDefinition** must be used to enable the F4 help to its respective field.
    + For your refernce, please refer to the Consumption view: [src/zro_c_connection.ddls.asddls]

💥<ins>**Application Outcome**</ins>💥:
- [Application Walk Through: Navigating from List Page to Object Page](https://github.com/user-attachments/assets/6c97b041-da62-46dc-8b6c-3bd8aa84fd6f)
- [Application Walk Through: Search result based on Adapt Filter](https://github.com/user-attachments/assets/5f17730a-6e63-4f46-a0e7-0e297de4f404)
- [Application Walk Through: Enabling Value help for Selection fields](https://github.com/user-attachments/assets/3ba9f363-7206-43dc-b446-0af2296ea0a7)
