CREATE TABLE "MLB_4"(
  "ID" UInt32,
  "Number of Records" smallint NOT NULL,
  "atbat_des" varchar(424),
  "awayteam" varchar(3) NOT NULL,
  "b_height" varchar(4) NOT NULL,
  "batted_ball_type" varchar(2) NOT NULL,
  "batter_name" varchar(26) NOT NULL,
  "day" smallint NOT NULL,
  "des" varchar(20),
  "event" varchar(20),
  "hometeam" varchar(3) NOT NULL,
  "inning" smallint NOT NULL,
  "inning_side" varchar(6) NOT NULL,
  "league" varchar(4) NOT NULL,
  "level" varchar(3) NOT NULL,
  "month" smallint NOT NULL,
  "our.x" double NOT NULL,
  "our.y" double NOT NULL,
  "p_throws" varchar(1),
  "pitcher_name" varchar(29) NOT NULL,
  "r" decimal(18, 15) NOT NULL,
  "stand" varchar(1) NOT NULL,
  "theta" double NOT NULL,
  "year" smallint NOT NULL,
  "Calculation_40532458064297984" date NOT NULL
)
ENGINE MergeTree()
PRIMARY KEY (ID);
