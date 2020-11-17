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
      type: 'discover-models',
      parent: 'target',
    },
  },
  tags: ['event-analytics'],
  databases: ['postgresql'],
}
