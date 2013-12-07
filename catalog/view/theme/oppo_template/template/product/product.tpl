<?= $header; ?>
<? //$column_left; ?>
<?= $column_right; ?>
	<section id="content">
	<?= $content_top; ?>
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


	<div class="product-info">
	<?php if ($thumb || $images) { ?>
		<div class="left">
			<?php if ($thumb) { ?>
				<div class="image">
					<a href="<?= $popup; ?>" title="<?= $heading_title; ?>" class="colorbox"  rel="colorbox">
						<img src="<?= $thumb; ?>" alt="<?= $heading_title; ?>" id="image"/>
					</a>
					<a href="javascript:void(0)" id="prev" class="nav-btn prev"></a>
					<a href="javascript:void(0)" id="next" class="nav-btn next"></a>
				</div>
			<?php } ?>
			<?php if ($images) { ?>
				<div class="image-additional">
					<a href="javascript:void(0)" class="aditional-image" data-rel="<?= $thumb; ?>">
							<img src="<?= $thumb0; ?>" alt="<?= $heading_title; ?>"/>
					</a>
					<?php
							$last = count($images); 
							foreach ($images as $imagekey => $image) { 
						?>
						<a href="javascript:void(0)" class="aditional-image <?php if($imagekey%4){ echo "last";} ?>" data-rel="<?= $image['thumb2']; ?>">
							<img src="<?= $image['thumb']; ?>" alt="<?= $heading_title; ?>"/>
						</a>
					<?php } ?>
				</div>
			<?php } ?>
		</div>
	<?php } ?>
	<div class="right">
	<div class="description">
		<h1><?= $heading_title; ?></h1>

		<div class="price">
			<span ><?= $price; ?></span>
		</div>
		<div class="manufactor">
			<?php if ($manufacturer) { ?>
		        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
		    <?php } ?>
		</div>
		<div class="short__story">
			<? echo $short_description; ?>
		</div>
			<div style="line-height:15px; font-family:Cambria;font-size:14px;">Габариты:</div>
			<div id="webme_additional" class="w_additional_fields_list">
				<?php if ($height>0) { ?><span><?php echo $text_height; ?></span> <?php echo round($height, 2); ?>
					<?php echo " см<br/>"; ?>
					<?php } ?>
				<?php if ($height) { ?>
				<?php } ?>
				<?php if ($length>0) { ?><span><?php echo $text_length; ?></span> <?php echo round($length, 2); ?>
					<?php echo " см<br/>"; ?>
					<?php  } ?>
				<?php if ($length) { ?>
				<?php } ?>

				<?php if ($width>0) { ?><span><?php echo $text_width; ?></span> <?php echo round($width, 2); ?>
					<?php echo " см<br/>"; ?>
					<?php } ?>
				<?php if ($width) { ?>
				<?php } ?>	
			</div>



	<?php if ($options) { ?>
		<div class="options">
			
			<br/>
			<?php foreach ($options as $option) { ?>
				<?php if ($option['type'] == 'select') { ?>
					<div id="option-<?= $option['product_option_id']; ?>" class="option">
							<select name="option[<?= $option['product_option_id']; ?>]" class="product_feature <?php if($option['required']) { echo 'required';} ?>">
								<option value=""><?= $option['name']; ?></option>
								<? ?>
								<?php foreach ($option['option_value'] as $option_value) { ?>
									<option
										value="<?= $option_value['product_option_value_id']; ?>"><?= $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
											(<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
										<?php } ?>
									</option>
								<?php } ?>
							</select>
					</div>
					<br/>
				<?php } ?>
				<?php if ($option['type'] == 'radio') { ?>
					<div id="option-<?= $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<label for="option[<?= $option['product_option_id']; ?>]" class="required">
							<?php } else { ?>
							<label for="option[<?= $option['product_option_id']; ?>]">
								<?php } ?>
								<b><?= $option['name']; ?>:</b></label>
							<br/>
							<?php foreach ($option['option_value'] as $option_value) { ?>
								<input type="radio" name="option[<?= $option['product_option_id']; ?>]"
								       value="<?= $option_value['product_option_value_id']; ?>"
								       id="option-value-<?= $option_value['product_option_value_id']; ?>"/>
								<label
									for="option-value-<?= $option_value['product_option_value_id']; ?>"><?= $option_value['name']; ?>
									<?php if ($option_value['price']) { ?>
										(<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
									<?php } ?>
								</label>
								<br/>
							<?php } ?>
					</div>
					<br/>
				<?php } ?>
				<?php if ($option['type'] == 'checkbox') { ?>
					<!-- <div id="option-<?= $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<label for="option[<?= $option['product_option_id']; ?>][]" class="required">
							<?php } else { ?>
							<label for="option[<?= $option['product_option_id']; ?>][]">
								<?php } ?>
								<b><?= $option['name']; ?>:</b></label>
							<br/>
							<?php foreach ($option['option_value'] as $option_value) { ?>
								<input type="checkbox" name="option[<?= $option['product_option_id']; ?>][]"
								       value="<?= $option_value['product_option_value_id']; ?>"
								       id="option-value-<?= $option_value['product_option_value_id']; ?>"/>
								<label
									for="option-value-<?= $option_value['product_option_value_id']; ?>"> <?= $option_value['name']; ?>
									<?php if ($option_value['price']) { ?>
										(<?= $option_value['price_prefix']; ?><?= $option_value['price']; ?>)
									<?php } ?>
								</label>
								<br/>
							<?php } ?>
					</div>
					<br/> -->
				<?php } ?>
				<?php if ($option['type'] == 'text') { ?>
					<div id="option-<?= $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<label for="option[<?= $option['product_option_id']; ?>]" class="required">
							<?php } else { ?>
							<label for="option[<?= $option['product_option_id']; ?>]">
								<?php } ?>
								<b><?= $option['name']; ?>:</b></label>
							<br/>
							<input type="text" name="option[<?= $option['product_option_id']; ?>]"
							       value="<?= $option['option_value']; ?>"/>
					</div>
					<br/>
				<?php } ?>
				<?php if ($option['type'] == 'textarea') { ?>
					<div id="option-<?= $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<label for="option[<?= $option['product_option_id']; ?>]" class="required">
							<?php } else { ?>
							<label for="option[<?= $option['product_option_id']; ?>]">
								<?php } ?>
								<b><?= $option['name']; ?>:</b></label>
							<br/>
							<textarea name="option[<?= $option['product_option_id']; ?>]" cols="40" rows="5">
								<?= $option['option_value']; ?>
							</textarea>
					</div>
					<br/>
				<?php } ?>
				<?php if ($option['type'] == 'file') { ?>
					<div id="option-<?= $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<label for="option[<?= $option['product_option_id']; ?>]" class="required">
							<?php } else { ?>
							<label for="option[<?= $option['product_option_id']; ?>]">
								<?php } ?>
								<b><?= $option['name']; ?>:</b></label>
							<br/>
							<a id="button-option-<?= $option['product_option_id']; ?>"
							   class="button"><?= $button_upload; ?></a>
							<input type="hidden" name="option[<?= $option['product_option_id']; ?>]" value=""/>
					</div>
					<br/>
				<?php } ?>
				<?php if ($option['type'] == 'date') { ?>
					<div id="option-<?= $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<label for="option[<?= $option['product_option_id']; ?>]" class="required">
							<?php } else { ?>
							<label for="option[<?= $option['product_option_id']; ?>]">
								<?php } ?>
								<b><?= $option['name']; ?>:</b></label>
							<br/>
							<input type="text" name="option[<?= $option['product_option_id']; ?>]"
							       value="<?= $option['option_value']; ?>" class="date"/>
					</div>
					<br/>
				<?php } ?>
				<?php if ($option['type'] == 'datetime') { ?>
					<div id="option-<?= $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<label for="option[<?= $option['product_option_id']; ?>]" class="required">
							<?php } else { ?>
							<label for="option[<?= $option['product_option_id']; ?>]">
								<?php } ?>
								<b><?= $option['name']; ?>:</b></label>
							<br/>
							<input type="text" name="option[<?= $option['product_option_id']; ?>]"
							       value="<?= $option['option_value']; ?>" class="datetime"/>
					</div>
					<br/>
				<?php } ?>
				<?php if ($option['type'] == 'time') { ?>
					<div id="option-<?= $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<label for="option[<?= $option['product_option_id']; ?>]" class="required">
							<?php } else { ?>
							<label for="option[<?= $option['product_option_id']; ?>]">
								<?php } ?>
								<b><?= $option['name']; ?>:</b></label>
							<br/>
							<input type="text" name="option[<?= $option['product_option_id']; ?>]"
							       value="<?= $option['option_value']; ?>" class="time"/>
					</div>
					<br/>
				<?php } ?>
				<?php if ($option['type'] == 'image') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <div class="color__title-toggle"><?php echo $option['name']; ?>:</div>
			          <div class="option-image">
			            <?php foreach ($option['option_value'] as $option_value) { ?>		            
			             <input style="display:none;" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
			              <div class="color__box">
			              	<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img class="product__color" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label>
			              </div>
			            <?php } ?>
			            <br style="clear:both;">
			          </div>
			        </div>
			        <br />
		        <?php } ?>
			<?php } ?>
		</div>
	<?php } ?>
	<section class="cart">
		<div>
			<input type="text" name="quantity" size="2" value="<?= $minimum; ?>" class="qty-input"/>
			<input type="hidden" name="product_id" size="2" value="<?= $product_id; ?>"/>
			&nbsp;
			<a id="button-cart" class="button btn-cart"><?= $button_cart; ?></a>
		</div>
		<div>
			<a onclick="addToWishList('<?= $product_id; ?>');" class="button btn-cart white"><?= $button_wishlist; ?></a>
			<!-- <br/>			<a onclick="addToCompare('<?= $product_id; ?>');" class="button btn-cart white"><?= $button_compare; ?></a> -->
		</div>
		<?php if ($minimum > 1) { ?>
			<div class="minimum"><?= $text_minimum; ?></div>
		<?php } ?>
	</section>
	<?php if ($review_status) { ?>
		<section class="review">
			<!-- <div>
				<img src="catalog/view/theme/default/image/stars-<?= $rating; ?>.png"
				     alt="<?= $reviews; ?>"/>
				&nbsp;&nbsp;
				<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?= $reviews; ?></a>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?= $text_write; ?></a>
			</div> -->
			<div class="share">
				<div class="addthis_default_style">
					<!-- <a class="addthis_button_compact"><?= $text_share; ?></a> -->
					<a class="addthis_button_facebook share-btn"></a> <a class="addthis_button_twitter share-btn"></a>
					<a class="addthis_button_google share-btn"></a><a class="addthis_button_email share-btn"></a>
				</div>
				<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
			</div>
		</section>
	<?php } ?>
	</div>
	</div>
	<br style="clear:both;">
	<div class="separator"></div>
	<div class="left">
	<section id="tabs" class="htabs">
		<a href="#tab-description"><?= $tab_description; ?></a>
		<?php if ($attribute_groups) { ?>
			<a href="#tab-attribute"><?= $tab_attribute; ?></a>
		<?php } ?>
		<!-- <?php if ($review_status) { ?>
			<a href="#tab-review"><?= $tab_review; ?></a>
		<?php } ?> -->
	</section>
	<section id="tab-description" class="tab-content"><?= $description; ?></section>
	<?php if ($attribute_groups) { ?>
		<section id="tab-attribute" class="tab-content">
			<table class="attribute">
				<?php foreach ($attribute_groups as $attribute_group) { ?>
					<thead>
					<tr>
						<td colspan="2"><?= $attribute_group['name']; ?></td>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
						<tr>
							<td><?= $attribute['name']; ?></td>
							<td><?= $attribute['text']; ?></td>
						</tr>
					<?php } ?>
					</tbody>
				<?php } ?>
			</table>
		</section>
	<?php } ?>
	<!-- <?php if ($review_status) { ?>
		<section id="tab-review" class="tab-content">
			<div id="review"></div>
			<h2 id="review-title"><?= $text_write; ?></h2>
			<label for="name"><b><?= $entry_name; ?></b></label>
			<br/>
			<input type="text" name="name" value=""/>
			<br/>
			<br/>
			<label for="text"><b><?= $entry_review; ?></b></label>
			<textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
			<span style="font-size: 11px;"><?= $text_note; ?></span><br/>
			<br/>
			<label for="rating"><b><?= $entry_rating; ?></b></label>
			<span><?= $entry_bad; ?></span>&nbsp;
			<input type="radio" name="rating" value="1"/>
			&nbsp;
			<input type="radio" name="rating" value="2"/>
			&nbsp;
			<input type="radio" name="rating" value="3"/>
			&nbsp;
			<input type="radio" name="rating" value="4"/>
			&nbsp;
			<input type="radio" name="rating" value="5"/>
			&nbsp; <span><?= $entry_good; ?></span><br/>
			<br/>
			<label for="captcha"><b><?= $entry_captcha; ?></b></label>
			<br/>
			<input type="text" name="captcha" value=""/>
			<br/>
			<img src="index.php?route=product/product/captcha" alt="" id="captcha"/><br/>
			<br/>

			<div class="buttons">
				<div class="right">
					<a id="button-review" class="button"><?= $button_continue; ?></a>
				</div>
			</div>
		</section>
	<?php } ?> -->
	</div>
	<?php if ($tags) { ?>
		<section class="tags"><?= $text_tags; ?></section>
		<?php if ($products) { ?>
		<section id="tab-related" class="tab-content">
			<div class="box-product">
				<?php foreach ($products as $product) { ?>
					<div class="product__featured">
						<?php if ($product['thumb']) { ?>
							<div class="image">
								<a href="<?= $product['href']; ?>" style="display:block;">
									<img src="<?= $product['thumb']; ?>" alt="<?= $product['name']; ?>"/>
								</a>
							</div>
						<?php } ?>
					</div>
				<?php } ?>
				<br style="clear:both;">
			</div>
		</section>
	<?php } ?>
	<?php } ?>
	<?= $content_bottom; ?>
	</section>
	<script type="text/javascript"><!--
		$('.colorbox').colorbox({
			overlayClose: true,
			opacity: 0.5
		});
		//--></script>
	<script type="text/javascript"><!--
		$('#button-cart').bind('click', function () {
			$.ajax({
				url: 'index.php?route=checkout/cart/add',
				type: 'post',
				data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
				dataType: 'json',
				success: function (json) {
					$('.success, .warning, .attention, information, .error').remove();

					if (json['error']) {
						if (json['error']['warning']) {
							$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

							$('.warning').fadeIn('slow');
						}

						for (i in json['error']) {
							$('#option-' + i).after('<span class="error">' + json['error'][i] + '</span>');
						}
					}

					if (json['success']) {
						$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

						$('.success').fadeIn('slow');

						$('#cart').load('index.php?route=module/cart #cart > *');
						var image = $('#image').offset();
						var cart = $('#cart').offset();

						$('#image').before('<img src="' + $('#image').attr('src') + '" id="temp" style="position: absolute; top: ' + image.top + 'px; left: ' + image.left + 'px;" />');

						params = {
							top: cart.top + 'px',
							left: cart.left + 'px',
							opacity: 0.0,
							width: $('#cart').width(),
							height: $('#cart').height()
						};

						$('#temp').animate(params, 'slow', false, function () {
							$('#temp').remove();
						});
					}
				}
			});
		});
		//--></script>
