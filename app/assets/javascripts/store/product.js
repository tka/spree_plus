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
        $('ul.thumbnails li').on('mouseenter', function(event) {
            $('#main-image img').attr('src', $(event.currentTarget).find('a').attr('href'));
        }); 
        /*
        $('ul.thumbnails li').on('mouseleave', function(event) {
            $('#main-image img').attr('src', $("#main-image").data('selectedThumb'));
        });
        */
        
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
        $('#product-thumbnails-origin li').removeClass('selected');
        $('#product-thumbnails-origin li.tmb-all').addClass('selected');
        $('#product-thumbnails-origin li'+img_filter).addClass('selected');
        $('#product-thumbnails').data('offset', 0);
        $('#product-thumbnails').trigger('thumb-updated');


        var thumb = $($('#product-thumbnails li:visible').eq(0));
        var newImg = thumb.find('a').attr('href');
        $('#main-image img').attr('src', newImg);
        $('#main-image a').attr('href', newImg.replace('/product/','/large/'));
        $("#main-image").data('selectedThumb', newImg);
        $("#main-image").data('selectedThumbId', thumb.attr('id'));

        $("ul#product-variant-fields input[type=radio]").attr('checked', false);
        if( $("ul#product-variant-fields input[type=radio]"+filter).length ==1 ){
            $("ul#product-variant-fields input[type=radio]"+filter).trigger('click');
        }

        $('ul.product_option_values li').removeClass('selected');
        $('ul.product_option_values li').each(function(){
            if($('input[type=radio]:checked', this).length > 0){
                $(this).addClass('selected');
            }
        })
        
        set_quantity_ui();
        return false;
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

        var sku = $("ul#product-variant-fields input[type=radio]:checked").data('sku');
        if(typeof(sku) != "undefined" ){
            $('#sku').html(sku);
        }else{
            $('#sku').html( $('#sku').data('product-sku') );
        }
    }

    function prev_page(){
        var $thumbs=$('#product-thumbnails');
        var offset = $thumbs.data('offset');
        var total_length = $('#product-thumbnails-origin li.selected').length
        if(offset > 0){
            $thumbs.data('offset', offset-4)
            $('#product-thumbnails').trigger('thumb-updated');
        }
    }
   
   function next_page(){
        var $thumbs=$('#product-thumbnails');
        var offset = $thumbs.data('offset');
        var total_length = $('#product-thumbnails-origin li.selected').length
        if(offset < total_length-4){
            $thumbs.data('offset', offset+4)
            $('#product-thumbnails').trigger('thumb-updated');
        }
    }

    function update_thumb(){
        var $thumbs=$('#product-thumbnails');
        var offset = $thumbs.data('offset');
        var total_length = $('#product-thumbnails-origin li.selected').length;
        $thumbs.html('')
        $('#product-thumbnails-origin li.selected:gt('+ offset +'):lt('+ (offset+4)+')').each(function(index){
            if(index < 4){
                $('#product-thumbnails').append($(this).clone());
            }
        });
        $('#thumbnails .control-btn').addClass('disabled');
        if(offset > 0 ){
            $('#thumbnails .control-btn.prev').removeClass('disabled');
        }
        if(offset <  total_length-4){
            $('#thumbnails .control-btn.next').removeClass('disabled');
        }
    }

    $('#product_option_types input[type=radio]').on('click', update_ui);
    $('#product_option_types a.radio-btn').on('click', function(){ $(this).next('input[type=radio]').prop('checked',true).trigger('click'); });
    $('#product_option_types select').on('change', update_ui);
    $("ul#product-variant-fields input[type=radio]").on('click', set_quantity_ui);
    $('#product-thumbnails').bind('thumb-updated', update_thumb);
    $('#thumbnails .control-btn.prev').bind('click', prev_page);
    $('#thumbnails .control-btn.next').bind('click', next_page);

    add_image_handlers();
    update_ui();
    $('#product_option_types input[type=radio]').hide();

})
