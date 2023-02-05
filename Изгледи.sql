-- Радослав Велков, №62528 --

-- ИЗГЛЕДИ:

-- - извеждащ кода на всеки един продукт, както и цената му:
CREATE VIEW v_allItemsPrices
AS
SELECT item.code, price
FROM item, table_
WHERE item.code=table_.item_code
UNION
SELECT item.code, price
FROM item, sofa
WHERE item.code=sofa.item_code
UNION
SELECT item.code, price
FROM item, chair
WHERE item.code=chair.item_code

-- - извеждащ средната цена за всеки вид продукт:
CREATE VIEW v_AvgPricesOfProducts
AS
SELECT type, AVG(price) AS avg_price
FROM item, chair
WHERE item.code=chair.item_code
GROUP BY type
UNION
SELECT type, AVG(price) AS avg_price
FROM item, sofa
WHERE item.code=sofa.item_code
GROUP BY type
UNION
SELECT item.type, AVG(price) AS avg_price
FROM item, table_
WHERE item.code=table_.item_code
GROUP BY item.type

-- - извеждащ кодове и материал на всички дивани, струващи над 100 (with check option):
CREATE VIEW v_sofasAbove100
AS
SELECT item_code, basematerial, price
FROM sofa
WHERE price>=100
WITH CHECK OPTION;

-- - извеждащ код, материал и цвят на всички 4-краки стола (with check option):
CREATE VIEW v_all_4legged_Chairs
AS
SELECT item_code, basematerial, colour
FROM chair
WHERE num_legs=4
WITH CHECK OPTION;

-- - извеждащ най-ниска и най-висока цена на стол за всеки вид материал:
CREATE VIEW v_min_max_prices_allMaterials
AS
SELECT basematerial, MIN(price) AS min_price, MAX(price) AS max_price
FROM chair
GROUP BY basematerial

-- - извеждащ материал и тип на всички дървени маси (името на материала съдържа ‚‚wood‘‘) (with check option):
CREATE VIEW v_wooden_tables
AS
SELECT basematerial, type
FROM table_
WHERE basematerial LIKE '%wood%'
WITH CHECK OPTION;

-- - извеждащ всичката информация за всеки български производители (with check option):
CREATE VIEW v_Bulgarian_manufacturers
AS
SELECT *
FROM manufacturer
WHERE county='Bulgaria'
WITH CHECK OPTION;

-- - извеждащ всички български пакети, които имат въведено описание (with check option):
CREATE VIEW v_bulgarianBundles_withDescription
AS
SELECT *
FROM bundle
WHERE name LIKE '%bulgarian%' AND description IS NOT NULL
WITH CHECK OPTION;

-- - извеждащ ID на пакет, ID на доставка и дата на доставка за всички пакети, които трябва да бъдат доставени преди 2022 година (with check option):
CREATE VIEW v_deliveriesBefore2022
AS
SELECT bundle_id, delivery_feature_id, delivery_date
FROM delivery
WHERE delivery_date<'2022-01-01'
WITH CHECK OPTION;

-- - извеждащ името на всеки магазин и колко пакета трябва да му бъдат доставени:
CREATE VIEW v_allStores_numberOfBundles
AS
SELECT store.name, COUNT(delivery.bundle_id) AS num_bundles
FROM store, delivery
WHERE store.code=delivery.store_code
GROUP BY store.name

-- - извеждащ всеки магазин (код, име, вид), като за всеки такъв се извеждат компанията/компаниите, чрез която/които ще се осъществи доставка, както и превозното средство:
CREATE VIEW v_stores_deliveries
AS
SELECT DISTINCT s.code, s.name, s.type, df.delivery_company, df.delivery_vehicle
FROM store s, delivery d, delivery_feature df
WHERE s.code=d.store_code AND d.delivery_feature_id=df.id
