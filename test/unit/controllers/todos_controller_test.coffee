module "Controllers.Todo - empty todo list", {
setup: ->
  window.Controllers = Ember.Namespace.create();
  Controllers.todoController = Todos.TodosController.create({})
}

test "Should be empty with no todos", ->
  ok Controllers.todoController.get('isEmpty'), "new controller is empty"

test "Should have 0 remaining", ->
  equal Controllers.todoController.get('remaining'), 0, "0 remaining"

test "Should not all be done", ->
  equal Controllers.todoController.get('allAreDone'), false, "not all todos are done"

module "Controllers.Todo - 1 done and 1 undone todo", {
  setup: ->
    Controllers.todoController.clear()
    Controllers.todoController.createTodo 'todo 1'
    Controllers.todoController.createTodo 'todo 2'
    Controllers.todoController.set 'firstObject.isDone', true
}

test "should not be empty", ->
  equal Controllers.todoController.get('isEmpty'), false, "is not empty"

test "should have 2 todos", ->
  equal Controllers.todoController.get('length'), 2, "2 todos"

test "should have 1 remaining", ->
  equal Controllers.todoController.get('remaining'), 1, "1 remaining"

test "should have 1 todo after calling clearCompletedTodos", ->
  Controllers.todoController.clearCompletedTodos()
  equal Controllers.todoController.get('length'), 1, "1 todo after clearCompletedTodos"

test "Should not all be done", ->
  equal Controllers.todoController.get('allAreDone'), false, "not all todos are done"

module "Controllers.Todo - 2 done todos", {
  setup: ->
    Controllers.todoController.clear()
    Controllers.todoController.createTodo 'todo 1'
    Controllers.todoController.createTodo 'todo 2'
    Controllers.todoController.forEach (todo) -> todo.set 'isDone', true
}

test "should have 0 todos remaining", ->
  equal Controllers.todoController.get('remaining'), 0, "0 remaining"

test "Should all be done", ->
  ok Controllers.todoController.get('allAreDone'), "all todos are done"

test "should have no todos after calling clearCompletedTodos", ->
  Controllers.todoController.clearCompletedTodos()
  equal Controllers.todoController.get('length'), 0, "no todo after clearCompletedTodos"

test "should be empty after calling clearCompletedTodos on completed todo list", ->
  Controllers.todoController.clearCompletedTodos()
  ok Controllers.todoController.get('isEmpty'), "empty on completed list"






