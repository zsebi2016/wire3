using EXPERT as exp from '../db/import';
using EXPERT_TEAM as team from '../db/import';
using TEAM_MEMBER as member from '../db/import';

service ExpertService {
  entity Expert @readonly as projection on exp;
  entity Expert_team @readonly as projection on team;
  entity Team_member @readonly as projection on member;
}