<?php if ($options) { ?>
	<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
	<?php foreach ($options as $option) { ?>
		<?php if ($option['type'] == 'file') { ?>
			<script type="text/javascript"><!--
				new AjaxUpload('#button-option-<?= $option['product_option_id']; ?>', {
					action: 'index.php?route=product/product/upload',
					name: 'file',
					autoSubmit: true,
					responseType: 'json',
					onSubmit: function (file, extension) {
						$('#button-option-<?= $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" id="loading" style="padding-left: 5px;" />');
					},
					onComplete: function (file, json) {
						$('.error').remove();

						if (json.success) {
							alert(json.success);

							$('input[name=\'option[<?= $option['product_option_id']; ?>]\']').attr('value', json.file);
						}

						if (json.error) {
							$('#option-<?= $option['product_option_id']; ?>').after('<span class="error">' + json.error + '</span>');
						}

						$('#loading').remove();
					}
				});
				//--></script>
		<?php } ?>
	<?php } ?>
<?php } ?>
	<script type="text/javascript"><!--
		$('#review .pagination a').live('click', function () {
			$('#review').slideUp('slow');

			$('#review').load(this.href);

			$('#review').slideDown('slow');

			return false;
		});

		$('#review').load('index.php?route=product/product/review&product_id=<?= $product_id; ?>');

		$('#button-review').bind('click', function () {
			$.ajax({
				type: 'POST',
				url: 'index.php?route=product/product/write&product_id=<?= $product_id; ?>',
				dataType: 'json',
				data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
				beforeSend: function () {
					$('.success, .warning').remove();
					$('#button-review').attr('disabled', true);
					$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?= $text_wait; ?></div>');
				},
				complete: function () {
					$('#button-review').attr('disabled', false);
					$('.attention').remove();
				},
				success: function (data) {
					if (data.error) {
						$('#review-title').after('<div class="warning">' + data.error + '</div>');
					}

					if (data.success) {
						$('#review-title').after('<div class="success">' + data.success + '</div>');

						$('input[name=\'name\']').val('');
						$('textarea[name=\'text\']').val('');
						$('input[name=\'rating\']:checked').attr('checked', '');
						$('input[name=\'captcha\']').val('');
					}
				}
			});
		});
		//--></script>
	<script type="text/javascript"><!--
		$('#tabs a').tabs();
		//--></script>
	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
	<script type="text/javascript"><!--
		if ($.browser.msie && $.browser.version == 6) {
			$('.date, .datetime, .time').bgIframe();
		}
		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		$('.datetime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'h:m'
		});
		$('.time').timepicker({timeFormat: 'h:m'});
		//--></script>
<?= $footer; ?>