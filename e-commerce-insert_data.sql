INSERT INTO customer (
	first_name,
	last_name,
	address,
	billing_info,
	email
) VALUES (
	'Dylan',
	'Smith',
	'1313 Mockingbird Lane',
	'4242 4242 4242 4242',
	'dylan@codingtemple.com'
);

INSERT INTO products VALUES (
	'Pikachu Card',
	'10.50',
	'A Rare Holographic Pikachu Card'
);

INSERT INTO products (
	product_name,
	price,
	description
) VALUES (
	'Card Binder',
	12.99,
	'Binder to hold cards'
), (
	'Charizard Card',
	100.00,
	'1st Edition Charizard Card'
);

SELECT *
FROM products;

INSERT INTO customer (
	first_name,
	email
) VALUES (
	'Shoha',
	'shoha@ct.com'
);