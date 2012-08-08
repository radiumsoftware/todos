minispade.register('todos/app', function() {Todos = Ember.Application.create();
minispade.require('todos/router/main');
minispade.require('todos/controllers/main');
minispade.require('todos/templates/main');
minispade.require('todos/models/main');
minispade.require('todos/views/main');

Todos.initialize();

});