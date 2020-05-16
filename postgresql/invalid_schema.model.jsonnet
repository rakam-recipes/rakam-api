local common = import 'common_schema.libsonnet';
local util = import 'util.libsonnet';
local target = std.extVar('target');

local dimensions = [
  {
    name: 'collection',
    type: 'string',
    desc: '',
  },
  {
    name: 'property',
    type: 'string',
    desc: 'The property the system failed to parse in the collection',
  },
  {
    name: 'type',
    type: 'string',
    desc: 'The expected type for the field. The system failed to parse the value to this type.',
  },
  {
    name: 'event_id',
    type: 'string',
    desc: 'The id of the corresponding event in the EVENTS table. You can use this id in order to join to that table and fix the historical data.',
  },
  {
    name: 'error_message',
    type: 'string',
    desc: 'The error message thrown in the system parsing the property ',
  },
  {
    name: 'encoded_value',
    type: 'string',
    desc: 'aria-label="The invalid raw value encoded as JSON for that is sent to the API"',
  },
];

{
  category: 'Rakam Events',
  name: 'rakam_invalid_schema',
  label: '[System] Invalid Schema',
  description: 'Includes the parsing errors in the API. ',
  target: util.generate_target_reference(std.mergePatch(target, { table: '$invalid_schema' })),
  measures: common.measures,
  mappings: common.mappings,
  dimensions: common.columns + std.foldl(function(a, b) a + b, std.map(function(prop) {
    [prop.name]: {
      column: prop.name,
      type: prop.type,
      description: prop.desc,
    },
  }, dimensions), {}),
}
