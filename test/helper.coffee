class Helper
  scripts: [
    'support/qunit',
    'iridium/qunit_adapter',
    'unit/mock_store'
  ]

  iridium: ->
    _iridium = requireExternal('iridium').create()
    _iridium.scripts = @scripts
    _iridium

exports.casper = (options) ->
  casper = (new Helper).iridium().casper(options)

  casper.test.emberDidRender = (cbk) ->
    casper.evaluate ->
      window.Ember.run.end()
    cbk.call casper

  casper

