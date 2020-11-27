local common = import 'common_schema.libsonnet';
local predefined = import 'custom_schema.libsonnet';
local util = import 'util.libsonnet';

local target = std.extVar('target');

[
  local event_name = event_type.event;
  local types = event_type.types;
  local names = event_type.names;

  local defined = if std.objectHas(predefined, event_name) then predefined[event_name] else {};

  local definedDimensions = if defined != null && std.objectHas(defined, 'properties') then defined.properties else {};

  local dimensions_for_event = std.foldl(function(a, b) a + b, std.mapWithIndex(function(index, name) {
                                 [name]: {
                                   column: name,
                                   label: util.get(definedDimensions, name + '.label', util.get(common.properties, name + '.label', null)),
                                   hidden: util.get(definedDimensions, name + '.hidden', util.get(common.properties, name + '.hidden', null)),
                                   type: types[index],
                                   category: util.get(definedDimensions, name + '.category', util.get(common.properties,
                                                                                                      name + '.category',
                                                                                                      if std.startsWith(name, '_') then 'SDK'
                                                                                                      else 'Event Property')),
                                 },
                               }, names), {})
                               +
                               util.get(defined, 'dimensions', {});
  {
    name: event_type.model,
    label: event_name,
    target: std.mergePatch(target, { table: event_name }),
    measures: common.measures + util.get(defined, 'measures', {}),
    mappings: common.mappings,
    relations: if std.extVar('users_table') != null then {
      _users: {
        source: '_user',
        target: 'id',
      },
    } else {} + util.get(defined, 'relations', {}),
    category: 'Rakam Events',
    dimensions: {
      _time: {
        column: '_time',
        type: 'timestamp',
      },
      server_time: {
        hidden: true,
        column: '$server_time',
        type: 'timestamp',
      },
      _user: {
        column: '_user',
        type: 'string',
      },
    } + dimensions_for_event,
  }
  for event_type in std.extVar('event_schema')
]
