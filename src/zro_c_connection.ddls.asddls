@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Connection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@UI: { headerInfo: { typeName: 'Connection',
                     typeNamePlural: 'Connections'},
       presentationVariant: [{ visualizations: [{ type: #AS_LINEITEM }] }]}

@Search.searchable: true
define view entity ZRO_C_Connection
  as select from ZRO_Connection
  association [1..*] to ZRO_C_Flight   as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                   and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to /DMO/I_Carrier as _Carrier on  $projection.CarrierId = _Carrier.AirlineID
  association [1]    to /DMO/I_Airport as _Airline on  $projection.AirportFromId = _Airline.AirportID
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
      @UI.fieldGroup: [{ position: 10, qualifier: 'General_FG' }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @ObjectModel.text.association: '_Carrier'
  key CarrierId,
      @UI.lineItem: [{ position: 20, label: 'Connection Id' }]
      @UI.fieldGroup: [{ position: 20, qualifier: 'General_FG' }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
  key ConnectionId,
      @UI.lineItem: [{ position:30, label: 'Departure Airport Code' }]
      @UI.selectionField: [{ position: 10 }]
      @UI.fieldGroup: [{ position: 10, qualifier: 'Departure_FG' }]
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/dmo/i_airport_stdvh', element: 'AirportID' }, useForValidation: true }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @ObjectModel.text.association: '_Airline'
      AirportFromId,
      @UI.lineItem: [{ position:40, label:'Arrival Airport Code' }]
      @UI.selectionField: [{ position: 20 }]
      @UI.fieldGroup: [{ position: 10, qualifier: 'Destination_FG' }]
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/dmo/i_airport_stdvh', element: 'AirportID' }, useForValidation: true }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      AirportToId,
      @UI.lineItem: [{ position:50, label: 'Departure Time' }]
      @UI.fieldGroup: [{ position: 20, qualifier: 'Departure_FG' }]
      DepartureTime,
      @UI.lineItem: [{ position: 60, label: 'Arrival Time' }]
      @UI.fieldGroup: [{ position: 20, qualifier: 'Destination_FG' }]
      ArrivalTime,
      @UI.lineItem: [{ position: 70, label:'Distance' }]
      @UI.fieldGroup: [{ position: 30, qualifier: 'General_FG' }]
      Distance,
      @UI.lineItem: [{ position: 80, label: 'Distance UOM' }]
      @UI.fieldGroup: [{ position: 90, qualifier: 'General_FG' }]
      DistanceUnit,
      /* Associations */
      @Search.defaultSearchElement: true
      _Flight,
      _Carrier,
      _Airline
}
