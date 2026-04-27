@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Flight'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZRO_C_Flight
  as select from ZRO_Flight
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied
}
