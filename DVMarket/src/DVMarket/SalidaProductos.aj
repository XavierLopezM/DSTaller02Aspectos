import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;


import DVMarket.Compra;
import DVMarket.Item;
import DVMarket.Tiempo;

public aspect SalidaProductos {
	
	File file = new File("market.log");
	
	pointcut Cambios() : execution(* Compra.borrarItem(Item));
	
	after() : Cambios(){
		String fecha=Tiempo.fechaDeHoy();
		String hora =Tiempo.horaExacta();
		String mensaje = "Eliminacion" +fecha+hora;
		writeFile(mensaje);
	}
	
	public void writeFile(String mensaje) {

		
		try {
			
			String content = mensaje;
			
			if(!file.exists()) {
				file.createNewFile();
			}
			
			FileWriter fw = new FileWriter(file.getAbsoluteFile(),true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(content);
			bw.close();
		} catch (IOException e) {
            e.printStackTrace();
        }
	}
}
