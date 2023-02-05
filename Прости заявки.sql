-- Моника Митрева, №62522 --

-- Прости заявки

-- №1. Да се изведат кодът и цената на всички дивани, които са под 500 лева.
SELECT sofas.item_code AS SOFA_CODE, 
	   sofas.price AS PRICE
	FROM SOFA sofas
WHERE sofas.price < 500;

-- №2. Да се изведат имената (и годината) на всчики български производители, 
-- основани след 1990 година.
SELECT manufacturers.name AS MANUFACTURER, 
	   manufacturers.year AS YEAR_OF_FOUNDATION
	FROM MANUFACTURER manufacturers
WHERE manufacturers.county = 'Bulgaria'
	AND manufacturers.year > 1990;

-- №3. Да се изведе информацията за всички мебелни магазини, с които складът 
-- работи.
SELECT stores.code AS CODE,
	   stores.name AS NAME,
	   stores.address AS ADDRESS
	FROM STORE stores
WHERE stores.type = 'furniture store';

-- №4. Да се изведе информацията за всички локации, чийто код започва с "SB".
-- SELECT *
SELECT locations.code AS CODE,
	   locations.sector AS SECTOR,
	   locations.row AS ROW,
	   locations.position AS POSITION
	FROM LOCATION locations
WHERE locations.code like ('SB%');

-- №5. Да се изведат цените на всички столове, които са червени или черни на 
-- цвят и струват по-малко от 250 лева.
SELECT chairs.price AS PRICE
	FROM CHAIR chairs
WHERE (chairs.colour = 'Red' OR chairs.colour = 'Black')
	AND chairs.price < 250;
