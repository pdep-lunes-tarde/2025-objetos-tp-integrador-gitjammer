class Instrumento{
    method afinado(){}

    method costo(){}

    method esValioso(){}
}

class FenderStratocaster inherits Instrumento {
    const color

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

    override method afinado() {
        return temperatura <= 25 && temperatura >= 20
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
}

class Bechstein inherits Instrumento {
    const mtsHabitacion = 5

    override method afinado(){
        return mtsHabitacion*mtsHabitacion > 20
    }

    override method costo() {
        return 2 * mtsHabitacion
    }

    override method esValioso() {
        return self.afinado()
    }
}

class Stagg inherits Instrumento {
    var tembrolo
    const pintura

    override method afinado() {
        return tembrolo < 10
    }

    override method costo() {
        if((20 - tembrolo) < 15) {
            return 15
        } else {
            return 20 - tembrolo
        }
    }

    override method esValioso() {
        return pintura == "laca acrilica"
    }
}

const guitarra = new FenderStratocaster(color = "negro")