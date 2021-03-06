export default Ember.Route.extend({
  model: function(){
    return this.store.createRecord('user');
  },

  actions: {
    save: function(model){
      var _this = this;
      var user = model.getProperties('username', 'email', 'password', 'passwordConfirmation');
      var data = {user: user};
      $.post('/api/v1/users', data).then(function(response){
        _this.container.lookup('session-store:local-storage').persist({auth_email: response.email, auth_token: response.auth_token, authenticatorFactory: 'authenticator:devise'});
        _this.set('session.isAuthenticated', true);
        _this.transitionTo('index');
        _this.controllerFor('application').set('success', "Welcome to Chores!");
        $('body').trigger('flash');
      }, function(error){
      });
    }
  }
});
