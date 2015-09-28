
var token = $('#api-token').val();
  $.ajaxSetup({
    headers:{
      "accept": "application/json",
      "token": token
    };
});

var app = app || {};

//model
app.Post = Backbone.Model.extend({
  defaults:{
  'title': 'tbd',
  'body': 'tbd'
  }
});

//collection
app.PostCollection = Backbone.Collection.extend({
  model: app.Post,
  url: '/api/posts'
});

//views
app.PostView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
  },
  tagName: 'div',
  className: 'post',
  template: _.template($('#post-template').html() ),
  render: function(){
    this.$el.empty();
    var html = this.template( this.model.toJSON() );
    var $html = $( html );
    this.$el.append( $html );
    // this.input = this.$('.edit');
  },
  events:{
    'click button.remove': 'removePost',
  },
  removePost: function(){
    this.model.destroy();
    this.$el.remove();
  }
});

app.PostListView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, 'add', this.render )
  },
  render: function(){
    this.$el.empty();
    var posts = this.collection.models;
    var view;
    for (var i = 0; i < posts.length; i++) {
      view = new app.PostView({model: posts[i]});
      view.render();
      this.$el.append( view.$el );
    }
  }
});

var posts = new app.PostCollection();
var postPainter = new app.PostListView({
  collection: posts,
  el: $('#post-list')
});

posts.fetch();

$('form.create-post').on('submit', function(e){
  e.preventDefault();
  var newTitle= $(this).find("#title").val();
  var newBody= $(this).find("#body").val();
  posts.create({
    title: newTitle,
    body: newBody
  });
});
