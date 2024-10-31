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
   public:
      COrder();
     ~COrder();
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
