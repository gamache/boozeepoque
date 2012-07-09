$(function(){
  var show_section = function show_section (section) {
    // show only this section
    $('#main > div').hide();
    $(section).show();

    // mark this section as selected in the nav
    $('nav a').removeClass('selected');
    $('nav a[href="' + section + '"]').addClass('selected');
  };

  // install handlers for section links and top logo
  $('nav a').click(function(){
    var section = this.getAttribute('href');
    show_section(section);
    return false;
  });
  $('#main > h1').click(function(){
    show_section('#home');
  });

  // if #section present, show it
  var url = document.location.toString(),
      x = url.indexOf('#'),
      sec = '#';
  if (x > -1) sec = url.slice(x);
  if (sec == '#') sec = '#home';
  show_section(sec);

  // remove initial .hidden from non-#home sections
  $('#main > div').removeClass('hidden');


});
