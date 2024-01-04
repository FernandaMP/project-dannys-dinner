CREATE SCHEMA dannys_diner;
SET search_path = dannys_diner;

CREATE TABLE sales (
  "customer_id" VARCHAR(1),
  "order_date" DATE,
  "product_id" INTEGER
);

INSERT INTO sales
  ("customer_id", "order_date", "product_id")
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 

CREATE TABLE menu (
  "product_id" INTEGER,
  "product_name" VARCHAR(5),
  "price" INTEGER
);

INSERT INTO menu
  ("product_id", "product_name", "price")
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE members (
  "customer_id" VARCHAR(1),
  "join_date" DATE
);

INSERT INTO members
  ("customer_id", "join_date")
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');
  

select * from dannys_diner.members
select * from dannys_diner.menu
select * from dannys_diner.sales

-- 1. Qual é o valor total gasto por cada cliente no restaurante?

select sales.customer_id as cliente_id,
sum(price) as total_gasto
from dannys_diner.sales
inner join dannys_diner.menu
on sales.product_id = menu.product_id
group by cliente_id
order by total_gasto desc

-- 2. Quantos dias cada cliente visitou o restaurante?

select customer_id,
count (distinct order_date ) as total_visitas
from dannys_diner.sales
group by customer_id

-- 3. Qual foi o primeiro item do cardápio comprado por cada cliente?
with ranking_itens as(
select
sales.customer_id,
sales.order_date,
menu.product_name,
dense_rank() over(partition by sales.customer_id order by sales.order_date) as dr
from dannys_diner.sales as sales
inner join dannys_diner.menu as menu
on sales.product_id = menu.product_id)

select 
customer_id as cliente_id,
product_name as primeiro_produto
from ranking_itens
where dr = 1
group by cliente_id, primeiro_produto

-- 4. Qual é o item mais comprado no cardápio e quantas vezes foi pedido por todos os clientes?

-- Item mais comprado do cardápio
select menu.product_name, count (sales.product_id) as item_mais_comprado
from dannys_diner.sales as sales
inner join dannys_diner.menu as menu
on sales.product_id = menu.product_id
group by menu.product_name
order by count(sales.product_id) desc
limit 1

-- Itens comprados por cliente
select menu.product_name, sales.customer_id, count (sales.product_id) as item_mais_comprado
from dannys_diner.sales as sales
inner join dannys_diner.menu as menu
on sales.product_id = menu.product_id
group by menu.product_name, sales.customer_id
order by count(sales.product_id) desc

-- 5. Qual item foi mais popular para cada cliente?

with popular as (
select 
sales.customer_id as cliente_id,
menu.product_name as nome_produto,
count (sales.product_id) as quantidade_comprada,
dense_rank() over(partition by sales.customer_id
order by count(sales.product_id) desc) as dr
from dannys_diner.sales as sales
inner join dannys_diner.menu as menu
on sales.product_id = menu.product_id
group by sales.customer_id, menu.product_name)

select cliente_id, nome_produto, quantidade_comprada
from popular
where dr = 1

-- 6. Qual foi o primeiro item adquirido por cada cliente após tornar-se membro?

-- Primeira opção
with rank_primeira_compra as(
select
sales.customer_id,
sales.order_date,
menu.product_name,
dense_rank() over(partition by sales.customer_id order by sales.order_date) as Rank
from dannys_diner.sales as sales
inner join dannys_diner.menu as menu
on sales.product_id = menu.product_id
inner join dannys_diner.members
on members.customer_id = members.customer_id
where sales.order_date >= members.join_date)

select 
customer_id, product_name, order_date
from rank_primeira_compra
where Rank = 1
group by customer_id, product_name, order_date

-- Segunda opção
with primeira_compra as (
select sales.customer_id,
sales.product_id,
sales.order_date,
row_number()over(partition by sales.customer_id order by sales.order_date) as rn
from dannys_diner.sales as sales
inner join dannys_diner.members as members
on sales.customer_id = members.customer_id and 
sales.order_date >= members.join_date)

select customer_id, product_name, order_date
from primeira_compra
inner join dannys_diner.menu as menu
on primeira_compra.product_id = menu.product_id
where rn = 1
order by customer_id asc

