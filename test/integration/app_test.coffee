casper.start 'http://localhost:7777/', ->
  @echo "app started"

casper.run ->
  @test.assertExists('#new-todo', 'todo form found')
  @test.done()
