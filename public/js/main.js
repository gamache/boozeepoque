$(function(){
  var show_section = function show_section (section) {
    // show only this section
    $('#main > div').hide();
    $('#' + section).show();

    // mark this section as selected in the nav
    $('nav a').removeClass('selected');
    $('nav a[href="#' + section + '"]').addClass('selected');

    // add section name class to #main-container
    if (! $('#main-container').hasClass(section)) {
      $('#main-container').removeClass()
                          .addClass('transition')
                          .addClass(section);
    }

    // retitle the page
    var title = 'Booze Époque';
    if (section != 'home') {
      title += ' - ' + section.charAt(0).toUpperCase() + section.slice(1);
    }
    document.title = title;
  };


  // site navigation is implemented with popState and pushState
  var handle_popstate = function(e) {
    var section = e.state ? e.state['section'] : null;
    if (section) {
      // This is a popState event from hitting the Back button.  There will
      // have been a valid state object; show the section listed there.
      show_section(section);
    }
    else {
      // This is a popState event from loading the page.  If the URL has
      // an #id at the end of it, show that section; otherwise do nothing.
      var h = document.location.href;
      if (h.indexOf('#') != -1) {
        section = h.slice(h.indexOf('#')+1);
        show_section(section);
        setTimeout(function(){window.scrollTo(0,0)}, 0);
      }
    }
  };
  window.onpopstate = handle_popstate;

  // install handlers for section links and top logo
  $('nav a').click(function(){
    var section = this.getAttribute('href').slice(1);  // discard leading '#'
    history.pushState({section: section}, '', '#'+section);
    show_section(section);
    return false;
  });
  $('#main > h1').click(function(){
    show_section('home');
  });

  // if #section present, show it
  var url = document.location.toString(),
      x = url.indexOf('#'),
      sec = '';
  if (x > -1) sec = url.slice(x+1);
  if (sec == '') sec = 'home';
  show_section(sec);
  setTimeout(function(){window.scrollTo(0,0);}, 0);

  // remove initial .hidden from non-#home sections
  $('#main > div').removeClass('hidden');

});
