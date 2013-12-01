<?php echo $header; ?>
<h1 class="category__title"><?php echo $heading_title; ?></h1>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<section id="content">
	<?php echo $content_top; ?>
  	<!-- <section class="breadcrumb">
    	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
    		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    	<?php } ?>
  	</section> -->
  	<?php if ($thumb || $description) { ?>
  		<!-- <section class="category-info">
    		<?php if ($thumb) { ?>
    			<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    		<?php } ?>
    		<?php if ($description) { ?>
    			<?php echo $description; ?>
    		<?php } ?>
  		</section> -->
  	<?php } ?>
  	<?php if ($categories) { ?>
  		<!-- <h2><?php echo $text_refine; ?></h2>
  		 <section class="category-list">
    		<?php if (count($categories) <= 5) { ?>
    			<ul>
      				<?php foreach ($categories as $category) { ?>
      					<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      				<?php } ?>
    			</ul>
    		<?php } else { ?>
    			<?php for ($i = 0; $i < count($categories);) { ?>
    				<ul>
      					<?php $j = $i + ceil(count($categories) / 4); ?>
      					<?php for (; $i < $j; $i++) { ?>
      						<?php if (isset($categories[$i])) { ?>
      							<li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
      						<?php } ?>
      					<?php } ?>
    				</ul>
    			<?php } ?>
    		<?php } ?>
  		</section>  -->
  	<?php } ?>
  	<?php if ($products) { ?>
  		<!-- <section class="product-filter">
    		<div class="display">
				<b><?php echo $text_display; ?></b> 
				<?php echo $text_list; ?> 
				<b>/</b>
				 <a onclick="display('grid');"><?php echo $text_grid; ?></a>
			</div>
    		<div class="limit"><b><?php echo $text_limit; ?></b>
      			<select onchange="location = this.value;">
        			<?php foreach ($limits as $limits) { ?>
        				<?php if ($limits['value'] == $limit) { ?>
        					<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        				<?php } else { ?>
        					<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        				<?php } ?>
        			<?php } ?>
      			</select>
    		</div>
    		<div class="sort">
				<b><?php echo $text_sort; ?></b>
      			<select onchange="location = this.value;">
        			<?php foreach ($sorts as $sorts) { ?>
        				<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        					<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        				<?php } else { ?>
        					<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        				<?php } ?>
        			<?php } ?>
      			</select>
    		</div>
  		</section> -->
  		<!-- <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare_total"><?php echo $text_compare; ?></a></div> -->
  		<section class="product-grid">
    		<?php foreach ($products as $product) { ?>
    			<article class="product__box">
      				<?php if ($product['thumb']) { ?>
      					<div class="image">
							<a href="<?php echo $product['href']; ?>" class="main__image">
								<img class="product__image" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" data-rel=<?= json_encode($product['thumbs']); ?> data-count="0" />
							</a>
						<?php if (count($product['thumbs'])>1) { ?>
							<a class="nav-btn prev" id="prev" href="javascript:void(0)"></a>
							<a class="nav-btn next" id="next" href="javascript:void(0)"></a>
						<?php } ?>
						</div>
      				<?php } ?>
      				<div class="name">
						<?php echo $product['name']; ?>
					</div>
      				<div class="description"><?php echo $product['description']; ?></div>
      				<?php if ($product['price']) { ?>
      					<div class="price">
        						<span class="price-tax"><?php echo $product['tax']; ?></span>
      					</div>
      				<?php } ?>
      				<div class="cart">
						<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button btn-cart small-btn"><?php echo $button_cart; ?></a>
						<a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="button btn-cart white small-btn"><?php echo $button_compare; ?></a>
					</div>
      				<!-- <div class="wishlist">
						<a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
					</div> -->
    			</article>
    		<?php } ?>
  		</section>
  		<div class="sep_product"></div>
  		<section class="pagination"><?php echo $pagination; ?></section>
	<?php } ?>
	<?php if (!$categories && !$products) { ?>
  		<section class="content"><?php echo $text_empty; ?></section>
  			<div class="buttons">
    			<div class="right">
					<a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a>
				</div>
  			</div>
		<?php } ?>
	<?php echo $content_bottom; ?>
</section>
<script type="text/javascript"><!--
// FUCKING PAGINATION IMAGE


$('.nav-btn.next').click(function(){
	var currImg  = $(this).siblings('.main__image').find('.product__image');;
	var currPos = currImg.attr('data-count');
	var imageJSON = currImg.attr('data-rel');
	var resImgArr = JSON.parse(imageJSON);	
	var count = resImgArr.length;
	currPos++;
	(currPos == count) ? currPos = 0 : currPos;  
    
    $(currImg).attr('src',resImgArr[currPos]);
    
    currImg.attr('data-count',currPos);
});

$('.nav-btn.prev').click(function(){
	var currImg  = $(this).siblings('.main__image').find('.product__image');;
	var currPos = currImg.attr('data-count');
	var imageJSON = currImg.attr('data-rel');
	var resImgArr = JSON.parse(imageJSON);	
	var count = resImgArr.length;
	currPos--;
	(currPos == -1) ? currPos = count-1 : currPos;
    
    $(currImg).attr('src',resImgArr[currPos]);
  	
    currImg.attr('data-count',currPos);
});

// END OF FUCKING MAGIC
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';

						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.cookie('display', 'grid'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
		
		
	}
}

view = $.cookie('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script> 
<?php echo $footer; ?>