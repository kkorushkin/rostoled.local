<div id="top-slideshow" style="position:relative;background-color:#000">
    <div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
        <?php foreach ($banners as $banner) { ?>
        <div class="item" style="position:relative">
            <div class="item-title">
                <?php $descs = explode('|',$banner['title']);?>
                <p class="s-h1"><?=$descs[0];?></p>
                <p class="h4 text-red"><?=$descs[1];?></p>
                <p class="h3"><?=$descs[2];?></p>
                <?php if($banner['link']){ ?>
                <a class="slider-btn" href="<?=$banner['link'];?>">ВЫБРАТЬ</a>
                <?php } ?>
                <?php ?>
            </div>
            <?php if($banner['link']){ ?>
            <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="img" class="img-responsive" /></a>
            <?php }else{ ?>
                <img src="<?php echo $banner['image']; ?>" alt="img" class="img-responsive" />
            <?php } ?>
        </div>
        <?php } ?>
    </div>
    <div id="slideshow-contacts" class="container hidden-xs">
        <ul class="list-unstyled">
            <li><a href="tel:<?=preg_replace('/[^0-9]/','',$item=array_shift($telephone));?>"><?=$item;?></a></li>
            <?php foreach ($telephone as $item){ ?>
                <li class="opacity"><a href="tel:<?=preg_replace('/[^0-9]/','',$item);?>"><?=$item;?></a></li>
            <?php } ?>
        </ul>
    </div>
</div>
<script type="text/javascript">
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
    startPosition: "<?php echo rand(1,6);?>",
	autoPlay: 10000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true,
    loop: true
});
</script>