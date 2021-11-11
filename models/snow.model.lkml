connection: "snow_data"

# include all the views
include: "/views/**/*.view"

datagroup: snow_default_datagroup {
  sql_trigger: SELECT MAX(reportDateTime) FROM snocountry_data;;
  max_cache_age: "24 hour"
}

persist_with: snow_default_datagroup

explore: snocountry_data {
  label: "Resort Daily Snow Reports"

  join: report_rank {
    relationship: many_to_one
    type: left_outer
    sql_on: ${report_rank.snocountry_data_resort_name} = ${snocountry_data.resort_name} AND ${report_rank.snocountry_data_report_date_date} = ${snocountry_data.report_date_date} ;;
    fields: []
  }

  always_join: [report_rank]

  sql_always_where: ${report_rank.report_rank} = 1 ;;
}
