--Show all columns and rows from the dataset.
select * from airbnbdetails;
--List only the listing name and price
select NAME,PRICE from airbnbdetails;
--Show all listings located in Manhattan.
select NAME,NEIGHBOURHOOD_GROUP from airbnbdetails Where NEIGHBOURHOOD_GROUP= 'Manhattan';
--Find listings with a price less than ₹1000
select NAME,PRICE from airbnbdetails Where PRICE<1000;
--Display all listings that are Private rooms
select NAME,ROOM_TYPE from airbnbdetails Where ROOM_TYPE='Private room';
--Show the top 5 most expensive listings.
select NAME,PRICE from (select NAME,PRICE from airbnbdetails WHERE PRICE IS NOT NULL order by PRICE desc) where rownum <=5
--List all listings available for all 365 days
select NAME,AVAILABILITY_365 from airbnbdetails where AVAILABILITY_365 = 365;
--How many listings are there in each neighbourhood group?
SELECT NEIGHBOURHOOD_GROUP,COUNT(NAME)as listingscount from airbnbdetails group by NEIGHBOURHOOD_GROUP;
--What is the average price for each room type?
select ROOM_TYPE,AVG(PRICE) AS averageprice from airbnbdetails group by ROOM_TYPE;
--Find listings that have zero reviews
select NAME,NUMBER_OF_REVIEWS from airbnbdetails where NUMBER_OF_REVIEWS = 0;
--Show hosts who have more than 1 listing.
select HOST_NAME,count(NAME)as listingcounts from airbnbdetails group by HOST_NAME having count(NAME)>1;
--Find listings where the minimum stay is more than 10 nights.
select NAME,MINIMUM_NIGHTS from airbnbdetails where MINIMUM_NIGHTS > 10;
--Show total number of listings and average price in each neighbourhood group.
select NEIGHBOURHOOD_GROUP,count(NAME),avg(PRICE) from airbnbdetails where PRICE is not null group by NEIGHBOURHOOD_GROUP;
--List all listings located in the Brooklyn neighbourhood group with a price above ₹500.
select NAME,NEIGHBOURHOOD_GROUP,PRICE from airbnbdetails where NEIGHBOURHOOD_GROUP= 'Brooklyn' and PRICE >500;
--Show names of listings with more than 100 reviews.
select NAME,NUMBER_OF_REVIEWS from airbnbdetails where NUMBER_OF_REVIEWS >=100;
--Display listings that have a NULL value in the last_review column
select NAME,LAST_REVIEW from airbnbdetails  where LAST_REVIEW is null;
--List the top 3 neighbourhoods with the most listings.
select NEIGHBOURHOOD,listing_count from (select NEIGHBOURHOOD,count(NAME) as listing_count from airbnbdetails  group by NEIGHBOURHOOD order by listing_count DESC) where rownum <=3;
--Find the minimum and maximum price in the dataset
select min(PRICE),max(PRICE) from airbnbdetails;
--Show listings where the availability is between 100 and 300 days
select NAME,AVAILABILITY_365 from airbnbdetails Where AVAILABILITY_365 between 100 and 300;
--How many listings are available in each room type within Manhattan?
select count(NAME),ROOM_TYPE from airbnbdetails where NEIGHBOURHOOD_GROUP='Manhattan'  group by ROOM_TYPE;