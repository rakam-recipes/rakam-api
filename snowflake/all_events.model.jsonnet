local common = import 'common_schema.libsonnet';

{
  name: 'rakam_events',
  label: '[Rakam] All events',
  target: std.extVar('target'),
  category: 'Rakam Events',
  measures: common.measures,
  mappings: common.mappings,
  dimensions: common.columns {
    event_type: {
      column: 'EVENT_TYPE',
      type: 'string',
    },
  },
  materialize: {
    segmentation: {
      first_launch: {
        query: {
          model: 'aptoide_first_launch',
          measures: [
            'count_all_rows',
            'test.name',
          ],
          dimensions: [
            { name: '_time', timeframe: 'day' },
            'test',
            { name: 'aptoide_package' },
          ],
          filters: {
            'reference.aptoide_package': { equals: 'test', isNotSet: true },
          },
          timezone: null,
        },
        persist: {

        },
      },
    },
  },
}
