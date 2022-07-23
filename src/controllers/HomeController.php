<?php
namespace src\controllers;

use \core\Controller;
use \src\handlers\UserHandler;
use \src\handlers\PostHandler;

class HomeController extends Controller {

    private $loggedUser;

    
    public function index() {
        
        $this->render('home', [
            'loggedUser' => []
            
        ]);
    }

}