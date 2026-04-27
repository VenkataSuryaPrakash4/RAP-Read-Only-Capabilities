@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Connection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZRO_C_Connection
  as select from ZRO_Connection
  association [1..*] to ZRO_C_Flight as _Flight on  $projection.CarrierId    = _Flight.CarrierId
                                                and $projection.ConnectionId = _Flight.ConnectionId
{
  key CarrierId,
  key ConnectionId,
      AirportFromId,
      AirportToId,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      /* Associations */
      _Flight
}
