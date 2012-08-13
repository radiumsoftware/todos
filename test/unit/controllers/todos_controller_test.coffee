module "Controllers.Todo - empty todo list", {
setup: ->
  window.Controllers = Ember.Namespace.create();
  Controllers.todoController = Todos.TodosController.create({content: Ember.A()})
}

test "Should be empty with no todos", ->
  Ember.run =>
    Controllers.todoController.set 'content.filterBy', ''

  equal Controllers.todoController.get('entries.length'), 0, "new controller is empty"

test "Should have 0 active", ->
  Ember.run =>
    Controllers.todoController.set 'content.filterBy', 'active'

  equal Controllers.todoController.get('entries.length'), 0, "0 active"

test "Should have 0 completed", ->
  Ember.run =>
    Controllers.todoController.set 'content.filterBy', 'completed'

  equal Controllers.todoController.get('entries.length'), false, "0 completed"

module "Controllers.Todo - 1 done and 1 undone todo", {
  setup: ->
    mock_store = new window.Todos.Store()

    content = Ember.A([
                window.Todos.Todo.create({title: 'todo 1', store: mock_store, completed: false}),
                window.Todos.Todo.create({title: 'todo 2', store: mock_store, completed: true})
              ])

    Controllers.todoController = Todos.TodosController.create({content: content})
}

test "should have 2 todos", ->
  Ember.run =>
    Controllers.todoController.set 'content.filterBy', ''

  equal Controllers.todoController.get('entries.length'), 2, "new controller has 2 todos"

test "should have 1 active", ->
  Ember.run =>
    Controllers.todoController.set 'content.filterBy', 'active'

  equal Controllers.todoController.get('entries.length'), 1, "1 active"

test "Should have 1 completed", ->
  Ember.run =>
    Controllers.todoController.set 'content.filterBy', 'completed'

  equal Controllers.todoController.get('entries.length'), 1, "1 completed"

module "Controllers.Todo - 2 done todos", {
  setup: ->
    mock_store = new window.Todos.Store()

    content = Ember.A([
                window.Todos.Todo.create({title: 'todo 1', store: mock_store, completed: true}),
                window.Todos.Todo.create({title: 'todo 2', store: mock_store, completed: true})
              ])

    Controllers.todoController = Todos.TodosController.create({content: content})
}

test "should have 0 active", ->
  Ember.run =>
    Controllers.todoController.set 'content.filterBy', 'active'

  equal Controllers.todoController.get('entries.length'), 0, "0 active"

test "Should have 2 completed", ->
  Ember.run =>
    Controllers.todoController.set 'content.filterBy', 'completed'

  equal Controllers.todoController.get('entries.length'), 2, "2 completed"






