view: partner {
  sql_table_name: edgefarm.partner ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
  }
  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
  }
  dimension: contact_phone {
    type: string
    sql: ${TABLE}.contact_phone ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: farm_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.farm_id ;;
  }
  dimension: memo {
    type: string
    sql: ${TABLE}.memo ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	contact_name,
	farm.id,
	farm.name,
	farm.contact_name
	]
  }

}
