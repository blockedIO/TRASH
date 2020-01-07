package ssm.util;

import java.util.HashMap;
import java.util.Map;

/**  
 * @Title: http://www.smschinese.cn/api.shtml
 * @date 2011-3-22
 * @version V1.2  
 */
public class SmsUtil {
	//用户名
	private static String Uid = "yyc1471480007";
	//接口安全秘钥
	private static String Key = "d41d8cd98f00b204e980";
	/**
	 * 发送短信的方法
	 * @param sendMsg  发送的信息普通短信限70个字，还可输入63字。
	 * @param sendPhone  发送的手机号、多个手机号用户逗号隔开
	 * @return  成功发送的条数  大于0成功
	 */
	public static int sendMsg(String sendMsg,String sendPhone) {

		HttpClientUtil client = HttpClientUtil.getInstance();

		//UTF发送
		return client.sendMsgUtf8(Uid, Key, sendMsg, sendPhone);
	}
}
