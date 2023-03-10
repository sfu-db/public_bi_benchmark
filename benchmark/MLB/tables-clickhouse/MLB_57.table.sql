CREATE TABLE "MLB_57"(
  "ID" UInt32,
  "AVG" decimal(4, 3) NOT NULL,
  "BABIP" decimal(4, 3) NOT NULL,
  "BB." decimal(2, 1) NOT NULL,
  "BIP." decimal(3, 1),
  "Ba." decimal(3, 1),
  "Ca." decimal(3, 1),
  "F." decimal(3, 1),
  "FB." decimal(3, 1) NOT NULL,
  "GB." decimal(3, 1) NOT NULL,
  "ISO" decimal(4, 3) NOT NULL,
  "K." decimal(3, 1) NOT NULL,
  "LD." decimal(3, 1) NOT NULL,
  "Number of Records" smallint NOT NULL,
  "OBP" decimal(4, 3) NOT NULL,
  "OPS" decimal(4, 3) NOT NULL,
  "PU." decimal(2, 1) NOT NULL,
  "SLG" decimal(4, 3) NOT NULL,
  "Str." decimal(3, 1),
  "SwStr." decimal(3, 1),
  "Wh.Sw" decimal(3, 1),
  "league" varchar(4) NOT NULL,
  "wOBA" decimal(4, 3) NOT NULL,
  "year" smallint NOT NULL
)
ENGINE MergeTree()
PRIMARY KEY (ID);
