<?php 
	if (isset($_SERVER['HTTP_USER_AGENT']) && !strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6')) echo '<?xml version="1.0" encoding="UTF-8"?>'. "\n";
?>

<?php include('_config.tpl'); ?>

<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title><?php echo $title; ?></title>
	
	<base href="<?php echo $base; ?>" >
	
	<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>
	<meta name="author" content="<?php echo $name; ?>">
	
	<?php if ($icon) { ?>
		<link href="<?php echo $icon; ?>" rel="icon" />
		<link rel="shortcut icon" href="<?php echo $icon; ?>">
		<link rel="apple-touch-icon" href="<?php echo $icon; ?>">
	<?php } ?>
	
	<?php foreach ($links as $link) { ?>
		<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
	
	<link rel="stylesheet" type="text/css" href="<?php echo TEMPLATE_FOLDER; ?>stylesheet/stylesheet.css" />
	<?php foreach ($styles as $style) { ?>
		<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"><\/script>')</script>
	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
	<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
	<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
	<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
	<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
	<script type="text/javascript" src="catalog/view/javascript/quick_search.js"></script>
	<?php foreach ($scripts as $script) { ?>
		<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>
	
	<!--[if IE 7]>
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
	<![endif]-->
	<!--[if lt IE 7]>
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
		<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
		<script type="text/javascript">
			DD_belatedPNG.fix('#logo img');
		</script>
	<![endif]-->
	<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<?php echo $google_analytics; ?>
</head>

<body>
<div class="main-wrapper">
    <div class="container">
		<header id="header">
			<?php if ($logo) { ?>
  				<div id="logo">
					<a href="<?php echo $home; ?>" id="logo-image"></a>
				</div>
			<?php } ?>
  		<?php //echo $language; ?>
			<?php //echo $currency; ?>
		<div class="header__right"> 			
  			<section id="welcome">
  				<!-- SECTION TELEPHOINES -->
  				<div class="telephones">
	  				<i class="phonbe_ico"></i>
	  				<span class="tel main">(044) 123 45 65</span>
	  				<span class="tel">(044) 123 45 65</span>
	  				<span class="tel">(044) 123 45 65</span>
  				</div>
  				<!-- SECTION WELCOME -->
  				<div class="login_links">
	    			<?php if (!$logged) { ?>
	    				<?php echo $text_welcome; ?>
	    			<?php } else { ?>
	    				<?php echo $text_logged; ?>
	    			<?php } ?>
    			</div>
  			</section>
  			<!-- <nav class="links">
				<a href="<?php echo $home; ?>"><?php echo $text_home; ?></a>
				<a href="<?php echo $wishlist; ?>" id="wishlist_total"><?php echo $text_wishlist; ?></a>
				<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
				<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
			</nav> -->
			<?php 
			if($we_menu_cache = $this->config->get('we_menu_cache')){ ?>
			<ul class="<?php echo $this->config->get('we_menu_class') ?>">
				<?php if(!empty($we_menu_cache)){ 
					foreach($we_menu_cache as $item){
						$tpl = (html_entity_decode($_SERVER['REQUEST_URI']) === $item['href']) ? 'tpl_row_act' : 'tpl_row';				
						echo str_replace('&', '&amp;', html_entity_decode($item[$tpl])); } 
					} ?>	
			</ul>
			<?php } ?>
			
		</div>
		</header>
		</div>
		<?php if ($categories) { ?>
		<nav id="menu">
			<div class="menu__wrapper">
  				<ul>
    				<?php $class='';
    				$count = count($categories);
    				$cartArray = array($count => array(
    				 	"name" =>  	"Корзина",
    				 	"children" => array(),
					  	"column" => 	"1",
					  	"href" =>  	"http://oppo.lc/index.php?route=checkout/cart",
					  	"active" =>  (isSet($_GET['route']) && $_GET['route'] == 'checkout/cart') ? true : false,
    				 ));
    				 $categor = $categories+$cartArray;
    				// $end = key(end($categor));
    				 foreach ($categor as $key => $category) {
    						$class = ($category['active'] == true) ? 'active ' : '';
    						if ($key == $count ) {
    							$class.='cart-link';
    						}
    					 ?>
    					<li  class="<?= $class; ?>">
    						<?php // 
    						if ($key == $count ) {
        					 	echo "<i class='cart_ico'></i>";
							} ?>
							<a href="<?php echo $category['href']; ?>"><?= $category['name']; ?></a>
      						<?php if ($category['children']) { ?>
      							<div>
        							<?php for ($i = 0; $i < count($category['children']);) { ?>
        								<ul>
        									<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
        									<?php for (; $i < $j; $i++) { ?>
        										<?php if (isset($category['children'][$i])) { ?>
        											<li>

														<a href="<?php echo $category['children'][$i]['href']; ?>">
															<?php echo $category['children'][$i]['name']; ?>
														</a>
													</li>
        										<?php } ?>
        									<?php } ?>
        								</ul>
        							<?php } ?>
      							</div>
      						<?php } ?>
    					</li>
    				<?php  } ?>

  				</ul>
  			<!-- CART VIEW  -->
  			<?php echo $cart; ?>
  			<!-- SEACR VIEW -->
			<section id="search">
    			<?php if ($filter_name) { ?>
    				<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" class="search_input"/>
    			<?php } else { ?>
    				<input type="text" name="filter_name" placeholder="<?php echo $text_search; ?>"  class="search_input"/>
    			<?php } ?>
  			</section>
  			</div>
			</nav>
		<?php } ?>	
<div class="container">
	<section id="notification"></section>