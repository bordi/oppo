<!-- webme - additional fields - mod - start //-->
	<?php if ($w_additional_fields) { ?>
	
	<style type="text/css">
	.w_additional_fields_list {}
	.w_additional_fields_list > td {}
	</style>
	<div id="w_additional_fields_list">

			<?php foreach ($w_additional_fields as $waf) { ?>
				<div class='w_additional_fields_list'><?php echo $waf["field_name"]; ?> - <?php echo $waf["field_value"]; ?></div>
			<?php } ?>
	</div>
	<?php } ?>
<!-- webme - additional fields - mod - end //-->