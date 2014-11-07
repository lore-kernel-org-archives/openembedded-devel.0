Return-Path: <bevenson@melinkcorp.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0120.outbound.protection.outlook.com [65.55.169.120])
	by mail.openembedded.org (Postfix) with ESMTP id 89A3760557
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 13:31:07 +0000 (UTC)
Received: from BY2PR05MB045.namprd05.prod.outlook.com (10.242.34.143) by
	BY2PR05MB029.namprd05.prod.outlook.com (10.242.34.139) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Fri, 7 Nov 2014 13:31:05 +0000
Received: from BY2PR05MB048.namprd05.prod.outlook.com (10.242.34.156) by
	BY2PR05MB045.namprd05.prod.outlook.com (10.242.34.143) with Microsoft
	SMTP Server (TLS) id 15.1.16.15; Fri, 7 Nov 2014 13:31:03 +0000
Received: from BY2PR05MB048.namprd05.prod.outlook.com ([169.254.9.151]) by
	BY2PR05MB048.namprd05.prod.outlook.com ([169.254.9.151]) with mapi id
	15.01.0016.006; Fri, 7 Nov 2014 13:31:03 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: PRINC migration questions
Thread-Index: Ac/6ioposBgxHVLQTxCI6lQhvHJI4g==
Date: Fri, 7 Nov 2014 13:31:02 +0000
Message-ID: <e111da9e0a424a2eac00f684ba4da94f@BY2PR05MB048.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 003161AF00871A003162FC
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR05MB045;UriScan:;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(189002)(199003)(20776003)(77156002)(87936001)(99396003)(77096003)(105586002)(64706001)(66066001)(21056001)(450100001)(62966003)(229853001)(2351001)(107886001)(107046002)(31966008)(46102003)(95666004)(110136001)(120916001)(106356001)(99286002)(54356999)(50986999)(101416001)(108616004)(40100003)(122556002)(74316001)(33646002)(92566001)(554214002)(97736003)(76576001)(4396001)(2656002)(86362001)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR05MB045;
	H:BY2PR05MB048.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR05MB029;
X-OriginatorOrg: melinkcorp.com
Subject: PRINC migration questions
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
X-List-Received-Date: Fri, 07 Nov 2014 13:31:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxsLA0KDQpJIGFtIG9uIHBva3kvZHlsYW4gYW5kIGhhdmUgbm90IHlldCBzdGFydGVkIHVzaW5n
IHRoZSBQUiBzZXJ2ZXIuICBJIHJlYWxseSBkbyB3YW50IHRvIHN0YXJ0IHVzaW5nIHRoZSBQUiBz
ZXJ2ZXIgYW5kIHN0b3AgdXNpbmcgUFJJTkMuICBIb3dldmVyLCBldmVuIG1vcmUgc28gSSByZWFs
bHkgZG9uJ3Qgd2FudCB0byBicmVhayBteSBwYWNrYWdlIGZlZWRzLiAgSSB3YW50IHRvIG1ha2Ug
c3VyZSBJIGRvIG15IG1pZ3JhdGlvbiBjb3JyZWN0bHkgYW5kIEkgZG9uJ3QgZG8gc29tZXRoaW5n
IHRoYXQgbG9va3MgbGlrZSBpdCB3b3JrcyBva2F5IG9ubHkgdG8gZmluZCBvdXQgaXQgY2F1c2Vz
IHByb2JsZW1zIGxhdGVyLiAgV2l0aCB0aGF0IGluIG1pbmQsIEkgYW0gbG9va2luZyBmb3IgYWR2
aWNlIG9uIHRoZSBwcm9wZXIgd2F5IHRvIG1pZ3JhdGUgYXdheSBmcm9tIHVzaW5nIFBSSU5DLg0K
DQpMZXQncyBzYXkgSSBoYXZlIGEgLmJiYXBwZW5kIGluIG15IHByaXZhdGUgbGF5ZXIgd2l0aCB0
aGUgbGluZToNCg0KUFJJTkMgOj0gIiR7QGludChQUklOQykgKyA0fSINCg0KVGhlIG1haW5saW5l
IGxheWVyJ3MgLmJiIGhhcyB0aGUgbGluZToNCg0KUFIgPSAiJHtJTkNfUFJ9LjAiDQoNCkFuZCB0
aGUgbWFpbmxpbmUgbGF5ZXIncyAuaW5jIGhhcyB0aGUgbGluZToNCg0KSU5DX1BSID0gInI4Ig0K
DQpJbiB0aGlzIHNjZW5hcmlvLCB0aGUgcmVzdWx0aW5nIFBSIHdpbGwgYmUgInIxMi4wIi4gIE5v
dyBsZXQncyBzYXkgSSB3YW50IHRvIHN0YXJ0IHVzaW5nIHRoZSBQUiBzZXJ2ZXIgYW5kIGdldCBy
aWQgb2YgUFJJTkMgaW4gdGhpcyByZWNpcGUuICBUaGUgcmVzdWx0aW5nIHBhY2thZ2UgY29udGVu
dHMgYXJlIHRvIGJlIHRoZSBzYW1lLCBzbyBJIHdhbnQgdGhlIHJlc3VsdGluZyBQUiB0byBiZSAi
cjEyLjAiLiAgRnJvbSBzb21lIGxpbWl0ZWQgdGVzdGluZywgaWYgSSBzdGFydCB0aGUgUFIgc2Vy
dmVyIGFuZCByZW1vdmUgdGhlIFBSSU5DIGxpbmUgZnJvbSBteSAuYmJhcHBlbmQgdGhlIHJlc3Vs
dGluZyBQUiBpcyAicjguMCIuICBTbyBpbiBteSAuYmJhcHBlbmQgc2hvdWxkIEkgY2hhbmdlIHRo
ZSBQUklOQyBsaW5lIHRvOg0KDQpJTkNfUFIgPSAicjEyIg0KDQpPciBzaG91bGQgSSBjaGFuZ2Ug
aXQgdG8gc29tZXRoaW5nIGVsc2U/ICBJZiBJIGNoYW5nZSBpdCB0byBhIGhhcmRjb2RlZCB2YWx1
ZSwgdGhlbiBJJ2xsIGhhdmUgdG8gYmUgY2FyZWZ1bCBhYm91dCB3aGF0IHRvIGRvIGlmIHRoZSBt
YWlubGluZSByZWNpcGUgY2hhbmdlcyBJTkNfUFIuICBIb3cgaGF2ZSBvdGhlciBwZW9wbGUgaGFu
ZGxlZCB0aGlzIHNpdHVhdGlvbj8NCg0KVGhhbmtzLA0KQnJ5YW4NCg==

