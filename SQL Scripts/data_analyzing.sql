-- Overall late delivery rate
SELECT 
  COUNT(ID) AS total_orders,
  SUM(is_late) AS total_late_deliveries,
  ROUND((SUM(is_late) / COUNT(ID)) * 100, 2) AS late_delivery_percentage
FROM 
  PROJECT_ID.supply_chain_analytics.delivery_performance`;


-- Late delivery by shipment mode and priority
SELECT 
  Mode_of_Shipment,
  Product_importance,
  COUNT(ID) AS total_orders,
  ROUND((SUM(is_late) / COUNT(ID)) * 100, 2) AS late_rate_percentage
FROM 
  PROJECT_ID.supply_chain_analytics.delivery_performance`
GROUP BY 
  Mode_of_Shipment,
  Product_importance
ORDER BY 
  late_rate_percentage DESC;


-- Impact of discount on delivery performance
SELECT 
  CASE 
    WHEN Discount_offered <= 10 THEN 'Low Discount (0-10%)'
    WHEN Discount_offered <= 30 THEN 'Medium Discount (11-30%)'
    ELSE 'High Discount (>30%)'
  END AS discount_tier,
  COUNT(ID) AS total_orders,
  ROUND((SUM(is_late) / COUNT(ID)) * 100, 2) AS late_rate_percentage
FROM 
  PROJECT_ID.supply_chain_analytics.delivery_performance`
GROUP BY 
  discount_tier
ORDER BY 
  late_rate_percentage DESC;