Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 4686 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Oct 2014 14:27:01 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0115.outbound.protection.outlook.com [157.56.110.115])
	by mail.openembedded.org (Postfix) with ESMTP id DD6B065F77
	for <Openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 14:27:01 +0000 (UTC)
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) with Microsoft
	SMTP Server (TLS) id 15.0.1039.15; Wed, 1 Oct 2014 12:54:31 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.248]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.248]) with mapi id
	15.00.1039.011; Wed, 1 Oct 2014 12:54:31 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Thread-Topic: Status of bash patches for dora and dylan?
Thread-Index: Ac/ddCO+l5fPNKfGTwWxrzxSXdYmFA==
Date: Wed, 1 Oct 2014 12:54:31 +0000
Message-ID: <92223d60b43647d8ba3265cdd621166e@BLUPR05MB037.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 0038ABD90083260038AD26
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB037;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(199003)(189002)(164054003)(21056001)(10300001)(107046002)(2656002)(4396001)(31966008)(99396003)(97736003)(85852003)(86362001)(46102003)(50986999)(2351001)(107886001)(120916001)(110136001)(80022003)(229853001)(87936001)(54356999)(101416001)(76482002)(92566001)(106356001)(74316001)(33646002)(76576001)(95666004)(108616004)(20776003)(99286002)(105586002)(85306004)(64706001)(77096002)(66066001)(24736002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR05MB037;
	H:BLUPR05MB037.namprd05.prod.outlook.com; FPR:; MLV:ovrnspm;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
Subject: Status of bash patches for dora and dylan?
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
X-List-Received-Date: Wed, 01 Oct 2014 14:27:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBzZWUgdGhhdCBwYXRjaGVzIGZvciBiYXNoIHRvIGZpeCBDVkUtMjAxNC03MTY5IGFuZCBDVkUt
MjAxNC02MjcxIGhhdmUgYmVlbiBhcHBsaWVkIHRvIHRoZSBkYWlzeSBhbmQgbWFzdGVyIGJyYW5j
aGVzIG9mIG9wZW5lbWJlZGRlZC1jb3JlIHR3byBkYXlzIGFnby4gIEkgc2F3IHNvbWUgdGFsayBv
biB0aGlzIG1haWxpbmcgbGlzdCBhYm91dCBhcHBseWluZyB0aGUgcGF0Y2hlcyB0byB0aGUgZG9y
YSBhbmQgZHlsYW4uICBBcmUgdGhlIHBhdGNoZXMgc3RpbGwgcGxhbm5lZCB0byBiZSBhcHBsaWVk
IHRvIHRoZSBkb3JhIGFuZCBkeWxhbiBicmFuY2hlcz8gIElmIHNvLCBkb2VzIHNvbWVvbmUgaGF2
ZSBhIHRpbWVmcmFtZSBpbiBtaW5kIGZvciBiYWNrcG9ydGluZyB0aGUgcGF0Y2hlcz8gIElmIG5v
dCwgZG8geW91IG5lZWQgc29tZW9uZSB0byBjaGVycnktcGljayB0aGUgY29tbWl0cyBhbmQgdmVy
aWZ5IHRoZXkgd29yayBhcyBleHBlY3RlZCBvbiB0aGUgZG9yYSBhbmQgZHlsYW4gYnJhbmNoZXM/
DQoNClRoYW5rcywNCkJyeWFuDQoNCg0K

