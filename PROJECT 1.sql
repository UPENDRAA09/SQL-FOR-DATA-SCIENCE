# 1 Create new schema as ecommerce
create database ecommerce;
# 2 Import .csv file users_data into MySQL
# (right click on ecommerce schema -> Table Data import Wizard -> Give path of the file -> Next -> choose options : 
# Create a new table , select delete if exist -> next -> next)
##  (''  you can see  the solutation on the schemas navigtor'')
# 3 Run SQL command to see the structure of tableus
use ecommerce;
select * from users_data;
desc users_data;
# 4 Run SQL command to select first 100 rows of the database
select * from users_data limit 100;
# 5 How many distinct values exist in table for field country and language
select count(distinct country) country , count(distinct language) language
from users_data;
# 6 Check whether male users are having maximum followers or female users.
select  gender, sum(SocialNbFollowers)
from users_data group by gender;
select gender, max(socialNbfollowers) greatest_followers
from users_data
where gender in('m','f');
select gender,count(SocialNbFollowers)
from users_data
where gender='m';
select gender,count(SocialNbFollowers)
from users_data
where gender='f';
# 7 Calculate the total users those
# (a) Uses Profile Picture in their Profile
select count(hasprofilepicture) total_users
from users_data
where hasprofilepicture ='true';
# 7 (b) Uses Application for Ecommerce platform
select count(hasAnyApp) total_users
from users_data
where hasAnyApp='true';
# 7 (c) Uses Android app
select count(hasAndroidApp) total_users
from users_data
where hasAndroidApp='true';
# 7 (d) Uses ios app
select count(hasIosApp) total_users
from users_data
where hasIosApp='true';
# 8 Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers. 
# (Hint: consider only those users having at least 1 product bought.)
select country , count(productsBought) Buyers
from users_data group by country order by buyers desc;
# 9 Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers. 
# (Hint: consider only those users having at least 1 product sold.)
select country,count(productsSold) sellers
from users_data group by country order by sellers asc;
# 10 Display name of top 10 countries having maximum products pass rate.
select country
from users_data group by country having max(productsPassRate) limit 10;
# 11 Calculate the number of users on an ecommerce platform for different language choices.
select language, count(language)
from users_data group by language;
# 12 Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform. 
# (Hint: use UNION to answer this question.)
select 'productsWished',sum(productsWished) from users_data where gender='f'
union
select 'socialProductsLiked',sum(socialProductsLiked) from users_data where gender='f';
# 13 Check the choice of male users about being seller or buyer. (Hint: use UNION to solve this question.)
select ' buyer',count(productsBought) from users_data where gender='m' and productsBought > 0
union
select 'seller',count(productsSold)from users_data where gender ='m' and productsSold > 0 ;
# 14 Which country is having maximum number of buyers?
select country,max(productsBought) Max_no_of_buyers from users_data group by country order by Max_no_of_buyers desc limit 1 ;
# 15 List the name of 10 countries having zero number of sellers.
select country,productsSold from users_data where productsSold=0 limit 10;
# 16 Display record of top 110 users who have used ecommerce platform recently.
select identifierHash,daysSinceLastLogin from users_data order by daysSinceLastLogin limit 100 ;
# 17 Calculate the number of female users those who have not logged in since last 100 days.
select count(daysSinceLastLogin) as number from users_data where gender='f' and daysSinceLastLogin >100;
# 18 Display the number of female users of each country at ecommerce platform.
select country,count(*)numver_of_users from users_data where gender='f' group by country;
# 19 Display the number of male users of each country at ecommerce platform.
select country,count(*)number_of_male_users from users_data where gender='m' group by country;
# 20 Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
select avg(productsSold) Average_product_sold, avg(productsBought) Average_product_bought, country
from users_data
where gender='m' group by country;
 




































































