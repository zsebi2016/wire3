namespace my.wire;
using { User, Country, managed } from '@sap/cds/common';

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

entity Team_members : managed {
  key ID  : UUID;
  expert  : Association to Experts;
  team : Association to Expert_teams;
}