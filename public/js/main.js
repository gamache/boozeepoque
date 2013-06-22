(function(){
  //// Navigation: show_section, handle_popstate, and hooks

  function show_section (section) {
    // hide other sections
    $('#main > div').addClass('offscreen');

    // show this section
    if (section == 'photos') {
      // special case, apologies.
      $('#galleria').hide();
      $('#photos').removeClass('offscreen').show();
      $('#galleria').show({});
    } else {
      $('#' + section).removeClass('offscreen');
      $('#' + section).show();
    }

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
  }


  // site navigation is implemented with popState and pushState
  function handle_popstate (e) {
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
  }

  $(function(){
    window.onpopstate = handle_popstate;

    // install handlers for section links and top logo
    $('nav a, a.to_section').click(function(){
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




  //// Contact form validation

  function validate_event_inquiry () {
    if ($('#event_inquiry_name').val() == '' ||
        $('#event_inquiry_email').val() == '')
      return false;

    return true
  }
  function submit_event_inquiry () {
    if (! validate_event_inquiry()) {
      alert("You must provide at least your name and email address.");
    }
    else {
      $.ajax('/event_inquiry', {
        type: 'post',
        headers: {
          'X-Transaction': 'POST Example',
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        data: $('#new_event_inquiry').serialize(),
        success: function () {
          alert("Thank you! Your event inquiry has been submitted.");
        }
      });
    }

    return false;
  }
  $(function(){ $('#submit-event-inquiry').click(submit_event_inquiry); });


  function validate_contact () {
    if ($('#contact_name').val() == '' || $('#contact_email').val() == '')
      return false;
    return true
  }
  function submit_contact () {
    if (! validate_contact()) {
      alert("You must provide at least your name and email address.");
    }
    else {
      $.ajax('/contact', {
        type: 'post',
        headers: {
          'X-Transaction': 'POST Example',
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        data: $('#new_contact').serialize(),
        success: function () {
          alert("Thank you! Your contact has been submitted.");
        }
      });
    }

    return false;
  }
  $(function(){ $('#submit-contact').click(submit_contact); });





  //// Galleria stuff

  function run_when_photos_visible (fn) {
    $('nav a.selected[href="#photos"]').each(fn);
  }

  $(function(){
    Galleria.loadTheme('/js/galleria.classic.js');
    Galleria.run('#galleria');

    var galleria = $('#galleria').data('galleria');
    $(document).keyup(function(e){
      if (e.keyCode == 37) {      // left arrow
        run_when_photos_visible(function(){ galleria.prev() });
      }
      else if (e.keyCode == 39) { // right arrow
        run_when_photos_visible(function(){ galleria.next() });
      }
    });

    // Sometimes the galleria doesn't size correctly when #photos is the
    // first page loaded.  This takes care of that.
    setTimeout(function () {
      var galleria = $('#galleria').data('galleria');
      galleria.updateCarousel();
    }, 250);
  });

})();
