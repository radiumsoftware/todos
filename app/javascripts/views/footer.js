Todos.FooterView = Ember.ContainerView.extend({
  elementId: 'footer',
  tagName: 'footer',
  visibilityBinding: 'controller.namespace.entriesController.noneLeft',
  classNameBindings: [ 'visibility:hidden' ],
  childViews: [ 'statsView', 'filtersView', 'clearBtnView' ],
  statsView: Ember.View.create({
    entriesBinding: 'controller.namespace.entriesController',
    elementId: 'todo-count',
    tagName: 'span',
    templateName: 'stats',
    oneLeft: function() {
      return this.getPath( 'entries.remaining' ) === 1;
    }.property( 'entries.remaining' )
  }),
  filtersView: Ember.View.create({
    templateName: 'filters',
    filterBinding: 'controller.namespace.entriesController.filterBy',
    isAll: function() {
      return Ember.empty( this.get('filter') );
    }.property( 'filter' ),
    isActive: function() {
      return this.get('filter') === 'active';
    }.property('filter'),
    isCompleted: function() {
      return this.get('filter') === 'completed';
    }.property('filter')
  }),
  clearBtnView: Ember.View.create({
    entriesBinding: 'controller.namespace.entriesController',
    templateName: 'clear_btn',
    elementId: 'clear-completed',
    buttonClass: function () {
      return !this.getPath( 'entries.completed' );
    }.property( 'entries.completed' )
  })
});
