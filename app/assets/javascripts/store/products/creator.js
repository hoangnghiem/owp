Owp.Product.Creator = Owp.Product.Creator || {};

(function(md, $) {
  'use strict';

  var bindBehaviors = function() {
    $("[data-behavior=edit-variants]").click(function() {
      $('#variants_pricing').trigger('click');
    });
  }

  var VariantOption = function() {
    this.type = ko.observable();
    this.value = ko.observable();
  }

  var VariantView = function(data) {
    var self = this;
    ko.mapping.fromJS(data, {}, self);
  }

  var ProductView = function() {
    self = this;

    // Observables
    self.code = ko.observable('');

    self.options = ko.observableArray([]);

    self.optionToEdit = ko.observable();

    self.variants = ko.observableArray([
      new VariantView({ sku: 'TDM1', price: 10.0, weight: null, dimension: null, options: [] }),
    ]);

    self.editing = ko.observable(false);
    self.edit = function() { self.editing(true) }

    // Actions
    self.addVariant = function() {
      self.variants.push(new VariantView(self.variants()[0]));
    };
    self.removeVariant = function() {
      self.variants.remove(this);
    }

    self.addOption = function() {
      if (self.optionToEdit() != "") {
        var newOption = self.optionToEdit().toLowerCase();
        self.options.push(newOption);
        ko.utils.arrayForEach(self.variants(), function(variant) {
          variant.options.push({'type': newOption, 'value': ''})
        });
        self.optionToEdit('');
      }
      UIkit.modal('#modal_add_option').hide();
    }
  }

  var initData = function() {
    ko.applyBindings(new ProductView());
  }

  md.init = function() {
    bindBehaviors();
    initData();
  }

})(Owp.Product.Creator, jQuery);

// Execute
$(document).on("turbolinks:load", function() {
  if(!($(".store.products.new, .store.products.create").length > 0)) return;
  Owp.Product.Creator.init();
});
