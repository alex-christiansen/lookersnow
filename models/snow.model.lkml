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
}
