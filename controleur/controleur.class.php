<?php
	require_once ("modele/modele.class.php");

	class Controleur {
		private $unModele ; 

		public function  __construct (){
			$this->unModele = new Modele (); 
		}
		/*********************** GESTION DES services **********/
		public function insertService($tab) {
			$this->unModele->insertService($tab) ;
		}
		
		public function selectAllService() {
			return $this->unModele->selectAllService();
		}
		
		public function deleteService($idservice) {
			$this->unModele->deleteService($idservice);
		}
		
		public function selectWhereService($idservice) {
		 return $this->unModele->selectWhereService($idservice);
		}
		
		public function updateService($tab) {
			$this->unModele->updateService($tab); 
		}
		
		public function selectLikeService($filtre) {
			 return $this->unModele->selectLikeService($filtre);
		}
		

		/*********************** GESTION DES Client **********/
		public function verifConnexionClient ($email, $mdp){
			//controle : voir cours sécurite 
			return $this->unModele->verifConnexionClient($email, $mdp);
		}

		public function insertClient($tab){
			//on controle les données avant insertion 
			//appel de la méthode du modele 
			$this->unModele->insertClient($tab);
		}

		public function selectAllClients (){
			//appel de la méthode du modele 
			return $this->unModele->selectAllClients();
		}

		public function deleteClient($idClient){
			$this->unModele->deleteClient ($idClient);
		}

		public function selectWhereClient($idClient){
			return $this->unModele->selectWhereClient ($idClient);
		}
		public function updateClient($tab) //$tab = $_POST
		{
			 $this->unModele->updateClient ($tab);
		}
		public function selectLikeClient ($filtre){
			return $this->unModele->selectLikeClient($filtre);
		}

		/******************** GESTION DES prestataire **********/
		public function insertPrestataire($tab){
			// Contrôlez les données avant l'insertion si nécessaire
			
			// Appel de la méthode du modèle pour insérer le prestataire
			$this->unModele->insertPrestataire($tab);
		}

		public function verifConnexionPrestataire($email, $mdp) {
			// Controle: voir cours sécurité
			return $this->unModele->verifConnexionPrestataire($email, $mdp);
		}
		
		public function selectAllPrestataires(){
			// Appel de la méthode du modèle pour sélectionner tous les prestataires
			return $this->unModele->selectAllPrestataires();
		}
		
		public function deletePrestataire($idprestataire){
			// Appel de la méthode du modèle pour supprimer le prestataire
			$this->unModele->deletePrestataire($idprestataire);
		}
		
		public function selectWherePrestataire($idprestataire){
			// Appel de la méthode du modèle pour sélectionner un prestataire en fonction de son identifiant
			return $this->unModele->selectWherePrestataire($idprestataire);
		}
		
		public function updatePrestataire($tab){
			// Appel de la méthode du modèle pour mettre à jour les informations du prestataire
			$this->unModele->updatePrestataire($tab);
		}
		
		public function selectLikePrestataires($filtre1, $filtre2){
			// Appel de la méthode du modèle pour sélectionner les prestataires correspondant à un filtre donné
			return $this->unModele->selectLikePrestataires($filtre1, $filtre2);
		}




		/***************************Prestataires */

     
		



		public function insertPrestation($tab) {
			$this->unModele->insertPrestation($tab);
		}
		
		public function selectAllPrestation() {
			return $this->unModele->selectAllPrestation();
		}
		
		public function deletePrestation($idprestation) {
			$this->unModele->deletePrestation($idprestation);
		}
		
		public function selectWherePrestation($idprestation) {
			return $this->unModele->selectWherePrestation($idprestation);
		}
		
		public function updatePrestation($tab) {
			$this->unModele->updatePrestation($tab);
		}

		
		public function selectLikePrestation($filtre) {
			return $this->unModele->selectLikePrestation($filtre);
		}
		
		
		/************* table User *********/
		public function verifConnexion ($email, $mdp){
			//controle : voir cours sécurite 
			return $this->unModele->verifConnexion($email, $mdp);
		
	}




/***************reservation**************** */

    public function selectAllReservations() {
        return $this->unModele->selectAllReservations();
    }

	public function selectReservationsByClientId($iduser) {
        return $this->unModele->selectReservationsByClientId($iduser);
    }

    public function insertReservation($tab) {
        return $this->unModele->insertReservation($tab);
    }

    
		public function deleteReservation($idreservation) {
			$this->unModele->deleteReservation($idreservation);
		}


		public function validerReservation($etat, $idreservation) {
			$this->unModele->validerReservation($etat, $idreservation);
		}





		
		
		





}








	