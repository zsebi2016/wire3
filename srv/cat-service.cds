using my.wire from '../db/data-model';

service ExpertService_old {
  entity Experts @readonly as projection on wire.Experts;
  entity Expert_teams @readonly as projection on wire.Expert_teams;
  entity Team_members @readonly as projection on wire.Team_members;
}