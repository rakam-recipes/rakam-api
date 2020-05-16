local common = import 'common_schema.libsonnet';
local predefined = import 'custom_schema.libsonnet';
local util = import 'util.libsonnet';

local target = std.extVar('target');

std.map(function(event_type)
  local event_name = event_type.event;
  local types = event_type.types;
  local names = event_type.names;

  local defined = if std.objectHas(predefined, event_name) then predefined[event_name] else null;

  local definedDimensions = if defined != null && std.objectHas(defined, 'dimensions') then defined.dimensions else {};

  local dimensions_for_event = std.foldl(function(a, b) a + b, std.mapWithIndex(function(index, name) {
                                 [name]: {
                                   column: name,
                                   label: if std.objectHas(definedDimensions, name) && std.objectHas(definedDimensions[name], 'label') then definedDimensions[name].label
                                   else if std.objectHas(common.dimensions, name) && std.objectHas(common.dimensions[name], 'label') then common.dimensions[name].label
                                   else null,
                                   type: types[10],
                                   category: if std.objectHas(definedDimensions, name) && std.objectHas(definedDimensions[name], 'category') then definedDimensions[name].category
                                   else if std.objectHas(common.dimensions, name) && std.objectHas(common.dimensions[name], 'category') then common.dimensions[name].category
                                   else if std.startsWith(name, '_') then 'SDK'
                                   else 'Event Property',
                                 },
                               }, names), {})
                               +
                               if defined != null && std.objectHas(defined, 'computed_dimensions') then defined.computed_dimensions else {};
  {
    name: 'rakam_event_' + event_name,
    label: (if defined != null then '[SDK] ' else '') + event_name,
    target: util.generate_target_reference(std.mergePatch(target, { table: event_name })),
    measures: common.measures + if defined != null && std.objectHas(defined, 'measures') then defined.measures else {},
    mappings: common.mappings,
    relations: if defined != null && std.objectHas(defined, 'relations') then defined.relations else {},
    category: 'Rakam Events',
    dimensions: common.columns + dimensions_for_event,
  }, std.extVar('event_schema'))
