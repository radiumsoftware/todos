module "Routing - Default", {
  setup: ->
    Todos.initialize()
    Todos.router.route '/'
}
test "default route is todos", ->
  equal Todos.router.get('currentState.path'), 'root.todos', "default to todos route"

