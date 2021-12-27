--- Check card_holder table data after import
SELECT *
FROM card_holder

--- Check credit_card table data after import
SELECT *
FROM credit_card

--- Check merchant table data after import
SELECT *
FROM merchant

--- Check merchant_category table data after import
SELECT *
FROM merchant_category

--- Check transaction table data after import
SELECT *
FROM transaction

--- queries for Data Analysis Part 1
--- query for Data Analysis Part 1 Question 1
SELECT card AS "Card Number", COUNT(amount) AS "Count of Sub $2 Transactions" 
FROM transaction
WHERE amount < 2.00
GROUP BY card
ORDER BY "Count of Sub $2 Transactions" DESC;



--- queries for Data Analysis Part 2
--- query for Data Analysis Part 2 Question 1
--- loading data for card holder 2 and 18 from the database
SELECT card_holder.id AS "cardholder", transaction.date AS "hour",  transaction.amount AS "amount"
FROM transaction
JOIN credit_card on credit_card.card = transaction.card
JOIN card_holder on card_holder.id = credit_card.cardholder_id
WHERE card_holder.id = 2 or card_holder.id = 18;

--- query for Data Analysis Part 2 Question 2
--- loading transaction data for card holder 25
SELECT transaction.date AS "date",  transaction.amount AS "amount"
FROM transaction
JOIN card_holder on card_holder.id = transaction.id_merchant
WHERE card_holder.id = 25;
