Todos = Ember.Application.create();

require('todos/controllers/main');
require('todos/templates/main');
require('todos/models/main');
require('todos/views/main');

Todos.MainView = Ember.View.extend({
  templateName: 'main_view'
});

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
