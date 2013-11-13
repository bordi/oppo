<?php echo $header; ?>
<?php if ($attention) { ?>
<div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <section class="breadcrumb">
    <?php
    end($breadcrumbs);
    $last = key($breadcrumbs);
    foreach ($breadcrumbs as $key => $breadcrumb) { ?>
      <?php if ($key != $last) { ?>
        <? if(!prev($breadcrumbs)){ ?> <i class="breadcrumb__separator"></i> <? } ?>
        <a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?></a>
      <?php
      } else {
        ?>
        <i class="breadcrumb__separator"></i>
        <span><?= $breadcrumb['text']; ?></span>
      <?php } ?>
    <?php } ?>
  </section>
  <h2><?php echo $heading_title; ?>
  </h2>
  <div class="border">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="cart-info">
      <table>
        <colgroup>
          <col width="225px" />
          <col width="225px" />
          <col width="225px" />
          <col width="120px" />
          <col width="" />
        </colgroup>
        <tbody>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="image" rowspan="2" colspan="1"><?php if ($product['thumb']) { ?>
                <a href="<?php  echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?>
            </td>
            <td class="table__noborder" colspan="4">
                <div class="product__name"><?php echo $product['name']; ?></div>
            </td>
          </tr>
          <tr>
            <td class="name">
                <!--<?php if (!$product['stock']) { ?>
                <span class="stock">***</span>
                <?php } ?>-->
                <span class="product__short-desc"><?php  echo $product['short_description']; ?></span>
            </td>
            <td class="model">
                <div class="title">Характеристики:</div>
                <div><?php echo $product['text_height']."&nbsp;".$product['height'].' см'; ?></div>
                <div><?php echo $product['text_length']."&nbsp;".$product['length'].' см'; ?></div>
                <div><?php echo $product['text_width']."&nbsp;".$product['width'].' см'; ?></div>
                <div>
                <?php foreach ($product['option'] as $option) { ?>
                  <div><?php echo $option['name']; ?>: <?php echo $option['value']; ?></div>
                  <?php } ?>
                </div>
            </td>
            <td class="quantity">
              <div class="title"><?php echo $column_quantity; ?></div>
              <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" class="qty-input"/>
              &nbsp;
              <input type="image" src="catalog/view/theme/default/image/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />
              </td>
            <td class="total">
              <div class="product__total-price"><?php echo substr($product['total'],0,-3); ?></div>
              <a href="<?php echo $product['remove']; ?>" class="product__remove-btn"><?php echo $button_remove; ?></a>
            </td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </form>
  <div class="cart-total">
    <table id="total">
      <colgroup>
          <col width="455px" />
          <col width="225px" />
          <col width="250px" />
        </colgroup>
      <?php $totals = array_pop($totals);  ?>
      <tr>
        <td>&nbsp;</td>
        <td class="left"><span class="total-price__span"><?php echo $totals['title']; ?>:&nbsp;<?php echo $totals['text']; ?><span></td>
        <td class="right"><a href="<?php echo $checkout; ?>" class="button btn-cart cart-btn"><?php echo $button_checkout; ?></a></td>
      </tr>
    </table>
  </div>
  </div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('input[name=\'next\']').bind('change', function() {
  $('.cart-module > div').hide();
  
  $('#' + this.value).show();
});
//--></script>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--
$('#button-quote').live('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/quote',
    type: 'post',
    data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
    dataType: 'json',   
    beforeSend: function() {
      $('#button-quote').attr('disabled', true);
      $('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },
    complete: function() {
      $('#button-quote').attr('disabled', false);
      $('.wait').remove();
    },    
    success: function(json) {
      $('.success, .warning, .attention, .error').remove();     
            
      if (json['error']) {
        if (json['error']['warning']) {
          $('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
          
          $('.warning').fadeIn('slow');
          
          $('html, body').animate({ scrollTop: 0 }, 'slow'); 
        } 
              
        if (json['error']['country']) {
          $('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
        } 
        
        if (json['error']['zone']) {
          $('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
        }
        
        if (json['error']['postcode']) {
          $('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
        }         
      }
      
      if (json['shipping_method']) {
        html  = '<h2><?php echo $text_shipping_method; ?></h2>';
        html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
        html += '  <table class="radio">';
        
        for (i in json['shipping_method']) {
          html += '<tr>';
          html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
          html += '</tr>';
        
          if (!json['shipping_method'][i]['error']) {
            for (j in json['shipping_method'][i]['quote']) {
              html += '<tr class="highlight">';
              
              if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
                html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
              } else {
                html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
              }
                
              html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
              html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
              html += '</tr>';
            }   
          } else {
            html += '<tr>';
            html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
            html += '</tr>';            
          }
        }
        
        html += '  </table>';
        html += '  <br />';
        html += '  <input type="hidden" name="next" value="shipping" />';
        
        <?php if ($shipping_method) { ?>
        html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" />';  
        <?php } else { ?>
        html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="button" disabled="disabled" />';  
        <?php } ?>
              
        html += '</form>';
        
        $.colorbox({
          overlayClose: true,
          opacity: 0.5,
          width: '600px',
          height: '400px',
          href: false,
          html: html
        });
        
        $('input[name=\'shipping_method\']').bind('change', function() {
          $('#button-shipping').attr('disabled', false);
        });
      }
    }
  });
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
    },
    complete: function() {
      $('.wait').remove();
    },      
    success: function(json) {
      if (json['postcode_required'] == '1') {
        $('#postcode-required').show();
      } else {
        $('#postcode-required').hide();
      }
      
      html = '<option value=""><?php echo $text_select; ?></option>';
      
      if (json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
              html += '<option value="' + json['zone'][i]['zone_id'] + '"';
            
          if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                html += ' selected="selected"';
            }
  
            html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }
      
      $('select[name=\'zone_id\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php } ?>
<?php echo $footer; ?>