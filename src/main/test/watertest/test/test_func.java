package watertest.test;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;

public class test_func {

	public static void main(String[] args) throws Exception {

	}

	public void func_20210326_UTF8toXML() throws FileNotFoundException, UnsupportedEncodingException {
		File file = new File("D:\\PetYou-master\\src\\main\\resources\\log4j2.xml");
//		InputStream inputStream= new FileInputStream(file);
//		Reader reader = new InputStreamReader(inputStream,"UTF-8");
//		InputSource is = new InputSource(reader);
		OutputStream os = new FileOutputStream(file);
		OutputStreamWriter bufferedWriter = new OutputStreamWriter(os,"UTF-8");
	}

}
