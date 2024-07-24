
view: shipment_report {
  derived_table: {
    sql: -- -- Query 1: Select all from movement
      -- SELECT *
      -- FROM movement
      -- ;
      
      -- SELECT substr(started_at, 1,10) AS base_date
      --     , count(1) AS report_cnt
      --     , SUM(stock) AS total_move_stock
      --     , SUM(avg_weight*stock) AS total_sum_weight
      --     , AVG(avg_weight) AS avg_weight
      --   FROM movement a
      -- group BY base_date
      -- ;
      
      SELECT substr(started_at, 1,10) AS base_date
           , category_id
           , count(1) AS report_cnt
           , SUM(stock) AS total_move_stock
           , SUM(avg_weight*stock) AS total_sum_weight
           , AVG(avg_weight) AS avg_weight
        FROM movement a
       group BY base_date, category_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: base_date {
    type: string
    sql: ${TABLE}.base_date ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: report_cnt {
    type: number
    sql: ${TABLE}.report_cnt ;;
  }

  dimension: total_move_stock {
    type: number
    sql: ${TABLE}.total_move_stock ;;
  }

  dimension: total_sum_weight {
    type: number
    sql: ${TABLE}.total_sum_weight ;;
  }

  dimension: avg_weight {
    type: number
    sql: ${TABLE}.avg_weight ;;
  }

  set: detail {
    fields: [
        base_date,
	category_id,
	report_cnt,
	total_move_stock,
	total_sum_weight,
	avg_weight
    ]
  }
}
