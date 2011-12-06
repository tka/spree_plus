$(function(){
    var add_image_handlers = function() {
        $("#main-image").data('selectedThumb', $('#main-image img').attr('src'));
        $('ul.thumbnails li').eq(0).addClass('selected');

        $('ul.thumbnails').delegate('a', 'click', function(event) {
            $("#main-image").data('selectedThumb', $(event.currentTarget).attr('href'));
            $("#main-image").data('selectedThumbId', $(event.currentTarget).parent().attr('id'));
            $(this).mouseout(function() {
                $('ul.thumbnails li').removeClass('selected');
                $(event.currentTarget).parent('li').addClass('selected');
            }); 
            return false;
        }); 
        $('ul.thumbnails').delegate('li', 'mouseenter', function(event) {
            $('#main-image img').attr('src', $(event.currentTarget).find('a').attr('href'));
        }); 
        $('ul.thumbnails').delegate('li', 'mouseleave', function(event) {
            $('#main-image img').attr('src', $("#main-image").data('selectedThumb'));
        }); 
    };

    var update_ui=function(){
        filter = ""
        img_filter = ""
        $('#product_option_types input[type=radio]:checked').each(function(){
            filter+= "[data-" +this.name.replace(/_/g,'-')+"="+this.value+"]"
            if(!$(this).data("has-same-product-image")){
                img_filter+= "[data-" +this.name.replace(/_/g,'-')+"="+this.value+"]"
            }
        })
        $('#product-thumbnails li').hide();
        $('#product-thumbnails li.tmb-all').show();
        $('#product-thumbnails li'+img_filter).show();
         
        var thumb = $($('ul.thumbnails li:visible').eq(0));
        var newImg = thumb.find('a').attr('href');
        $('#main-image img').attr('src', newImg);
        $("#main-image").data('selectedThumb', newImg);
        $("#main-image").data('selectedThumbId', thumb.attr('id'));
        $("div[data-hook=inside_product_cart_form] input[type=radio]"+filter).trigger('click')
    }

    $('#product_option_types input[type=radio]').on('click', update_ui);
    add_image_handlers();
    update_ui();
    
})
