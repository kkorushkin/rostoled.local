/**
 * Created by MI on 04.02.2017.
 */
$('#navlist').lavalamp({
    easing: 'easeOutBack'
});

$(function(){
    var ink, d, x, y;
    $(".ripplelink").click(function(e){
        if($(this).find(".ink").length === 0){
            $(this).prepend("<span class='ink'></span>");
        }

        ink = $(this).find(".ink");
        ink.removeClass("animate");

        if(!ink.height() && !ink.width()){
            d = Math.max($(this).outerWidth(), $(this).outerHeight());
            ink.css({height: d, width: d});
        }

        x = e.pageX - $(this).offset().left - ink.width()/2;
        y = e.pageY - $(this).offset().top - ink.height()/2;

        ink.css({top: y+'px', left: x+'px'}).addClass("animate");
    });
});

$(document).ready(function(){
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 800);
        return false;
    });

    $('#back-to-top').tooltip('show');

});

(function($) {
    $.fn.spinner = function() {
        this.each(function() {
            var el = $(this);

// add elements
            el.wrap('<span class="spinner"></span>');
            el.before('<span class="sub">&or;</span>');
            el.after('<span class="add">&and;</span>');

// substract
            el.parent().on('click', '.sub', function () {
                if (el.val() > parseInt(el.attr('min')))
                    el.val( function(i, oldval) { return --oldval; });
            });

// increment
            el.parent().on('click', '.add', function () {
                if (el.val() < parseInt(el.attr('max')))
                    el.val( function(i, oldval) { return ++oldval; });
            });
        });
    };

    $('header a[href^="#"], .carousel-caption a[href^="#"], .category a[href^="#"]').on('click', function () {
        $('html, body').stop().animate({
            scrollTop: $($(this).attr('href')).offset().top - 100
        }, 1000);
    });

    $('#buyModal').on('show.bs.modal', function (e) {
        var button = $(e.relatedTarget),
            root = button.closest('.js-item-cntnr'),
            title = root.find('.js-item-ttl').text();

            $(this).find('textarea').val(title.trim());
    })
})(jQuery);

$('input[type="text"].counter-text').spinner();

