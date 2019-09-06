using my.wire from '../db/data-model';

service ExpertService {
  entity Experts @readonly as projection on wire.EXPERT;
  entity Expert_teams @readonly as projection on wire.Expert_teams;
  entity Team_members @readonly as projection on wire.Team_members;
}