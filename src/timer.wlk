import componentes.*
import utilidades.*
import wollok.game.*
import juego.*
import pantallas.*


object timer inherits Componente{
	
	//contiene el tiempo en segundos del timer
	const tiempoEnSegundos = 60 
	
	//contiene el tiempo restante, al principio es el mismo que el tiempoEnSegundos
	var tiempoRestante = tiempoEnSegundos
	
	//contiene el estado de activacion
	var	activado = false
	
	
	// agrega los elementos que construyen al timer
	method initialize(){
		elementos.add(new CeldaTimer(caracter=self.minuto(), position= game.at(24,24)))
		elementos.add(new CeldaTimer(caracter="dosPuntos", position= game.at(24,24)))
		elementos.add(new CeldaTimer(caracter=self.segundo1(), position= game.at(25,24)))
		elementos.add(new CeldaTimer(caracter=self.segundo2(), position= game.at(26,24)))
		game.schedule(3000,{=> self.activar()})
	}
	
	method tiempoRestante() = tiempoRestante	
	
	method habilitarSiEsNecesario(esPorTiempo){
		if(esPorTiempo){
			self.activar()
			
		}else{
			self.desactivar()
			self.borrarElementos()
		}
	}
	
	//activa el timer y cuenta el primer segundo
	method activar(){ 
		activado = true
		game.schedule(1000, {=>self.actualizar()})
	}
	
	//resetea el timer haciendo que el tiempo restante sea el tiempo configurado
	method resetear(){
		tiempoRestante = tiempoEnSegundos
	}
	
	//desactiva el timer y lo resetea
	method desactivar(){ 
		activado = false
		self.resetear()
	}
	
	//devuelve la cantidad de minutos restantes en el timer en un string
	method minuto()= (tiempoRestante.div(60)).toString()     
	
	//devuelve las decenas de los segundos restantes en un string
	method segundo1()= (tiempoRestante.rem(60).div(10)).toString()			
	
	//devuelve las unidades de los segundos restantes en un string
	method segundo2()= (tiempoRestante.rem(60).rem(10)).toString()
	
	//actualiza el estado del timer cada un segundo(o 1000 milisegundos), si es que esta activado 
	method actualizar(){
		if(activado){
			tiempoRestante = tiempoRestante - 1
			game.schedule(1000, { => self.actualizar()})
			self.actualizarNumeros()
			self.verificarSiTermino()
		}	
	}	
	
	method actualizarNumeros(){
		elementos.get(0).actualizarCaracter(self.minuto())
		elementos.get(2).actualizarCaracter(self.segundo1())
		elementos.get(3).actualizarCaracter(self.segundo2())
	}
	
	method verificarSiTermino(){
		if(tiempoRestante == 0){
			pantallaJuego.detenerSonido()
			juego.cambiarPantalla(pantallaPerdedorTiempo)
		}
	}
}
