minispade.register('todos/views/create_todo_view', function() {Todos.CreateTodoView = Ember.TextField.extend({
  insertNewline: function() {
    var value = this.get('value');

    if (value) {
      Todos.TodosController.createTodo(value);
      this.set('value', '');
    }
  }
});

});