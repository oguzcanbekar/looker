connection: "mysql_edgefarm"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: edgefarm_try_eb_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: edgefarm_try_eb_default_datagroup

explore: alarm {
  join: member {
    type: left_outer
    sql_on: ${alarm.member_id} = ${member.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${alarm.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${alarm.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${alarm.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: average_daily {}

explore: room_dayage_weightlist {}

explore: sql_runner_query {}

explore: alarm_category {}

explore: sample {
  group_label: "intflow"
}

explore: alarm_history {
  join: member {
    type: left_outer
    sql_on: ${alarm_history.member_id} = ${member.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${alarm_history.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: alarm {
    type: left_outer
    sql_on: ${alarm_history.alarm_id} = ${alarm.id} ;;
    relationship: many_to_one
  }

  join: related_table {
    type: left_outer
    sql_on: ${alarm_history.related_table_id} = ${related_table.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${alarm_history.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${alarm_history.room_id} = ${room.id} ;;
    relationship: many_to_one
  }

  join: alarm_history_category {
    type: left_outer
    sql_on: ${alarm_history.alarm_history_category_id} = ${alarm_history_category.id} ;;
    relationship: many_to_one
  }

  join: alarm_history_sub_category {
    type: left_outer
    sql_on: ${alarm_history.alarm_history_sub_category_id} = ${alarm_history_sub_category.id} ;;
    relationship: many_to_one
  }
}

explore: alarm_history_category {}

explore: alarm_history_sub_category {}

explore: alembic_version {}

explore: count_ {
  join: farm {
    type: left_outer
    sql_on: ${count_.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${count_.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }
}

explore: count_camera {
  join: farm {
    type: left_outer
    sql_on: ${count_camera.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${count_camera.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }
}

explore: count_camera_history {
  join: count_camera {
    type: left_outer
    sql_on: ${count_camera_history.count_camera_id} = ${count_camera.id} ;;
    relationship: many_to_one
  }

  join: movement {
    type: left_outer
    sql_on: ${count_camera_history.movement_id} = ${movement.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${count_camera.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${count_camera.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${movement.group_id} = ${group.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${group.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: farm {}

explore: feeder {
  join: farm {
    type: left_outer
    sql_on: ${feeder.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${feeder.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${feeder.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: feeder_brand {}

explore: feeder_history {
  join: feeder {
    type: left_outer
    sql_on: ${feeder_history.feeder_id} = ${feeder.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${feeder.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${feeder.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${feeder.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: group {
  join: farm {
    type: left_outer
    sql_on: ${group.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${group.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${group.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: group_day_report {
  join: group {
    type: left_outer
    sql_on: ${group_day_report.group_id} = ${group.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${group_day_report.room_id} = ${room.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${group.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${group.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }
}

explore: group_history {
  join: group {
    type: left_outer
    sql_on: ${group_history.group_id} = ${group.id} ;;
    relationship: many_to_one
  }

  join: movement {
    type: left_outer
    sql_on: ${group_history.movement_id} = ${movement.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${group.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${group.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${group.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: group_history_category {}

explore: grow {
  join: farm {
    type: left_outer
    sql_on: ${grow.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${grow.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }
}

explore: grow_camera {
  join: farm {
    type: left_outer
    sql_on: ${grow_camera.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${grow_camera.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${grow_camera.room_id} = ${room.id} ;;
    relationship: many_to_one
  }

  join: grow {
    type: left_outer
    sql_on: ${grow_camera.grow_id} = ${grow.id} ;;
    relationship: many_to_one
  }
}

explore: grow_camera_history {
  join: grow_camera {
    type: left_outer
    sql_on: ${grow_camera_history.grow_camera_id} = ${grow_camera.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${grow_camera_history.room_id} = ${room.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${grow_camera_history.group_id} = ${group.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${grow_camera.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${grow_camera.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: grow {
    type: left_outer
    sql_on: ${grow_camera.grow_id} = ${grow.id} ;;
    relationship: many_to_one
  }
}

explore: member {}

explore: member_farm {
  join: member {
    type: left_outer
    sql_on: ${member_farm.member_id} = ${member.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${member_farm.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }
}

explore: movement {
  join: farm {
    type: left_outer
    sql_on: ${movement.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${movement.group_id} = ${group.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${group.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${group.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: movement_category {}

explore: partner {
  join: farm {
    type: left_outer
    sql_on: ${partner.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }
}

explore: piggery {
  join: farm {
    type: left_outer
    sql_on: ${piggery.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }
}

explore: related_table {}

explore: report {
  join: movement {
    type: left_outer
    sql_on: ${report.movement_id} = ${movement.id} ;;
    relationship: many_to_one
  }

  join: report_category {
    type: left_outer
    sql_on: ${report.report_category_id} = ${report_category.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${movement.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${movement.group_id} = ${group.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${group.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${group.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: report_category {}

explore: room {
  join: farm {
    type: left_outer
    sql_on: ${room.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${room.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }
}

explore: room_category {}

explore: room_history {
  join: room {
    type: left_outer
    sql_on: ${room_history.room_id} = ${room.id} ;;
    relationship: many_to_one
  }

  join: movement {
    type: left_outer
    sql_on: ${room_history.movement_id} = ${movement.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${room_history.group_id} = ${group.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${room.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${room.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }
}

explore: room_history_category {}

explore: schedule {
  join: farm {
    type: left_outer
    sql_on: ${schedule.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${schedule.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${schedule.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: schedule_category {}

explore: schedule_worker {
  join: schedule {
    type: left_outer
    sql_on: ${schedule_worker.schedule_id} = ${schedule.id} ;;
    relationship: many_to_one
  }

  join: worker {
    type: left_outer
    sql_on: ${schedule_worker.worker_id} = ${worker.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${schedule.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${schedule.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${schedule.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: sensor {
  join: farm {
    type: left_outer
    sql_on: ${sensor.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${sensor.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${sensor.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: sensor_history {
  join: sensor {
    type: left_outer
    sql_on: ${sensor_history.sensor_id} = ${sensor.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${sensor.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${sensor.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${sensor.room_id} = ${room.id} ;;
    relationship: many_to_one
  }
}

explore: service_log {
  join: member {
    type: left_outer
    sql_on: ${service_log.member_id} = ${member.id} ;;
    relationship: many_to_one
  }
}

explore: setting_process {}

explore: spray {
  join: grow_camera {
    type: left_outer
    sql_on: ${spray.grow_camera_id} = ${grow_camera.id} ;;
    relationship: many_to_one
  }

  join: count_camera {
    type: left_outer
    sql_on: ${spray.count_camera_id} = ${count_camera.id} ;;
    relationship: many_to_one
  }

  join: farm {
    type: left_outer
    sql_on: ${grow_camera.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }

  join: piggery {
    type: left_outer
    sql_on: ${grow_camera.piggery_id} = ${piggery.id} ;;
    relationship: many_to_one
  }

  join: room {
    type: left_outer
    sql_on: ${grow_camera.room_id} = ${room.id} ;;
    relationship: many_to_one
  }

  join: grow {
    type: left_outer
    sql_on: ${grow_camera.grow_id} = ${grow.id} ;;
    relationship: many_to_one
  }
}

explore: target_feeding {
  join: farm {
    type: left_outer
    sql_on: ${target_feeding.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }
}

explore: target_weight {
  join: farm {
    type: left_outer
    sql_on: ${target_weight.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }
}

explore: worker {
  join: farm {
    type: left_outer
    sql_on: ${worker.farm_id} = ${farm.id} ;;
    relationship: many_to_one
  }
}
