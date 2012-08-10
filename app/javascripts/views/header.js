(function(app) {
	'use strict';

  Todos.HeaderView = Ember.ContainerView.extend({
    childViews: [ 'titleView', 'createTodoView' ],
    elementId: 'header',
    tagName: 'header',
    titleView: Ember.View.create({
      tagName: 'h1',
      template: function() {
        return 'todos';
      }
    }),
    createTodoView: Ember.TextField.create({
      entriesBinding: 'controller.namespace.entriesController',
      placeholder: 'What needs to be done?',
      elementId: 'new-todo',
      insertNewline: function() {
        var value = this.get( 'value' );
        if ( value ) {
          this.get( 'entries' ).createNew( value );
          this.set( 'value', '' );
        }
      }
    })
  });

})(window.Todos);
