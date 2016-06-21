<?php 

class Usuario{
	private $id_usuario;
	private $nom_usuario;
	private $Cargo_usuario;
	private $clave_usuario;
        private $tipo_usuario;
        
        
      
        
	function __construct($snom,$susr,$clave_usuario,$tipoUsuario){
		$this->nom_usuario=$snom;
		$this->Cargo_usuario=$susr;
		$this->clave_usuario=md5($clave_usuario);
                $this->tipo_usuario=$stipo;

	}
	public function getNombre(){
		return $this->nom_usuario;
	}

	public function getIdacceso(){
		return $this->id_usuario;
	}
        
        public function getNidacceso() {
            return $this->id_usuario;
        }

        public function getSnombre() {
            return $this->nom_usuario;
        }

        public function getSusuario() {
            return $this->Cargo_usuario;
        }

        public function getSclave() {
            return $this->clave_usuario;
        }

        public function getStipoUsuario() {
            return $this->tipo_usuario;
        }


        
	function VerificaUsuario(){
		$db=dbconnect();
		$sqlsel="select nombre from acceso
		where nom_usuario=:usr";

		$querysel=$db->prepare($sqlsel);


		$querysel->bindParam(':usr',$this->Cargo_usuario);
		
		$datos=$querysel->execute();
		
		if ($querysel->rowcount()==1)return true; else return false;

	}

	function VerificaAcceso(){
		$db=dbconnect();
		$sqlsel="select idacceso,nombre from acceso
		where nomusuario=:usr and pwdusuario=:pwd";

		$querysel=$db->prepare($sqlsel);

		$querysel->bindParam(':usr',$this->Cargo_usuario);
		$querysel->bindParam(':pwd',$this->clave_usuario);

		$datos=$querysel->execute();

		if ($querysel->rowcount()==1){
                    
                    $registro = $querysel->fetch();
                    
                    $this->nom_usuario=$registro['nombre'];
                    $this->id_usuario=$registro['idacceso'];
			return true;
		}
		else{
			return false;
		}


	}
	function ActualizaClave($snewpwd){
		$db=dbconnect();

		$sqlupd="update acceso set pwdusuario=:pwd
					where idacceso=:id";

		$querysel=$db->prepare($sqlupd);

		$querysel->bindParam(':pwd',($snewpwd));
		$querysel->bindParam(':id',$this->id_usuario);
		

		$valaux=$querysel->execute();
	
		return $valaux;
	}

}
?>