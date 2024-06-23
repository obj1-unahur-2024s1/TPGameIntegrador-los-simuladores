import wollok.game.*

// es un conjunto de celdas, denominadas elementos, para lograr mostrar la informacion deseada
class Componente{
	const elementos = []
	
	method agregarElementos(){
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


