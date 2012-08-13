module "Routing - Default", {
  setup: ->
    Todos.initialize()
    Todos.router.route '/'

  teardown: ->
    Todos.router.route '/'
}
test "default route is index", ->
  equal Todos.router.get('currentState.path'), 'root.index', "default to todos route"

test "route to active", ->
  Todos.router.route '/active'
  equal Todos.router.get('currentState.path'), 'root.active', "in active"

test "route to completed", ->
  Todos.router.route '/completed'
  equal Todos.router.get('currentState.path'), 'root.completed', "in completed"



