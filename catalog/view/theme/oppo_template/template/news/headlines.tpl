<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
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
  <!-- <h1><?php echo $heading_title; ?></h1> -->
  <div class="border">
  <?php if ($article) { ?>
  <div class="product-list">
    <?php foreach ($article as $articles) { ?>
    <div>
	<?php if ($articles['thumb225']) { ?>
      <div class="image marginright30"><a href="<?php echo $articles['href']; ?>"><img src="<?php echo $articles['thumb225']; ?>" title="<?php echo $articles['name']; ?>" alt="<?php echo $articles['name']; ?>" /></a></div>
      <?php } ?>
      <div class="name-news"><a href="<?php echo $articles['href']; ?>"><?php echo $articles['name']; ?></a> <!-- <span class="headlines-text-coments">- <?php echo $articles['date_added']; ?></span> --></div>
      <div class="description-news"><?php echo $articles['description']; ?></div>
	 <!--  <?php if ($articles['acom']) { ?>
	  <span class="headlines-text-coments"><?php echo $text_comments; ?>: <?php echo $articles['total_comments']; ?></span>
	  <?php } ?> -->
	  <div class="button-more"><a class="btn-more__link" href="<?php echo $articles['href']; ?>"><span><?php echo $button_more; ?></span></a></div>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  <?php if (!$article) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  <?php } ?>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>