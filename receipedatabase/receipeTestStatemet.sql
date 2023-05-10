select * from receipe;
select * from ingredient;
select * from receipe_has_ingredient;


select ingredientName,amount,unit from receipe 
inner join receipe_has_ingredient on receipeNumber = receipeId
inner join ingredient on ingredientNumber = ingredientId
where receipeName = 'cake';

select receipeName,countryCode,instructions from receipe;

select receipeName,countryCode,instructions from receipe
where receipeName = 'cake';

--names of all receipes that use flour--
select receipeName from receipe 
inner join receipe_has_ingredient on receipeNumber = receipeId
inner join ingredient on ingredientNumber = ingredientId
where ingredientName = 'flour';
           ---OR---
select receipeName from receipe 
inner join (receipe_has_ingredient, ingredient)
 on (receipeNumber = receipeId and ingredientNumber = ingredientId)
where ingredientName = 'flour';     

--all the ingredients that are in use in the receipe.--
--ingredientName and receipeNAme--
select ingredientName, receipeName from receipe
inner join receipe_has_ingredient on receipeNumber=receipeId
inner join ingredient on ingredientNumber=ingredientId;

--all the ingredientNames that are in use in the receipe.--
--ingredientName is in the result only once --
select distinct ingredientName from ingredient
inner join receipe_has_ingredient on ingredientNumber=ingredientId;

--all ingredients (name) that are not use in any receipe--
select distinct ingredientName, ingredientNumber from ingredient
left join receipe_has_ingredient on ingredientNumber=ingredientId;

select distinct ingredientName from ingredient
left join receipe_has_ingredient on ingredientNumber=ingredientId
where ingredientNumber is null;

--all ingredient used--
select distinct ingredientName from ingredient
left join receipe_has_ingredient on ingredientNumber=ingredientId
where ingredientNumber is not null;
                --OR--
select distinct ingredientName from ingredient
inner join receipe_has_ingredient on ingredientNumber=ingredientId;

--get number of receipes by country--
select countryCode, count(*) as NumberOfReceipes from receipe
group by countryCode
order by countryCode;

--get the number of ingredients in receipe --
--resultset should include reciepeName and numberOfIngredients--
select receipeName, count(ingredientNumber) as numberOfIngredients from receipe
inner join receipe_has_ingredient on receipeNumber = receipeId
inner join ingredient on ingredientNumber = ingredientId
group by receipeName;

select receipeName, count(ingredientNumber) as numberOfIngredients from receipe
left join receipe_has_ingredient on receipeNumber = receipeId
left join ingredient on ingredientNumber = ingredientId
group by receipeName;

update receipe set receipeName='cake' where receipeId=2;

select receipeName, count(ingredientNumber) as numberOfIngredients from receipe
left join receipe_has_ingredient on receipeNumber = receipeId
left join ingredient on ingredientNumber = ingredientId
group by receipeId;

update receipe set receipeName='pancake' where receipeId=2;

--shoppinglist for cake or pancake. --
--resultset:receipeName, ingredientName, amount, unit --
select  ingredientName, amount, unit, receipeName from receipe
inner join receipe_has_ingredient on receipeNumber = receipeId
inner join ingredient on ingredientNumber = ingredientId
where receipeName='cake' or receipeName='pancake'
order by ingredientName;
            ---OR---
select  ingredientName, amount, unit, receipeName from receipe
inner join receipe_has_ingredient on receipeNumber = receipeId
inner join ingredient on ingredientNumber = ingredientId
where receipeName in('cake','pancake')
order by ingredientName;

--shoppinglist for cake or pancake. --
--resultset:amount, unit of eggs needed--
select amount, unit from receipe
inner join receipe_has_ingredient on receipeNumber = receipeId
inner join ingredient on ingredientNumber = ingredientId
where receipeName in('cake','pancake') and ingredientName='egg'
order by ingredientName;
