using EXPERT as exp from '../db/import';
using EXPERT_TEAM as team from '../db/import';
using TEAM_MEMBER as member from '../db/import';
using V_TEAM from '../db/import';
//using EXPERTPLUS from '../db/import';
using TEST_VIEW from '../db/import';
using EXPERT_WITH_TEAM from '../db/import';

service ExpertService {
  entity Expert @readonly as projection on exp;
  entity Expert_team @readonly as projection on team;
  entity Team_member @readonly as projection on member;
  entity V_Team @readonly as projection on V_TEAM;
  //entity ExpertPlus @readonly as projection on EXPERTPLUS;
  entity ExpertExtra @readonly as projection on EXPERT_WITH_TEAM;
  //extend TEST_VIEW with {
	//exp: association to exp on exp.ID = ID;
//} 
  
  entity Test2 @readonly as projection on TEST_VIEW;
}