$(document).ready(function () {

    $('.scrollbar-light').scrollbar();


    var userData = Cookies.get('User_Data');
    function escapeRegExp(str) {
        return str.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
    }
    if(userData) { 
        $.each($.parseJSON(userData), function ( key, val ) {
            if(key == 'name' || key == 'email'|| key == 'tel') {
                $("[name='" + key + "']").val(val.replace(new RegExp(escapeRegExp('+'), 'g'), ' '));
            }
        });
    }

	$('.products__item_btn-buy').click(function(){
		$('input[type="text"].counter-text').val("1");
    });

	
	
    $(".formQuestion").submit(function () {
        var form = $(this);
        var error = false;

        if (!error) {
            var data = form.serialize() + '&location=' + window.location.href;
            $.ajax({
                type: 'POST',
                url: 'js/mailQuestion.php',
                dataType: 'json',
                data: data,
                beforeSend: function (data) {
                    form.find('button[type="submit"]').attr('disabled', 'disabled');
                },
                success: function (data) {

                    if (data['error']) { // ???? ???????? ???????? ???????
                        alert(data['error']); // ???????? ?? ?????
                    } else { // ???? ??? ??????? ??
                        form.closest('.modal').modal('hide');
                        $('.ok').find('.modal-body').html(data['text']);
                        $('.ok').modal('show');
						dataLayer.push({'event': '01'});
                        setTimeout(function () {
                            $('.ok').modal('hide');
                        }, 6000);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                },
                complete: function (data) {
                    form.find('button[type="submit"]').prop('disabled', false);
                }
            });
        }
        return false; // ??????? ?????????? ?????????? ?????
    });
    $(".formAction").submit(function () {
        var form = $(this);
        var error = false;

        if (!error) {
            var data = form.serialize() + '&location=' + window.location.href;
            $.ajax({
                type: 'POST',
                url: 'js/mailAction.php',
                dataType: 'json',
                data: data,
                beforeSend: function (data) {
                    form.find('button[type="submit"]').attr('disabled', 'disabled');
                },
                success: function (data) {

                    if (data['error']) { // ???? ???????? ???????? ???????
                        alert(data['error']); // ???????? ?? ?????
                    } else { // ???? ??? ??????? ??
                        form.closest('.modal').modal('hide');
                        $('.ok').find('.modal-body').html(data['text']);
                        $('.ok').modal('show');
						dataLayer.push({'event': '02'});
                        setTimeout(function () {
                            $('.ok').modal('hide');
                        }, 6000);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                },
                complete: function (data) {
                    form.find('button[type="submit"]').prop('disabled', false);
                }
            });
        }
        return false; // ??????? ?????????? ?????????? ?????
    });
    $(".formShop").submit(function () {
        var form = $(this);
        var error = false;

        if (!error) {
            var data = form.serialize() + '&location=' + window.location.href;
            $.ajax({
                type: 'POST',
                url: 'js/mailShop.php',
                dataType: 'json',
                data: data,
                beforeSend: function (data) {
                    form.find('button[type="submit"]').attr('disabled', 'disabled');
                },
                success: function (data) {
                    if (data['error']) { // ???? ???????? ???????? ???????
                        alert(data['error']); // ???????? ?? ?????
                    } else { // ???? ??? ??????? ??
                        console.log(data);
                        form.closest('.modal').modal('hide');
                        $('.ok').find('.modal-body').html(data['text']);
                        $('.ok').modal('show');
						dataLayer.push({'event': '03'});
                        setTimeout(function () {
                            $('.ok').modal('hide');
                        }, 11000);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                },
                complete: function (data) {
                    form.find('button[type="submit"]').prop('disabled', false);
                }
            });
        }
        return false; // ??????? ?????????? ?????????? ?????
    });

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        e.target // newly activated tab
        e.relatedTarget // previous active tab
    });

    $('.modal').on('show.bs.modal', function() {
        var modal = this;
        var hash = modal.id;
        console.log(hash);
        window.location.hash = hash;
        window.onhashchange = function() {
            if (!location.hash){
                $(modal).modal('hide');
            }
        }
    });

    $('.modal').on('hide.bs.modal', function() {
        history.pushState('', document.title, window.location.pathname);
    });

   

 

	$(function(){
	  var modal = this;
      var hash = window.location.hash.slice(1); // get the hash, and strip out the "#"	  
	 /*  console.log(hash);  */
      window.onhashchange = function() {
            if (!location.hash){
                $(modal).modal('hide');
            }
        }
	       if( hash && hash === 'click-led_lamps') {  // if there was a hash
           $('a.click-led_lamps').trigger('click');
		   $('html, body').stop().animate({
            scrollTop: $('.products__tabs').offset().top - 100
        }, 3000);
			}
			
		   else if( hash && hash === 'click-led_lamps_t8'){   // if there was a hash
	       $('a.click-led_lamps_t8').trigger('click');
		   $('html, body').stop().animate({
            scrollTop: $('.products__tabs').offset().top - 100
        }, 3000);
			}
		   else if( hash && hash === 'click-led_line' ){   // if there was a hash
	          $('a.click-led_line').trigger('click');
              $('html, body').stop().animate({
            scrollTop: $('.products__tabs').offset().top - 100
        }, 3000);			  
			}  
		   else if( hash && hash === 'click-led_progector' ){   // if there was a hash
	       $('a.click-led_progector').trigger('click');  
		   $('html, body').stop().animate({
            scrollTop: $('.products__tabs').offset().top - 100
        }, 3000);
			}
		   else if( hash && hash === 'click-led_modules' ){   // if there was a hash
	       $('a.click-led_modules').trigger('click');
		   $('html, body').stop().animate({
            scrollTop: $('.products__tabs').offset().top - 100
        }, 3000);
			}
		   else if( hash && hash === 'click-led_panels' ){   // if there was a hash
	       $('a.click-led_panels').trigger('click');
		   $('html, body').stop().animate({
            scrollTop: $('.products__tabs').offset().top - 100
        }, 3000);
			}
		   else if( hash && hash === 'click-led_home_lamp' ){  // if there was a hash
	      $('a.click-led_home_lamp').trigger('click');
		  $('html, body').stop().animate({
            scrollTop: $('.products__tabs').offset().top - 100
        }, 3000);
			}
			 
			else if( hash && hash === 'how-buy' ){  // if there was a hash
	      $('a.hash-how-buy').trigger('click');
		  $('html, body').stop().animate({
            scrollTop: $('#how-buy').offset().top - 100
        }, 3000);
		 
			}
			else if( hash && hash === 'ship-pay' ){  // if there was a hash
	      $('a.hash-ship-pay').trigger('click');
		  $('html, body').stop().animate({
            scrollTop: $('#ship-pay').offset().top - 100
        }, 3000);
			}
			else if( hash && hash === 'opt' ){  // if there was a hash
	      $('a.hash-opt').trigger('click');
		  $('html, body').stop().animate({
            scrollTop: $('#opt').offset().top - 100
        }, 3000);
			}
			else if( hash && hash === 'sertificate' ){  // if there was a hash
	      $('a.hash-sertificate').trigger('click');
		  $('html, body').stop().animate({
            scrollTop: $('#sertificate').offset().top - 100
        }, 3000);
			}
			else if( hash && hash === 'our-as' ){  // if there was a hash
	      $('a.hash-our-as').trigger('click');
		  $('html, body').stop().animate({
            scrollTop: $('#our-as').offset().top - 100
        }, 3000);
			}			
			
			else {  
			var hash = window.location.hash;
	      $(hash).modal('show');
			}
			
	/* 	else if(!location.hash){
		  var hash = window.location.hash;
         $(hash).modal('show');
		} */
		/* 	
		$('.modal-open').attr('Style', 'overflow: overlay');
        $('.modal-backdrop').addClass('fade').remove('.modal-backdrop'); */
	   /*  
		 var hash = window.location.hash;
         $(hash).modal('show'); */
	
	});
	
	//open-close phone
    $('.show-second-phone').mouseenter(function () {
        $('.second-phone').addClass('second-phone-open', {duration:500});
    });
    $('.show-second-phone').mouseleave(function () {
        $('.second-phone').removeClass('second-phone-open', {duration:100});
    });
	
});



