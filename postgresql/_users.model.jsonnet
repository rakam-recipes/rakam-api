local attrs = std.extVar('user_attributions');

if std.objectHas(attrs, '_users') then std.mergePatch(attrs._users, {
  dimensions: {
    hiddenattr: {
      hidden: true,
    },
  },
}) else null
