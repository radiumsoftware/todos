Todos = Ember.Application.create({
  VERSION: '1.0',
  //rootElement: '#todoapp',
  storeNamespace: 'todos-emberjs',
  // Extend to inherit outlet support
  ApplicationController: Ember.Controller.extend()
});

require('todos/router');
require('todos/models/store');
require('todos/models/todo');
require('todos/controllers/entries');
require('todos/controllers/todos');
require('todos/views/application');
require('todos/views/header');
require('todos/views/main');
require('todos/views/todos');
require('todos/views/footer');
require('todos/templates/application');
require('todos/templates/clear_btn');
require('todos/templates/filters');
require('todos/templates/stats');
require('todos/templates/todos');
