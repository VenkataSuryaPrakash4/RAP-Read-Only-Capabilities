@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Connection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@UI: { headerInfo: { typeName: 'Connection',
                     typeNamePlural: 'Connections'},
       presentationVariant: [{ visualizations: [{ type: #AS_LINEITEM }] }]}
define view entity ZRO_C_Connection
  as select from ZRO_Connection
  association [1..*] to ZRO_C_Flight as _Flight on  $projection.CarrierId    = _Flight.CarrierId
                                                and $projection.ConnectionId = _Flight.ConnectionId
{
      @UI.facet: [ { id:'Connection',
                      purpose: #STANDARD,
                      type: #COLLECTION,
                      label: 'Connection',
                      position: 10},

                    { id: 'General',
                      targetQualifier: 'General_FG',
                      parentId: 'Connection',
                      purpose: #STANDARD,
                      type: #FIELDGROUP_REFERENCE,
                      label: 'General',
                      position: 10
                      },

                    { id: 'Departure',
                      label: 'Departure',
                      targetQualifier: 'Departure_FG',
                      type:#FIELDGROUP_REFERENCE,
                      parentId: 'Connection',
                      position: 20,
                      purpose: #STANDARD},

                    { id: 'Destination',
                      targetQualifier: 'Destination_FG',
                      label: 'Destination',
                      position: 30,
                      parentId: 'Connection',
                      type:#FIELDGROUP_REFERENCE,
                      purpose: #STANDARD},

                    { id: 'Flight',
                      type: #LINEITEM_REFERENCE,
                      label: 'Flight',
                      position: 20,
                      targetElement: '_Flight'} ]

      @UI.lineItem: [{ position: 10, label: 'Carrier Id' }]
      // @UI.identification: [{ position: 10, label:'Carrier Id' }]
      @UI.fieldGroup: [{ position: 10, qualifier: 'General_FG' }]
  key CarrierId,
      @UI.lineItem: [{ position: 20, label: 'Connection Id' }]
      //  @UI.identification: [{ position: 20, label:'Connection Id' }]
      @UI.fieldGroup: [{ position: 20, qualifier: 'General_FG' }]
  key ConnectionId,
      @UI.lineItem: [{ position:30, label: 'Departure Airport Code' }]
      @UI.selectionField: [{ position: 10 }]
      @UI.fieldGroup: [{ position: 10, qualifier: 'Departure_FG' }]
      //  @UI.identification: [{ position: 30, label:'Departure Airport Code' }]
      AirportFromId,
      @UI.lineItem: [{ position:40, label:'Arrival Airport Code' }]
      @UI.selectionField: [{ position: 20 }]
      @UI.fieldGroup: [{ position: 10, qualifier: 'Destination_FG' }]
      //  @UI.identification: [{ position: 40, label:'Arrival Airport Code' }]
      AirportToId,
      @UI.lineItem: [{ position:50, label: 'Departure Time' }]
      // @UI.identification: [{ position: 50, label:'Departure Time' }]
      @UI.fieldGroup: [{ position: 20, qualifier: 'Departure_FG' }]
      DepartureTime,
      @UI.lineItem: [{ position: 60, label: 'Arrival Time' }]
      //  @UI.identification: [{ position: 60, label:'Arrival Time' }]
      @UI.fieldGroup: [{ position: 20, qualifier: 'Destination_FG' }]
      ArrivalTime,
      @UI.lineItem: [{ position: 70, label:'Distance' }]
      // @UI.identification: [{ position: 70, label: 'Distance' }]
      @UI.fieldGroup: [{ position: 30, qualifier: 'General_FG' }]
      Distance,
      @UI.lineItem: [{ position: 80, label: 'Distance UOM' }]
      //  @UI.identification: [{ position: 80, label: 'Distance UOM' }]
      @UI.fieldGroup: [{ position: 90, qualifier: 'General_FG' }]
      DistanceUnit,
      /* Associations */
      _Flight
}
