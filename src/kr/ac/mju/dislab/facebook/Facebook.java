package kr.ac.mju.dislab.facebook;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import com.restfb.Connection;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.types.User;

public class Facebook{	
	// �먯떊��facebook appID
	public static final String APPID = "288015661318723";
	// �먯떊��facebook app Secret;
	public static final String APPSECRET = "904145d5d065b7eaed8aac9ec7951bf2";
	// facebook���깅줉�쒗궗 �ъ씠�몄＜��
	public static final String SITEURL="http://localhost:8080/GivingGift/index.jsp";
	// facebook���붿껌�� 沅뚰븳 由ъ뒪��
	// �꾨옒 �ъ씠�몄뿉���꾩슂��沅뚰븳 �뺤씤 媛�뒫
	// https://developers.facebook.com/docs/reference/login/#permissions
	private static final String PERMISSIONS ="user_about_me,publish_stream,read_friendlists," +
		"offline_access,user_photos,friends_about_me,user_birthday,friends_birthday";	

	private FacebookClient facebookClient;

	private Facebook(String accessToken) {
		this.facebookClient = new DefaultFacebookClient(accessToken);
	}

	public static Facebook getInstance(String code) throws IOException{
		return new Facebook(getAccessToken(code));		
	}
	
	// facebook�먯꽌 �살� code濡�access token �살쓬
	public static String getOAuthURL() throws IOException{		
		// facebook �몄쬆 ���뚯븘��redirect_url
		String redirectURL = Facebook.SITEURL +"/FBAuthServlet.do";		
		String oauthURL = "https://www.facebook.com/dialog/oauth?" +
			"client_id="+ Facebook.APPID +
			"&redirect_uri=" + URLEncoder.encode(redirectURL, "UTF-8")+
			"&scope="+ Facebook.PERMISSIONS;
		return oauthURL;
	}
	
	// facebook �ъ슜���뺣낫瑜�媛�졇�ㅺ린 �꾪빐 access token���섍꺼以�떎.
	private static String getAccessToken(String code) throws IOException{
		String redirectURL = Facebook.SITEURL + "/FBAuthServlet.do";
		String accessToken = "";
		String accessTokenURL = "https://graph.facebook.com/oauth/access_token?" +
			"client_id="+ Facebook.APPID + 
			"&redirect_uri=" + URLEncoder.encode(redirectURL, "UTF-8") + 
			"&client_secret=" + Facebook.APPSECRET + 
			"&code=" + code;

		URL siteURL = new URL(accessTokenURL);
		URLConnection urlConn = siteURL.openConnection();        
		BufferedReader in = new BufferedReader(
			new InputStreamReader(urlConn.getInputStream()));
		String inputLine = null;        
		while ((inputLine = in.readLine()) != null){ 
			accessToken = inputLine.split("&")[0].split("=")[1];	        		
		}
		in.close();
		return accessToken;
	}	

	public User getCurrentUser() {
		// resfFB��facebookClient瑜��듯빐 �꾩옱 �ъ슜���뺣낫瑜�媛�졇��
		return facebookClient.fetchObject("me", User.class);
	}

	public List<User> getFriends() {		
		List<User> friends= new ArrayList<User>();
		// 媛�졇�ㅺ퀬 �띠� 移쒓뎄���뺣낫��
		String fields = "id,name,username,link,first_name,last_name,gender,birthday,about";
		// resfFB��facebookClient瑜��듯빐 �꾩옱 �ъ슜���뺣낫瑜�媛�졇��
		Connection<User> myFriends = facebookClient.fetchConnection("me/friends",
			User.class,Parameter.with("fields",fields));
		// �섏씠�ㅻ턿�먯꽌 媛�졇��移쒓뎄�ㅼ쓽 �뺣낫瑜�FacebookUser���대뒗��
		for (List<User> myFriendConnection : myFriends){				
			for (User friend : myFriendConnection){
				friends.add(friend);
			}
		}
		return friends;
	}

	public String getAPPID() {
		return Facebook.APPID;
	}

	public String getSITEURL() {
		return Facebook.SITEURL;
	}
	
}
