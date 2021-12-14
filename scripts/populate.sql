DROP TABLE IF EXISTS data;

CREATE TABLE "data" (
"date" REAL,
  "pair" TEXT,
  "quantity" INTEGER,
  "price" REAL,
  "provider" TEXT
);

INSERT INTO data (date, pair, quantity, price, provider) VALUES ('1514764800.0', 'GBP/USD', '1181830', '2.13289', 'CBOE');

INSERT INTO data (date, pair, quantity, price, provider) VALUES ('1514764800.1', 'EUR/USD', '1726034', '2.92386', 'CBOE');

INSERT INTO data (date, pair, quantity, price, provider) VALUES ('1514764800.2', 'GBP/EUR', '1178238', '1.34977', 'UBS');

INSERT INTO data (date, pair, quantity, price, provider) VALUES ('1514764800.3', 'GBP/EUR', '1632815', '1.37101', 'UBS');

INSERT INTO data (date, pair, quantity, price, provider) VALUES ('1514764800.4', 'EUR/USD', '1484703', '2.7064', 'UBS');

INSERT INTO data (date, pair, quantity, price, provider) VALUES ('1514764800.5', 'EUR/USD', '1876121', '1.07752', 'CBOE');

INSERT INTO data (date, pair, quantity, price, provider) VALUES ('1514764800.6', 'GBP/USD', '1664148', '2.50586', 'CBOE');

INSERT INTO data (date, pair, quantity, price, provider) VALUES ('1514764800.7', 'EUR/USD', '1052885', '2.97619', 'CBOE');

INSERT INTO data (date, pair, quantity, price, provider) VALUES ('1514764800.8', 'GBP/EUR', '1258454', '1.3521', 'UBS');

INSERT INTO data (date, pair, quantity, price, provider) VALUES ('1514764800.9', 'GBP/EUR', '1683975', '2.86516', 'UBS');