CREATE TABLE "RealEstate2_5"(
  "ID" UInt32,
  "Address_1" varchar(50),
  "Address_2" varchar(42),
  "County" varchar(28) NOT NULL,
  "County (copy)" varchar(28) NOT NULL,
  "Date_of_Transfer" date NOT NULL,
  "District" varchar(28) NOT NULL,
  "Duration" varchar(1) NOT NULL,
  "Latitude" decimal(15, 13),
  "Locality" varchar(35),
  "Longitude" double,
  "New_Build" varchar(1) NOT NULL,
  "Number of Records" smallint NOT NULL,
  "Postcode" varchar(8),
  "Postcode_District" varchar(4),
  "Postcode_Region" varchar(2),
  "Postcode_Sector" varchar(6),
  "Price" integer NOT NULL,
  "Price_Paid_Transaction_Type" varchar(1) NOT NULL,
  "Property_Type" varchar(1) NOT NULL,
  "Street" varchar(44),
  "Town/City" varchar(22) NOT NULL,
  "Transaction_ID" varchar(38) NOT NULL,
  "Calculation_342484700263473152" varchar(22) NOT NULL,
  "Calculation_222787466265260036" varchar(9) NOT NULL,
  "Calculation_222787466264023043" varchar(117) NOT NULL,
  "Calculation_222787466257584130" boolean NOT NULL,
  "town/city url string (copy)" varchar(49)
)
ENGINE MergeTree()
PRIMARY KEY (ID);
