@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Connection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@UI.headerInfo.typeNamePlural: 'Connections' //This will give the Headerline name on the list Page.
define view entity ZRO_C_Connection
  as select from ZRO_Connection
  association [1..*] to ZRO_C_Flight as _Flight on  $projection.CarrierId    = _Flight.CarrierId
                                                and $projection.ConnectionId = _Flight.ConnectionId
{
      @UI.facet: [{ purpose: #STANDARD,
                    type: #IDENTIFICATION_REFERENCE,
                    label: 'Connection',
                    position: 10 }]
      @UI.lineItem: [{ position: 10, label: 'Carrier Id' }]
      @UI.identification: [{ position: 10, label:'Carrier Id' }]
  key CarrierId,
      @UI.lineItem: [{ position: 20, label: 'Connection Id' }]
      @UI.identification: [{ position: 20, label:'Connection Id' }]
  key ConnectionId,
      @UI.lineItem: [{ position:30, label: 'Departure Airport Code' }]
      @UI.selectionField: [{ position: 10 }]
      @UI.identification: [{ position: 30, label:'Departure Airport Code' }]
      AirportFromId,
      @UI.lineItem: [{ position:40, label:'Arrival Airport Code' }]
      @UI.selectionField: [{ position: 20 }]
      @UI.identification: [{ position: 40, label:'Arrival Airport Code' }]
      AirportToId,
      @UI.lineItem: [{ position:50, label: 'Departure Time' }]
      @UI.identification: [{ position: 50, label:'Departure Time' }]
      DepartureTime,
      @UI.lineItem: [{ position: 60, label: 'Arrival Time' }]
      @UI.identification: [{ position: 60, label:'Arrival Time' }]
      ArrivalTime,
      @UI.lineItem: [{ position: 70, label:'Distance' }]
      @UI.identification: [{ position: 70, label: 'Distance' }]
      Distance,
      @UI.lineItem: [{ position: 80, label: 'Distance UOM' }]
      @UI.identification: [{ position: 80, label: 'Distance UOM' }]
      DistanceUnit,
      /* Associations */
      _Flight
}
