DROP TABLE IF EXISTS data;

CREATE TABLE "data" (
"date" TIMESTAMP,
  "pair" TEXT,
  "quantity" INTEGER,
  "price" REAL,
  "providers" TEXT
);

INSERT INTO data (date, pair, quantity, price, providers) VALUES ('2018-01-01 00:00:00+00:00', 'GBP/EUR', '1998591', '2.31012', 'CBOE');

INSERT INTO data (date, pair, quantity, price, providers) VALUES ('2018-01-01 00:00:00.100000+00:00', 'EUR/USD', '1935181', '2.52439', 'UBS');

INSERT INTO data (date, pair, quantity, price, providers) VALUES ('2018-01-01 00:00:00.200000+00:00', 'EUR/USD', '1452560', '2.76961', 'UBS');

INSERT INTO data (date, pair, quantity, price, providers) VALUES ('2018-01-01 00:00:00.300000+00:00', 'GBP/EUR', '1783938', '2.65587', 'UBS');

INSERT INTO data (date, pair, quantity, price, providers) VALUES ('2018-01-01 00:00:00.400000+00:00', 'EUR/USD', '1203219', '1.94936', 'CBOE');

INSERT INTO data (date, pair, quantity, price, providers) VALUES ('2018-01-01 00:00:00.500000+00:00', 'GBP/EUR', '1423110', '2.40902', 'CBOE');

INSERT INTO data (date, pair, quantity, price, providers) VALUES ('2018-01-01 00:00:00.600000+00:00', 'GBP/USD', '1754853', '1.77362', 'UBS');

INSERT INTO data (date, pair, quantity, price, providers) VALUES ('2018-01-01 00:00:00.700000+00:00', 'GBP/USD', '1677559', '1.45056', 'UBS');

INSERT INTO data (date, pair, quantity, price, providers) VALUES ('2018-01-01 00:00:00.800000+00:00', 'EUR/USD', '1734093', '1.05181', 'CBOE');

INSERT INTO data (date, pair, quantity, price, providers) VALUES ('2018-01-01 00:00:00.900000+00:00', 'GBP/USD', '1828291', '1.63939', 'UBS');