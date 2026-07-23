-- Duplicate Check
SELECT 
  ID, 
  COUNT(ID) AS duplicate_count
FROM 
  `PROJECT_ID.supply_chain_analytics.delivery_performance`
GROUP BY 
  ID
HAVING 
  COUNT(ID) > 1;


-- Missing Values Check
SELECT 
  COUNTIF(ID IS NULL) AS missing_id,
  COUNTIF(Warehouse_block IS NULL) AS missing_warehouse,
  COUNTIF(Mode_of_Shipment IS NULL) AS missing_shipment_mode,
  COUNTIF(is_late IS NULL) AS missing_is_late
FROM 
  `PROJECT_ID.supply_chain_analytics.delivery_performance`;


-- Numerical Outlier and Business Logic
SELECT 
  MIN(Weight_in_gms) AS min_weight,
  MAX(Weight_in_gms) AS max_weight,
  MIN(Discount_offered) AS min_discount,
  MAX(Discount_offered) AS max_discount,
  MIN(Cost_of_the_Product) AS min_cost,
  MAX(Cost_of_the_Product) AS max_cost
FROM 
  `PROJECT_ID.supply_chain_analytics.delivery_performance`;


-- Categorical Consistency Check
SELECT 
  DISTINCT Mode_of_Shipment 
FROM 
  `PROJECT_ID.supply_chain_analytics.delivery_performance`;
SELECT 
  DISTINCT Product_importance 
FROM 
  `PROJECT_ID.supply_chain_analytics.delivery_performance`;