view: covid_nyt_us_states {
  sql_table_name: `pae-dsdv-internal-dev.test_looker_demo.covid_nyt_us_states`
    ;;

  dimension: confirmed_cases {
    type: number
    sql: ${TABLE}.confirmed_cases ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }


  measure: latest_date {
    type: date
    sql: MAX(${date_raw}) ;;
    convert_tz: no
  }

  measure: latest_date_bool {
    type: yesno
    sql: ${latest_date} = ${date_raw};;
  }

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  dimension: state_fips_code {
    type: string
    sql: ${TABLE}.state_fips_code ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  measure: count {
    type: count
    drill_fields: [state_name]
  }
}
