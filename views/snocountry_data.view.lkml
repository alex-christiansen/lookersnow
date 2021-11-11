view: snocountry_data {
  sql_table_name: `snow_data.snocountry_data`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: avg_base_depth_max {
    type: number
    group_label: "Snow Details"
    sql: ${TABLE}.avgBaseDepthMax ;;
  }

  dimension: avg_base_depth_min {
    type: number
    group_label: "Snow Details"
    sql: ${TABLE}.avgBaseDepthMin ;;
  }

  dimension: country {
    type: number
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: covid_mask_required {
    type: yesno
    group_label: "Covid Info"
    sql: ${TABLE}.covidMaskRequired ;;
  }

  dimension: covid_pass_protection {
    type: yesno
    group_label: "Covid Info"
    sql: ${TABLE}.covidPassProtection ;;
    link: {
      label: "Pass Protection Details"
      url: "{{ snocountry_data.covid_pass_protection_page._value }}"
    }
  }

  dimension: covid_pass_protection_page {
    type: string
    hidden: yes
    sql: ${TABLE}.covidPassProtectionPage ;;
  }

  dimension: covid_pre_purchase_day_lift_tickets_recommended {
    type: number
    hidden: yes
    sql: ${TABLE}.covidPrePurchaseDayLiftTicketsRecommended ;;
  }

  dimension: covid_reservations_required {
    type: yesno
    group_label: "Covid Info"
    sql: ${TABLE}.covidReservationsRequired ;;
    link: {
      label: "Reservation Details"
      url: "{{ snocountry_data.covid_reservations_required_page._value }}"
    }
  }

  dimension: covid_reservations_required_page {
    type: string
    hidden: yes
    sql: ${TABLE}.covidReservationsRequiredPage ;;
  }

  dimension: covid_sanitization_stations_available {
    type: yesno
    sql: ${TABLE}.covidSanitizationStationsAvailable ;;
  }

  dimension: covid_social_distancing_required {
    type: yesno
    sql: ${TABLE}.covidSocialDistancingRequired ;;
  }

  dimension_group: covid_updated {
    type: time
    description: "bq-datetime"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.covidUpdatedOn ;;
  }

  dimension: forecast_base_temp {
    type: number
    group_label: "Weather Forecast"
    sql: ${TABLE}.forecastBaseTemp ;;
  }

  dimension: forecast_top_temp {
    type: number
    group_label: "Weather Forecast"
    sql: ${TABLE}.forecastTopTemp ;;
  }

  dimension: forecast_weather {
    type: string
    group_label: "Weather Forecast"
    sql: ${TABLE}.forecastWeather ;;
  }

  dimension: general_email {
    type: string
    hidden: yes
    sql: ${TABLE}.generalEmail ;;
  }

  dimension: high_lift_elevation {
    type: number
    group_label: "Resort Facts"
    sql: ${TABLE}.highLiftElevation ;;
  }

  dimension: last_snow_fall_amount {
    type: number
    group_label: "Snow Details"
    sql: CAST(${TABLE}.lastSnowFallAmount AS numeric);;
  }

  dimension: last_snow_fall_date {
    type: string
    group_label: "Snow Details"
    sql: ${TABLE}.lastSnowFallDate ;;
  }

  dimension: latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: lg_trail_map_url {
    hidden:  yes
    type: string
    sql: ${TABLE}.lgTrailMapURL ;;
  }

  dimension: locatiaon {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: logo {
    type: string
    hidden: yes
    sql: ${TABLE}.logo ;;
  }

  dimension: longest_trail {
    type: number
    group_label: "Resort Facts"
    sql:  ${TABLE}.longestTrail ;;
  }

  dimension: longest_trail_length {
    type: string
    group_label: "Resort Facts"
    sql: split(${TABLE}.longestTrail, "miles")[offset(0)] ;;
  }

  dimension: longitude {
    type: number
    hidden:  yes
    sql: ${TABLE}.longitude ;;
  }

  dimension: low_base_elevation {
    type: number
    value_format: "0 \" ft\""
    group_label: "Resort Facts"
    sql: split(${TABLE}.lowBaseElevation, "ft")[offset(0)] ;;
  }

  dimension: max_open_down_hill_acres {
    type: number
    group_label: "Currently Open"
    sql: SAFE_CAST(${TABLE}.maxOpenDownHillAcres AS numeric);;
  }

  dimension: max_open_down_hill_lifts {
    type: number
    group_label: "Currently Open"
    sql: ${TABLE}.maxOpenDownHillLifts ;;
  }

  dimension: max_open_down_hill_miles {
    type: number
    group_label: "Currently Open"
    sql: ${TABLE}.maxOpenDownHillMiles ;;
  }

  dimension: max_open_down_hill_trails {
    type: number
    group_label: "Currently Open"
    sql: ${TABLE}.maxOpenDownHillTrails ;;
  }

  dimension: max_xcski_trails {
    type: number
    sql: ${TABLE}.maxXCSkiTrails ;;
  }

  dimension: new_snow_max {
    type: number
    group_label: "Snow Details"
    sql: ${TABLE}.newSnowMax ;;
  }

  dimension: new_snow_min {
    type: number
    group_label: "Snow Details"
    sql: ${TABLE}.newSnowMin ;;
  }

  dimension: night_grooming {
    type: yesno
    group_label: "Night Grooming"
    sql: ${TABLE}.nightGrooming ;;
  }

  dimension: night_grooming_number {
    type: number
    group_label: "Night Grooming"
    sql: ${TABLE}.nightGroomingNumber ;;
  }

  dimension: night_grooming_perc {
    type: number
    group_label: "Night Grooming"
    value_format_name: percent_0
    sql: ${TABLE}.nightGroomingPerc ;;
  }

  dimension: night_skiing {
    type: yesno
    group_label: "Night Skiing"
    sql: ${TABLE}.nightSkiing ;;
  }

  dimension: night_skiing_lifts {
    type: number
    sql: ${TABLE}.nightSkiingLifts ;;
  }

  dimension: night_skiing_trails {
    type: number
    sql: ${TABLE}.nightSkiingTrails ;;
  }

  dimension: number_advanced_trails {
    type: number
    group_label: "Resort Facts"
    sql: ${TABLE}.numberAdvancedTrails ;;
  }

  dimension: number_beginner_trails {
    type: number
    group_label: "Resort Facts"
    sql: ${TABLE}.numberBeginnerTrails ;;
  }

  dimension: number_expert_trails {
    type: number
    group_label: "Resort Facts"
    sql: ${TABLE}.numberExpertTrails ;;
  }

  dimension: number_intermediate_trails {
    type: number
    group_label: "Resort Facts"
    sql: ${TABLE}.numberIntermediateTrails ;;
  }

  dimension: number_terrain_park_features {
    type: number
    group_label: "Resort Facts"
    sql: ${TABLE}.numberTerrainParkFeatures ;;
  }

  dimension: number_terrain_parks_open {
    type: number
    sql: ${TABLE}.numberTerrainParksOpen ;;
  }

  dimension: open_down_hill_acres {
    type: number
    value_format: "0 \" Acres\""
    group_label: "Currently Open"
    sql: SAFE_CAST(${TABLE}.openDownHillAcres AS numeric) ;;
  }

  dimension: open_down_hill_lifts {
    type: number
    value_format: "0 \" Lifts\""
    group_label: "Currently Open"
    sql: ${TABLE}.openDownHillLifts ;;
  }

  dimension: open_down_hill_miles {
    type: number
    value_format: "0 \" mi\""
    group_label: "Currently Open"
    sql: ${TABLE}.openDownHillMiles ;;
  }

  dimension: open_down_hill_percent {
    type: number
    value_format_name: percent_0
    group_label: "Currently Open"
    sql: ${TABLE}.openDownHillPercent ;;
  }

  dimension: open_down_hill_trails {
    type: number
    group_label: "Currently Open"
    sql: ${TABLE}.openDownHillTrails ;;
  }

  dimension: operating_status {
    type: string
    group_label: "Currently Open"
    sql: ${TABLE}.operatingStatus ;;
  }

  dimension: open_acre_percentage {
    type: number
    sql: 1.0*${open_down_hill_acres} / nullif(${max_open_down_hill_acres},0);;
    value_format_name: percent_0
  }

  measure: avg_open_percentage {
    type:  average
    sql:  ${open_acre_percentage};;
  }

  dimension: predicted_snow_fall_24_hours {
    type: number
    group_label: "Snow Prediction"
    sql: ${TABLE}.predictedSnowFall_24Hours ;;
  }

  dimension: predicted_snow_fall_48_hours {
    type: number
    group_label: "Snow Prediction"
    sql: ${TABLE}.predictedSnowFall_48Hours ;;
  }

  dimension: predicted_snow_fall_72_hours {
    type: number
    group_label: "Snow Prediction"
    sql: ${TABLE}.predictedSnowFall_72Hours ;;
  }

  dimension: predicted_snow_fall_7days {
    type: number
    group_label: "Snow Prediction"
    sql: ${TABLE}.predictedSnowFall_7days ;;
  }

  dimension: prev_snow_fall_amount {
    type: number
    group_label: "Snow Details"
    sql: ${TABLE}.prevSnowFallAmount ;;
  }

  dimension: prev_snow_fall_date {
    type: date
    group_label: "Snow Details"
    sql: ${TABLE}.prevSnowFallDate ;;
  }

  dimension: primary_surface_condition {
    type: string
    group_label: "Snow Details"
    sql: ${TABLE}.primarySurfaceCondition ;;
  }

  dimension_group: report_date {
    type: time
    description: "bq-datetime"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.reportDateTime ;;
  }

  dimension: reservation_phone {
    type: string
    hidden: yes
    sql: ${TABLE}.reservationPhone ;;
  }

  dimension: resort_address {
    type: string
    group_label: "Resort Facts"
    sql: ${TABLE}.resortAddress ;;
  }

  dimension: resort_covid_page {
    type: string
    hidden: yes
    sql: ${TABLE}.resortCovidPage ;;
  }

  dimension: resort_facebook {
    type: string
    hidden: yes
    sql: ${TABLE}.resortFacebook ;;
  }

  dimension: resort_name {
    type: string
    sql: ${TABLE}.resortName ;;
    link: {
      label: "Website"
      url: "{{ snocountry_data.web_site_link._value }}"
    }
    link: {
      label: "Twitter"
      url: "{{ snocountry_data.resort_twitter._value }}"
    }
    link: {
      label: "Trail Map"
      url: " {{ snocountry_data.tn_trail_map_url._value }}"
    }
    link: {
      label: "Web Cam"
      url: " {{ snocountry_data.web_cam_link._value }}"
    }
  }

  dimension: resort_photos {
    type: string
    hidden: yes
    sql: ${TABLE}.resortPhotos ;;
  }

  dimension: resort_photos2 {
    type: string
    hidden: yes
    sql: ${TABLE}.resortPhotos2 ;;
  }

  dimension: resort_status {
    type: number
    group_label: "Resort Facts"
    sql: ${TABLE}.resortStatus ;;
  }

  dimension: resort_twitter {
    type: string
    hidden: yes
    sql: ${TABLE}.resortTwitter ;;
  }

  dimension: resort_type {
    type: string
    group_label: "Resort Facts"
    sql: ${TABLE}.resortType ;;
  }

  dimension: resort_you_tube {
    type: string
    hidden: yes
    sql: ${TABLE}.resortYouTube ;;
  }

  dimension: roads {
    type: string
    group_label: "Resort Facts"
    sql: ${TABLE}.Roads ;;
  }

  dimension: season_total {
    type: number
    group_label: "Snow Details"
    sql: ${TABLE}.seasonTotal;;
  }

  dimension: secondary_surface_condition {
    type: string
    sql: ${TABLE}.secondarySurfaceCondition ;;
  }

  dimension: sno_country_resort_link {
    type: string
    hidden: yes
    sql: ${TABLE}.SnoCountryResortLink ;;
  }

  dimension: snow_comments {
    type: string
    group_label: "Snow Details"
    sql: ${TABLE}.snowComments ;;
  }

  dimension: snow_last48_hours {
    type: number
    group_label: "Snow Details"
    sql: ${TABLE}.snowLast48Hours ;;
  }

  dimension: snow_making {
    type: string
    group_label: "Snow Details"
    sql: ${TABLE}.snowMaking ;;
  }

  dimension: snow_making_number {
    type: number
    group_label: "Snow Details"
    sql: ${TABLE}.snowMakingNumber ;;
  }

  dimension: snow_making_perc {
    type: number
    group_label: "Snow Details"
    value_format_name: percent_0
    sql: ${TABLE}.snowMakingPerc ;;
  }

  dimension: snow_phone {
    type: string
    hidden: yes
    sql: ${TABLE}.snowPhone ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: terrain_park_location {
    type: string
    sql: ${TABLE}.terrainParkLocation ;;
  }

  dimension: terrain_park_open {
    type: yesno
    sql: ${TABLE}.terrainParkOpen ;;
  }

  dimension: timezone {
    type: string
    hidden: yes
    sql: ${TABLE}.timezone ;;
  }

  dimension: tn_trail_map_url {
    type: string
    hidden: yes
    sql: ${TABLE}.tnTrailMapURL ;;
  }

  dimension: tubing {
    type: yesno
    group_label: "Tubing"
    sql: ${TABLE}.Tubing ;;
  }

  dimension: tubing_hours {
    type: string
    group_label: "Tubing"
    sql: ${TABLE}.tubingHours ;;
  }

  dimension: tubing_lanes {
    type: number
    group_label: "Tubing"
    sql: ${TABLE}.tubingLanes ;;
  }

  dimension: vertical_drop {
    type: number
    group_label: "Resort Facts"
    sql: ${TABLE}.verticalDrop ;;
  }

  dimension: walking_trails {
    type: string
    hidden: yes
    sql: ${TABLE}.walkingTrails ;;
  }

  dimension: weather_day4_condition {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDay4_Condition ;;
  }

  dimension: weather_day4_sunrise {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDay4_Sunrise ;;
  }

  dimension: weather_day4_sunset {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDay4_Sunset ;;
  }

  dimension: weather_day4_temperature_high {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherDay4_Temperature_High ;;
  }

  dimension: weather_day4_temperature_low {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherDay4_Temperature_Low ;;
  }

  dimension: weather_day4_wind_direction {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDay4_WindDirection ;;
  }

  dimension: weather_day4_wind_speed {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherDay4_WindSpeed ;;
  }

  dimension: weather_day5_condition {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDay5_Condition ;;
  }

  dimension: weather_day5_sunrise {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDay5_Sunrise ;;
  }

  dimension: weather_day5_sunset {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDay5_Sunset ;;
  }

  dimension: weather_day5_temperature_high {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherDay5_Temperature_High ;;
  }

  dimension: weather_day5_temperature_low {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherDay5_Temperature_Low ;;
  }

  dimension: weather_day5_wind_direction {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDay5_WindDirection ;;
  }

  dimension: weather_day5_wind_speed {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherDay5_WindSpeed ;;
  }

  dimension: weather_day_after_tomorrow_condition {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDayAfterTomorrow_Condition ;;
  }

  dimension: weather_day_after_tomorrow_sunrise {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDayAfterTomorrow_Sunrise ;;
  }

  dimension: weather_day_after_tomorrow_sunset {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDayAfterTomorrow_Sunset ;;
  }

  dimension: weather_day_after_tomorrow_temperature_high {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherDayAfterTomorrow_Temperature_High ;;
  }

  dimension: weather_day_after_tomorrow_temperature_low {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherDayAfterTomorrow_Temperature_Low ;;
  }

  dimension: weather_day_after_tomorrow_wind_direction {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherDayAfterTomorrow_WindDirection ;;
  }

  dimension: weather_day_after_tomorrow_wind_speed {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherDayAfterTomorrow_WindSpeed ;;
  }

  dimension: weather_today_condition {
    type: string
    group_label: "Weather Today"
    sql: ${TABLE}.weatherToday_Condition ;;
  }

  dimension: weather_today_sunrise {
    type: string
    group_label: "Weather Today"
    sql: ${TABLE}.weatherToday_Sunrise ;;
  }

  dimension: weather_today_sunset {
    type: string
    group_label: "Weather Today"
    sql: ${TABLE}.weatherToday_Sunset ;;
  }

  dimension: weather_today_temperature_high {
    type: number
    group_label: "Weather Today"
    sql: ${TABLE}.weatherToday_Temperature_High ;;
  }

  dimension: weather_today_temperature_low {
    type: number
    group_label: "Weather Today"
    sql: ${TABLE}.weatherToday_Temperature_Low ;;
  }

  dimension: weather_today_wind_direction {
    type: string
    group_label: "Weather Today"
    sql: ${TABLE}.weatherToday_WindDirection ;;
  }

  dimension: weather_today_wind_speed {
    type: number
    group_label: "Weather Today"
    sql: ${TABLE}.weatherToday_WindSpeed ;;
  }

  dimension: weather_tomorrow_condition {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherTomorrow_Condition ;;
  }

  dimension: weather_tomorrow_sunrise {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherTomorrow_Sunrise ;;
  }

  dimension: weather_tomorrow_sunset {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherTomorrow_Sunset ;;
  }

  dimension: weather_tomorrow_temperature_high {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherTomorrow_Temperature_High ;;
  }

  dimension: weather_tomorrow_temperature_low {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherTomorrow_Temperature_Low ;;
  }

  dimension: weather_tomorrow_wind_direction {
    type: string
    hidden: yes
    sql: ${TABLE}.weatherTomorrow_WindDirection ;;
  }

  dimension: weather_tomorrow_wind_speed {
    type: number
    hidden: yes
    sql: ${TABLE}.weatherTomorrow_WindSpeed ;;
  }

  dimension: web_cam_link {
    type: string
    hidden: yes
    sql: ${TABLE}.webCamLink ;;
  }

  dimension: web_site_link {
    type: string
    hidden: yes
    sql: ${TABLE}.webSiteLink ;;
  }

  dimension: weekday_hours {
    type: string
    group_label: "Resort Facts"
    sql: ${TABLE}.weekdayHours ;;
  }

  dimension: weekend_hours {
    type: string
    group_label: "Resort Facts"
    sql: ${TABLE}.weekendHours ;;
  }

  dimension: xc_skiing {
    type: string
    hidden: yes
    sql: ${TABLE}.xcSkiing ;;
  }

  dimension: xc_skiing_km {
    type: string
    hidden: yes
    sql: ${TABLE}.xcSkiingKM ;;
  }

  dimension: xc_skiing_skating_km {
    type: string
    hidden: yes
    sql: ${TABLE}.xcSkiingSkatingKM ;;
  }

  dimension: xc_skiing_total_km_open {
    type: string
    hidden: yes
    sql: ${TABLE}.xcSkiingTotalKM_Open ;;
  }

  dimension: xc_skiing_trails {
    type: string
    hidden: yes
    sql: ${TABLE}.xcSkiingTrails ;;
  }

  measure: count {
    type: count
    drill_fields: [id, resort_name]
  }
}
