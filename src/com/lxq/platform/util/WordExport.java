package com.lxq.platform.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;

/**
 * 导出excel文件
 * @author lizi
 *
 */
public class WordExport
{
	/**
	 * 读取word模板并替换变量
	 * @param templateDocPath  模板路径
	 * @param map 要替换的数据
	 * @param out 输出流
	 * @return
	 * @throws IOException 
	 */
	public static void export(String templateDocPath,Map<String, String> map,OutputStream out) throws IOException {
			// 读取word模板
			FileInputStream fis = new FileInputStream(new File(templateDocPath));
			HWPFDocument document = new HWPFDocument(fis);
			// 读取word文本内容
			Range bodyRange = document.getRange();
			// 替换文本内容
			for (Map.Entry<String, String> entry : map.entrySet()) {
				bodyRange.replaceText("${" + entry.getKey() + "}", entry.getValue());
			}

			fis.close();

			document.write(out);
	}
}
