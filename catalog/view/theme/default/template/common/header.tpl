<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link rel="shortcut icon" href="/favicon.png" type="image/png">
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-5TFNRNB');</script>
<!-- End Google Tag Manager -->

</head>
<body class="<?php echo $class; ?>">

<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5TFNRNB"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<nav id="top">
  <div class="container">
      <div id="logo" class="pull-left">
          <?php if ($logo) { ?>
          <a href="/"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="/"><?php echo $name; ?></a></h1>
          <?php } ?>
      </div>
      <button id="top-pages-btn" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
      </button>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul id="top-pages" class="list-unstyled">
              <?php if($categories){ ?>
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">ТОВАРЫ </a><i class="fa fa-caret-down" aria-hidden="true"></i>
                  <div class="dropdown-menu">
                      <div class="dropdown-inner">
                          <ul>
                              <?php foreach($categories as $category){ ?>
                              <?php if($category['children']){ ?>
                              <li onclick="tglEl('.lvl2',0)" class="dropdown hvr-sweep-to-right"><a href="" class="lvl2-show" data-toggle="dropdown"><?php echo $category['name']; ?><i class="fa fa-caret-down" aria-hidden="true"></i></a>
                                  <div class="dropdown-menu lvl2">
                                      <div class="dropdown-inner">
                                          <?php foreach(array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children){ ?>
                                          <ul class="list-unstyled">
                                              <?php foreach($children as $child){ ?>
                                              <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                              <?php } ?>
                                          </ul>
                                          <?php } ?>
                                      </div>
                                      <hr/>
                                      <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a>
                                  </div>
                              </li>
                              <?php } else { ?>
                              <li class="hvr-sweep-to-right"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                              <?php } ?>
                              <?php } ?>
                          </ul>
                      </div>
                  </div>
              </li>
              <?php } ?>
              <?php foreach($pages as $page){ ?>
              <li><a href="<?=$page['href'];?>"><?=$page['title'];?></a></li>
              <?php } ?>
          </ul>
      </div>

      <!--<?php echo $currency; ?><?php echo $language; ?>-->
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
          <li class="dropdown" onclick="tglEl('#phones-drpdwn',0,'display')">
              <i class="fa fa-phone" aria-hidden="true"></i>
              <span class="caret"></span>
              <ul id="phones-drpdwn" class="dropdown-menu dropdown-menu-right">
                  <?php $i=0; foreach($telephone as $item){ $i++;?>
                      <?php if($i == count($telephone)){ ?>
                        <li class="hidden-xs"><a href="tel:<?=$item;?>"><?=$item;?></a></li>
                      <?php }else{ ?>
                        <li><a href="tel:<?=$item;?>"><?=$item;?></a></li>
                      <?php } ?>
                  <?php } ?>
              </ul>
          </li>
        <li class="dropdown" onclick="tglEl('#user-drpdwn',0,'display')">
            <i class="fa fa-user"></i><span class="hidden-xs hidden-sm hidden-md"><?php //echo $text_account; ?></span><span class="caret"></span>
          <ul id="user-drpdwn" class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
          <li>
              <a href="/search">Поиск<i class="fa fa-search" aria-hidden="true" style="margin-left:5px"></i></a>
          </li>
        <!--<li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php //echo $text_wishlist; ?></span></a></li>-->
          <li>
              <?=$cart;?>
          </li>
          <!--<li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>-->
          <!--<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>-->
      </ul>
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <!--id="logo" default position-->
      </div>
      <div class="col-sm-5"><?php //echo $search; ?>
      </div>
      <div class="col-sm-3"><?php //echo $cart; ?></div>
    </div>
  </div>
</header>
<?=$content_top;?>
<?php if ($categories) { ?>
<div class="container">
  <!--<nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
                <li class="dropdown hvr-sweep-to-right"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                  <div class="dropdown-menu">
                    <div class="dropdown-inner">
                      <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                      <ul class="list-unstyled">
                        <?php foreach ($children as $child) { ?>
                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                        <?php } ?>
                      </ul>
                      <?php } ?>
                    </div>
                    <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
                </li>
            <?php } else { ?>
                <li class="hvr-sweep-to-right"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>-->
</div>
<?php } ?>
