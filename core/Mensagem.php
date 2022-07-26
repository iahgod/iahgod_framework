<?php
namespace core;

class Mensagem {

    public static function sucesso($mensagem){
        $_SESSION['flash'] = '<div class="alert alert-success" role="alert">'.$mensagem.'</div>';
    }
    public static function erro($mensagem){
        $_SESSION['flash'] = '<div class="alert alert-danger" role="alert">'.$mensagem.'</div>';
    }
    public static function basico($mensagem){
        $_SESSION['flash'] = '<div class="alert alert-primary" role="alert">'.$mensagem.'</div>';
    }
    public static function aviso($mensagem){
        $_SESSION['flash'] = '<div class="alert alert-warning" role="alert">'.$mensagem.'</div>';
    }
    
}