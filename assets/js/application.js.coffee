#= require jquery

$(document).on 'ready', ->
  winHeight = $(window).height()
  mainPadding = (winHeight / 2)
  $('.main').css('height', winHeight).css('padding-top', mainPadding)
  arrowHeight = $('.main').outerHeight()
  $('.arrow').css('top', arrowHeight - 100)

  $('.arrow').find('a').click (e) ->
    e.preventDefault()
    $('html, body').animate { scrollTop: $('#film-fatales').offset().top }, 1000
    return
    
    
