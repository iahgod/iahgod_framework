<?php
use core\Router;

$router = new Router();

$router->get('/', 'HomeController@index');
//LOGIN
$router->get('/admin/login', 'LoginController@signin');
$router->post('/admin/login', 'LoginController@signinAction');
//CADASTRO
$router->get('/admin/cadastro', 'LoginController@signup');
$router->post('/admin/cadastro', 'LoginController@signupAction');
//ESQUECEU SENHA
$router->get('/admin/esqueceu-senha', 'LoginController@esqueceu');
$router->post('/admin/esqueceu-senha', 'LoginController@esqueceuAction');
//LOGOUT
$router->get('/admin/sair', 'LoginController@logout');
//MINHA CONTA
$router->get('/admin/minha-conta', 'UserController@conta');
$router->post('/admin/minha-conta', 'UserController@contaUpdate');
//ADMIN
$router->get('/admin', 'AdminController@index');
//NOTIFICACAO
$router->get('/admin/notificacao/{id}', 'AdminController@viuNotificacao');
$router->get('/admin/Teste/lista',       'TesteController@index');
$router->get('/admin/Teste/form',        'TesteController@form');
$router->get('/admin/Teste/form/{id}',   'TesteController@form');
$router->post('/admin/Teste/form',       'TesteController@action');
$router->get('/admin/Teste/delete/{id}', 'TesteController@delete');