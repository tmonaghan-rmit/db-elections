-- Using Michael, populate a vote
DECLARE
   type vote_array is varray(3) of VOTEPREFERENCE.PREFERENCENUMBER%TYPE;
   array vote_array := vote_array('0', '2', '1');
   
   total_candidates number := 3;
   
   VOTE_VUID VOTE.VUID%TYPE;
   ELECTORATE_EUID ELECTORATE.EUID%TYPE;
   VOTERS_VUID VOTER.VUID%TYPE;
   POLLING_STATION_PUID POLLINGSTATION.PUID%TYPE;
   
BEGIN

SELECT MAX(VUID) + 1 INTO VOTE_VUID FROM VOTE;

SELECT EUID INTO ELECTORATE_EUID FROM ELECTORATE WHERE NAME = 'Melbourne';

INSERT INTO VOTE VALUES (VOTE_VUID, ELECTORATE_EUID);

FOR PREFERENCE_NUM IN 1..TOTAL_CANDIDATES LOOP
    INSERT INTO VOTEPREFERENCE VALUES (PREFERENCE_NUM, VOTE_VUID, array(PREFERENCE_NUM));

END LOOP;

SELECT PUID INTO POLLING_STATION_PUID FROM POLLINGSTATION WHERE NAME = 'St.Johns Church';

SELECT VUID INTO VOTERS_VUID FROM VOTER WHERE FIRSTNAME = 'Michael';

INSERT INTO VOTEISSUED VALUES (VOTERS_VUID,POLLING_STATION_PUID, CURRENT_TIMESTAMP);

END;