view: sample {
  derived_table: {
    sql: WITH RECURSIVE split_target_weights AS (
                  SELECT id,
                         farm_id,
                         name,
                         SUBSTRING_INDEX(weight, ',', 1) AS weight_value,
                         SUBSTRING(weight, LENGTH(SUBSTRING_INDEX(weight, ',', 1)) + 2) AS rest,
                         0 AS day,
                         created_at
                  FROM edgefarm.target_weight
                  WHERE CHAR_LENGTH(weight) > 0
                  UNION ALL
                  SELECT id,
                         farm_id,
                         name,
                         SUBSTRING_INDEX(rest, ',', 1) AS weight_value,
                         SUBSTRING(rest, LENGTH(SUBSTRING_INDEX(rest, ',', 1)) + 2) AS rest,
                         day + 7 AS day,
                         created_at
                  FROM split_target_weights
                  WHERE CHAR_LENGTH(rest) > 0
                ),
                target AS (
                  SELECT id,
                         farm_id,
                         name,
                         ROUND(CAST(weight_value AS FLOAT),2) AS weight_value,
                         created_at,
                         day
                  FROM split_target_weights
                  WHERE weight_value IS NOT NULL
                  AND weight_value != ''
                ),
                weight_base AS (
                  SELECT gch.room_id,
                         r.name AS room_name,
                         DATEDIFF(gch.created_at,g.birth_date) AS age_in_days,
                         gch.created_at,
                         f.id AS farm_id,
                         f.name AS farm_name,
                         p.name AS piggery_name,
                         g.stock AS stock,
                         GROUP_CONCAT(gch.weight_list) AS weight_list
                  FROM grow_camera_history AS gch -- 수집된 돼지 정보
                  JOIN `group` AS g ON gch.group_id = g.id -- 돈군 정보
                  JOIN `farm` AS f ON f.id = g.farm_id
                  JOIN `piggery` p ON g.piggery_id = p.id AND g.farm_id = p.farm_id
                  JOIN `room` r ON g.room_id = r.id AND g.piggery_id = r.piggery_id
                  WHERE 1=1
                    AND gch.created_at BETWEEN g.arrival_date and if(g.active_status, DATE_ADD(NOW(), INTERVAL 1 DAY), g.deactivated_at)
                    AND gch.weight_list != ''
                    AND gch.weight_list IS NOT null
                  GROUP BY 1,2,3,4,5,6,7,8
                ),
                average_weight AS (
                  SELECT age_in_days,
                         room_id,
                         round(avg(weight),3) AS avg_weight
                  FROM weight_base
                  JOIN json_table(replace(json_array(weight_list), ',', '","'),'$[*]' columns (weight FLOAT path '$')) t
                  GROUP BY 1,2
                )
                SELECT day AS days,
                       'Target' AS room_id,
                       'Target' AS room_name,
                       created_at,
                       NULL AS farm_id,
                       NULL AS farm_name,
                       NULL AS piggery_name,
                       NULL AS stock,
                       name AS target_name,
                       weight_value AS weight
                FROM target
                UNION ALL
                SELECT w.age_in_days AS days,
                       w.room_id,
                       b.room_name,
                       b.created_at,
                       b.farm_id,
                       b.farm_name,
                       b.piggery_name,
                       b.stock,
                       null AS target_name,
                       w.avg_weight AS weight
                FROM average_weight w
                LEFT JOIN weight_base b ON w.room_id = b.room_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: days {
    type: number
    sql: ${TABLE}.days ;;
  }

  dimension: room_id {
    type: string
    sql: ${TABLE}.room_id ;;
  }

  dimension: room_name {
    type: string
    sql: ${TABLE}.room_name ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: farm_id {
    type: number
    sql: ${TABLE}.farm_id ;;
  }

  dimension: farm_name {
    type: string
    sql: ${TABLE}.farm_name ;;
  }

  dimension: piggery_name {
    type: string
    sql: ${TABLE}.piggery_name ;;
  }

  dimension: stock {
    type: number
    sql: ${TABLE}.stock ;;
  }

  dimension: target_name {
    type: string
    sql: ${TABLE}.target_name ;;
  }

  # create for using liquid variables in the html parameter
  measure: room_name_measure {
    type: string
    sql: ${TABLE}.room_name ;;
  }

  measure: stock_measure {
    type: string
    sql: ${TABLE}.stock ;;
  }

  measure: created_at_measure {
    type: date
    sql: ${TABLE}.created_at ;;
  }

  measure: weight {
    type: number
    sql: ${TABLE}.weight ;;
    # value_format: "0.00"
    html:
    <ul>
      <li> 날짜 : {{created_at_measure}} </li>
      <li> 평균 체중 : {{weight}} </li>
      <li> 돈방 : {{room_name_measure}} </li>
      <li> 총두수 : {{stock_measure}} </li>
    </ul> ;;
  }

  # create filter using liquid variable
  filter: target_weight {
    type: string
    suggest_dimension: target_name
    sql: {% condition %} target_name {% endcondition %} or target_name is null ;;
  }

  filter: room {
    type: string
    suggest_dimension: room_name
    sql: {% condition %} room_name {% endcondition %} or room_name = 'Target' ;;
  }

  set: detail {
    fields: [
      days,
      room_id,
      room_name,
      created_at_time,
      farm_id,
      farm_name,
      piggery_name,
      stock,
      target_name,
      weight
    ]
  }
}
