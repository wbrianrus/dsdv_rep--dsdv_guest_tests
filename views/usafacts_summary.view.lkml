view: usafacts_summary {
  sql_table_name: `test_looker_demo.usafacts_summary`
    ;;

  dimension: county_fips_code {
    type: string
    sql: ${TABLE}.county_fips_code ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.county_name ;;
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
    sql: MAX(${TABLE}.date) = ${TABLE}.date ;;
  }


  measure: diff_num_cases {
    type: number
    sql: ${TABLE}.diff_num_cases ;;
  }

  measure: num_cases {
    type: number
    sql: ${TABLE}.num_cases ;;
  }

  measure: num_deaths {
    type: number
    sql: ${TABLE}.num_deaths ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  measure: prev_num_cases {
    type: number
    sql: ${TABLE}.prev_num_cases ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: state_fips_code {
    type: string
    sql: ${TABLE}.state_fips_code ;;
  }

  measure: count {
    type: count
    drill_fields: [state,county_fips_code]
  }
}
