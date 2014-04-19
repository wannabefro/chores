export default Ember.View.extend({
  didInsertElement: function(){
    $('body').on('flash', function(){
      $('.alert-box').delay(2000).fadeOut();
    });
  }
});
