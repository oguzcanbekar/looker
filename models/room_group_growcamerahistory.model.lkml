connection: "mysql_edgefarm"

include: "/views/grow_camera_history.view.lkml"
include: "/views/room.view.lkml"
include: "/views/group.view.lkml"
# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: room {
  join: group {
    relationship: one_to_many
    sql_on: ${room.id} = ${group.room_id} ;;
  }

  join: grow_camera_history {
    relationship: one_to_many
    sql_on: ${room.id} = ${grow_camera_history.room_id} ;;
  }
}
