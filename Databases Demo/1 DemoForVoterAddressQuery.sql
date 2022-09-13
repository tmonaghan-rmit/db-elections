SELECT
    FIRSTNAME,
    MIDDLENAMES,
    LASTNAME,
    DOB,
    STREETNUM,
    STREETNAME,
    SUBURB,
    POSTCODE
FROM
         HOMEADDRESS
         INNER JOIN VOTER
         ON HOMEADDRESS.VOTER_VUID = VOTER.VUID
WHERE
    VOTER_VUID = (
        SELECT
            VUID
        FROM
            VOTER
        WHERE
                FIRSTNAME = 'Ella'
            AND MIDDLENAMES = 'Joanne'
            AND LASTNAME = 'Johnston'
            AND DOB = TO_DATE('07/07/1950', 'DD/MM/YYYY')
    );