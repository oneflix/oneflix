/**
 * @constructor
 * @description NAVER Login authorize API
 * @author nid.nullism@navercorp.com
 * @version 0.0.2
 * @date 15. 06. 25
 * @copyright 2015 Licensed under the MIT license.
 */
 
/**
 怨듯넻 �곸뿭
 */
//踰꾪듉 醫낅쪟�� ���� �뺤쓽
BUTTON_TYPE = 1;
BANNER_SMALL_TYPE = 2;
BANNER_BIG_TYPE = 3;
//踰꾪듉 �됯퉼�� ���� �뺤쓽
BUTTON_COLOR_WHITE = "white";
BUTTON_COLOR_GREEN = "green";

var naver_id_login = function (client_id,redirect_uri)
{
	this.button_color = BUTTON_COLOR_GREEN;
	this.button_type = BUTTON_TYPE;
	this.button_height = 40;
	this.nil_domain = "";
	this.response_type="token";
	this.authorize_url="https://nid.naver.com/oauth2.0/authorize";
	this.state = "";
	this.scope="";
	this.client_id = client_id;
	this.redirect_uri = redirect_uri;
	this.cookie_name="nil_state";
	this.popup = false;
	this.oauthParams = {};
	this.profileParams = {};
	this.is_callback = false;
	this.callback_status="";
	this.callback_message="";

/**
 * 濡쒓렇�몄갹 �앹뾽 �ㅼ젙
 * @ignore
 * @return void
 * @private
 */
	this.setPopup = function() {
		this.popup = true;
	}
/**
 * �쒕퉬�� �꾨찓�� �ㅼ젙
 * @ignore
 * @return void
 * @private
 */
	this.setState = function(state_value) {
		this.state = ((typeof(state_value)!='undefined') && (state_value != "") ) ? state_value : "";
	}
/**
 * �쒕퉬�� �꾨찓�� �ㅼ젙
 * @ignore
 * @return void
 * @private
 */
	this.setDomain = function(domain_value) {
		this.nil_domain = ((typeof(domain_value)!='undefined') && (domain_value != "") ) ? domain_value : "";
	}
/**
 * �ㅼ씠踰� �꾩씠�붾줈 濡쒓렇�� 踰꾪듉 �붿옄�� �좏깮
 * @ignore
 * @return void
 * @private
 */
	this.setButton = function(button_color,button_type,button_height) {
		this.button_color = ((typeof(button_color)!='undefined') && (button_color != "") ) ? button_color : BUTTON_COLOR_GREEN;
		this.button_type = ((typeof(button_type)!='undefined') && (button_type != "") ) ? button_type : BUTTON_TYPE;
		this.button_height = ((typeof(button_height)!='undefined') && (button_height != "") ) ? button_height : 40;
	}
/**
 * oauth 2.0 spec �� state 媛� �먮룞 �앹꽦
 * @ignore
 * @returns {*}
 * @private
 */
	this.getUniqState = function(){
		var stat_str = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) { var r = Math.random()*16|0, v = c === 'x' ? r : (r&0x3|0x8); return v.toString(16); });
		return stat_str;
	};
