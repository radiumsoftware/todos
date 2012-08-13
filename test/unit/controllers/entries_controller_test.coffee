module "Controllers.Entries - empty todo list", {
setup: ->
  window.Controllers = Ember.Namespace.create();
  Controllers.entriesController = Todos.EntriesController.create()
  Controllers.entriesController.store = new window.Todos.Store()
}

test "should have 0 total", ->
  equal Controllers.entriesController.get('total'), 0, "0 total when empty"

test "should have 0 remaining", ->
  equal Controllers.entriesController.get('remaining'), 0, "0 remaining when empty"

test "should have 0 completed", ->
  equal Controllers.entriesController.get('completed'), 0, "0 completed when empty"

test "should have none left", ->
  ok Controllers.entriesController.get('noneLeft'), "none left when empty"

test "should not be all done", ->
  ok !Controllers.entriesController.get('allAreDone'), "not all done when empty"

module "Controllers.Entries - 1 done and 1 undone todo", {
setup: ->
  window.Controllers = Ember.Namespace.create();
  Controllers.entriesController = Todos.EntriesController.create()
  Controllers.entriesController.store = new window.Todos.Store()
  Ember.run =>
    Controllers.entriesController.createNew('todo 1')
    Controllers.entriesController.createNew('todo 2')
    Controllers.entriesController.set('lastObject.completed', true)
}

test "should have 2 total", ->
  equal Controllers.entriesController.get('total'), 2, "2 total with 1 completed"

test "should have 1 remaining", ->
  equal Controllers.entriesController.get('remaining'), 1, "1 remaining with 1 completed"

test "should have 1 completed", ->
  equal Controllers.entriesController.get('completed'), 1, "1 completed with 1 completed"

test "should not be noneLeft", ->
  ok !Controllers.entriesController.get('noneLeft'), "not noneLeft when 1 completed"

test "should not be all done", ->
  ok !Controllers.entriesController.get('allAreDone'), "not all done when 1 completed"

module "Controllers.Entries - 2 done and 0 undone todo", {
setup: ->
  window.Controllers = Ember.Namespace.create();
  Controllers.entriesController = Todos.EntriesController.create()
  Controllers.entriesController.store = new window.Todos.Store()
  Ember.run =>
    Controllers.entriesController.createNew('todo 1')
    Controllers.entriesController.createNew('todo 2')
    Controllers.entriesController.set('firstObject.completed', true)
    Controllers.entriesController.set('lastObject.completed', true)
}

test "should have 2 total", ->
  equal Controllers.entriesController.get('total'), 2, "2 total with both completed"

test "should have 0 remaining", ->
  equal Controllers.entriesController.get('remaining'), 0, "0 remaining with both completed"

test "should have 2 completed", ->
  equal Controllers.entriesController.get('completed'), 2, "2 completed with both completed"

test "should not be noneLeft", ->
  ok !Controllers.entriesController.get('noneLeft'), "not noneLeft with both completed"

test "should be all done", ->
  ok Controllers.entriesController.get('allAreDone'), "all done with both completed"

test "shold clear completed", ->
  Controllers.entriesController.clearCompleted()
  equal Controllers.entriesController.get('total'), 0, "0 total after clearCompleted"





