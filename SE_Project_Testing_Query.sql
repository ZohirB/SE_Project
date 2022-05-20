--  
-- بداية كويرية التنفيذ

SELECT * FROM armory

select *from sub_graveyard

-- نهاية كويرية التنفيذ


-- قسم الكويريات

/*
SELECT gang_member.GM_name,sub_group.SG_Name,victim.ID_Victim,territory.Territory_Name,sub_graveyard.ID_Sub_Graveyard,VICTIM.BLOOD_TYPE
FROM gang_member,sub_group,victim,territory,sub_graveyard,vgs,gs
WHERE gang_member.ID_GM=gs.ID_GM 
and gs.ID_SG=sub_group.ID_SG
AND gs.ID_GS=vgs.ID_GS
AND vgs.ID_Victim=victim.ID_Victim
AND victim.ID_Sub_Graveyard=sub_graveyard.ID_Sub_Graveyard
AND victim.ID_Territory=territory.ID_Territory

-- اظهار اسم كل فرد من افراد العصابة وشو زمر الدم الي حصل عليهن
SELECT gang_member.GM_name,victim.Blood_Type
from gang_member left outer join gs 
on gang_member.ID_GM=gs.ID_GM
left outer join vgs 
on gs.ID_GS=vgs.ID_GS
left outer join victim
on vgs.ID_Victim=victim.ID_Victim;
*/


-- اظهار الضحايا المخطوفين مع اسم المقبرة واسم الكروب واسم منطقة الدفن    
SELECT victim.ID_Victim,graveyard.Graveyard_Name,sub_group.SG_Name,territory.Territory_Name
from sub_group,gs,vgs,victim,territory ,graveyard,sub_graveyard
where sub_group.ID_SG=gs.ID_SG
AND gs.ID_GS=vgs.ID_GS
and victim.ID_Victim=vgs.ID_Victim
and sub_graveyard.ID_Sub_Graveyard=victim.ID_Sub_Graveyard
AND graveyard.ID_Graveyard=sub_graveyard.ID_Graveyard
AND territory.ID_Territory=graveyard.ID_Territory


-- اظهار الضحايا المخطوفين مع اسم الكروب واسم منطقة الخطف    
SELECT victim.ID_Victim,sub_group.SG_Name,territory.Territory_Name
from sub_group,gs,vgs,victim,territory
where sub_group.ID_SG=gs.ID_SG
AND gs.ID_GS=vgs.ID_GS
and victim.ID_Victim=vgs.ID_Victim
and territory.ID_Territory=victim.ID_Territory;


-- اظهار كل الضحايا المدفونين مع اسم المقبرة واسم الكروب واسم منطقة الدفن    
SELECT victim.ID_Victim,graveyard.Graveyard_Name,sub_group.SG_Name,territory.Territory_Name
from sub_group inner join gs 
on sub_group.ID_SG=gs.ID_SG  inner join vgs
ON gs.ID_GS=vgs.ID_GS right outer join victim
on victim.ID_Victim=vgs.ID_Victim inner join sub_graveyard
on sub_graveyard.ID_Sub_Graveyard=victim.ID_Sub_Graveyard inner join graveyard
ON graveyard.ID_Graveyard=sub_graveyard.ID_Graveyard inner join territory
on territory.ID_Territory=graveyard.ID_Territory 

--الافراد الي شايلين اسلحة
SELECT sub_group.SG_Name ,gang_member.GM_name,weapon_detail.W_Name,weapon_detail.W_Type
FROM gang_member,sub_group,gs,armory,weapon_detail
WHERE sub_group.ID_SG= gs.ID_SG
and gang_member.ID_GM=gs.ID_GM
AND gs.ID_Item= armory.ID_Item
AND armory.ID_WD = weapon_detail.ID_WD;


--الافراد الي معن سلاح وسيارة بنفس الوقت 
SELECT sub_group.SG_Name ,gang_member.GM_name,weapon_detail.W_Name,weapon_detail.W_Type,car_detail.Model_Name,car_detail.Color
FROM gang_member,sub_group,gs,armory,weapon_detail,vgs,car_license,car_detail
WHERE sub_group.ID_SG= gs.ID_SG
and gang_member.ID_GM=gs.ID_GM
AND gs.ID_Item= armory.ID_Item
AND armory.ID_WD = weapon_detail.ID_WD
AND gs.ID_GS= vgs.ID_GS
and vgs.ID_CL= car_license.ID_CL
and car_license.ID_CD= car_detail.ID_CD;

