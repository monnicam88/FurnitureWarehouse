-- Моника Митрева, №62522 --

-- Заявки върху две и повече релации

-- №1. Да се изведат името и кодът на производителите на фотьойли/столове.
SELECT DISTINCT manufacturers.code AS MANUFACTURER_CODE,
				manufacturers.name AS NAME
	FROM ITEM items, MANUFACTURER manufacturers
WHERE items.manufacturer_code = manufacturers.code
	AND items.type = 'Chair';

-- №2. Да се изведат номерата на пакетите, съдържащи продукти, които са 
-- изпратени за мебелните магазини, партньори на склада.
SELECT deliveries.bundle_id AS BUNDLE_ID,
	   stores.name AS STORE_NAME
	FROM DELIVERY deliveries, STORE stores
WHERE stores.code = deliveries.store_code
	AND stores.type = 'furniture store';

-- №3. Да се изведат цените на всички дивани, произведени от Progres.
SELECT sofas.price AS SOFA_PRICE
	FROM MANUFACTURER manufacturers,
		 ITEM items,
		 SOFA sofas
WHERE sofas.item_code = items.code
	AND items.manufacturer_code = manufacturers.code
	AND manufacturers.name = 'Progres';

-- №4. Да се изведе кодът за доставка на всички пратки, доставени от 
-- фирмите ECONT и SPEEDY.
SELECT deliveries.code AS DELIVERY_CODE,
	   d_features.delivery_company AS DELIVERY_COMPANY
	FROM DELIVERY deliveries,
		 DELIVERY_FEATURE d_features
WHERE d_features.id = deliveries.delivery_feature_id
	AND d_features.delivery_company = 'EKONT'
UNION
SELECT deliveries.code AS DELIVERY_CODE,
	   d_features.delivery_company AS DELIVERY_COMPANY
	FROM DELIVERY deliveries,
		 DELIVERY_FEATURE d_features
WHERE d_features.id = deliveries.delivery_feature_id
	AND d_features.delivery_company = 'SPEEDY';

-- №5. Да се изведaт имената на всички магазини, получили доставка
-- от склада преди 15.05.2022 година (както и датата на доставката).
SELECT stores.name AS STORE_NAME,
	   deliveries.delivery_date AS DELIVERY_DATE
	FROM STORE stores,
		 DELIVERY deliveries
WHERE stores.code = deliveries.store_code
	AND deliveries.delivery_date < '2022-05-15';
