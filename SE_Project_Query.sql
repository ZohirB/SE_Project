-- بداية كويرية التنفيذ


SELECT * FROM armory
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

-- ظهار اسم كل فرد من افراد العصابة وشو زمر الدم الي حصل عليهن
SELECT gang_member.GM_name,victim.Blood_Type
from gang_member left outer join gs 
on gang_member.ID_GM=gs.ID_GM
left outer join vgs 
on gs.ID_GS=vgs.ID_GS
left outer join victim
on vgs.ID_Victim=victim.ID_Victim;
*/