--كل الزبائن الي اشترو اعضاء
SELECT customer.Customer_Name,customer.Blood_Type,sale.Price,Part_Name.Part_Name
FROM customer 
left outer join  sale on customer.ID_Customer=sale.ID_Customer
inner  join  p_v on sale.ID_Sale = p_v.ID_Sale
inner join Part_Name on Part_Name.ID_Part= p_v.ID_Part


--منطقة الخطف ومنطقة الدفن للضحايا
SELECT victim.ID_Victim,t1.Territory_Name as K ,t2.Territory_Name as B
from victim,territory t1,territory t2,graveyard,sub_graveyard
where t1.id_territory=victim.ID_Territory
and graveyard.ID_Territory=t2.id_territory
and graveyard.ID_Graveyard=sub_graveyard.ID_Graveyard
and sub_graveyard.ID_Sub_Graveyard=victim.ID_Sub_Graveyard


--معرفة رقم عملية خطف الضحية وزمرة الدم وافراد العصابة مع العصابة التابعين لها والسيارة المستخدمة لخطف الضحية
select vgs.ID_VGS,v.Blood_Type,gm.GM_name,sb.SG_Name,cd.Model_Name,lp.License_Number
from vgs vgs ,victim v ,gang_member gm ,sub_group sb , gs  gs, car_license cl ,car_detail cd , license_plate lp,weapon_detail wd , shipment sh ,armory a
where cd.ID_CD=cl.ID_CD
and lp.ID_LP=cl.ID_LP
and wd.ID_WD=a.ID_WD
and sh.ID_Shipment=a.ID_Shipment
and gm.ID_GM=gs.ID_GM
and sb.ID_SG=gs.ID_SG
and gs.ID_GS=vgs.ID_GS
and v.ID_Victim=vgs.ID_Victim
and vgs.ID_CL=cl.ID_CL

select gm.GM_name , gm.Leader , SG_Name , v.Blood_Type , cd.Model_Name
from vgs 
join gs 
using(ID_GS)
join armory  
using (ID_Item)
join shipment 
using(ID_Shipment) 
join weapon_detail
using (ID_WD)
join gang_member gm 
using (ID_GM) 
join sub_group sg 
using(ID_SG)
join victim v 
using(ID_Victim)
join car_license  cl
using(ID_CL)
join license_plate
using (ID_LP) 
join car_detail cd
using(ID_CD)



-- رقم الطلبية و ما هو العضو الذي يريده الزبون يلي هو نفسه رح نبيعه و نحطه بالطلبية و اسم الزبون و سعر الفاتورة بشرط يكون ها العضو فعال

select s.ID_Sale,Part_Name,Available,Customer_Name,Price,Wanted_Part
from victim v left outer join p_v pv 
 on v.ID_Victim=pv.ID_Victim
 left outer join part_name p
 on p.ID_Part=pv.ID_Part
 right outer join sale s
 on s.ID_Sale=pv.ID_Sale
 left outer join customer c
 on c.ID_Customer=s.ID_Customer
where Available="N"

--اظهار الضحايا و عدد الاعضاء الماخوذة منهم و ما هي الاعضاء و فعاليتها 
 
 select v.ID_Victim,Age,part_name,count(Part_Name),Available,Date_Of_Murder
 from victim v left outer join p_v pv 
 on v.ID_Victim=pv.ID_Victim
 left outer join part_name p
 on p.ID_Part=pv.ID_Part
 group by Part_Name


 --كل سيارة بكم عملية شاركت و مين الشخص يلي خطف بهي العملية 

select cd.ID_CD,Model_Name,Color,ID_VGS,count(ID_VGS) as number,GM_name
from car_detail cd left outer join car_license cl 
on cd.ID_CD=cl.ID_CD
left outer join license_plate lp
on lp.ID_LP=cl.ID_LP
left outer join vgs vgs 
on cl.ID_CL=vgs.ID_CL
left outer join gs gs
on gs.ID_GS=vgs.ID_GS
left outer join gang_member gm 
on gm.ID_GM=gs.ID_GM
left outer join sub_group sb
on sb.ID_SG=gs.ID_SG
group by ID_VGS

--معرفة عدد الضحايا التي أعمارن تحت ال30 عام حسب زمرة الدم 
select  count(ID_Victim),victim.Age
,Blood_Type
from victim
group by Blood_Type
having Age<30


--  بتظهر كل عضو مع ايدي تبعته ورقم القائد واسمه
SELECT gm.ID_GM,gm.GM_Name,gm.Leader,l.GM_name as L_name
from gang_member gm , gang_member L
WHERE gm.Leader = L.ID_GM
