
class FenderStratocaster{
    const color
    const familia = "Cuerdas"

    method getFamilia() = familia

    method nombre()="FenderStratocaster"

    method afinado(){
        return true
    }

    method costo() {
        if(color == "negro") {
            return 15
        } else {
            return 10
        }
    }

    method esValioso() {
        return true
    }
}

class Jupiter{
    const sordina
    const temperatura
    const familia = "Viento"
    var estaAfinado = false

    method nombre() = "Jupiter"

    method getFamilia() = familia

    method tieneSordina(){
        return sordina
    }

    method afinado() {
        if(temperatura <= 25 && temperatura >= 20){
            return true
        }
        return estaAfinado
    }

    method costo() {
        if(sordina) {
            return 35
        } else {
            return 30
        }
    }

    method esValioso() {
        return false
    }

    method afinar(){
        estaAfinado = true
    }
}

class Bechstein{
    var largo = 5
    var ancho = 5
    const familia = "Cuerdas"
    
    method getLargo() = largo

    method getAncho() = ancho

    method getFamilia() = familia

    method nombre() = "Bechstein"

    method afinado(){
        return largo*ancho > 20
    }

    method costo() {
        return 2 * ancho
    }

    method esValioso() {
        return self.afinado()
    }
}

class Stagg{
    var tremolo
    const pintura
    const familia = "Cuerdas"

    method getFamilia()=familia

    method nombre()="Stagg"

    method afinado() {
        return tremolo < 10
    }

    method costo() {
        if((20 - tremolo) < 15) {
            return 15
        } else {
            return 20 - tremolo
        }
    }

    method esValioso() {
        return pintura == "laca acrílica"
    }
}


object johann{
    var instrumento = new Jupiter(sordina=true, temperatura=20)
    method esFeliz(){
        return instrumento.costo() > 20
    }
    method cambiarInstrumento(nuevoInstrumento){
        instrumento = nuevoInstrumento
    }
}

object wolfgang{
    
    var instrumento = ""

    method esFeliz(){
        return johann.esFeliz()
    }

    method cambiarInstrumento(nuevoInstrumento){
        instrumento = nuevoInstrumento
    }
}

object antonio{
    var instrumento = new Bechstein()

    method esFeliz(){
        return instrumento.esValioso()
    }

    method cambiarInstrumento(nuevoInstrumento){
        instrumento = nuevoInstrumento
    }
}

object giuseppe {
    var instrumento = new FenderStratocaster(color="rojo")

    method esFeliz(){
        return instrumento.afinado()
    }

    method cambiarInstrumento(nuevoInstrumento){
        instrumento = nuevoInstrumento
    }
}

object maddalena{
    var instrumento = new Stagg(tremolo=true, pintura="mate")

    method esFeliz(){
        return instrumento.costo() % 2 == 0
    }

    method cambiarInstrumento(nuevoInstrumento){
        instrumento = nuevoInstrumento
    }
}

class Musico{ // Generico, debe haber una forma de crear una clase Musico con este como hijo junto con los antes ya definidos
    var instrumento
    const preferencia

    method esFeliz(){
        if(instrumento.nombre() == "Jupiter"){
            return instrumento.tieneSordina()
        }
        return instrumento.nombre() == "Bechstein" && (instrumento.getLargo() > 6 || instrumento.getAncho() > 6)
    }

    method cambiarInstrumento(nuevoInstrumento){
        instrumento = nuevoInstrumento
    }

    method esExperto(){
        return instrumento.getFamilia() == preferencia
    }
}

class Orquesta{
    const musicos = []
    const maximoDeMusicos

    method getMusicos()=musicos

    method agregarMusico(musico){
        if(maximoDeMusicos != musicos.size() && !musicos.contains(musico)){
            musicos.add(musico)
        }
    }

    method estaBienFormada(){
        var todosFelices = true
        musicos.forEach({m => todosFelices = m.esFeliz() && todosFelices})
        return todosFelices
    }
}

class Fecha{
    const dia
    const mes
    const anio

    method getDia() = dia
    method getMes() = mes
    method getAnio() = anio
}

class Diferencia{
    const dias
    const meses
    const anios

    method getDias() = dias
    method getMeses() = meses
    method getAnios() = anios
}

// Asumo que cada mes tiene 30 dias
object calculadorDiferenciaFechas{
    method calcular(fecha, fechaActual) {
        const dia1 = fecha.getDia()
        const mes1 = fecha.getMes()
        const anio1 = fecha.getAnio()

        var dia2 = fechaActual.getDia()
        var mes2 = fechaActual.getMes()
        var anio2 = fechaActual.getAnio()

        var dias = 0
        var meses = 0
        var anios = 0

        if (dia2 < dia1) {
            dia2 = dia2 + 30    // pedimos "prestado" un mes
            mes2 = mes2 - 1
        }

        dias = dia2 - dia1

        if (mes2 < mes1) {
            mes2 = mes2 + 12    // pedimos "prestado" un año
            anio2 = anio2 - 1
        }

        meses = mes2 - mes1
        anios = anio2 - anio1

        return new Diferencia(dias = dias, meses = meses, anios = anios)
    }
}

class Instrumento{

    const familia
    const afinaciones = []

    method afinado(fechaActual){
        const ultimaAfinacion = afinaciones.last()
        const diferencia = calculadorDiferenciaFechas.calcular(ultimaAfinacion, fechaActual)

        return (diferencia.getMeses() == 0 && diferencia.getAnios() == 0)
    }

    method costo(valorFijo){
        var multiplicador
        var n = valorFijo

        if(n < 1 || n > 10){
            n = 1.randomUpTo(10)
        }
        if(n%2==0){
                multiplicador = 2
            }else{
                multiplicador = 3
            }
        return multiplicador*familia.length()
    }

    method esValioso(){}

    method getFamilia(){
        return familia
    }
}

class Afinacion{
    
}