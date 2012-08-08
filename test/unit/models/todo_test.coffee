module "Models/Todo", {
setup: ->
  window.Models = Ember.Namespace.create();
  Models.todo = Todos.Todo.create({})

teardown: ->
  window.Models = undefined
}

test "should default to not done", ->
  equal Models.todo.get('isDone'), false, "todo is not done"

test "should set todo title", ->
  Models.todo.set 'title', "A todo"
  equal Models.todo.get('title'), "A todo", "todo title is set"

test "should be able to signify isdone", ->
  Models.todo.set 'isDone', true
  ok Models.todo.get('isDone'), "Todo is done"

  
