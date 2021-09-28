
![family_db](/images/family_db.png)

***
# My profile https://sql-academy.org/ru/profile/18792
***

# Task 17. Определить, сколько потратил в 2005 году каждый из членов семьи
## https://sql-academy.org/ru/trainer/tasks/17
### Поля в результирующей таблице: 
**member_name, status, costs**

Используйте конструкцию "as costs" для отображения затраченной суммы членом семьи. Это необходимо для корректной проверки.

## SOLUTION

```sql
select
    member_name,
    status,
    SUM(amount * unit_price) as costs
from
    Payments
    INNER JOIN FamilyMembers ON Payments.family_member = FamilyMembers.member_id
WHERE
    YEAR(date) = 2005
GROUP BY
    member_name,
    status
```
# Task 18. Узнать, кто старше всех в семьe
## https://sql-academy.org/ru/trainer/tasks/18
### Поля в результирующей таблице: 
**member_name**

## SOLUTION

```sql
SELECT member_name
FROM FamilyMembers
WHERE birthday=
    (SELECT MIN (birthday)
    FROM FamilyMembers)
```

# Task 19. Определить, кто из членов семьи покупал картошку (potato)
## https://sql-academy.org/ru/trainer/tasks/19
### Поля в результирующей таблице: 
**status**

## SOLUTION

```sql
SELECT DISTINCT status
FROM FamilyMembers
INNER JOIN Payments
    ON Payments.family_member=FamilyMembers.member_id
INNER JOIN Goods
    ON Payments.good=Goods.good_id
WHERE good_name="potato" 
```

# Task 20. Сколько и кто из семьи потратил на развлечения (entertainment). Вывести статус в семье, имя, сумму
## https://sql-academy.org/ru/trainer/tasks/20
### Поля в результирующей таблице: 
**status, member_name, costs**

Используйте конструкцию "as costs" для отображения затраченной суммы членом семьи. Это необходимо для корректной проверки.

## SOLUTION

```sql
SELECT status,
         member_name,
        (amount * unit_price) AS costs
FROM FamilyMembers
INNER JOIN Payments
    ON Payments.family_member=FamilyMembers.member_id
INNER JOIN Goods
    ON Payments.good=Goods.good_id
INNER JOIN GoodTypes
    ON GoodTypes.good_type_id=Goods.type
WHERE good_type_name="entertainment"
```

# Task 21. Определить товары, которые покупали более 1 раза
## https://sql-academy.org/ru/trainer/tasks/21
### Поля в результирующей таблице: 
**good_name**


## SOLUTION

```sql
SELECT good_name
FROM Goods
INNER JOIN Payments
    ON Payments.good=Goods.good_id
GROUP BY  Payments.good
HAVING COUNT(Payments.good)>1
```

# Task 22. Найти имена всех матерей (mother)
## https://sql-academy.org/ru/trainer/tasks/22
### Поля в результирующей таблице: 
**member_name**

## SOLUTION

```sql
SELECT member_name
FROM FamilyMembers
WHERE status='mother'
```

# Task 23. Найдите самый дорогой деликатес (delicacies) и выведите его стоимость
## https://sql-academy.org/ru/trainer/tasks/23
### Поля в результирующей таблице: 
**good_name, unit_price**

## SOLUTION

```sql
SELECT good_name,
         unit_price
FROM Payments
INNER JOIN Goods
    ON Payments.good=Goods.good_id
WHERE unit_price=
    (SELECT MAX(unit_price) AS unit_price
    FROM Payments
    INNER JOIN Goods
        ON Payments.good=Goods.good_id
    INNER JOIN GoodTypes
        ON Goods.type=GoodTypes.good_type_id
    WHERE good_type_name="delicacies")
```