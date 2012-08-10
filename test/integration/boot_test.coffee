casper.start 'http://localhost:7777/', ->
  casper.evaluate ->
    window.Ember.run.end()

  @test.assertExists '#new-todo', 'app should show a new todo form initially!' 

casper.run ->
  @test.done()
