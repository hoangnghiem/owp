var Owp = Owp || {};

// Namespaces
Owp.Product = Owp.Product || {};

Owp.init = function() {
  // console.log('global init code here');
}

$(document).on('turbolinks:load', function() {
  Owp.init();
});

