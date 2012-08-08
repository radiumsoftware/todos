Todos = Ember.Application.create();

require('todos/templates/main_view');
require('todos/templates/application');

Todos.ApplicationController = Ember.Controller.extend();
Todos.ApplicationView = Ember.View.extend({
  templateName: 'application'
});

Todos.Todo = Ember.Object.extend({
  title: null,
  isDone: false
});

Todos.TodosController = Ember.ArrayController.extend({
  content: [],

  createTodo: function(title) {
    var todo = Todos.Todo.create({ title: title });
    this.pushObject(todo);
  },

  clearCompletedTodos: function() {
    this.filterProperty('isDone', true).forEach(this.removeObject, this);
  },

  remaining: function() {
    return this.filterProperty('isDone', false).get('length');
  }.property('@each.isDone'),

  isEmpty: function() {
    return this.get('length') === 0;
  }.property('length'),

  allAreDone: function(key, value) {
    if (arguments.length === 2) {
      this.setEach('isDone', value);

      return value;
    } else {
      return !this.get('isEmpty') && this.everyProperty('isDone', true);
    }
  }.property('@each.isDone')
});

Todos.CreateTodoView = Ember.TextField.extend({
  insertNewline: function() {
    var value = this.get('value');

    if (value) {
      Todos.TodosController.createTodo(value);
      this.set('value', '');
    }
  }
});

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
