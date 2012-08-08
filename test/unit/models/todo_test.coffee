module "Models/Todo", {
setup: ->
  window.Models = Ember.Namespace.create();
  Models.todo = Todos.Todo.create({})

teardown: ->
  window.Models = undefined
}

test "should create todo object", ->
  ok Models.todo, "todo null"

test "should set todo title", ->
  Models.todo.set 'title', "A todo"
  equal Models.todo.get('title'), "A todo", "todo title is not as expected"

test "should be able to signify isdone", ->
  Models.todo.set 'isDone', true
  ok Models.todo.get('isDone'), "Todo is not done"

  
