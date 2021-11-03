use gs;

CREATE TABLE `gs`.`products` (
  `product_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `uom_id` INT NOT NULL,
  `price_per_unit` DOUBLE NOT NULL,
  PRIMARY KEY (`product_id`));

alter table products
add constraint foreign key(uom_id)
references uom(uom_id);

INSERT INTO products values(1,'toothpaste',1,30);
SELECT * FROM products;

  CREATE TABLE `gs`.`uom` (
  `uom_id` INT NOT NULL,
  `uom_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uom_id`));

INSERT INTO uom values(1, 'each');
INSERT INTO uom values(2, 'kg');

CREATE TABLE `gs`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(100) NOT NULL,
  `total` DOUBLE NOT NULL,
  `datetime` DATETIME NULL,
  PRIMARY KEY (`order_id`));

create table order_details(
	order_id int primary key not null,
    product_id int,
    foreign key(order_id) references orders(order_id),
    foreign key(product_id) references products(product_id),
    quantity double,
    total_price double
);

INSERT INTO orders values(
1,'vedanth',3000,'2020-11-15 00:00:00'
);

INSERT INTO order_details values(
1,1,2,60
);

INSERT INTO `gs`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('2', 'okra', '1', '20');
INSERT INTO `gs`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('3', 'banana', '2', '30');
INSERT INTO `gs`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('4', 'soap', '1', '50');
INSERT INTO `gs`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('5', 'detergent', '1', '100');
INSERT INTO `gs`.`products` (`product_id`, `name`, `uom_id`, `price_per_unit`) VALUES ('6', 'apple', '2', '200');

select product_id,name,uom_id,price_per_unit,uom.uom_name from products natural join uom;

INSERT INTO products VALUES ('7', 'spinach', '1', '36');



