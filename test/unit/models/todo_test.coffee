module "Models/Todo", {
setup: ->
  window.Models = Ember.Namespace.create();
  Models.todo = window.Todos.Todo.create({store: new window.Todos.Store() })

teardown: ->
  window.Models = undefined
}

test "should default to not done", ->
  equal Models.todo.get('completed'), false, "todo is not done"

test "should set todo title", ->
  Models.todo.set 'title', "A todo"
  equal Models.todo.get('title'), "A todo", "todo title is set"

test "should be able to complete", ->
  Models.todo.set 'completed', true
  ok Models.todo.get('completed'), "Todo is done"

  
