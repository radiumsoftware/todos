minispade.register('todos/app', function() {Todos = Ember.Application.create();
minispade.require('todos/controllers/main');
minispade.require('todos/templates/main');
minispade.require('todos/models/main');
minispade.require('todos/views/main');


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

Todos.initialize();

});