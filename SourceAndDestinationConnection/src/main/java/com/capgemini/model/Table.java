package com.capgemini.model;

public class Table {
	private String sourceTable;
	  private String destTable;
	  private String forceMatch;
	  private String sourceSchema;
	  private String destSchema;
	  private String clause;
	public String getSourceTable() {
		return sourceTable;
	}
	public void setSourceTable(String sourceTable) {
		this.sourceTable = sourceTable;
	}
	public String getDestTable() {
		return destTable;
	}
	public void setDestTable(String destTable) {
		this.destTable = destTable;
	}
	public String getForceMatch() {
		return forceMatch;
	}
	public void setForceMatch(String forceMatch) {
		this.forceMatch = forceMatch;
	}
	public String getSourceSchema() {
		return sourceSchema;
	}
	public void setSourceSchema(String sourceSchema) {
		this.sourceSchema = sourceSchema;
	}
	public String getDestSchema() {
		return destSchema;
	}
	public void setDestSchema(String destSchema) {
		this.destSchema = destSchema;
	}
	public String getClause() {
		return clause;
	}
	public void setClause(String clause) {
		this.clause = clause;
	}
	  

}
