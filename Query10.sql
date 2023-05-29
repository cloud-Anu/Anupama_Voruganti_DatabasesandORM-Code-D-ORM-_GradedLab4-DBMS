/* 10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
Service” else print “Poor Service”. Note that there should be one rating per supplier. */

DELIMITER //

CREATE PROCEDURE GetSupplierServiceRatings()
BEGIN
    SELECT
        SUP.SUPP_ID,
        SUP.SUPP_NAME,
        AVG(RAT.RAT_RATSTARS) AS AverageRating,
        CASE
            WHEN AVG(RAT.RAT_RATSTARS) = 5 THEN 'Excellent Service'
            WHEN AVG(RAT.RAT_RATSTARS) > 4 THEN 'Good Service'
            WHEN AVG(RAT.RAT_RATSTARS) > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS TypeOfService
    FROM
        supplier SUP
    INNER JOIN
        supplier_pricing SUPP ON SUP.SUPP_ID = SUPP.SUPP_ID
    INNER JOIN
        orders ORD ON SUPP.PRICING_ID = ORD.PRICING_ID
    INNER JOIN
        rating RAT ON ORD.ORD_ID = RAT.ORD_ID
    GROUP BY
        SUP.SUPP_ID, SUP.SUPP_NAME;
END //

DELIMITER ;

-- To Execute the Procedure

call GetSupplierServiceRatings();

-- To delete Procedure

DROP PROCEDURE GetSupplierServiceRatings
