datagroup: test {
  max_cache_age: "5 minutes"
  sql_trigger: select EXTRACT(MINUTE FROM CURRENT_TIMESTAMP) ;;
}

view: report_rank {

  derived_table: {
    sql: SELECT

          ROW_NUMBER() OVER (PARTITION BY snocountry_data.resortName ORDER BY  (DATE(snocountry_data.reportDateTime , 'America/Denver')) DESC) AS report_rank,
          snocountry_data.resortName  AS snocountry_data_resort_name,
              (DATE(snocountry_data.reportDateTime , 'America/Denver')) AS snocountry_data_report_date_date
      FROM `snow_data.snocountry_data` AS snocountry_data;;
    publish_as_db_view: yes
    datagroup_trigger: test

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: report_rank {
    type: number
    label: "View only most recent report data?"
    sql: ${TABLE}.report_rank ;;
  }

  dimension: snocountry_data_resort_name {
    type: string
    sql: ${TABLE}.snocountry_data_resort_name ;;
  }

  dimension: snocountry_data_report_date_date {
    type: date
    datatype: date
    sql: ${TABLE}.snocountry_data_report_date_date ;;
  }

  set: detail {
    fields: [report_rank, snocountry_data_resort_name, snocountry_data_report_date_date]
  }
}
