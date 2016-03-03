#= require jquery

$(document).on 'ready', ->
  winHeight = $(window).height()
  mainPadding = (winHeight / 2)
  $('.main').css('height', winHeight).css('padding-top', mainPadding)
  arrowHeight = $('.main').outerHeight()
  $('.arrow').css('top', arrowHeight - 100)
  $('body').find('.arrow').click (e) ->
    e.preventDefault()
    $('html, body').animate { scrollTop: $('.site-div').first().offset().top }, 1000
    return

  # set open div height to window height unless smaller than 800px
  if winHeight < 800
    divHeight = 800
  else
    divHeight = winHeight
  $('.ss').css('height', divHeight / 2).css('margin-top', divHeight * .05)

  # click handling for divs opening
  upArrow = $('.up_arrow').find('.rotated_arrow')
  counterVar = 0

  $('.site-div').click (e) ->
    # catch clicks that are on the links and return early
    nodeName = e.target.nodeName
    return if nodeName is 'A' or nodeName is 'IMG'

    if $(this).hasClass('closed')
      $('html, body').animate { scrollTop: $(this).offset().top }, 1000
      $(this).find('.ss').fadeIn(1000)
      $(this).find('.site-blurb').fadeIn(1000)
      upArrow.fadeIn(1800).removeClass('hidden')
      $(this).removeClass('closed').addClass('opened').css('height', divHeight)
      counterVar++
    else
      $(this).find('.ss').fadeOut(400)
      $(this).find('.site-blurb').fadeOut(400)
      $(this).removeClass('opened').addClass('closed').css('height', 200)
      counterVar--
      if counterVar == 0
        upArrow.fadeOut(400).addClass('hidden')

  upArrow.click (e) ->
    e.preventDefault()
    $('.site-div').each ->
      if $(this).hasClass('opened')
        $(this).find('.ss').fadeOut(400)
        $(this).find('.site-blurb').fadeOut(400)
        $(this).removeClass('opened').addClass('closed').css('height', 200)
    $('html, body').animate { scrollTop: $('body').offset().top }, 1000
    $(this).fadeOut(800).removeClass('visible').addClass('hidden')
    counterVar = 0
