Todos.Router = Ember.Router.extend({
  enableLogging: true,
  root: Ember.Route.extend({
    index: Ember.Route.extend({
      route: '/',
      redirectsTo: 'todos'
    }),
    todos: Ember.Route.extend({
      route: 'todos',
      connectOutlets: function(router) {
        router.get('applicationController').connectOutlet('main');
      }
    })
  })
});
