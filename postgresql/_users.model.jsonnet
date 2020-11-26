local table = std.extVar('users_table');

if table == null then null else {
  category: 'Rakam Events',
  name: '_users',
  target: table,
  label: '[Users]',
  mappings: {
    userId: 'id',
  },
  measures: {
    count_all_rows: {
      label: 'Total Users',
      aggregation: 'count',
    },
  },
  dimensions: std.mergePatch(std.extVar('user_attributions'), {
    id: {
      type: 'string',
      column: 'id',
    },
    created_at: {
      type: 'timestamp',
      column: 'created_at',
    },
  }),
}
