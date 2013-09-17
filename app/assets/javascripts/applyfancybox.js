$(document).ready(function() {

  $(function() {
    $('.fancybox').fancybox({
        type: 'iframe',
        beforeLoad: function() {
            this.href = this.element.data('href');
        }
    });
  });
});