
--FUNCTIONS TO USE
--PARAM updateAccount(ACCOUNT,AMOUNT)
CREATE FUNCTION updateAccount(INTEGER,NUMERIC) RETURNS INTEGER AS '
	BEGIN
		IF $2 IS NULL THEN
			RAISE EXCEPTION ''% cannot have null amount'', $2;
		END IF;
		IF ($2 < 0) THEN
	        IF (SELECT true
	        	FROM account	        	
	        	WHERE account=$2
	        	AND amount<abs($2))
	       THEN
	            RAISE EXCEPTION ''% not enough money'', $2;
	       END IF;
        END IF;
		UPDATE account SET amount=amount+$2 WHERE account=$1;
	RETURN 0;
END;' LANGUAGE plpgsql;

-- PARAM payBill(AMOUNT,ACCOUNT,PAYEE,CUSTOMER,DATE)
CREATE FUNCTION payBill(NUMERIC,INTEGER,INTEGER,INTEGER,DATE) RETURNS INTEGER AS '
	DECLARE v_desc VARCHAR;
	DECLARE v_payee VARCHAR; 
	DECLARE v_remaining NUMERIC;
	DECLARE v_amount NUMERIC;
	BEGIN
		IF ($1 < 0 ) THEN
			RAISE EXCEPTION ''% cannot have negative amount'', $1;
		END IF;
		
		v_amount := -1 * $1;
		IF v_overdraft IS NULL THEN
			v_overdraft := 0;
		END IF;
		
		SELECT (amount-abs($1)) INTO v_remaining FROM account WHERE account=$2;
		SELECT payee INTO v_payee FROM payee WHERE pid=$3;
		
		v_desc := ''Bill payment - '' || v_payee;
		
		IF (v_remaining < 0) THEN
			RAISE EXCEPTION ''Insuffient funds, % does not exist in your account'', $1;
		END IF;
		
		INSERT INTO bill(pid,date,account,cid,amount) VALUES($3,current_date,$2,$4,$1);
		
		INSERT INTO activity(descr,account,cid,date,rem_bal,amount) VALUES(v_desc,$2,$4,$5,v_remaining,v_amount);

		PERFORM updateaccount($2,v_amount);
	RETURN 0;
END;' LANGUAGE plpgsql;

-- PARAM (AMOUNT,ACCOUNTFROM,ACCOUNTTO,CUSTOMER)
CREATE FUNCTION transferMoney(NUMERIC,INTEGER,INTEGER,INTEGER) RETURNS INTEGER AS '
	DECLARE v_desc VARCHAR;
	DECLARE v_remaining NUMERIC;
	DECLARE v_amount NUMERIC;
	BEGIN
		IF ($1 < 0 ) THEN
			RAISE EXCEPTION ''% cannot have negative amount'', $1;
		END IF;

		-- INSERT MONEY TO THE TO
		v_amount := -1 * $1;
		SELECT (amount-abs($1)) INTO v_remaining FROM account WHERE account=$2;
		v_desc := ''Transfer to - '' || to_char($3,'000000000000');
		
		IF (v_remaining < 0) THEN
			RAISE EXCEPTION ''Insuffient funds, % does not exist in your account'', $1;
		END IF;
		
		INSERT INTO activity(descr,account,cid,date,rem_bal,amount) VALUES(v_desc,$2,$4,current_date,v_remaining,v_amount);
		PERFORM updateaccount($2,v_amount);
		
		-- INSERT MONEY TO THE FROM
		SELECT (amount+abs($1)) INTO v_remaining FROM account WHERE account=$3;
		
		IF (v_remaining < 0) THEN
			RAISE EXCEPTION ''Insuffient funds, % does not exist in your account'', $1;
		END IF;
		
		v_desc := ''Transfer from - '' || to_char($2,'000000000000');
		
		INSERT INTO activity(descr,account,cid,date,rem_bal,amount) VALUES(v_desc,$3,$4,current_date,v_remaining,$1);
		PERFORM updateaccount($3,$1);
		
	RETURN 0;
END;' LANGUAGE plpgsql;