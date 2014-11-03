Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 5561 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Nov 2014 15:36:26 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0122.outbound.protection.outlook.com [65.55.169.122])
	by mail.openembedded.org (Postfix) with ESMTP id 37EB065D59
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2014 15:36:26 +0000 (UTC)
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Mon, 3 Nov 2014 14:03:43 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.45]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.45]) with mapi id
	15.01.0011.000; Mon, 3 Nov 2014 14:03:42 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>, "koen@dominion.thruhere.net"
	<koen@dominion.thruhere.net>
Thread-Topic: php: museum.php.net is broken - change recipe SRC_URI?
Thread-Index: Ac/3Z5ppbk7ICAEwTw+FbzLtrZYhaA==
Date: Mon, 3 Nov 2014 14:03:42 +0000
Message-ID: <ab38d1872c37433981e9fd312b842a54@BLUPR05MB037.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 00437E920086A800437FDF
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB037;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 0384275935
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(20776003)(66066001)(120916001)(16799955002)(16601075003)(31966008)(74316001)(15202345003)(64706001)(99396003)(54356999)(101416001)(50986999)(19580395003)(92566001)(86362001)(15975445006)(46102003)(87936001)(2656002)(122556002)(40100003)(21056001)(95666004)(99286002)(76576001)(106356001)(229853001)(107886001)(105586002)(108616004)(77096003)(62966003)(33646002)(77156002)(107046002)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR05MB037;
	H:BLUPR05MB037.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
Subject: php: museum.php.net is broken - change recipe SRC_URI?
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
X-List-Received-Date: Mon, 03 Nov 2014 15:36:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIG9mZmljaWFsIFBIUCBhcmNoaXZhbCB2ZXJzaW9uIGRvd25sb2FkIHNpdGUsIGh0dHA6Ly9t
dXNldW0ucGhwLm5ldCwgaGFzIGJlZW4gZG93biBhdCBsZWFzdCBzaW5jZSB0aGUgYmVnaW5uaW5n
IG9mIE9jdG9iZXIuICBUaGlzIGlzIGEgcHJvYmxlbSBmb3IgZGFpc3kgYW5kIG9sZGVyIGJyYW5j
aGVzIGlmIGEgYnVpbGQgYXR0ZW1wdHMgdG8gZmV0Y2ggUEhQLiAgSSBleHBlY3QgdGhpcyBzaXRl
IHdpbGwgYmUgYmFjayB1cCBhZ2FpbiBzb21ldGltZSwgYnV0IGZyb20gcmVhZGluZyB0aGUgY29u
dmVyc2F0aW9uIG9uIHRoZSByZWxhdGVkIFBIUCBidWcgcmVwb3J0IChodHRwczovL2J1Z3MucGhw
Lm5ldC9idWcucGhwP2lkPTY4MTMwKSBJIGRvIG5vdCBiZWxpZXZlIGh0dHA6Ly9tdXNldW0ucGhw
Lm5ldCBjYW4gYmUgdmlld2VkIHRvIGJlIGEgcmVsaWFibGUgYXJjaGl2ZSBpbiB0aGUgZnV0dXJl
LiAgSSBzZWUgdGhhdCBkaXp6eSBjaGFuZ2VkIHRoZSBTUkNfVVJJIHRvIHVzZSBodHRwOi8vd3d3
LnBocC5uZXQvZGlzdHJpYnV0aW9ucyBmb3IgdGhlIG1haW4gZG93bmxvYWQuICBJIGRpZCBzb21l
IHRlc3RpbmcgYW5kIGl0IGFwcGVhcnMgdGhhdCBQSFAgdmVyc2lvbnMgdGhhdCBhcmUgYWJvdXQg
YSB5ZWFyIG9sZCBvciBsZXNzIGFyZSBhdmFpbGFibGUgZnJvbSBodHRwOi8vd3d3LnBocC5uZXQv
ZGlzdHJpYnV0aW9ucy4gIFNvIHdlIGNhbiBhc3N1bWUgdGhhdCBhIHllYXIgZnJvbSBub3cgdGhl
IGRpenp5IGJyYW5jaCBTUkNfVVJJIHdpbGwgbmVlZCB0byBjaGFuZ2UgdG8gc29tZXRoaW5nIGVs
c2UuDQoNCkknZCBwcm9wb3NlIGNoYW5naW5nIHRoZSBTUkNfVVJJIHRvIHNvbWV0aGluZyB0aGF0
IHdpbGwgbm90IGNoYW5nZSBvdmVyIHRpbWUuICBNeSBzdWdnZXN0aW9uIHdvdWxkIGJlIHRoZSBQ
SFAgZGlzdHJpYnV0aW9ucyBHaXQgcmVwb3NpdG9yeSBsb2NhdGVkIGhlcmU6IGh0dHA6Ly9naXQu
cGhwLm5ldC8/cD13ZWIvcGhwLWRpc3RyaWJ1dGlvbnMuZ2l0O2E9c3VtbWFyeS4gIFRoaXMgaXMg
dGhlIHBhdGggc3VnZ2VzdGVkIGluIHRoZSByZWxhdGVkIFBIUCBidWcgbWVudGlvbmVkIGVhcmxp
ZXIuICBUaGUgZGlzYWR2YW50YWdlIGlzIHRoYXQgdGhlIFNSQ19VUkkgd291bGQgcmVmZXIgdG8g
YSBmaWxlIG9uIGEgc3BlY2lmaWMgdGFnLCBzbyB0aGUgU1JDX1VSSSB3b3VsZCBiZSBzcGVjaWZp
YyBmb3IgZWFjaCBQSFAgdmVyc2lvbi4NCg0KQW55IGZ1cnRoZXIgc3VnZ2VzdGlvbnMgb24gaG93
IHRvIGhhbmRsZSB0aGlzPyAgSWYgdGhlIFNSQ19VUkkgZG9lcyBnZXQgdXBkYXRlZCwgaG93IG1h
bnkgYnJhbmNoZXMgYmFjayBzaG91bGQgdGhlIGNoYW5nZSBiZSBtYWRlPw0KDQpSZWdhcmRzLA0K
QnJ5YW4NCg==

