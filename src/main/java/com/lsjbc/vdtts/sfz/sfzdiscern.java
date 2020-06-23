package com.lsjbc.vdtts.sfz;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lsjbc.vdtts.utils.HttpUtils;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class sfzdiscern{

	public static String img_base64(String path) {
		/**
		 *  对path进行判断，如果是本地文件就二进制读取并base64编码，如果是url,则返回
		 */
		String imgBase64="";
		if (path.startsWith("http")){
			imgBase64 = path;
		}else {
			try {
				File file = new File(path);
				byte[] content = new byte[(int) file.length()];
				FileInputStream finputstream = new FileInputStream(file);
				finputstream.read(content);
				finputstream.close();
				imgBase64 = new String(Base64.encodeBase64(content));
			} catch (IOException e) {
				e.printStackTrace();
				return imgBase64;
			}
		}

		return imgBase64;
	}

	public static void main(String[] args) {
		String host = "http://dm-51.data.aliyun.com";
		String path = "/rest/160601/ocr/ocr_idcard.json";
		String appcode = "92f66ab7c6ab4e7fbb07fb18200d12cd";
		String imgFile = "/vdtts/src/main/webapp/image/pages/sfzphoto/jj.jpg";
		String method = "POST";

		Map<String, String> headers = new HashMap<String, String>();
		//最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
		headers.put("Authorization", "APPCODE " + appcode);
		//根据API的要求，定义相对应的Content-Type
		headers.put("Content-Type", "application/json; charset=UTF-8");

		Map<String, String> querys = new HashMap<String, String>();
		// 对图像进行base64编码
		String imgBase64 = img_base64(imgFile);

		//configure配置
		JSONObject configObj = new JSONObject();
		configObj.put("side", "face");

		String config_str = configObj.toString();

		// 拼装请求body的json字符串
		JSONObject requestObj = new JSONObject();
		requestObj.put("image", imgBase64);
		if(configObj.size() > 0) {
			requestObj.put("configure", config_str);
		}
		String bodys = requestObj.toString();

		try {
			HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
			int stat = response.getStatusLine().getStatusCode();
			if(stat != 200){
				System.out.println("Http code: " + stat);
				System.out.println("http header error msg: "+ response.getFirstHeader("X-Ca-Error-Message"));
				System.out.println("Http body error msg:" + EntityUtils.toString(response.getEntity()));
				return;
			}

			String res = EntityUtils.toString(response.getEntity());
			JSONObject res_obj = JSON.parseObject(res);
//打印
			System.out.println(res_obj.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}