SELECT DISTINCT status,
         member_name,
         (amount*unit_price) AS costs
FROM FamilyMembers
INNER JOIN Payments
    ON Payments.family_member=FamilyMembers.member_id
INNER JOIN Goods
    ON Payments.good=Goods.good_id
INNER JOIN GoodTypes
    ON Payments.good=Goods.type
WHERE good_type_name="entertainment"