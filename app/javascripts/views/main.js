Todos.MainView = Ember.ContainerView.extend({
  elementId: 'main',
  tagName: 'section',
  visibilityBinding: 'controller.namespace.entriesController.noneLeft',
  classNameBindings: [ 'visibility:hidden' ],
  childViews: [ 'outletView', 'markAllChkbox' ],
  outletView: Ember.View.create({
    template: Ember.Handlebars.compile( '{{outlet}}' ),
  }),
  markAllChkbox: Ember.Checkbox.create({
    entriesBinding: 'controller.namespace.entriesController',
    elementId: 'toggle-all',
    checkedBinding: 'entries.allAreDone'
  })
});
