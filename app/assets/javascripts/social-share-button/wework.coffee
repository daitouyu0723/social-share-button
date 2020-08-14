#= require jquery.qrcode.min

window.SocialShareWeWorkButton =
  init: (opts={}) ->
    $wDialog = "<div id='ss-wework-dialog' class='ss-wework-dialog'>
                  <div class='wework-popup-header'>
                    <span>#{opts.header}</span>
                    <a href='#' onclick='return false;' class='wework-popup-close'>×</a>
                  </div>
                  <div id='ss-wework-dialog-qr' class='wework-dialog-qr'></div>
                  <div class='wework-popup-footer'>
                    #{opts.footer}
                  </div>
               </div>"

    $("body").append($wDialog)

   bindEvents: ()->
     $wContainer = $("#ss-wework-dialog")
     $wContainer.find(".wework-popup-close").on "click", (e) ->
       $wContainer.hide()

   qrcode: (opts={}) ->
     unless $("#ss-wework-dialog").length
       @init(opts)
       @bindEvents()

     $wBody = $('#ss-wework-dialog-qr')
     $wBody.empty()
     $wBody.qrcode
       width: 200
       height: 200
       text: opts.url

     $wContainer = $("#ss-wework-dialog")
     top = ($(window).height() - $wContainer.height()) / 2
     top = 100 if top < 100
     left = ($(window).width() - $wContainer.width()) / 2

     $wContainer.css
       top: top
       left: left

     $wContainer.show()
