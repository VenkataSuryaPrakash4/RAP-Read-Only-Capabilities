@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Flight'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@UI:{ headerInfo:{ typeName: 'Flight',
                   typeNamePlural: 'Flights',
                   title:{ type:#STANDARD, value:'FlightDate'} },
                   presentationVariant: [{ visualizations: [{ type: #AS_LINEITEM }] }]}


define view entity ZRO_C_Flight
  as select from ZRO_Flight
{
      @UI.facet: [{ id: 'Flight',
                    purpose: #STANDARD,
                    type:#COLLECTION,
                    label: 'Flight',
                    position: 10 },

                  { id:'General',
                    targetQualifier: 'General_FG',
                    type: #FIELDGROUP_REFERENCE,
                    position: 10,
                    purpose: #STANDARD,
                    parentId: 'Flight',
                    label:'General Flight'},

                  { id: 'Seats',
                    type: #FIELDGROUP_REFERENCE,
                    label: 'Seats',
                    parentId: 'Flight',
                    purpose: #STANDARD,
                    targetQualifier: 'Seats_FG',
                    position: 20}]

      @UI.lineItem: [{ position: 10, label:'Carrier Id' }]
      @UI.fieldGroup: [{ position: 10, qualifier: 'General_FG' }]
  key CarrierId,

      @UI.lineItem: [{ position: 20, label: 'Connection Id' }]
      @UI.fieldGroup: [{ position: 20, qualifier: 'General_FG' }]
  key ConnectionId,

      @UI.lineItem: [{ position: 30, label:'Flight Date' }]
      @UI.fieldGroup: [{ position: 30, qualifier: 'General_FG' }]
  key FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      @UI.lineItem: [{ position: 40, label:'Price' }]
      @UI.fieldGroup: [{ position: 40, qualifier: 'General_FG' }]
      Price,

      @UI.lineItem: [{ position: 50, label:'Currency' }]
      @UI.fieldGroup: [{ position: 50, qualifier: 'General_FG' }]
      CurrencyCode,

      @UI.lineItem: [{ position: 60, label:'Plane Type ID' }]
      @UI.fieldGroup: [{ position: 60, qualifier: 'General_FG' }]
      PlaneTypeId,

      @UI.lineItem: [{ position: 70, label:'Maximum Seats' }]
      @UI.fieldGroup: [{ position: 10, qualifier: 'Seats_FG' }]
      SeatsMax,

      @UI.lineItem: [{ position: 80, label: 'Occupied Seats' }]
      @UI.fieldGroup: [{ position: 20, qualifier: 'Seats_FG' }]
      SeatsOccupied
}
