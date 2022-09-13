-- Display all votes issued with voter information
SELECT TIME, FIRSTNAME, POLLINGSTATION_PUID, VUID FROM VOTEISSUED JOIN VOTER ON VOTEISSUED.VOTER_VUID = VOTER.VUID;

-- Display all recorded preferences
    -- There are more votes than voters in here, this is to demonstrate multiple rounds of elimination
SELECT * FROM VOTEPREFERENCE;