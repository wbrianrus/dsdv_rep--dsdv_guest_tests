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


  measure: last_updated_date {
    type: date
    sql: MAX(${TABLE}.date) ;;
    convert_tz: no
  }

  dimension: is_latest_date {
    type: yesno
    sql: MAX(last_updated_date) = ${TABLE}.date ;;
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
