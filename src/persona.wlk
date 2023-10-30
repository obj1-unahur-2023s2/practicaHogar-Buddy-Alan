
 import habitaciones.*
 import casa.*
  class Persona {
 	const property edad 
 	var property tieneHabilidadesDeCocina
 	var habitacionDondeEsta = null
	method habitacionDondeEsta () = habitacionDondeEsta
 	
 	method entrarAHabitacion(habitacion)
 		{
 			if(!habitacion.puedeIngresarOcupante(self))
 				{
 					self.error("Donde vas amigo??")
 				}
 			habitacion.agregarOcupatens(self)
 			habitacionDondeEsta = habitacion
 		}
 	method nivelDeConfort()
 		{
 			habitacionDondeEsta.nivelDeConfort(self)
 		}
 	method seSienteAgusto(casa, familia)
 	}
 	
 /* 
  * 	* **Obsesives**: puede entrar en al menos una habitación y todas las habitaciones tienen como máximo 2 ocupantes.*/
  
  class Obsesives inherits Persona
  	{
  	 override method seSienteAgusto(casa, familia)
  	 	{
  	 	return 	casa.habitaciones().any({hab => hab.puedeEntrar(self)}) and casa.habitaciones().all({hab => hab.ocupantes().size() < 3 })
  	 	}
  	}
  	
  class Goloses inherits Persona
  {
  	override method seSienteAgusto(casa, familia) 
  		{
  				return casa.habitaciones().any({hab => hab.puedeEntrar(self)}) and familia.integrantes().any({int => int.tieneHabilidadesDeCocina()})
  		}
  }
  
  /*
  	* **Sencilles**: puede entrar en al menos una habitación 
  	* y la casa tiene al menos 1 habitación más que la cantidad de miembros de la familia 
  	* (p.ej. si la familia tiene 4 integrantes, la casa debe tener 5 habitaciones o más).
  
  */
  
    class Sencilles inherits Persona
  {
  	override method seSienteAgusto(casa, familia) 
  		{
  				return casa.habitaciones().any({hab => hab.puedeEntrar(self)}) 
  					and familia.integrantes().size() > casa.integrantes().size()
  		}
  }