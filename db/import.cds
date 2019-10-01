
@cds.persistence.exists
Entity EXPERT {
	key ID : Integer;
	REPORTS_TO : Integer;
	SKILL_SET: String;
	EXT_ID : String(100);
	NAME : String (100);
	FIRSTNAME : String(100);
	LASTNAME : String(100);
	TITLE : String(100);
	EMAIL : String(100);
	DEPARTMENT : String(100);
	JOBCODE : String(100);
	DIVISION : String(100);
	LOCATION : String(100);
	CITY : String(100);
	COUNTRY : String(100);
	SOURCE : String(10);
}

@cds.persistence.exists
entity EXPERT_TEAM {
  key ID : Integer;
  TEAM_NAME : String(200);
  DESCRIPTION : String;
  TEAM_LEAD : Integer;
  PARENT_TEAM : Integer;
  SOURCE : String(10);
  EXPERTS : association to many EXPERT_WITH_TEAM ON ID = EXPERTS.TEAM_ID;
}

@cds.persistence.exists
entity TEAM_MEMBER {
  key ID : Integer;
  EXPERT : association to EXPERT on EXPERT.ID = EXPERT_ID;
  TEAM : association to EXPERT_TEAM on TEAM.ID = TEAM_ID;
  EXPERT_ID : Integer;
  TEAM_ID : Integer;
}

@cds.persistence.exists
Entity EXPERT_WITH_TEAM {
	key X_KEY : String;
	NAME : String;
	ID : Integer;
	TEAM_ID: Integer;
	REPORTS_TO : Integer;
	SKILL_SET: String;
	EXT_ID : String;
}

@cds.persistence.exists
entity TEAM_WITH_EXPERT {
  TEAM_NAME : String;
  key ID : Integer;
  EXPERT_ID : Integer;
  DESCRIPTION : String;
  TEAM_LEAD : Integer;
  PARENT_TEAM : Integer;
}

@cds.persistence.exists
entity V_TEAM {
  key ID : Integer;
  TEAM_NAME : String;
  DESCRIPTION : String;
  TEAM_LEAD : Integer;
  PARENT_TEAM : Integer;
  EXPERTS : association to many EXPERT_WITH_TEAM on ID = EXPERTS.TEAM_ID;
}

@cds.persistence.exists
Entity V_EXPERT {
	key ID : Integer;
	REPORTS_TO : Integer;
	SKILL_SET: String;
	EXT_ID : String(100);
	NAME : String (100);
	FIRSTNAME : String(100);
	LASTNAME : String(100);
	TITLE : String(100);
	EMAIL : String(100);
	DEPARTMENT : String(100);
	JOBCODE : String(100);
	DIVISION : String(100);
	LOCATION : String(100);
	CITY : String(100);
	COUNTRY : String(100);
	SOURCE : String(10);
	LANGUAGE : String;
}

/*@cds.persistence.exists
entity TEST_VIEW {
  key ID : Integer;
  TEAM_NAME : String;
}*/

/*@cds.persistence.exists
*Entity "EXPERTPLUS" {
*	key ID : Integer;
*	REPORTS_TO : Integer;
*	SKILL_SET: String;
*	EXT_ID : String(100);
*	NAME : String (100);
*	TEAM_ID : Integer;
*	EXPERT_ID : Integer;
*}
*/

