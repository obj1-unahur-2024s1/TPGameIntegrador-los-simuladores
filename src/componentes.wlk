import wollok.game.*


object menuPrincipal {
	// implementar
}


class Componente{
	const elementos = []
	
	method dibujarElementos(){
	 	elementos.forEach({
	 		e => 
	 		e.dibujar()
	 	})
	}
	 
	method borrarElementos(){
	 	elementos.forEach({
	 		e => 
	 		e.borrar()
	 	})
	}
	 
	method resetearElementos(){
	 	elementos.forEach({
	 		e => 
	 		e.resetear()
	 	})
	}
}

