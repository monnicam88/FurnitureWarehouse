-- Димана Вятрова, №62516 --

-- Съединения

-- №1 Да се изведат всички столове, произведени в България.
select i.code, i.type
	from ITEM i join MANUFACTURER m on i.manufacturer_code = m.code
where m.county = 'Bulgaria' and i.type = 'Chair';

-- №2 Да се изведе цената на всчики продукти и типа продукти, 
-- които са произведени в България.
select i.type, c.price
	from CHAIR c 
		 join ITEM i on c.item_code = i.code
		 join MANUFACTURER m on i.manufacturer_code = m.code
where m.county = 'Bulgaria'
UNION
select i.type, t.price
	from TABLE_ t 
		 join ITEM i on t.item_code = i.code
		 join MANUFACTURER m on i.manufacturer_code = m.code
where m.county = 'Bulgaria'
UNION
select i.type, s.price
	from SOFA s 
		 join ITEM i on s.item_code = i.code
		 join MANUFACTURER m on i.manufacturer_code = m.code
where m.county = 'Bulgaria';

-- №3 Да се изведат всички данни за столовете, които са произведени от компания, 
-- основана преди 2008 година.
select c.basematerial, c.colour, c.price, c.num_legs
	from CHAIR c join ITEM i on c.item_code = i.code
				 join MANUFACTURER m on m.code = i.manufacturer_code
where m.year < 2008
order by c.price DESC;

-- №4 Да се изведе информацията за всички производители, заедно с всички данни 
-- за продуктите, произведени от тях. Ако не са произвели нищо, на стойностите 
-- за продукт да се извежда NULL.
select *
	from MANUFACTURER m left join ITEM i on m.code = i.manufacturer_code
ORDER BY m.name;

-- №5 Да се изведат кодовете на продуктите, доставени с ван.
select bi.item_code
	from BUNDLEITEM bi
		 join BUNDLE b on b.id = bi.bundle_id
		 join DELIVERY d on b.id = d.bundle_id
		 join DELIVERY_FEATURE df on df.id = d.delivery_feature_id
where df.delivery_vehicle = 'VAN';

-- №6 Да се извде информацията за всички продукти, като ако те са столове, 
-- да се изведе и цената им.
select i.type, i.code, i.manufacturer_code, i.loc_code, c.price
	from item i left join chair c on c.item_code = i.code;

-- №7 Да се изведат всички локации (включително и празните) както и продуктите, 
-- които са налични в тях.
select *
	from LOCATION l full join ITEM i on l.code = i.loc_code;

