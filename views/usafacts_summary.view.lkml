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

  dimension: diff_num_cases {
    type: string
    sql: ${TABLE}.diff_num_cases ;;
  }

  dimension: num_cases {
    type: string
    sql: ${TABLE}.num_cases ;;
  }

  dimension: num_deaths {
    type: string
    sql: ${TABLE}.num_deaths ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  dimension: prev_num_cases {
    type: string
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
    drill_fields: [county_name]
  }
}
