
![family_db](/images/family_db.png)

***
# My profile https://sql-academy.org/ru/profile/18792
***
## https://sql-academy.org/ru/trainer/tasks/17

# Task 17. Определить, сколько потратил в 2005 году каждый из членов семьи
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


## https://sql-academy.org/ru/trainer/tasks/18

# Task 18. Узнать, кто старше всех в семьe
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

## https://sql-academy.org/ru/trainer/tasks/19

# Task 19. Определить, кто из членов семьи покупал картошку (potato)
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

## https://sql-academy.org/ru/trainer/tasks/20

# Task 20. Сколько и кто из семьи потратил на развлечения (entertainment). Вывести статус в семье, имя, сумму
### Поля в результирующей таблице: 
**status, member_name, costs**

Используйте конструкцию "as costs" для отображения затраченной суммы членом семьи. Это необходимо для корректной проверки.

## SOLUTION

```sql
INCORRECT SOLUTION // TODO FIX
SELECT DISTINCT status, member_name, (amount*unit_price) as costs
FROM FamilyMembers
INNER JOIN Payments
    ON Payments.family_member=FamilyMembers.member_id
INNER JOIN Goods
    ON Payments.good=Goods.good_id
INNER JOIN GoodTypes
    ON Payments.good=Goods.type
WHERE good_type_name="entertainment" 
```