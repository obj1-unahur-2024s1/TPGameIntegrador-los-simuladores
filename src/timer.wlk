import componentes.*
import utilidades.*
import wollok.game.*


object timer inherits Componente{
	
	//contiene el tiempo en segundos del timer
	const tiempoEnSegundos = 150 
	
	//contiene el tiempo restante, al principio es el mismo que el tiempoEnSegundos
	var tiempoRestante = tiempoEnSegundos
	
	//contiene el estado de activacion
	var	activado = false
	
	
	// agrega los elementos que construyen al timer
	method initialize(){
		elementos.add(new CeldaTimer(caracter=self.minuto(), id="timerMinuto", position= game.at(26,27)))
		elementos.add(new CeldaTimer(caracter="dosPuntos", id="timerDosPuntos", position= game.at(27,27)))
		elementos.add(new CeldaTimer(caracter=self.segundo1(), id="timerSegundos1", position= game.at(28,27)))
		elementos.add(new CeldaTimer(caracter=self.segundo2(), id="timerSegundos2", position= game.at(29,27)))
		game.schedule(3000,{=> self.activar()})
	}
	
	method tiempoRestante() = tiempoRestante	
	
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
	method segundo1()= (tiempoRestante.rem(60).div(10)).toString()			// no estan consistentes los calculos pero funcionan bien ,sugiero no tocar
	
	//devuelve las unidades de los segundos restantes en un string
	method segundo2()= (tiempoRestante.rem(60).rem(10)).toString()
	
	//actualiza el estado del timer cada un segundo(o 1000 milisegundos), si es que esta activado 
	method actualizar(){
		if(activado){
			tiempoRestante = tiempoRestante - 1
			game.schedule(1000, { => self.actualizar()})
			elementos.get(0).actualizarCaracter(self.minuto())
			elementos.get(2).actualizarCaracter(self.segundo1())
			elementos.get(3).actualizarCaracter(self.segundo2())
			console.println(tiempoRestante.toString() + " " + self.minuto() + " " +  self.segundo1() + " " +  self.segundo2()) // debug, borrar para la entrega final
		}	
	}	
}
