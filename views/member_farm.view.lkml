view: member_farm {
  sql_table_name: edgefarm.member_farm ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: farm_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.farm_id ;;
  }
  dimension: member_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.member_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	member.id,
	member.username,
	member.name,
	farm.id,
	farm.name,
	farm.contact_name
	]
  }

}
