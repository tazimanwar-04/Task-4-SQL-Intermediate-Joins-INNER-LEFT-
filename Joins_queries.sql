create database chinook;
use chinook;
show tables;
describe customer;
describe invoice;
describe invoiceline;
describe track;
describe genre;
select

-- INNER JOIN customers with invoices
c.customerId,
c.firstName,
c.lastname,
c.country,
i.invoiceId,
i.invoiceDate,
i.total
from customer c
inner join invoice i 
 on c.customerId = i.customerId;

 SELECT COUNT(*) FROM invoice;
 select count(*) from customer c inner join invoice i
 on c.customerId= i.customerId;
 
 --  LEFT JOIN customers without orders
 select
 c.customerId,
 c.firstName,
 c.lastName,
 c.country,
 i.invoiceId
 from customer c
 left join invoice i
 on c.customerId=i.customerId;
 
 select
 c.customerId,
 c.firstName,
 c.lastName,
 c.country
 from customer c
 left join invoice i
 on c.customerId = i.customerId
 where i.invoiceId is null;
 SELECT COUNT(*) FROM customer;
SELECT COUNT(DISTINCT customerId) FROM invoice;


select
i.invoiceId,
i.invoiceDate,
i.billingCountry,
il.trackId,
t.name as trackName,
il.quantity,
il.unitprice
from invoice i 
inner join invoiceline il
on i.invoiceId = il.invoiceId
inner join track t
on il.trackId = t.trackId;

--  Revenue per product
select
t.trackId,
t.name as trackName,
sum(il.quantity * il.unitprice) as totalRevenue
from invoiceline il
inner join track t
on il.trackId = t.trackId
group by 
t.trackId,
t.name
order by totalRevenue desc;


-- Revenue per genre
select
g.genreId,
g.name as genreName,
sum(il.quantity * il.unitPrice) as totalRevenue
from genre g
inner join track t
on g.genreId = t.genreId
inner join invoiceline il
on t.trackId = il.trackId
group by 
g.genreId,
g.name
order by totalRevenue desc;


-- Business analysis queries

select
i.billingCountry,
sum(il.quantity * il.unitPrice) as totalRevenue
from invoice i 
inner join invoiceline il
on i.invoiceId = il.invoiceId
group by
i.billingCountry
order by
totalRevenue desc;

select
sum(il.quantity * il.unitPrice) as totalRevenue
from invoice i 
inner join invoiceline il
on i.invoiceId = il.invoiceId
where
i.invoiceDate between '2012-01-01' and '2012-12-31';

select
c.customerId,
c.firstName,
c.lastName,
sum(i.total) as totalSpent
from customer c
inner join invoice i
on c.customerId = i.customerId
group by
c.customerId,
c.firstName,
c.lastName
order by
totalSpent desc;



-- Final master join query
select
c.customerId,
concat(c.firstName, ' ', c.lastName) as customerName,
c.country,
i.invoiceId,
i.invoiceDate,
g.name as genre,
t.name as trackName,
il.quantity,
il.unitPrice,
(il.quantity * il.unitPrice) as revenue
from customer c 
inner join invoice i
on c.customerId = i.customerId
inner join invoiceline il
on i.invoiceId = il.invoiceId
inner join track t
on il.trackId = t.trackId
inner join genre g
on t.genreId = g.genreId;