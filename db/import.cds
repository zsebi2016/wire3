
@cds.persistence.exists
Entity EXPERT {
	key ID : Integer;
	REPORTS_TO : Integer;
	SKILL_SET: String;
	EXT_ID : String(100);
	NAME : String (100);
}

@cds.persistence.exists
entity EXPERT_TEAM {
  key ID : Integer;
  TEAM_NAME : String(200);
  DESCRIPTION : String;
  TEAM_LEAD : Integer;
  PARENT_TEAM : Integer;
}

@cds.persistence.exists
entity TEAM_MEMBER {
  key ID : Integer;
  EXPERT : association to EXPERT on EXPERT.ID = EXPERT_ID;
  TEAM : association to EXPERT_TEAM on TEAM.ID = TEAM_ID;
  EXPERT_ID : Integer;
  TEAM_ID : Integer;
}