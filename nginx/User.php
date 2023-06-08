<?php

class User
{

    protected $db;

    public function __construct()
    {
        $this->db = Database::instance();
    }

    public function loginUser($email, $password)
    {
        $email = Validate::escape($email);
        $password = Validate::escape($password);

        $sql = "SELECT * FROM users WHERE email = :email";
        $stmt = $this->db->pdo->prepare($sql);
        $stmt->bindParam(":email", $email);
        $stmt->execute();

        if ($stmt->rowCount() == 1) {
            $user = $stmt->fetch(PDO::FETCH_OBJ);
            if (password_verify($password, $user->password)) {
                $_SESSION['user_id'] = $user->id;
                header("Location: index.php");
                exit();
            }
        }
    }
}
?>
