
 import persona.*
 class Habitacion {
 	const property ocupantes = #{}
 	method puedeIngresarOcupante (persona) = ocupantes.isEmpty() or self.puedenEntrar(persona)
 	method agregarOcupatens(persona) {
 		if(self.puedeIngresarOcupante(persona))
 		{ocupantes.add(persona)}
 	}
 	method nivelDeConfort (persona) = 10
 	method puedenEntrar (persona) 
 	method esUnOcupante(persona) = ocupantes.contains(persona)
 	method hayUnCocinero() = ocupantes.any({p => p.tieneHabilidadesDeCocina()})
 	method estaOcupada() = not ocupantes.isEmpty()
 	method ocupanteMasViejoDeLaHabitacion () = ocupantes.max({p => p.edad()})
 }

 
  class Banio inherits Habitacion {
 	
 	override method   nivelDeConfort (persona) 
 		{
 			if(persona.edad() < 5)
 				{
 					return super(persona) +2
 				}
 			else 
 			{
 				return super(persona) + 4
 			}
 		}
 	override method puedenEntrar (persona) = ocupantes.any({ocup => ocup.edad() < 5})
 }
 
 class Dormitorios inherits Habitacion 
 	{
 		const  cantDePersonasQueDuermen = #{}
 		method agregarPersona(persona)
 			{
 				cantDePersonasQueDuermen.add(persona)
 			}
 		 		method sacarPersona(persona)
 			{
 				cantDePersonasQueDuermen.remove(persona)
 			}
 		method utilizaDormitorio(persona) = cantDePersonasQueDuermen.contains(persona)
 	   override method   nivelDeConfort (persona) 
 	   {
 	   		if (self.utilizaDormitorio(persona))
 	   			{
 	   				return super(persona) + (10/cantDePersonasQueDuermen.size())
 	   			}
 	   		else 
 	   			{
 	   				return super(persona)
 	   			}
 	   }
 	 	override  method puedenEntrar (persona) =  self.esUnaPersonaQueUtilizaDormitorio(persona) or cantDePersonasQueDuermen.all({p => p.esUnOcupante(p)})
 		method esUnaPersonaQueUtilizaDormitorio(persona) = cantDePersonasQueDuermen.contains(persona)
 	}
 	
class Cocina inherits Habitacion 

	{
		var property metrosDeLaCocina = 10
		override method   nivelDeConfort (persona)
			{
				const valorExtra = if(persona.tieneHabilidadesDeCocina())
					{
						metrosDeLaCocina * (valoresAdicionalesHabitaciones.porcentajeConfonfortCocina() / 100)
					}
					else{
						0
					}
			return  super(persona) + valorExtra
			}
		override method puedenEntrar (persona)  =  !self.hayUnCocinero() or !persona.tieneHabilidadesDeCocina()
	} 
 
  class UsoGeneral  inherits Habitacion 
  	{
  		override method puedenEntrar(persona) = true
  	}
 
 object valoresAdicionalesHabitaciones
 	{
 		var property porcentajeConfonfortCocina = 10
 	}

