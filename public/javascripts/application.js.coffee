#= require jquery

$(document).on 'ready', ->
  winHeight = $(window).height()
  mainPadding = (winHeight / 2)
  $('.main').css('height', winHeight).css('padding-top', mainPadding)
  $('.arrow').css('top', winHeight - 100)

