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
    total_users: {
      aggregation: 'count',
    },
  },
  dimensions: std.extVar('user_attributions'),
}
