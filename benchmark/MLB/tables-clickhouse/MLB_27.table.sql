CREATE TABLE "MLB_27"(
  "ID" UInt32,
  "AB" smallint NOT NULL,
  "AVG" decimal(4, 3),
  "BABIP" decimal(4, 3),
  "BB." decimal(4, 1),
  "BB" smallint NOT NULL,
  "BIP." decimal(4, 1),
  "BIP" smallint NOT NULL,
  "Ba." decimal(4, 1),
  "Balls" smallint,
  "Ca." decimal(4, 1),
  "Calculation_496521908233248779" decimal(4, 3),
  "Called" smallint,
  "F." decimal(4, 1),
  "FB." decimal(4, 1) NOT NULL,
  "FB" smallint NOT NULL,
  "Foul" smallint,
  "GB." decimal(4, 1) NOT NULL,
  "GB" smallint NOT NULL,
  "GIDP" smallint NOT NULL,
  "HBP" smallint NOT NULL,
  "HR" smallint NOT NULL,
  "H" smallint NOT NULL,
  "ISO" decimal(4, 3),
  "K." decimal(4, 1),
  "LD." decimal(4, 1) NOT NULL,
  "LD" smallint NOT NULL,
  "Number of Records" smallint NOT NULL,
  "OBP" decimal(4, 3),
  "PA" smallint NOT NULL,
  "PU." decimal(4, 1) NOT NULL,
  "PU" smallint NOT NULL,
  "Pitches" smallint,
  "SF" smallint NOT NULL,
  "SH" smallint NOT NULL,
  "SLG" decimal(4, 3),
  "SOL" smallint NOT NULL,
  "SOS" smallint NOT NULL,
  "SO" smallint NOT NULL,
  "Str." decimal(4, 1),
  "Strikes" smallint,
  "SwStr." decimal(4, 1),
  "Swinging" smallint,
  "TB" smallint NOT NULL,
  "Wh.Sw" decimal(4, 1),
  "X1B" smallint NOT NULL,
  "X2B" smallint NOT NULL,
  "X3B" smallint NOT NULL,
  "batter_name" varchar(26) NOT NULL,
  "iBB" smallint NOT NULL,
  "league" varchar(4) NOT NULL,
  "parentteam" varchar(3) NOT NULL,
  "pwRC." smallint,
  "statei" varchar(12) NOT NULL,
  "teamname" varchar(27) NOT NULL,
  "wOBA" decimal(4, 3) NOT NULL,
  "wRAA" decimal(3, 1) NOT NULL,
  "wRC." smallint,
  "wRC" decimal(3, 1) NOT NULL,
  "year" smallint NOT NULL,
  "Calculation_40532458110861321" decimal(17, 14),
  "Calculation_40532458115964950" decimal(17, 14)
)
ENGINE MergeTree()
PRIMARY KEY (ID);
