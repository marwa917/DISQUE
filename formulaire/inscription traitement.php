<?php 
    require_once  'config.php'; // On inclu la connexion à la bdd

    // Si les variables existent et qu'elles ne sont pas vides
    if (isset( $_POST['pseudo']) && isset($_POST['email'])&& isset($_POST['password']) && isset($_POST ['password_retype']))
    {
        // Patch XSS
        $pseudo = htmlspecialchars($_POST ['pseudo']);
        $email = htmlspecialchars($_POST ['email']);
        $password = htmlspecialchars($_POST ['password']);
        $password_retype = htmlspecialchars($_POST ['password_retype']);

        // On procédera si l'utilisateur existe
        $check = $bdd ->prepare ('SELECT pseudo, email, password FROM utilisateurs WHERE email = ?' );
        $check ->execute (array ( $email ));
        $data = $vérification -> fetch();
        $row = $check -> rowCount();

        $email = strtolow($email); // on transforme toutes les lettres majuscules en minuscules pour éviter que Foo@gmail.com et foo@gmail.com soient deux comptes différents ..
        
        // Si la demande renvoie un 0 alors l'utilisateur n'existe pas
        if ($row == 0 ){
            if (strlen($pseudo) <= 100 ){ // On vérifie que la longueur du pseudo <= 100
                if (strlen($email) <= 100 ){ // On vérifie que la longueur du mail <= 100
                    if (filter_var($email ,FILTER_VALIDATE_EMAIL)){ // Si l'email est de la bonne forme
                        if ($password == $password_retype){ // si les deux mdp saisis sont bon

                            // On hash le mot de passe avec Bcrypt, via un coût de 12
                            $coût = ['coût' => 12 ];
                            $password = hash('sha256',$password );
                            
                            // En stock l'adresse IP
                            $ip = $_SERVER [ 'REMOTE_ADDR' ] ;
                             /*
                              ATTENTION
                              Vérifiez bien que le jeton champs est présent dans votre tableau utilisateurs, il a été rajouté APRÈS la vidéo
                              le .sql est dispo pensez à l'importer !
                              ATTENTION
                            */
                            // On insère dans la base de données
                            $insert = $bdd ->prepare ('INSERT INTO utilisateurs(pseudo, email, password, ip, token) VALUES(:pseudo, :email, :password, :ip, :token)' ) ;
                            $insert -> exécuter ( tableau (
                                'pseudo'=> $pseudo,
                                'email'=> $email,
                                'password'=> $password,
                                'ip' => $ip ,
                                
                            ));
                            // On redirige avec le message de succès
                            header('Location:inscription.php?reg_err=success');
                        } else header( 'location : inscription.php?reg_err=password'); 
                    } else header( 'location : inscription.php?reg_err=email'); 
                } else header( 'location : inscription.php?reg_err=email_length'); 
            } else header( 'location : inscription.php?reg_err=pseudo_length'); 
        } else header( 'location : inscription.php?reg_err=already'); mourir();
    }