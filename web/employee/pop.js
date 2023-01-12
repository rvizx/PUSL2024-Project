function showPrompt(msg)
{
 
  var p = new Promise(function(resolve, reject) {;
  
    var dialog = $('<div/>', {class: 'popup'})
      .append(
        $('<p/>').html(msg)
      )
      .append(
        $('<div/>', {class: 'text-right'})
          .append($('<button/>', {class: 'btn btn-cancel'}).html('Cancel').on('click', function() {
            $('.overlay').remove();
          
            resolve(false);
          }))
          .append($('<button/>', {class: 'btn btn-primary'}).html('Ok').on('click', function() {
            $('.overlay').remove();
            
            resolve(true);
          }))
      );
      
    var overlay = $('<div/>', {class: 'overlay'})
      .append(dialog);
    
    $('body').append(overlay);
    $(dialog).animate({top: '15%'}, 1000);
  });
  

  return p;
}
 
