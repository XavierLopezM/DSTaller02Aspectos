package DVMarket;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import org.aspectj.lang.JoinPoint;
import DVMarket.DVMarket;


public aspect UpdateSistem {
	
	public static String RUTA3 = "Archivos/consultas.log":
	

	
	pointcut Consultas() : execution(* DVMarket.buscar*(..));

	
	after() : Consultas(){
		
		

		String hora=Tiempo.horaExacta();
		String fecha = Tiempo.fechaDeHoy();
		String tipo=thisJoinPoint.getDeclaringType;
		String nombre=thisJoinPoint.getSignature();
		String mensaje = fecha+hora+tipo+nombre;
		writeFile(mensaje);
	}

	public void writeFile(String mensaje) {
		File file = new File("consultas.log");
		try {
			
			String content = mensaje;
			
			if(!file.exists()) {
				file.createNewFile();
			}
			
			FileWriter fw = new FileWriter(RUTA3,true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(content);
			bw.close();
		} catch (IOException e) {
            e.printStackTrace();
        }
	}

	
	/*
	 * Para esta parte debe crear un nuevo aspecto con el nombre que considere adecuado.
2. El requerimiento por manejar es el siguiente: �El �rea gerencial desea agregar nuevas 
funcionalidades al sistema en un futuro pr�ximo, se tiene planeado mejorar
 las b�squedas del sistema y se desea guardar en un archivo llamado `consultas.log`
  
  
  
  cada que se ejecute alg�n m�todo que inicie con la palabra buscar. 
  Se debe almacenar en el archivo el tipo de objeto que realiza la b�squeda,
   la fecha y la hora y m�todo que se ejecut�.�
3. Considere que necesita utilizar m�scaras para con un solo advice 
generar la informaci�n correspondiente para cualquier clase y
 m�todo que cumpla con el requerimiento.
	 * 
	 * 
	 *
	 * 

	 * 
	 * */
	

}
