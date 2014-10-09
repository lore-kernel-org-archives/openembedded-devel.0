Return-Path: <prvs=13524be160=pfink@christ-elektronik.de>
X-Greylist: delayed 344 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Oct 2014 07:19:09 UTC
Received: from richard.christ-ag.com (richard.christ-ag.com [145.253.160.98])
	by mail.openembedded.org (Postfix) with ESMTP id 364996A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Oct 2014 07:19:09 +0000 (UTC)
Received: from richard.christ-ag.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	A83507A92F_4363594B for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Oct 2014 07:13:24 +0000 (GMT)
Received: from BEXBE01.christ.local (bexbe01.christ.local [172.16.100.25])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(Client CN "mail.christ-ag.com", Issuer "CHRIST-CA" (not verified))
	by richard.christ-ag.com (Sophos Email Appliance) with ESMTPS id
	6D28C79A93_4363594F for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Oct 2014 07:13:24 +0000 (GMT)
Received: from BEXBE01.christ.local ([fe80::89a:7a19:86a4:56c5]) by
	BEXBE01.christ.local ([fe80::89a:7a19:86a4:56c5%12]) with mapi id
	14.02.0347.000; Thu, 9 Oct 2014 09:13:23 +0200
From: "Fink, Peter" <pfink@christ-elektronik.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5] How to build Qt5 with 'designer' module?
Thread-Index: Ac/jkGHPiTetautNTZSwCdpm/OcB7A==
Date: Thu, 9 Oct 2014 07:13:23 +0000
Message-ID: <F50ED7964AF8784493DDA71A307917F96F0F63@BEXBE01.christ.local>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.25.54]
MIME-Version: 1.0
Subject: [meta-qt5] How to build Qt5 with 'designer' module?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Oct 2014 07:19:17 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCknigJltIHRyeWluZyB0byBidWlsZCBhIFF0IGFwcGxpY2F0aW9uIHdpdGggdGhlIHRv
b2xjaGFpbiBnZW5lcmF0ZWQgYnkgb3BlbmVtYmVkZGVkIChtZXRhLXRvb2xjaGFpbi1xdDUpLg0K
DQpUaGUgYXBwbGljYXRpb24gbmVlZHMgdGhlIGRlc2lnbmVyLW1vZHVsZSwgd2hpY2ggSSB0aG91
Z2h0IHdhcyBpbmNsdWRlZCBpbiB0aGUgcXR0b29scyBwYWNrYWdlLCBidXQgbm93IEkgZ2V0IHRo
ZSBmb2xsb3dpbmcgZXJyb3I6DQoNCuKAnFByb2plY3QgRXJyb3I6IFVua25vd24gbW9kdWxlKHMp
IGluIFFUOiBkZXNpZ25lci7igJ0NCg0KV2hhdCBkbyBJIGhhdmUgdG8gaW5jbHVkZSB0byBnZXQg
dGhlIGRlc2lnbmVyIG1vZHVsZT8NCg0KQW5vdGhlciB0aGluZyBJIHJ1biBpbnRvIHdhcyB0aGUg
bWlzc2luZyBzeW5jcXQucGwgc2NyaXB0IGluIHRoZSB0b29sY2hhaW4gYXMgSSBuZWVkIHFmdHAu
IEEgbGluayBzeW5jcXQgLT4gc3luY3F0LnBsIHdhcyBwcmVzZW50Lg0KSXMgaXQgbWlzc2luZyBi
eSBhY2NpZGVudCBvciBmb3IgYSByZWFzb24/DQoNCkkgd2FzIHVzaW5nIFF0LiA1LjMuMSAwMjg2
MWU2NzdhYi4uLi4NCg0KVGhhbmtzIGluIGFkdmFuY2UgYW5kIGJlc3QgcmVnYXJkcywNClBldGVy
IEZpbmsNCk90dG8gQ2hyaXN0IEFHDQpodHRwOi8vd3d3LmNocmlzdC1hZy5jb20NCg0KTWl0Z2xp
ZWRlciBkZXMgVm9yc3RhbmRlczogT3R0byBDaHJpc3QgKFZvcnNpdHplbmRlcikgLSBBbGV4YW5k
ZXIgQ2hyaXN0IC0gRW5nZWxiZXJ0IEhhZ2dlbm3DvGxsZXIgLSBNYXJrdXMgQ2hyaXN0DQpBdWZz
aWNodHNyYXRzdm9yc2l0emVuZGVyOiBPdHRvIENocmlzdA0KSGF1cHRzaXR6OiBNZW1taW5nZXIg
U3RyLiA1MSA4NzczNCBCZW5uaW5nZW4NCkFtdHNnZXJpY2h0IE1lbW1pbmdlbiBIUkIgOTEwMA0K
DQpEaWVzZSBFLU1haWwgZW50aMOkbHQgdmVydHJhdWxpY2hlIHVuZC9vZGVyIHJlY2h0bGljaCBn
ZXNjaMO8dHp0ZSBJbmZvcm1hdGlvbmVuLiBXZW5uIFNpZSBuaWNodCBkZXIgcmljaHRpZ2UgQWRy
ZXNzYXQgc2luZCBvZGVyIGRpZXNlIEUtTWFpbCBpcnJ0w7xtbGljaCBlcmhhbHRlbiBoYWJlbiwg
aW5mb3JtaWVyZW4gU2llIGJpdHRlIHNvZm9ydCBkZW4gQWJzZW5kZXIgdW5kIHZlcm5pY2h0ZW4g
U2llIGRpZXNlIE1haWwuIERhcyB1bmVybGF1YnRlIEtvcGllcmVuIHNvd2llIGRpZSB1bmJlZnVn
dGUgV2VpdGVyZ2FiZSBkaWVzZXIgTWFpbCBzaW5kIG5pY2h0IGdlc3RhdHRldC4NClRoaXMgZS1t
YWlsIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBhbmQvb3IgcHJpdmlsZWdlZCBpbmZvcm1hdGlv
bi4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCAob3IgaGF2ZSByZWNlaXZl
ZCB0aGlzIGUtbWFpbCBpbiBlcnJvcikgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0
ZWx5IGFuZCBkZXN0cm95IHRoaXMgZS1tYWlsLiBBbnkgdW5hdXRob3JpemVkIGNvcHlpbmcsIGRp
c2Nsb3N1cmUgb3IgZGlzdHJpYnV0aW9uIG9mIHRoZSBtYXRlcmlhbCBpbiB0aGlzIGUtbWFpbCBp
cyBzdHJpY3RseSBmb3JiaWRkZW4uDQo=