-- 7. Qual item foi adquirido antes de o cliente se tornar um membro?

with compra_anterior_membro as (
select sales.customer_id,
menu.product_name,
sales.order_date,
dense_rank() over(partition by sales.customer_id order by sales.order_date) as rn
from dannys_diner.sales as sales
inner join dannys_diner.menu as menu
on menu.product_id = sales.product_id
inner join dannys_diner.members as members
on sales.customer_id = members.customer_id
where sales.order_date < members.join_date)

select customer_id, product_name, order_date
from compra_anterior_membro
where rn = 1

-- Opção 2
WITH compra_anterior_membro AS (
SELECT 
sales.customer_id,
menu.product_name,
sales.order_date,
DENSE_RANK() OVER (PARTITION BY sales.customer_id ORDER BY sales.order_date DESC) AS rn
FROM dannys_diner.sales AS sales
INNER JOIN dannys_diner.menu AS menu ON menu.product_id = sales.product_id
INNER JOIN dannys_diner.members AS members ON sales.customer_id = members.customer_id
WHERE sales.order_date < members.join_date)

SELECT 
customer_id, 
product_name, 
order_date
FROM 
compra_anterior_membro
WHERE 
rn = 1

-- 8. Qual é o total de itens e valor gasto por cada membro antes de se tornarem membros?

select sales.customer_id as cliente_id,
count (sales.product_id) as total_itens,
sum(price) as total_gasto
from dannys_diner.sales as sales
inner join dannys_diner.menu as menu
on sales.product_id = menu.product_id
inner join dannys_diner.members as members
on sales.customer_id = members.customer_id
where sales.order_date < members.join_date
group by cliente_id
order by total_gasto desc

-- 9. Se cada $1 gasto equivale a 10 pontos e o sushi tem um multiplicador de pontos de 2x, quantos pontos cada cliente teria?

select sales.customer_id as cliente_id,
menu.product_name as itens_menu,
sum(price) as total_gasto
from dannys_diner.sales as sales
inner join dannys_diner.menu as menu
on sales.product_id = menu.product_id
group by cliente_id, product_name
order by cliente_id

select sales.customer_id as cliente_id,
sum(case when menu.product_name = 'sushi' then price *20
else price*10
end) as pontos_cliente
from dannys_diner.sales as sales
inner join dannys_diner.menu as menu
on sales.product_id = menu.product_id
group by cliente_id
order by cliente_id

-- 10. Durante a primeira semana após a adesão de um cliente ao programa (incluindo a data de inscrição), 
-- eles recebem pontos em dobro em todos os itens, não se limitando ao sushi. Ao considerar essa promoção, 
-- quantos pontos os clientes A e B acumulariam no final de janeiro?

with pontos as (
select
sales.customer_id as cliente_id,
menu.product_name as produto,
menu.price as valor,
sales.order_date as data_pedido,
members.join_date as adesao,
join_date + 6 as uma_semana
from dannys_diner.sales as sales
join dannys_diner.menu as menu
on sales.product_id = menu.product_id
join dannys_diner.members as members
on sales.customer_id = members.customer_id)

select cliente_id,
sum(case when data_pedido >= adesao
and data_pedido <= uma_semana
then valor * 20
when produto = 'sushi' then valor * 20
else valor * 10 end) as total_pontos
from pontos
where data_pedido < '2021-02-01'
group by cliente_id

-- Bônus
-- Recrie a tabela usando os dados disponíveis

create view membro_status as
select 
sales.customer_id,
sales.order_date,
menu.product_name,
menu.price,
case 
when members.join_date > sales.order_date then 'Não'
when members.join_date <= sales.order_date then 'Sim'
else 'Não' end as membro
from dannys_diner.sales as sales
left join dannys_diner.menu as menu
on sales.product_id = menu.product_id
left join dannys_diner.members as members
on sales.customer_id = members.customer_id
order by customer_id, order_date

select * from membro_status

-- Rank All Things

select *,
case when membro = 'Não' then NULL
else dense_rank() over(partition by customer_id, membro order by order_date)
end as ranking
from membro_status




