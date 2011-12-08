$(function(){
    var l =function(o){ if(window.console){window.console.log(o)}};

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

        var filter = ""
        var img_filter = ""
        var option_type_inputs = $('#product_option_types input[type=radio]:checked, #product_option_types select')
        var target_input_index = option_type_inputs.index(this);
        var variants_radio_str = "div[data-hook=inside_product_cart_form] input[type=radio]";

        for(var i=0; i < option_type_inputs.length; i++){
            var input = option_type_inputs[i];


            if(i > target_input_index ){
                if( $(input).is('select')){
                    $("option",input).each(function(){
                        this.disabled=true;
                        if($( variants_radio_str + filter +"[data-" + input.name.replace(/_/g,'-')+"="+ this.value+"]").length >0){
                            this.disabled=false;
                        }
                    })
                    if(target_input_index != -1){
                        input.selectedIndex=0;
                    }
                }
                
                if( $(input).is('input[type=radio]')){
                    $(input).closest('ul').find('input[type=radio]').each(function(){
                        this.disabled=true;
                        if(target_input_index != -1){
                            this.checked=false;
                        }
                        if($( variants_radio_str + filter +"[data-" + input.name.replace(/_/g,'-')+"="+ this.value+"]").length >0){
                            this.disabled=false;
                        }
                    });
                }
            }
            var current_filter = "[data-" + input.name.replace(/_/g,'-')+"="+$(input).val()+"]";
            filter += current_filter 
            if(!$(input).data("has-same-product-image")){
                img_filter+= current_filter
            }

        }
        $('#product-thumbnails li').hide();
        $('#product-thumbnails li.tmb-all').show();
        $('#product-thumbnails li'+img_filter).show();

        var thumb = $($('ul.thumbnails li:visible').eq(0));
        var newImg = thumb.find('a').attr('href');
        $('#main-image img').attr('src', newImg);
        $("#main-image").data('selectedThumb', newImg);
        $("#main-image").data('selectedThumbId', thumb.attr('id'));
        $("ul#product-variant-fields input[type=radio]").attr('checked', false);
        if( $("ul#product-variant-fields input[type=radio]"+filter).length ==1 ){
            $("ul#product-variant-fields input[type=radio]"+filter).trigger('click');
        }
        set_quantity_ui();
    }
    
    var set_quantity_ui = function(){
        var on_hand = $("ul#product-variant-fields input[type=radio]:checked").data('on-hand');
        if(typeof(on_hand) != "undefined" && parseInt(on_hand, 10) >0 ){
            on_hand = parseInt(on_hand, 10);
            var options="";
            for(var i=0; i<10 && i<on_hand; i++){
                options+='<option value="'+(i+1)+'">'+(i+1)+'</option>';
            }
            $('#quantity').html(options)
        }else{
            $('#quantity').html('<option value="0">請選擇商品</option>');
        }
    }

    $('#product_option_types input[type=radio]').on('click', update_ui);
    $('#product_option_types select').on('change', update_ui);
    $("ul#product-variant-fields input[type=radio]").on('click', set_quantity_ui);
    add_image_handlers();
    update_ui();

})
