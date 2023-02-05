-- ������ �������, �62516 --

-- ��������� � ���������

-- �1 �� �� ������ �������� ���� �� ����������
select AVG(price) AS �ver�g�_sofa_price
	from SOFA;

-- �2 �� �� ������ �������� ���� �� ����������, �� ���� ����������, �� ����� �� ���������. 
select basematerial, AVG(price) AS Average_price
	from SOFA
group by basematerial
order by Average_price ASC;

-- �3 �� �� ������ ����� �� �������� ������ ���� ��.
select type, COUNT(type) AS Count
	from ITEM
group by type;

-- �4 �� �� ������ ������������������ ��� �� ����� �����, ����� ������� ��-����� �� 
-- 5 ��������. 
select b.bundle_id, COUNT(b.bundle_id) AS item_count
	from BUNDLEITEM b
group by b.bundle_id
having COUNT(b.bundle_id) < 5;

-- �5 �� �� ������� ������� ������� �� ����� ���.
select l.row, COUNT(l.position) AS Taken_positions_count
	from LOCATION l
group by l.row

-- �6 �� �� ����� ����� ����, � ����� �� ����� ����� ��������, ����� �� � ������. ( koito ne e null)
select b.description, COUNT(b.description) AS Count_occurences
	from BUNDLE b
group by b.description
having b.description is NOT NULL

-- �7 �� �� ������ ������ ���� �� ������ ������� � 3 �����.
select * 
	from CHAIR;
select SUM(c.price) AS Bundle_price_sum
	from CHAIR c
where c.num_legs = 3;

-- �8 �� �� ������ �������� ���� �� ������ ��������.
select AVG(price)
	from (select price from CHAIR 
		  union all
		  select price from SOFA
		  union all
		  select price from TABLE_) price

-- �9 �� �� ������� ���������, � ����� ��� ��������, ����� � ���� �� ���������� ��� ����� ������.
select l.sector, COUNT(l.sector) Armchairs_count
	from ITEM i join LOCATION l on i.loc_code = l.code
where i.type = 'Sofa'
group by l.sector;

-- �10 �� �� ������ ������������ ���� �� ���������, ����������� � �������� ������ ����� �����, ����� ����.
select  c.num_legs, MAX(c.price) as Max_price
	from ITEM i 
		 join CHAIR c on i.code = c.item_code
		 join MANUFACTURER m on m.code = i.manufacturer_code
where m.county = 'Bulgaria'
group by c.num_legs