/**
 * local Storage�� �대떦 name �� key濡� 媛�吏��� value 媛믪쓣 �덉쟾�섍쾶 諛쏆븘�⑤떎.
 * @ignore
 * @param {string} local Storage �� ���λ맂 �ㅺ컪
 * @private
 */
	this.getLocalStorageItemSafely = function () {
		try {
			var item = localStorage.getItem(this.cookie_name);
			if (item == null || item.length == 0) {
				return item;
			}
			return item.replace(/&/g, '&amp;')
				.replace(/"/g, '&quot;')
				.replace(/'/g, '&#x27;')
				.replace(/</g, '&lt;')
				.replace(/>/g, '&gt;');
		}	catch (e)
		{
			return null;
		}
	}

/**
 * local Storage �뱀� cookie storage �� �먰븯�� key vlaue �띿쓣 ���� �쒕떎.
 * @ignore
 * @param {string} local Storage �뱀� cookie storage �� ���ν븷 value 媛�
 * @returns {*}
 * @private
 */
	this.setStateStore = function ()
	{
		try {
			if (this.nil_domain!="")
			{
				document.cookie = this.cookie_name+"=; path=/; domain="+this.nil_domain+"; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
			}
			else
			{
				document.cookie = this.cookie_name+"=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
			}
			localStorage.setItem('nil_state', this.state);
			if (this.nil_domain!="")
			{
				var today = new Date();
				var expire = new Date(today.getTime() + 60 * 5 * 1000); //5遺꾧컙 �좏슚
				var curCookie = this.cookie_name+"=" + escape(this.state) + "; expires="
					+ expire.toGMTString() + "; domain=" + this.nil_domain+ ";path=/;";
				document.cookie = curCookie;	
			}
		}catch (e)
		{
			var today = new Date();
			var expire = new Date(today.getTime() + 60 * 5 * 1000); //5遺꾧컙 �좏슚
			var curCookie = this.cookie_name+"=" + escape(this.state) + "; expires="
				+ expire.toGMTString() + ";path=/;";
			document.cookie = curCookie;	
		}
	}

/**
 * �ㅼ씠踰� �꾩씠�붾줈 濡쒓렇�몃븣 �ъ슜�� 留곹겕�� 二쇱냼瑜� �앹꽦�쒕떎.
 * @ignore
 * @private
 */
	this.getNaverIdLoginLink = function ()
	{
		if (!this.is_callback)
		{
			this.setStateStore();
		}
		else
		{
			this.state = this.oauthParams.state;
		}
		if ( ( this.client_id == undefined ) || ( this.client_id == "�깅줉�� ClientID 媛�" ) || ( this.client_id.length < 5 ) )
		{
			alert("�깅줉�� ClientID 媛믪쓣 �낅젰�� 二쇱꽭��.");
			return false;
		}
		if ( ( this.redirect_uri == undefined ) || ( this.redirect_uri == "�깅줉�� Callback URL 媛�" ) || ( this.redirect_uri.length < 5 ) )
		{
			alert("�깅줉�� Callback URL 媛믪쓣 �낅젰�� 二쇱꽭��.");
			return false;
		}
		call_url = this.authorize_url+"?response_type="+this.response_type+"&client_id="+this.client_id+"&redirect_uri="+encodeURIComponent(this.redirect_uri)+"&state="+encodeURIComponent(this.state);
		if (this.scope!="")
		{
			call_url = call_url + "&scope="+encodeURIComponent(this.scope);
		}
		return call_url;
	}

/**
 * �ㅼ씠踰� �꾩씠�붾줈 濡쒓렇�몃븣 �ъ슜�� �대�吏� 諛� 留곹겕瑜� �앹꽦�쒕떎.
 * @ignore
 * @param {int} �대�吏��� �믪씠 媛� (px �⑥쐞)
 * @private
 */
	this.init_naver_id_login = function ()
	{
		var naver_id_login = document.getElementById('naver_id_login');
		if (naver_id_login==undefined)
		{
			alert("id 媛� naver_id_login �� div tag 媛� 議댁옱�댁빞 �⑸땲��.");
			return false;
		}
		if (this.button_color=="green")
		{
			color="g";
		}
		else
		{
			color="w";
		}
		naver_id_login.innerHTML="";
		naver_id_login_contents="";
		naver_id_login_url = this.getNaverIdLoginLink();
		if (this.state==undefined || this.state=="")
		{
			this.state = this.getUniqState();
		}
		naver_id_popup_option = "";
		if (this.popup)
		{
			naver_id_popup_option = " onClick=\"window.open(this.href, 'naverloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550'); return false\" ";
		}
		if (this.button_type == BUTTON_TYPE)
		{
			naver_id_login_contents="<a href='"+naver_id_login_url+"' "+naver_id_popup_option+" id='naver_id_login_anchor' style='color:white'>네이버로 로그인하기</a> ";
		}
		else if (this.button_type == BANNER_SMALL_TYPE)
		{
			naver_id_login_contents="<a href='"+naver_id_login_url+"' "+naver_id_popup_option+" id='naver_id_login_anchor'><img src='http://static.nid.naver.com/oauth/small_"+color+"_in.PNG' border='0' title='테스트2' width='"+(this.button_height*656/250)+"px' height='"+this.button_height+"'></a> ";
		}

		else if (this.button_type == 10)
		{
		//네이버 회원가입(인증)_커스텀 이미지로 버튼을 만들기 위해 추가
		naver_id_login_contents="<a style='display:none;' href='"+naver_id_login_url+"' "+naver_id_popup_option+" class='whiteA' id='naver_id_login_anchor'>네이버로 로그인<img src='http://static.nid.naver.com/oauth/small_"+color+"_in.PNG' border='0' title='네이버로 로그인' width='"+(this.button_height*656/250)+"px' height='"+this.button_height+"'></a>";
		} 
		naver_id_login.innerHTML=naver_id_login_contents;
		if (this.is_callback)
		{
			this.init_naver_id_login_callback();
		}
	}

/**
 * �ъ슜�먭� �뗮똿�� state 媛믪쓽 �쇱튂 �щ�瑜� �뺤씤
 * @ignore
 * @param {string} oauth callback url 濡� �꾨떖�� state 媛�
 * @returns {boolean} �쇱튂 �щ� true/false
 * @private
 */
	this.checkStateStore = function (receive_state)
	{
		//�ъ슜�먭� setting �� 媛믪씠 �덉쑝硫� �곗꽑沅뚯쓣 媛�吏꾨떎.
		if (this.state!=undefined || this.state=="")
		{
			state = this.getLocalStorageItemSafely();
		}
		else
		{
			state = this.state;
		}
		if (state != null && state.length > 10 )
		{
			if (state==receive_state)
			{
				try {
					localStorage.removeItem(this.cookie_name)
				}catch (e) {}
				return true;
			}
			else
			{
				try {
					localStorage.removeItem(this.cookie_name)
				}catch (e) {}
				return false;
			}
		}
		else //check cookie
		{
		//�ъ슜�먭� setting �� 媛믪씠 �덉쑝硫� �곗꽑沅뚯쓣 媛�吏꾨떎.
			if (this.state!=undefined || this.state=="")
			{
				state = this.getCookie();
			}
			else
			{
				state = this.state;
			}
			if (state != null && state.length > 10 )
			{
				if (state==receive_state)
				{
					if (this.nil_domain!="") {
						document.cookie = this.cookie_name+"=; path=/; domain="+this.nil_domain+"; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
					} else {
						document.cookie = this.cookie_name+"=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
					}
					
					return true;
				}
				else
				{
					if (this.nil_domain!="") {
						document.cookie = this.cookie_name+"=; path=/; domain="+this.nil_domain+"; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
					} else {
						document.cookie = this.cookie_name+"=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
					}
					return false;
				}
			}
			return false;
		}
	}

/**
 * cookie Storage�� nil_state �� key濡� 媛�吏��� value 媛믪쓣 諛쏆븘�⑤떎.
 * @ignore
 * @return {string} cookie Storage �� ���λ맂 value 媛�
 * @private
 */
	this.getCookie = function () {
		var b = "nil_state=";
		var c = b.length;
		var d = document.cookie.length;
		var e = 0;
		while (e < d) {
		    var f = e + c;
		    if (document.cookie.substring(e, f) == b) {
		        var g = document.cookie.indexOf(";", f);
		        if (g == -1) g = document.cookie.length;
		        return unescape(document.cookie.substring(f, g))
		    }
		    e = document.cookie.indexOf(" ", e) + 1;
		    if (e == 0) break
		}
		return null
	}
/**
 * callback �몄텧 二쇱냼瑜� parsing �댁꽌 寃곌낵瑜� array 濡� ���ν븳��.
 * @ignore
 * @return {string} parameter 媛� ���λ맂 array
 * @private
 */
	this.parseCallBack = function (){
		var params = {};
		var queryString = (document.location+"").substring(1);
		var regex = /([^#?&=]+)=([^&]*)/g;
		var match;
		while ((match = regex.exec(queryString)) !== null) {
			params[decodeURIComponent(match[1])] = decodeURIComponent(match[2]);
		}
		this.oauthParams = params;
	}
/**
 * callback �몄텧 二쇱냼瑜� parsing �댁꽌 寃곌낵瑜� array 濡� ���ν븳��.
 * @ignore
 * @return {string} parameter 媛� ���λ맂 array
 * @private
 */
	this.parseCallBack_check = function (){
		this.parseCallBack();
		if (this.oauthParams.access_token!=undefined)
		{
			this.is_callback = true;
		}
		else
		{
			this.is_callback = false;
		}
	}
/**
 * callback �섏씠吏��먯꽌 �몄텧 �섎㈃ oauthParams �� 寃곌낵瑜� ���ν븯怨� 醫낅즺�쒕떎.
 * @ignore
 * @return void
 * @private
 */
	this.init_naver_id_login_callback = function (){
		this.parseCallBack_check();
		if (this.is_callback)
		{
			if (this.oauthParams.error==undefined)
			{
				if (this.oauthParams.access_token!=undefined)
				{
					if (this.checkStateStore(this.oauthParams.state))
					{
						this.callback_status="success";
						this.callback_message = "state check success";
					}
					else
					{
						/*
                         * state 媛� 留욎� �딆쓬 cookie �ъ슜�� 李⑤떒 �� 寃쎌슦 
						 * �ъ슜�먭� 紐낆떆�곸쑝濡� state 媛믪쓣 �ъ슜�� 寃쎌슦
						*/
						if (this.state == this.oauthParams.state)
						{
							this.callback_status="success";
							this.callback_message = "state check success";
						}
						else
						{
							/*
                        	 * state 媛� 留욎� �딆쓬 localstorage 諛� cookie �ъ슜�� 遺덇��ν븳 寃쎌슦�� nil_login.setState(....); 濡� 吏��� �댁빞 ��.
							*/
							alert("state 媛믪씠 留욎씠 �딆뒿�덈떎.");
							this.callback_status="warning";
							this.callback_message = "state miss match";
						}
					}
				}
			}
			else
			{
				/* �뺤긽�곸씤 �묎렐�� �꾨땶 寃쎌슦 */
				this.callback_status="fail";
				this.callback_message = "invalid access";
			}
		}
	}
	//�곗꽑 callback �몄� �뺤씤
	this.parseCallBack_check();

	this.get_naver_userprofile = function(callback_func1) {
		$.ajax({
		url: "https://openapi.naver.com/v1/nid/getUserProfile.json?response_type=json",
		type: "GET",
		data: {"access_token":this.oauthParams.access_token},
		dataType: "jsonp",
		jsonp: "oauth_callback",
		success: function (result) {
			inner_profileParams.age           = result.response.age;
			inner_profileParams.birthday      = result.response.birthday;
			inner_profileParams.email         = result.response.email;
			inner_profileParams.enc_id        = result.response.enc_id;
			inner_profileParams.gender        = result.response.gender;
			inner_profileParams.id            = result.response.id;
			inner_profileParams.nickname      = result.response.nickname;
			inner_profileParams.profile_image = result.response.profile_image;
			eval(callback_func1);
		},
		error: function (xhr, ajaxOptions, thrownError) {
			//�먮윭 泥섎━�� �곸젅��
			alert(xhr.status);
			alert(thrownError);
		}
		});
	}
/*
 * �꾨옒 媛믪쓣 name �쇰줈 �ъ슜�� �� �덉쓬.
 * age
 * birthday
 * email
 * enc_id
 * gender
 * id
 * nickname
 * profile_image
 * */
	this.getProfileData = function (name) {
		return inner_profileParams[name];
	}
	this.getOauthMessage = function ()
	{
		return this.callback_message;
	}
	this.getOauthStatus = function ()
	{
		return this.callback_status;
	}
	this.getAccessToken = function ()
	{
		return this.oauthParams.access_token;
	}
}
var inner_profileParams = {};