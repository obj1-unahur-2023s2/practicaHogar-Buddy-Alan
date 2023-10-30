import habitaciones.*
import persona.*

class Casa
	{
		var property habitaciones = #{}
		method agregarHabitacion(hab)
			{
				habitaciones.add(hab)
			}
		method habitacionesOcupadas() = habitaciones.filter({hab => hab.estaOcupada()})
		method respondablesDeLaCasa() = self.habitacionesOcupadas().filter({hab => hab.ocupanteMasViejoDeLaHabitacion()})
	}
	
class Familia 
	{
		var property integrantes = #{}
		var property casaDondeVive 
		method agregarIntegrante(integranteNuevo)
			{
				integrantes.add(integranteNuevo)
			}
		method nivelDeConfotDeLosIntegrantes () = integrantes.sum({int => int.nivelDeConfort()}) / integrantes.size()
		method saberSiEstanAgustos()
			{
			return self.nivelDeConfotDeLosIntegrantes() > 40 and integrantes.all({persona => persona.seSienteAgusto(casaDondeVive,self)})
			}
	}