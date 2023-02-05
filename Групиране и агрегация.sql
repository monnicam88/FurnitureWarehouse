-- Димана Вятрова, №62516 --

-- Групиране и агрегация

-- №1 Да се изведе средната цена на фотьойлите
select AVG(price) AS Аverаgе_sofa_price
	from SOFA;

-- №2 Да се изведе средната цена на фотьойлите, на база материалът, от който са направени. 
select basematerial, AVG(price) AS Average_price
	from SOFA
group by basematerial
order by Average_price ASC;

-- №3 Да се изведе броят на мебелите спрямо вида им.
select type, COUNT(type) AS Count
	from ITEM
group by type;

-- №4 Да се изведе идентификационният код на всеки пакет, който съдържа по-малко от 
-- 5 артикула. 
select b.bundle_id, COUNT(b.bundle_id) AS item_count
	from BUNDLEITEM b
group by b.bundle_id
having COUNT(b.bundle_id) < 5;

-- №5 Да се изведат заетите позиции на всеки ред.
select l.row, COUNT(l.position) AS Taken_positions_count
	from LOCATION l
group by l.row

-- №6 Да се извде броят пъти, в които се среща всяко описание, което не е празно. ( koito ne e null)
select b.description, COUNT(b.description) AS Count_occurences
	from BUNDLE b
group by b.description
having b.description is NOT NULL

-- №7 Да се намери общата цена на всички столове с 3 крака.
select * 
	from CHAIR;
select SUM(c.price) AS Bundle_price_sum
	from CHAIR c
where c.num_legs = 3;

-- №8 Да се изведе средната цена на всички продукти.
select AVG(price)
	from (select price from CHAIR 
		  union all
		  select price from SOFA
		  union all
		  select price from TABLE_) price

-- №9 Да се изведат секторите, в които има фотьойли, както и броя на фотьойлите във всеки сектор.
select l.sector, COUNT(l.sector) Armchairs_count
	from ITEM i join LOCATION l on i.loc_code = l.code
where i.type = 'Sofa'
group by l.sector;

-- №10 Да се изведе максималната цена на столовете, произведени в България спрямо броят крака, които имат.
select  c.num_legs, MAX(c.price) as Max_price
	from ITEM i 
		 join CHAIR c on i.code = c.item_code
		 join MANUFACTURER m on m.code = i.manufacturer_code
where m.county = 'Bulgaria'
group by c.num_legs
