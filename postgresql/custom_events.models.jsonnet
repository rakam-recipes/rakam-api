local common = import 'common_schema.libsonnet';
local predefined = import 'custom_schema.libsonnet';
local util = import 'util.libsonnet';

local target = std.extVar('target');

[function(event_type)
  local event_name = event_type.event;
  local types = event_type.types;
  local names = event_type.names;

  local defined = if std.objectHas(predefined, event_name) then predefined[event_name] else null;

  local definedDimensions = if defined != null && std.objectHas(defined, 'properties') then defined.properties else {};

  local dimensions_for_event = std.foldl(function(a, b) a + b, std.mapWithIndex(function(index, name) {
                                 [name]: {
                                   column: name,
                                   label: if std.objectHas(definedDimensions, name) && std.objectHas(definedDimensions[name], 'label') then definedDimensions[name].label
                                   else if std.objectHas(common.properties, name) && std.objectHas(common.properties[name], 'label') then common.properties[name].label
                                   else null,
                                   type: types[index],
                                   category: if std.objectHas(definedDimensions, name) && std.objectHas(definedDimensions[name], 'category') then definedDimensions[name].category
                                   else if std.objectHas(common.properties, name) && std.objectHas(common.properties[name], 'category') then common.properties[name].category
                                   else if std.startsWith(name, '_') then 'SDK'
                                   else 'Event Property',
                                 },
                               }, names), {})
                               +
                               if defined != null && std.objectHas(defined, 'dimensions') then defined.dimensions else {};
  {
    name: event_type.model,
    label: (if defined != null then '[SDK] ' else '') + event_name,
    target: std.mergePatch(target, { table: event_name }),
    measures: common.measures + if defined != null && std.objectHas(defined, 'measures') then defined.measures else {},
    mappings: common.mappings,
    relations: common.relations
               + if defined != null && std.objectHas(defined, 'relations') then defined.relations else {},
    category: 'Rakam Events',
    dimensions: {
      _time: {
        column: '_time',
        description: '',
        type: 'timestamp',
      },
      _server_time: {
        column: '$server_time',
        description: '',
        type: 'timestamp',
      },
      _user: {
        column: '_user',
        type: 'string',
        description: '',
      },
    } + dimensions_for_event,
  } for event_type in std.extVar('event_schema')]
