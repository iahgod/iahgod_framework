<?php
namespace src\controllers;

use \core\Controller;
use \src\handlers\UserHandler;
use \src\handlers\Fila_EmailHandler;
use \src\Constant;

class LoginController extends Controller {

    public function signin() {
        $this->render('signin', [
            'flash' => $this->getFlash()
        ]);
    }

    public function signinAction() {
        $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);
        $password = filter_input(INPUT_POST, 'password');

        if($email && $password) {
            $token = UserHandler::verifyLogin($email, $password);
            if($token) {
                $_SESSION['token'] = $token;
                $this->redirect('/admin');
            } else {
                $this->mensagem('E-mail e/ou senha não conferem!', 'erro');
                $this->redirect('/admin/login');
            }
        } else {
            $this->mensagem('Informe todos os campos!', 'erro');
            $this->redirect('/admin/login');
        }
    }

    public function signup() {

        if(!\src\Constant::ADMIN_CADASTRO){$this->render('erro', ['mensagem' => 'ERRO 401 - Autorização requerida.']);exit;}

        $this->render('signup', [
            'flash' => $this->getFlash()
        ]);
    }

    public function signupAction() {
        $name = filter_input(INPUT_POST, 'nome');
        $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);
        $password = filter_input(INPUT_POST, 'senha');
        $password2 = filter_input(INPUT_POST, 'senha2');

        if($name && $email && $password) {
            if($password != $password2){
                $this->mensagem('As senhas não conferem!', 'erro');
                $this->redirect('/admin/cadastro');
            }
            if(UserHandler::emailExists($email) === false) {
                $token = UserHandler::addUser($name, $email, $password);
                $_SESSION['token'] = $token;
                $this->redirect('/admin');
            } else {
                $this->mensagem('E-mail já cadastrado!', 'erro');
                $this->redirect('/admin/cadastro');
            }

        } else {
            $this->mensagem('Informe todos os campos!', 'erro');
            $this->redirect('/admin/cadastro');
        }
    }

    public function logout() {
        $_SESSION['token'] = '';
        $this->redirect('/admin/login');
    }

    public function esqueceu() {

        $flash = '';
        if(!empty($_SESSION['flash'])) {
            $flash = $_SESSION['flash'];
            $_SESSION['flash'] = '';
        }
        $this->render('esqueceu_senha', [
            'flash' => $flash
        ]);
    }
    public function esqueceuAction() {
        $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);

        if($email) {
            if(UserHandler::emailExists($email)) {

                $user = UserHandler::gerarNovaSenha($email);
                
                $to_body = $user['user']['nome'].', Segue a sua nova senha do sistema '.\src\Constant::TITULO_SITE.', sua nova senha é: '. $user['senha'];

                Fila_EmailHandler::addFila($email, $user['user']['nome'], $email, $user['user']['nome'], 'Sua nova senha', $to_body);

                $this->mensagem('E-mail enviado com uma nova senha', 'sucesso');
                $this->redirect('/admin/login');

            }else{
                $this->mensagem('Este e-mail não existe em nossa base de dados', 'erro');
                $this->redirect('/admin/esqueceu-senha');
            }

        } else {
            $this->mensagem('Informe o e-mail', 'erro');
            $this->redirect('/admin/esqueceu-senha');
        }
    }

}