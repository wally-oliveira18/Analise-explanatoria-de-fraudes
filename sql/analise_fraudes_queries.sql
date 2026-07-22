SELECT *
FROM credit_card_fraud_2026; 

-- conta o numero de transações não falsas 
SELECT COUNT(transaction_id) AS count_transaction
FROM credit_card_fraud_2026;

-- quantidade de transações que são fraudes 
SELECT SUM(is_fraud) AS sum_fraud
FROM credit_card_fraud_2026
WHERE is_fraud = '1';

-- valor total transações
SELECT ROUND(SUM(amount_usd),0) AS sum_usd
FROM credit_card_fraud_2026; 

-- valor medio das transações 
SELECT ROUND(AVG(amount_usd),2)
FROM credit_card_fraud_2026; 

-- valor da maior transação 
SELECT MAX(amount_usd) 
FROM credit_card_fraud_2026;

-- valor da menor transação 
SELECT MIN(amount_usd)
FROM credit_card_fraud_2026; 

-- quantos tipos diferentes de cartões existem 

SELECT COUNT(DISTINCT card_type)
FROM credit_card_fraud_2026;

-- quantidade de categoria de comerciantes 
SELECT COUNT(DISTINCT merchant_category)
FROM credit_card_fraud_2026; 

-- perfil das transações por categoria
SELECT merchant_category, 
		COUNT(transaction_id) AS quantidade_transacoes
FROM credit_card_fraud_2026
GROUP BY merchant_category;

-- valor movimentado por categoria por ordem decrescente
SELECT merchant_category,
		ROUND(SUM(amount_usd),2) AS valor_movimentado_categoria
FROM credit_card_fraud_2026
GROUP BY merchant_category
ORDER BY valor_movimentado_categoria DESC;

-- valor medio por categoria 
SELECT merchant_category,
       ROUND(AVG(amount_usd), 2) AS valor_medio_movimentado_categoria
FROM credit_card_fraud_2026
GROUP BY merchant_category
ORDER BY valor_medio_movimentado_categoria DESC;

-- quantidade de transaçoes por cartao
SELECT card_type,
		COUNT(transaction_id) AS quantidade_transacoes_por_cartao
FROM credit_card_fraud_2026
GROUP BY card_type
ORDER BY quantidade_transacoes_por_cartao DESC;

-- valor Medio por cartao
SELECT card_type,
		ROUND(AVG(transaction_id),2) AS valor_medio_por_cartao
FROM credit_card_fraud_2026
GROUP BY card_type
ORDER BY valor_medio_por_cartao; 

-- quantidade de transacoes por canal 
SELECT channel,
		COUNT(transaction_id) AS quantidade_transacoes_por_canal
FROM credit_card_fraud_2026
GROUP BY channel
ORDER BY quantidade_transacoes_por_canal;

-- quantidade de transacoes por dispositivo
SELECT device_type,
	COUNT(transaction_id) AS quantidade_transacoes_por_dispositivo
FROM credit_card_fraud_2026
GROUP BY device_type
ORDER BY quantidade_transacoes_por_dispositivo;

-- idade media dos clientes 
SELECT ROUND(AVG(customer_age),2) AS idade_media
FROM credit_card_fraud_2026;

-- saldo medio das contas 
SELECT ROUND(AVG(account_balance_usd),2) AS saldo_medio_contas
FROM credit_card_fraud_2026;

-- maior saldo 
SELECT MAX(account_balance_usd) AS maior_saldo
FROM credit_card_fraud_2026;

-- menor saldo 

SELECT MIN(account_balance_usd) AS menor_saldo
FROM credit_card_fraud_2026;

-- quantidade de transacoes por idade 
SELECT customer_age, 
		COUNT(transaction_id) AS quantidade_clientes_por_idade
FROM credit_card_fraud_2026
GROUP BY customer_age
ORDER BY quantidade_clientes_por_idade DESC;

-- quantidade de transações internacionais
SELECT ip_country_mismatch, 
		COUNT(transaction_id) AS quantidade_transacoes_nacionais
FROM credit_card_fraud_2026
WHERE ip_country_mismatch = 'True';

-- quantidade de transacoes nacionais 
SELECT ip_country_mismatch, 
		COUNT(transaction_id) AS quantidade_transacoes_nacionais
FROM credit_card_fraud_2026
WHERE ip_country_mismatch = 'False';

-- quantidade de transacoes por VPN
SELECT used_vpn, 
	COUNT(transaction_id) AS quantidade_trnasacoes_vpn
FROM credit_card_fraud_2026
WHERE used_vpn = 'True';


-- Quantidade de transações por Merchant Risk Score maior que 80.
SELECT merchant_risk_score, 
       COUNT(transaction_id) AS quantidade_transacoes_merchant
FROM credit_card_fraud_2026
WHERE merchant_risk_score > 80
GROUP BY merchant_risk_score
ORDER BY quantidade_transacoes_merchant DESC;

-- Quantidade de transações por Velocity Score maior que 20.

SELECT velocity_score, 
       COUNT(transaction_id) AS quantidade_transacoes_velocity
FROM credit_card_fraud_2026
WHERE velocity_score > 20
GROUP BY velocity_score
ORDER BY quantidade_transacoes_velocity;

-- quantidade de fraudes por categoria 

SELECT merchant_category, 
       COUNT(transaction_id) AS quantidade_fraudes_categoria
FROM credit_card_fraud_2026
WHERE is_fraud = 1
GROUP BY merchant_category
ORDER BY quantidade_fraudes_categoria DESC;

-- valor perdido em fraudes 

SELECT ROUND(SUM(amount_usd),2) AS valor_perdido_fraudes,	
	is_fraud
FROM credit_card_fraud_2026
WHERE is_fraud = '1';

-- QUantidade de fraudes por bandeira

SELECT card_type,
	COUNT(card_type) AS quantidade_fraudes_bandeiras
FROM credit_card_fraud_2026
WHERE is_fraud = '1'
GROUP BY card_type;

-- quantidade de fraudes por dispositivo 

SELECT device_type,
	COUNT(device_type) AS quantidade_fraudes_dispositivo
FROM credit_card_fraud_2026
WHERE is_fraud = '1'
GROUP BY device_type;

-- horarios com maior quantidade de fraude 

SELECT hours_since_last_txn,
       COUNT(transaction_id) AS quantidade_fraudes_horario
FROM credit_card_fraud_2026
WHERE is_fraud = 1
GROUP BY hours_since_last_txn
ORDER BY quantidade_fraudes_horario DESC;