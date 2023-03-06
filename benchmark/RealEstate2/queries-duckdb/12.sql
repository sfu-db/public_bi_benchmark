SELECT "RealEstate2_7"."Calculation_222787466264023043" AS "Calculation_222787466264023043",   "RealEstate2_7"."Street" AS "Street",   AVG(CAST(CAST("RealEstate2_7"."Price" AS BIGINT) AS double)) AS "avg:Price:ok",   SUM(1) AS "cnt:Date_of_Transfer:ok",   CAST(MAX("RealEstate2_7"."Price") AS BIGINT) AS "max:Price:ok" FROM "RealEstate2_7" WHERE ((instr("RealEstate2_7"."Street",'THE BISHOPS AVENUE')>0) AND ("RealEstate2_7"."County" = 'CITY OF NOTTINGHAM') AND ("RealEstate2_7"."Date_of_Transfer" >= cast('1996-01-01' as DATE)) AND ("RealEstate2_7"."Date_of_Transfer" < cast('2019-01-01' as DATE)) AND ("RealEstate2_7"."Postcode_District" = 'N2')) GROUP BY "RealEstate2_7"."Calculation_222787466264023043",   "RealEstate2_7"."Street";
