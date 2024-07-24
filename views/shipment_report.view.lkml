view: shipment_report {
  derived_table: {
    sql:
      WITH shipment_base AS (
        SELECT substr(started_at, 1,10) AS base_date
             , category_id
             , SUM(stock) AS total_move_stock
             , SUM(avg_weight * stock) AS total_sum_weight
             , AVG(avg_weight) AS avg_weight
             , count(1) AS report_cnt
        FROM movement
        GROUP BY base_date, category_id
      )
      SELECT
          base_date,
          category_id,
          report_cnt,
          total_move_stock,
          total_sum_weight,
          avg_weight
      FROM shipment_base
      ;;
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

  # Measures similar to the example view
  measure: total_move_stock_measure {
    type: sum
    sql: ${total_move_stock} ;;
    value_format: "0.00"
    html:
    <ul>
      <li> Date: {{base_date}} </li>
      <li> Total Move Stock: {{total_move_stock}} </li>
    </ul> ;;
  }

  measure: total_sum_weight_measure {
    type: sum
    sql: ${total_sum_weight} ;;
    value_format: "0.00"
    html:
    <ul>
      <li> Date: {{base_date}} </li>
      <li> Total Sum Weight: {{total_sum_weight}} </li>
    </ul> ;;
  }

  measure: avg_weight_measure {
    type: average
    sql: ${avg_weight} ;;
    value_format: "0.00"
    html:
    <ul>
      <li> Date: {{base_date}} </li>
      <li> Average Weight: {{avg_weight}} </li>
    </ul> ;;
  }

  # Filters similar to the example view
  filter: category_filter {
    type: string
    suggest_dimension: category_id
    sql: {% condition category_id %} ${category_id} {% endcondition %} ;;
  }

  filter: base_date_filter {
    type: date
    sql: {% condition base_date %} ${base_date} {% endcondition %} ;;
  }

  # Set for detailed reporting
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
