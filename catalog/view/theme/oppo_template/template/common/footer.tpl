  	</div>
    <div class="push"></div>
</div>
    <footer id="footer">
      <div class="container">
        <section class="column right-margin">
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
          <div class="copyright">
            &copy; OPPO <?php echo Date('Y'); ?>. Все права защищены.
          </div>
        </section>
        <section class="column contacts">
            <div class="contact-ico"></div>
            <div class="telephones">
              (044) 555 22 22<br>
              (067) 445 45 45
            </div>
        </section>
        </div>
      </footer>
</body>
</html>


<!-- 
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donatation.
Please donate via PayPal to donate@opencart.com
//-->