object nave {
    var property pasajeroDeMayorVitalidad = 0
    const property pasajeros = [neo,morfeo,trinity]
    

    method chocarLaNave() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }
    method acelerarNave() {
        self.losQueNoSonElElegido().forEach({
            p => p.saltar()
        })
    }
    method bajarA(unPasajero) {
        if(!self.estaEnLaNave(unPasajero)){
            self.error("El pasajero NO esta en la nave")
        }
        pasajeros.remove(unPasajero)

    }
    method subirA(unPasajero) {
        if(self.estaEnLaNave(unPasajero)){
            self.error("El pasajero ya esta en la nave")
        }
        pasajeros.add(unPasajero)

    }
    method todosPuedenContraUnAgente() {
        pasajeros.all({p => p.vitalidad() > 2})
    }
    method simulacroDeCombate(){
        pasajeros.forEach({p => p.saltar() p.saltar() p.saltar()})
    }
    method ordenarPorVitalidad() {
        pasajeros.sortBy({p1,p2 => p1.vitalidad() < p2.vitalidad()})
    }
    method vitalidadPromedio()= pasajeros.average({p => p.vitalidad()})
    method cuantosTienenVitalidadPar() = pasajeros.count({p => p.vitalidad().even()})
    method vitalidadDePasajeros() = pasajeros.map({p => p.vitalidad()})
    method elPasajeroDeMayorVitalidad() = pasajeros.max({p => p.vitalidad()})
    method estaElElegido() = pasajeros.any({p => p.esElegido()})
    method estaEnLaNave(unPasajero) = pasajeros.contains(unPasajero)
    method cantidadDePasajeros() = pasajeros.size()
    method losQueNoSonElElegido() = pasajeros.filter({p => !p.esElegido()})
}
object neo {    
    var energia = 100

    method saltar() {
        energia = energia * 0.5
    }
    method subirALaNave(){
        nave.subirA(self)
    }
    method bajaseDeLaNave(){
        nave.bajarA(self)
    }
    method vitalidad() = energia * 0.1
    method esElegido() = true
}
object morfeo {
    var vitalidad = 8
    var estaCansado = false 

    method saltar() {
        estaCansado = !estaCansado
        vitalidad = (vitalidad - 1).max(0) 
    }
    method subirALaNave(){
        nave.subirA(self)
    }
    method bajaseDeLaNave(){
        nave.bajarA(self)
    }
    method vitalidad() = vitalidad
    method esElegido() = false
}
object trinity {
    method saltar() {
        //respeta el polimorfismo
    }
    method subirALaNave(){
        nave.subirA(self)
    }
    method bajaseDeLaNave(){
        nave.bajarA(self)
    }
    method esElegido() = false
    method vitalidad() = 0
}