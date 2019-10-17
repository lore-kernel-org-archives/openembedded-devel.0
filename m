Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 4557B7F593
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 13:03:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9HD1nao024888; Thu, 17 Oct 2019 15:03:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : subject :
	date : message-id : references : in-reply-to : content-type :
	content-id :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=osXdz/K443YAnkfJTXNkG5rHQK3h81rUVMJ/cmf695I=;
	b=eiCKztg4+NUJa19Uxclh/bf617lT+JEvt9fl/RGgnp06b/YehoAcDkFQVPvdQxPfIhD1
	lVPRxPO/zx9nFmi2//yERefgU3FkK3RoL/ZoXrK41EzzxlHbPvH6bbPJ98rv2LA4wt7q
	D3ezGhLSOCNlo/JWBxR2+YDywhGAR5AfbR/E1w2qfTnMJmFjJpTREYL2hmw7MQZl/xie
	V6v7JeINPX+LlSma1+SVhiSIiRQ7ETIDxhhfMRHzbZXPiqbfRmCHw9m4lm/gMX6ZUoCH
	ASMUDHoZQdWe5K8GBxu/LRUrENwdtY1fv4W1LDBLaDxr7vCAwbPG7aePV4AWoSZ10PR8
	1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vk4kxbx3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 17 Oct 2019 15:03:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E2EF100034;
	Thu, 17 Oct 2019 15:03:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 95A432074F1; 
	Thu, 17 Oct 2019 15:03:03 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Thu, 17 Oct 2019 15:03:03 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 17 Oct 2019 15:03:03 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-xfce][PATCH 1/3] xfce4-mpc-plugin: Clarify BSD
	license variant
Thread-Index: AQHVhALripn2gCdeWUKSVX5TGB8JT6ddV8OAgAFVGgA=
Date: Thu, 17 Oct 2019 13:03:03 +0000
Message-ID: <f8818f99-5a7e-9f0f-6667-e60abb40ecad@st.com>
References: <20191016092013.6460-1-christophe.priouzeau@st.com>
	<f4efa716-3f05-8e5a-6d39-6182717f3a96@gmail.com>
In-Reply-To: <f4efa716-3f05-8e5a-6d39-6182717f3a96@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-17_04:2019-10-17,2019-10-17 signatures=0
Subject: Re: [meta-xfce][PATCH 1/3] xfce4-mpc-plugin: Clarify BSD license variant
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Oct 2019 13:03:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A444C681534AAE49A11018C89190ABE0@st.com>
Content-Transfer-Encoding: base64

T24gMTAvMTYvMTkgNjo0MiBQTSwgYWt1c3RlcjgwOCB3cm90ZToNCj4NCj4gT24gMTAvMTYvMTkg
MjoyMCBBTSwgQ2hyaXN0b3BoZSBQUklPVVpFQVUgd3JvdGU6DQo+PiBUaGUgTGljZW5zZSBvZiB4
ZmNlNCBtcGMgcGx1Z2luIGlzIEJTRC0wLUNsYXVzZS4NCj4gU2hvdWxkbid0IHRoaXMgYWxzbyBi
ZSBiYWNrcG9ydGVkIHRvIHN0YWJsZSBicmFuY2hlcz8NCkl0IGNhbiBiZSwgdGhlIG1haW4gZ29h
bCBvZiB0aGlzIHNlcmllcyBvZiBwYXRjaCBhcmUgdG8gcmVtb3ZlIGFsbCBjYWxsIA0Kb2YgQlNE
IGxpY2Vuc2UgYW5kDQpyZXBsYWNlIGl0IGJ5IHRoZSBjb3JyZXNwb25kZW50IEJEUyBsaWNlbnNl
IChoZXJlIEJTRC0wLUNsYXVzZSkNCj4NCj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUg
UHJpb3V6ZWF1IDxjaHJpc3RvcGhlLnByaW91emVhdUBzdC5jb20+DQo+PiAtLS0NCj4+ICAgLi4u
L3hmY2U0LW1wYy1wbHVnaW4veGZjZTQtbXBjLXBsdWdpbl8wLjUuMi5iYiAgICAgICAgICAgICAg
ICAgIHwgMiArLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS14ZmNlL3JlY2lwZXMtbXVsdGltZWRpYS94
ZmNlNC1tcGMtcGx1Z2luL3hmY2U0LW1wYy1wbHVnaW5fMC41LjIuYmIgYi9tZXRhLXhmY2UvcmVj
aXBlcy1tdWx0aW1lZGlhL3hmY2U0LW1wYy1wbHVnaW4veGZjZTQtbXBjLXBsdWdpbl8wLjUuMi5i
Yg0KPj4gaW5kZXggZmY5NTRhY2I4Li45ZDAzMWRkNTkgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhLXhm
Y2UvcmVjaXBlcy1tdWx0aW1lZGlhL3hmY2U0LW1wYy1wbHVnaW4veGZjZTQtbXBjLXBsdWdpbl8w
LjUuMi5iYg0KPj4gKysrIGIvbWV0YS14ZmNlL3JlY2lwZXMtbXVsdGltZWRpYS94ZmNlNC1tcGMt
cGx1Z2luL3hmY2U0LW1wYy1wbHVnaW5fMC41LjIuYmINCj4+IEBAIC0xLDcgKzEsNyBAQA0KPj4g
ICBTVU1NQVJZID0gIlNpbXBsZSBjbGllbnQgcGx1Z2luIGZvciBNdXNpYyBQbGF5ZXIgRGFlbW9u
Ig0KPj4gICBIT01FUEFHRSA9ICJodHRwczovL2dvb2RpZXMueGZjZS5vcmcvcHJvamVjdHMvcGFu
ZWwtcGx1Z2lucy94ZmNlNC1tcGMtcGx1Z2luIg0KPj4gICBTRUNUSU9OID0gIngxMS9hcHBsaWNh
dGlvbiINCj4+IC1MSUNFTlNFID0gIkJTRCINCj4+ICtMSUNFTlNFID0gIkJTRC0wLUNsYXVzZSIN
Cj4+ICAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MzYwNGQ5ODdlNmRm
ZGZjNjcyYzc1NGQwODk1M2IwZTAiDQo+PiAgIA0KPj4gICBpbmhlcml0IHhmY2UtcGFuZWwtcGx1
Z2lu

