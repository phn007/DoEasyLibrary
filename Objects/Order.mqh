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
      int   IndexProp(ENUM_ORDER_PROP_DOUBLE property)   const { return (int)property-ORDER_PROP_INTEGER_TOTAL;}
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
      
      public:
      //--- Return (1) integer, (2) real and (3) string order properties from the property array
      long     GetProperty(ENUM_ORDER_PROP_INTEGER property)   const { return m_long_prop[property];                    }
      double   GetProperty(ENUM_ORDER_PROP_DOUBLE property)    const { return m_double_prop[this.IndexProp(property)];  }
      string   GetProperty(ENUM_ORDER_PROP_STRING property)    const { return m_string_prop[this.IndexProp(property)];  }
      
      //--- Return the flag of the order supporting the property
      virtual bool   SupportProperty(ENUM_ORDER_PROP_INTEGER property)  { return true; }
      virtual bool   SupportProperty(ENUM_ORDER_PROP_DOUBLE property)   { return true; }
      virtual bool   SupportProperty(ENUM_ORDER_PROP_STRING property)   { return true; }
      
      //--- Compare COrder objects by all possible properties
      virtual int Compare(const CObject *node,const int mode=0) const;
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
//+------------------------------------------------------------------+
//| Compare COrder objects by all possible properties                |
//+------------------------------------------------------------------+
int COrder::Compare(const CObject *node,const int mode=0) const
  {
   const COrder *order_compared = node;
//--- compare integer properties of two orders
   if(mode<ORDER_PROP_INTEGER_TOTAL)
 	{
      long value_compared = order_compared.GetProperty((ENUM_ORDER_PROP_INTEGER)mode);
      long value_current  = this.GetProperty((ENUM_ORDER_PROP_INTEGER)mode);
      return(value_current>value_compared ? 1 : value_current<value_compared ? -1 : 0);
 	}
//--- compare real properties of two orders
   else if(mode<ORDER_PROP_DOUBLE_TOTAL+ORDER_PROP_INTEGER_TOTAL)
 	{
      double value_compared = order_compared.GetProperty((ENUM_ORDER_PROP_DOUBLE)mode);
      double value_current  = this.GetProperty((ENUM_ORDER_PROP_DOUBLE)mode);
      return(value_current>value_compared ? 1 : value_current<value_compared ? -1 : 0);
 	}
//--- compare string properties of two orders
   else if(mode<ORDER_PROP_DOUBLE_TOTAL+ORDER_PROP_INTEGER_TOTAL+ORDER_PROP_STRING_TOTAL)
 	{
      string value_compared=order_compared.GetProperty((ENUM_ORDER_PROP_STRING)mode);
      string value_current=this.GetProperty((ENUM_ORDER_PROP_STRING)mode);
      return(value_current>value_compared ? 1 : value_current<value_compared ? -1 : 0);
 	}
   return 0;
  }
//+------------------------------------------------------------------+
