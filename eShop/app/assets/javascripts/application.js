// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .
//= require foundation-datetimepicker
//= require owl.carousel

$(function(){ 
  $(document).foundation(); 
  $(".owl-carousel").owlCarousel({
    navigation : true, // Show next and prev buttons
    slideSpeed : 300,
    paginationSpeed : 400,
    singleItem:true
  }); 
});

function AddToCartFromIndex(shopitem_id, cart_amount)
{
  /* alert("StopItem ID = " + shopitem_id + " ; Amount = " + cart_amount + " ;"); */
  /* Write to Session */
  
  var form = document.createElement("form");
  form.setAttribute("method", "post");
  form.setAttribute("action", "/cart");
  form.setAttribute("target", "cart");
  form.setAttribute("class", "add_cart");
  form.setAttribute("enctype", "multipart/form-data");
  form.setAttribute("id", "add_cart");
  form.setAttribute("accept-charset", "UTF-8");
  
  var hiddenField_shopitem_id = document.createElement("input");
  hiddenField_shopitem_id.setAttribute("type", "hidden");
  hiddenField_shopitem_id.setAttribute("id", "cart_shopitem_id");
  hiddenField_shopitem_id.setAttribute("name", "cart[shopitem_id]");
  hiddenField_shopitem_id.setAttribute("value", shopitem_id);
  
  var hiddenField_shopitem_amount = document.createElement("input");
  hiddenField_shopitem_amount.setAttribute("type", "hidden");
  hiddenField_shopitem_amount.setAttribute("id", "cart_shopitem_amount");
  hiddenField_shopitem_amount.setAttribute("name", "cart[shopitem_amount]");
  hiddenField_shopitem_amount.setAttribute("value", cart_amount);
  
  form.appendChild(hiddenField_shopitem_id);
  form.appendChild(hiddenField_shopitem_amount);
  
  document.body.appendChild(form);

  var tmp_window = window.open('', 'cart');

  form.submit();
  
  setTimeout(tmp_window.close(), 10000);
}