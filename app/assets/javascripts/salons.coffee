# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	$(document).on 'change', '.category_salon_field #salon_select', ( e ) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/salons/#{id}/get_branches"
			success: (data) ->
				$(".branch_field").html(data)

	$(document).on 'change', '.service_salon_field #salon_select', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/services/#{id}/get_branches"
			success: (data) ->
				$(".branch_field").html(data)

	$(document).on 'change', '.discount_salon_field #salon_select', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/discounts/#{id}/get_branches"
			success: (data) ->
				$(".discount_branch_field").html(data)

	$(document).on 'change', '.branch_field #service_branch_id', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/services/#{id}/get_service_categories"
			success: (data) ->
				$(".category_field").html(data)

	$(document).on 'change', '.stylist_cat_branch_field #service_branch_id', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/stylist_categories/#{id}/get_service_categories"
			success: (data) ->
				$(".category_field").html(data)

	$(document).on 'change', '.discount_branch_field #service_branch_id', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/discounts/#{id}/get_service_categories"
			success: (data) ->
				$(".discount_category_field").html(data)


	$(document).on 'change', '.stylist_cat_salon_field #salon_select', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/stylist_categories/#{id}/get_branches"
			success: (data) ->
				$(".stylist_cat_branch_field").html(data)

	$(document).on 'change', '.stylist_salon_field #salon_select', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/stylists/#{id}/get_branches"
			success: (data) ->
				$(".branch_field").html(data)

	$(document).on 'change', '.category_field #service_category_id', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/stylists/#{id}/get_stylist_categories"
			success: (data) ->
				$(".stylist_category_field").html(data)

	$(document).on 'change', '.discount_category_field #service_category_id', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/discounts/#{id}/get_services"
			success: (data) ->
				$(".discount_service_field").html(data)

	$(document).on 'change', '#stylist_branch_id', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/stylists/#{id}/get_service_categories"
			success: (data) ->
				$(".category_field").html(data)

	$(document).on 'change', '#discount_service_id', (e) ->
		id = $(this).val()
		$.ajax
			type: "GET"
			url: "/service_categories/#{id}/get_services"
			success: (data) ->
				$(".service_field").html(data)

#	$(document).on 'click', '.add_cart_item', (e) ->
		id = $(this).data("id")
		val = $("#customer_booking_services").val();price = parseFloat($(this).parents('.service-height').find('.service-price').html());total = parseFloat($('#total-count').html());
		$("#customer_booking_services").val(val + ',' + id)
		$.ajax
			type: "GET"
			url: "/services/#{id}/cart_item"
			success: (data) ->
				$("#proceed_link").show();$("#cart").append(data);$('#total-count').html(price+total);
        
	$(document).on 'click', '#proceed_link', (e) ->
		$('#customer_form').show()
		$('.cart-items').hide()
		$('.fa-arrow-left').css("visibility", "visible")
		if	$('#proceed_link').text() == 'Submit'
			$('form').submit()
		else
			$('#proceed_link').text('Submit')

	$(document).on 'click', '.fa-arrow-left', (e) ->
		$('#customer_form').hide()
		$('.fa-arrow-left').css("visibility", "hidden")
		$('.fa-arrow-right').css("visibility", "visible")
		$('.cart-items').show()

	$(document).on 'click', '.fa-arrow-right', (e) ->
		$('#customer_form').show()
		$('.fa-arrow-left').css("visibility", "visible")
		$('.fa-arrow-right').css("visibility", "hidden")
		$('.cart-items').hide()

delay = do ->
  timer = 0
  (callback, ms) ->
    clearTimeout timer
    timer = setTimeout(callback, ms)
    return
$('#search').keyup ->
  delay (->
    $('#search').parents('form').submit()
    return
  ), 500
  return
$(document).on 'change', '#city', (e) ->
    $('#search').parents('form').submit()
    return
$(document).on 'change', '#area', (e) ->
    $('#search').parents('form').submit()
	return
        