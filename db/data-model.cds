//keep for testing purposes, how to generate code etc.
namespace my.wire;

entity Experts {
  key ID : Integer;
  reports_to: Integer;
  skill_set  : String;
  ext_id : String;
  name : String;
}

entity Expert_teams {
  key ID : Integer;
  team_name  : String;
  description : String;
  team_lead : Integer;
  parent_team: Integer;
}

entity Team_members {
  key ID  : Integer;
  expert  : Association to Experts;
  team : Association to Expert_teams;
}
