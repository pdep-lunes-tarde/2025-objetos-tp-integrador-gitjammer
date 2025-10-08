class Instrumento{
    method afinado(){}

    method costo(){}

    method esValioso(){}
}

class FenderStratocaster inherits Instrumento {
    const color

    override method afinado(){
        return true
    }

    override method costo() {
        if(color == "negro") {
            return 15
        } else {
            return 10
        }
    }

    override method esValioso() {
        return true
    }
}

class Jupiter inherits Instrumento {
    const sordina
    const temperatura
    var estaAfinado = false

    override method afinado() {
        if(temperatura <= 25 && temperatura >= 20){
            return true
        }
        return estaAfinado
    }

    override method costo() {
        if(sordina) {
            return 35
        } else {
            return 30
        }
    }

    override method esValioso() {
        return false
    }

    method afinar(){
        estaAfinado = true
    }
}

class Bechstein inherits Instrumento {
    var largo = 5
    var ancho = 5

    override method afinado(){
        return largo*ancho > 20
    }

    override method costo() {
        return 2 * ancho
    }

    override method esValioso() {
        return self.afinado()
    }
}

class Stagg inherits Instrumento {
    var tremolo
    const pintura

    override method afinado() {
        return tremolo < 10
    }

    override method costo() {
        if((20 - tremolo) < 15) {
            return 15
        } else {
            return 20 - tremolo
        }
    }

    override method esValioso() {
        return pintura == "laca acrílica"
    }
}

const guitarra = new FenderStratocaster(color = "negro")

class Musico{
    method esFeliz(){}
}

object johann inherits Musico{
    var instrumento = new Jupiter(sordina=true, temperatura=20)

    override method esFeliz(){
        return instrumento.costo() > 20
    }
}

object wolfgang inherits Musico{
    
    override method esFeliz(){
        return johann.esFeliz()
    }
}

object antonio inherits Musico {
    var instrumento = new Bechstein()

    override method esFeliz(){
        return instrumento.esValioso()
    }
}

object giuseppe inherits Musico{
    var instrumento = new FenderStratocaster(color="rojo")

    override method esFeliz(){
        return instrumento.afinado()
    }
}

object maddalena inherits Musico{
    var instrumento = new Stagg(tremolo=true, pintura="mate")

    override method esFeliz(){
        return instrumento.costo() % 2 == 0
    }
}