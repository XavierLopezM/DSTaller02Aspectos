package DVMarket;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;


public aspect SalidaProductos {
	
	File file;
	
	pointcut Cambios() : execution(* Compra.borrarItem(Item));
	
	after() : Cambios(){
		
		try {
			String mensaje="Eliminacion " + "Fecha: " +Tiempo.fechaDeHoy() + "Hora: " + Tiempo.horaExacta();
			FileWriter escribir = new FileWriter("market.log");
			escribir.write(mensaje);
		} catch(IOException e){
			System.out.print(e);
		}
		
	}
	
	public void writeFile(String mensaje) {
		try {
			
			String content = mensaje;
			
			if(!file.exists()) {
				file = new File("market.log");
			}
			
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(content);
			bw.close();
		} catch (IOException e) {
            e.printStackTrace();
        }
	}
}