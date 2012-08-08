casper.start 'http://localhost:7777/', ->
  @echo "app started"

casper.then -> @form_exists()

casper.form_exists = ->
  @test.emberDidRender ->
    @test.assertExists('#new-todo', 'todo form found')

casper.run ->
  @test.done()
