<?php
namespace src\controllers;

use \core\Controller;
use \src\handlers\UserHandler;
use \core\Mensagem;

class HomeController extends Controller {

    private $loggedUser;

    
    public function index() {
        
        $this->render('home', [
            'loggedUser' => []
            
        ]);
    }

}