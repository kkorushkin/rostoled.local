<div id="module-latest_all_categories" class="container">
    <!--<h3><?php echo $heading_title; ?></h3>-->
    <?php $i=0;foreach($products as $key => $value){;?>
        <div class="cats-title-desc container">
            <div class="col-sm-3"><?=$text_latest_arrival;?>: <?=$key;?></div>
            <?php if($value['description']){ ?>
                <span onclick="tglEl('#cats-title-desc-desc<?=++$i;?>',40,'height');"><?=$button_read_more;?></span>
            <?php } ?>
            <div id="cats-title-desc-desc<?=$i;?>" class="col-sm-9"><?=array_shift($value)?></div>
        </div>
        <div class="row">
            <?php foreach($value as $product){ ?>
                <div class="product-layout col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="product-thumb transition">
                    <div class="caption">
                        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    </div>
                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                    <div class="caption">
                        <p><?php echo $product['description']; ?></p>
                        <?php if ($product['rating']) { ?>
                        <div class="rating">
                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                            <?php if ($product['rating'] < $i) { ?>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                            <?php } else { ?>
                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                            <?php } ?>
                            <?php } ?>
                        </div>
                        <?php } ?>
                        <?php if ($product['price']) { ?>
                        <p class="price">
                            <?php if (!$product['special']) { ?>
                            <?php echo $product['price']; ?>
                            <?php } else { ?>
                            <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                            <?php } ?>
                            <?php if ($product['tax']) { ?>
                            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                            <?php } ?>
                        </p>
                        <?php } ?>
                    </div>
                    <div class="button-group">
                        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="pull-left add-to-cart"><!--<i class="fa fa-shopping-cart"></i>--> <?php echo $button_cart; ?></button>
                        <!--<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>-->
                        <button onclick="window.location.href='<?=$product['href'];?>'" class="pull-right">Подробнее</button>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    <?php } ?>
</div>