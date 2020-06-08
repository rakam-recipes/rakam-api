{
  version: 1.1,
  label: 'Rakam API',
  description: 'It automatically creates models from your collections.',
  variables: {
    target: {
      label: 'Project Name',
      type: 'schema',
    },
    event_schema: {
      type: 'sql',
      parent: 'target',
      description: 'The event schema',
      options: {
        sql: |||
          select regexp_replace(table_name, '[^\w_]+', '_','g') as model, (array_agg(table_name::text))[1] as event, array_agg(column_name::text) as names,
                array_agg(case
                    when udt_name = 'text' then 'string'
                    when udt_name = 'timestamptz' then 'timestamp'
                    when udt_name = 'float8' then 'double'
                    when udt_name = 'int4' then 'integer'
                    when udt_name = 'int8' then 'long'
                    when udt_name = 'bool' then 'boolean'
                    when udt_name = '_text' then 'array_string'
                    when udt_name = '_timestamptz' then 'array_timestamp'
                    when udt_name = '_float8' then 'array_double'
                    when udt_name = '_int4' then 'array_integer'
                    when udt_name = '_int8' then 'array_long'
                    when udt_name = '_bool' then 'array_boolean'
                    when udt_name = 'jsonb' then 'map_string'
                    else 'unknown'
                  end) as types
          from information_schema.columns
          where table_schema = current_schema and table_name not like '%~%' and table_name not like '$%' and column_name not like '$%' and column_name not in ('_user', '_time', '$server_time')
          group by 1
        |||,
      },
    },
  },
  tags: ['event-analytics'],
  databases: ['postgresql'],
}
