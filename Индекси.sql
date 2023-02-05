-- Радослав Велков, №62528 --

-- ИНДЕКСИ:

-- За таблицата Item:
-- - обединяващ типа на продукта и кода му:
	CREATE INDEX idx_type_code
ON item(type, code);
-- - обединяващ типа и кода на продука и кода на производителя:
	CREATE INDEX idx_type_code_manufacturer
ON item(type, code, manufacturer_code);

-- За таблицата Table_:
-- - обединяващ типа на масата и цената й:
	CREATE INDEX idx_type_price
ON table_(type, price);
-- - обединяващ материала на масата и цената й:
	CREATE INDEX idx_basematerial_price
ON table_(basematerial, price);
-- - обединяващ типа и материала на масата:
	CREATE INDEX idx_type_basematerial
ON table_(type, basematerial);

-- За таблицата Chair:
-- - обединяващ материала на стола и цената му:
CREATE INDEX idx_basematerial_price
ON chair(basematerial, price);
-- - за броя на краката на стола:
CREATE INDEX idx_numLegs
ON chair(num_legs);

-- За таблицата Sofa:
-- - обединяващ материала на дивана и цената му:
CREATE INDEX idx_basematerial_price
ON sofa(basematerial, price);
-- - за броя на местата за сядане на дивана:
	CREATE INDEX idx_numSeats
ON sofa(num_seats);

-- За таблицата Manufacturer:
-- - за името на производителя:
CREATE INDEX idx_name
ON manufacturer(name);
-- - обединяващ името на производителя и държавата, от която е:
CREATE INDEX idx_name_county
ON manufacturer(name, county);

-- За таблицата Location:
-- - обединяващ сектор, ред и позиция:
CREATE INDEX idx_sector_row_position
ON location(sector, row, position);

-- За таблицата Bundle:
-- - обединяващ ID и име на пакет:
CREATE INDEX idx_id_name
ON bundle(id,name);

-- За таблицата Delivery:
-- - обединяващ ID на пакет и код на магазин:
CREATE INDEX idx_bundleID_storeCode
ON delivery(bundle_id,store_code);

-- За таблицата Store:
-- - обединяващ име на магазина и адреса му:
CREATE INDEX idx_name_address
ON store(name, address);
-- - обединяващ тип на магазина и името му:
CREATE INDEX idx_type_name
ON store(type, name);
-- - обединяващ код на магазина и името му:
CREATE INDEX idx_code_name
ON store(code, name);