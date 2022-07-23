<?=$render('head', ['loggedUser'=>$loggedUser, 'title' => $title]);?>

<?php if($admin):?>

    <?=$render('header_mobile', ['loggedUser'=>$loggedUser, 'notificacoes' => $notificacoes]);?>

    <?=$render('menu_sidebar', ['loggedUser'=>$loggedUser, 'menu' => $menu]);?>

    <!-- PAGE CONTAINER-->
    <div class="page-container">

    <?=$render('header_principal', ['loggedUser'=>$loggedUser, 'notificacoes' => $notificacoes]);?>

 <?php endif;?>