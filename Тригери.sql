-- Радослав Велков, №62528 --

-- ТРИГЕРИ:

-- - Добавя нова колона „num_items“ към таблицата manufacturer, 
-- която ще съдържа броя на артикулите, които всеки производител 
-- е произвел (с check ограничение):
ALTER TABLE manufacturer ADD num_items INT CHECK(num_items>=0);

-- - Тригер за таблицата item, който да се задейства при вмъкване на 
-- нов продукт (стол, диван или маса) в таблицата и да увеличава с 
-- единица броя на артикулите за таблицата manufacturer:
	CREATE TRIGGER tr_increase_num_of_items
ON item
FOR INSERT
AS
UPDATE manufacturer
SET num_items = isnull(num_items,0)+(SELECT count(1) 
   FROM inserted 
   WHERE manufacturer_code=manufacturer.code)
WHERE manufacturer.code IN (SELECT manufacturer_code FROM inserted);

-- - Тригер за таблицата item, който да се задейства при изтриване на 
-- продукт (стол, диван или маса) от таблицата и да намалява с единица 
-- броя на артикулите за таблицата manufacturer:
CREATE TRIGGER tr_decrease_num_of_items
ON item
FOR DELETE
AS
UPDATE manufacturer
   	SET num_items = num_items - (SELECT count(1) 
  FROM deleted 
  WHERE manufacturer_code=manufacturer.code)
 	WHERE manufacturer.code IN (SELECT manufacturer_code FROM deleted);