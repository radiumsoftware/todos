module "Controllers/Todo - empty todo list", {
setup: ->
  window.Controllers = Ember.Namespace.create();
  Controllers.todoController = Todos.TodosController.create({})

teardown: ->
  window.Controllers = undefined
}

test "Should be empty with no todos", ->
  ok Controllers.todoController.get('isEmpty'), "new controller is empty"

test "Should have 0 remaining", ->
  equal Controllers.todoController.get('remaining'), 0, "0 remaining"
