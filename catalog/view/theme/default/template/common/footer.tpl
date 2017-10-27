<footer id="footer">
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-6">
          <img src="image/footer-logo.png" alt="prostoled logo"/><br/><br/>
          <ul class="list-unstyled">
              <?php foreach ($telephone as $item){ ?>
                <li class="num-font"><a href="tel:<?=preg_replace('/[^0-9]/','',$item);?>"><?=$item;?></a></li>
              <?php } ?>
          </ul>
      </div>
      <?php } ?>
      <div class="col-sm-2">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <!--<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>-->
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-2">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>

<div class="modal fade" id="topModal" tabindex="-1" role="dialog" aria-labelledby="topModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-header">
                <span class="modal-title">Заказать звонок</span>
            </div>
            <div class="modal-body">
                <form class="formQuestion">
                    <div class="form-group">
                        <input type="text" name="name" class="form-control" placeholder="Представтесь*" required>
                    </div>
                    <div class="form-group">
                        <input type="tel" name="tel" class="form-control" id="buyInputTel"
                               placeholder="Ваш телефон*" required>
                    </div>
                    <button type="submit" class="btn btn-default ripplelink">Заказать</button>
                </form>
            </div>
        </div>
    </div>
</div>
<i id="to-top" class="fa fa-chevron-up" aria-hidden="true"></i>
</body>
<script type="text/javascript">
    $('body').on('touchstart.dropdown', '.dropdown-menu', function (e) {
        e.stopPropagation();
    });
</script>
</html>