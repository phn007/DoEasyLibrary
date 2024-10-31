//+------------------------------------------------------------------+
//|                                                        Order.mqh |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include <Object.mqh>
#include "..\Defines.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class COrder : public CObject
{
   private:
      ulong    m_ticket;                                 // Selected order/deal ticket (MQL5)
      long     m_long_prop[ORDER_PROP_INTEGER_TOTAL];    // Integer properties
      double   m_double_prop[ORDER_PROP_DOUBLE_TOTAL];   // Real properties
      string   m_string_prop[ORDER_PROP_STRING_TOTAL];   // String properties
      //--- Return the array index the double property is actually located at
      int   IndexProp(ENUM_ORDER_PROP_DOUBLE property)   const { return (int)property-ORDER_PROP_INTEGER_TOTAL;                  }
      //--- Return the array index the string property is actually located at
      int   IndexProp(ENUM_ORDER_PROP_STRING property)   const { return (int)property-ORDER_PROP_INTEGER_TOTAL-ORDER_PROP_DOUBLE_TOTAL;}
   public:
      COrder();
     ~COrder();  
   protected:                                                                     
      //--- Protected parametric constructor                                
      COrder(ENUM_ORDER_STATUS order_status,const ulong ticket);    
      
      //--- Get and return integer properties of a selected order from its parameters
      long     OrderMagicNumber(void)        const;
      long     OrderTicket(void)             const;
      long     OrderTicketFrom(void)         const;
      long     OrderTicketTo(void)           const;
      long     OrderPositionID(void)         const;
      long     OrderPositionByID(void)       const;
      long     OrderOpenTimeMSC(void)        const;
      long     OrderCloseTimeMSC(void)       const;
      long     OrderType(void)               const;
      long     OrderTypeByDirection(void)    const;
      long     OrderTypeFilling(void)        const;
      long     OrderTypeTime(void)           const;
      long     OrderReason(void)             const;
      long     DealOrder(void)               const;
      long     DealEntry(void)               const;
      bool     OrderCloseByStopLoss(void)    const;
      bool     OrderCloseByTakeProfit(void)  const;
      datetime OrderOpenTime(void)           const;
      datetime OrderCloseTime(void)          const;
      datetime OrderExpiration(void)         const;
      datetime PositionTimeUpdate(void)      const;
      datetime PositionTimeUpdateMSC(void)   const;
      
      //--- Get and return real properties of a selected order from its parameters: (1) open price, (2) close price, (3) profit,
      //---  (4) commission, (5) swap, (6) volume, (7) unexecuted volume (8) StopLoss price, (9) TakeProfit price (10) StopLimit order price
      double   OrderOpenPrice(void)          const;
      double   OrderClosePrice(void)         const;
      double   OrderProfit(void)             const;
      double   OrderCommission(void)         const;
      double   OrderSwap(void)               const;
      double   OrderVolume(void)             const;
      double   OrderVolumeCurrent(void)      const;
      double   OrderStopLoss(void)           const;
      double   OrderTakeProfit(void)         const;
      double   OrderPriceStopLimit(void)     const;
      
      //--- Get and return string properties of a selected order from its parameters: (1) symbol, (2) comment, (3) ID at an exchange
      string   OrderSymbol(void)             const;
      string   OrderComment(void)            const;
      string   OrderExternalID(void)         const; 
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
COrder::COrder()
{
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
COrder::~COrder()
{
}
//+------------------------------------------------------------------+
