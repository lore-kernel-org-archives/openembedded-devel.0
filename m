Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <craig.mcqueen@beamcommunications.com>)
	id 1SUvdo-0004zc-48 for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 10:00:56 +0200
Received: from mail109-db3-R.bigfish.com (10.3.81.241) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.23; Thu, 17 May 2012 07:35:40 +0000
Received: from mail109-db3 (localhost [127.0.0.1])	by
	mail109-db3-R.bigfish.com (Postfix) with ESMTP id 7C42C4073A	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 07:35:40 +0000 (UTC)
X-SpamScore: 0
X-BigFish: PS0(zzzz1202hzz8275dhz2dh2a8h668h839h93fhd25h)
X-Forefront-Antispam-Report: CIP:111.221.66.13; KIP:(null); UIP:(null); IPV:NLI;
	H:HKNPRD0204HT001.apcprd02.prod.outlook.com; RD:none; EFVD:NLI
Received: from mail109-db3 (localhost.localdomain [127.0.0.1]) by mail109-db3
	(MessageSwitch) id 1337240138540822_10439;
	Thu, 17 May 2012 07:35:38 +0000 (UTC)
Received: from DB3EHSMHS006.bigfish.com (unknown [10.3.81.240])	by
	mail109-db3.bigfish.com (Postfix) with ESMTP id 75E4114004E	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 07:35:38 +0000 (UTC)
Received: from HKNPRD0204HT001.apcprd02.prod.outlook.com (111.221.66.13) by
	DB3EHSMHS006.bigfish.com (10.3.87.106) with Microsoft SMTP Server (TLS)
	id 14.1.225.23; Thu, 17 May 2012 07:35:38 +0000
Received: from HKNPRD0204MB116.apcprd02.prod.outlook.com ([169.254.12.104]) by
	HKNPRD0204HT001.apcprd02.prod.outlook.com ([10.9.122.175]) with mapi
	id 14.15.0074.002; Thu, 17 May 2012 07:34:26 +0000
From: Craig McQueen <craig.mcqueen@beamcommunications.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Python exception running step do_package_update_index_ipk in
	OE classic
Thread-Index: Ac0z/4Nh6Z8G6AS6SLGJqRwX1TV9Uw==
Date: Thu, 17 May 2012 07:34:24 +0000
Message-ID: <DB8F1B3EEF94C3439BFFE674EB05E3CC028713@HKNPRD0204MB116.apcprd02.prod.outlook.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.9.122.7]
MIME-Version: 1.0
X-OriginatorOrg: beamcommunications.com
Subject: Python exception running step do_package_update_index_ipk in OE classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 08:00:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSdtIHRyeWluZyB0byBidWlsZCBPRSBjbGFzc2ljIGZvciBpLk1YMjgsIGZvbGxvd2luZyBpbnN0
cnVjdGlvbnMgYXQ6DQpodHRwOi8vd3d3LmlteGRldi5vcmcvd2lraS9pbmRleC5waHA/dGl0bGU9
QWxsX0JvYXJkc19PcGVuRW1iZWRkZWQNCg0KSSdtIHRyeWluZyB0byBydW46DQogIGJpdGJha2Ug
Ym9vdHN0cmFwLWltYWdlDQoNCkl0IGlzIGZhaWxpbmcgb24gYSBzdGVwIGRvX3BhY2thZ2VfdXBk
YXRlX2luZGV4X2lwayB3aGVuIGNhbGxpbmcgUHl0aG9uIHByb2dyYW0gb3BrZy1tYWtlLWluZGV4
LiBTZWUgZXJyb3IgYmVsb3cuDQoNClRoZSBwcm9ibGVtIGlzIHdoZW4gaXQgY2FsbHMgc3VicHJv
Y2Vzcy5jaGVja19vdXRwdXQoKSwgYnV0IGNoZWNrX291dHB1dCgpIGlzIG9ubHkgaW4gUHl0aG9u
IDIuNywgYnV0IG5vdCBQeXRob24gMi42Lg0KDQpPbiBteSBtYWNoaW5lLCBQeXRob24gMi43IGlz
IGluc3RhbGxlZCwgaG93ZXZlciBpdCBzZWVtcyB0aGF0IE9FIG11c3QgYmUgcnVubmluZyBQeXRo
b24gMi42LiBJIHNlZSB0aGF0IE9FIGJ1aWxkcyBQeXRob24gMi42IGluIHRtcC93b3JrL2k2ODYt
bGludXgvcHl0aG9uLW5hdGl2ZS0yLjYuNi1tbDEyLjAuDQoNCldoYXQgd291bGQgYmUgYSBnb29k
IHdheSB0byBmaXggdGhpcz8NCg0KUmVnYXJkcywNCkNyYWlnIE1jUXVlZW4NCg0KTk9URTogUnVu
bmluZyB0YXNrIDQwNTYgb2YgNDA2MCAoSUQ6IDE4LCAvaG9tZS9jcmFpZ20vb3BlbmVtYmVkZGVk
L3N0dWZmL29wZW5lbWJlZGRlZC9yZWNpcGVzL2ltYWdlcy9ib290c3RyYXAtaW1hZ2UuYmIsIGRv
X3BhY2thZ2VfdXBkYXRlX2luZGV4X2lwaykNCk5PVEU6IHBhY2thZ2UgYm9vdHN0cmFwLWltYWdl
LTEuMC1yMDogdGFzayBkb19wYWNrYWdlX3VwZGF0ZV9pbmRleF9pcGs6IFN0YXJ0ZWQNCkVSUk9S
OiBMb2dmaWxlIG9mIGZhaWx1cmUgc3RvcmVkIGluOiAvaG9tZS9jcmFpZ20vb3BlbmVtYmVkZGVk
L3N0dWZmL3RtcC93b3JrL214MjhldmstYW5nc3Ryb20tbGludXgtZ251ZWFiaS9ib290c3RyYXAt
aW1hZ2UtMS4wLXIwL3RlbXAvbG9nLmRvX3BhY2thZ2VfdXBkYXRlX2luZGV4X2lway4yMDA0OQ0K
TG9nIGRhdGEgZm9sbG93czoNCnwgKyBkb19wYWNrYWdlX3VwZGF0ZV9pbmRleF9pcGsNCnwgKyBz
ZXQgLXgNCnwgKyBpcGtnYXJjaHM9J2FsbCBhbnkgbm9hcmNoIGFybSAgYXJtdjQgYXJtdjR0IGFy
bXY1dGUgbXgyOGV2aycNCnwgKyAnWycgJyEnIC16ICcnICddJw0KfCArIG1rZGlyIC1wIC9ob21l
L2NyYWlnbS9vcGVuZW1iZWRkZWQvc3R1ZmYvdG1wL2RlcGxveS9lZ2xpYmMvaXBrDQp8ICsgdG91
Y2ggL2hvbWUvY3JhaWdtL29wZW5lbWJlZGRlZC9zdHVmZi90bXAvZGVwbG95L2VnbGliYy9pcGsv
UGFja2FnZXMNCnwgKyBvcGtnLW1ha2UtaW5kZXggLXIgL2hvbWUvY3JhaWdtL29wZW5lbWJlZGRl
ZC9zdHVmZi90bXAvZGVwbG95L2VnbGliYy9pcGsvUGFja2FnZXMgLXAgL2hvbWUvY3JhaWdtL29w
ZW5lbWJlZGRlZC9zdHVmZi90bXAvZGVwbG95L2VnbGliYy9pcGsvUGFja2FnZXMgLWwgL2hvbWUv
Y3JhaWdtL29wZW5lbWJlZGRlZC9zdHVmZi90bXAvZGVwbG95L2VnbGliYy9pcGsvUGFja2FnZXMu
ZmlsZWxpc3QgLW0gL2hvbWUvY3JhaWdtL29wZW5lbWJlZGRlZC9zdHVmZi90bXAvZGVwbG95L2Vn
bGliYy9pcGsNCnwgVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0KfCAgIEZpbGUg
Ii9ob21lL2NyYWlnbS9vcGVuZW1iZWRkZWQvc3R1ZmYvdG1wL3N5c3Jvb3RzL2k2ODYtbGludXgv
dXNyL2Jpbi9vcGtnLW1ha2UtaW5kZXgiLCBsaW5lIDE4OSwgaW4gPG1vZHVsZT4NCnwgICAgIHJj
ID0gc3VicHJvY2Vzcy5jaGVja19vdXRwdXQoZ3ppcF9jbWQsIHNoZWxsPVRydWUpDQp8IEF0dHJp
YnV0ZUVycm9yOiAnbW9kdWxlJyBvYmplY3QgaGFzIG5vIGF0dHJpYnV0ZSAnY2hlY2tfb3V0cHV0
Jw0KTk9URTogcGFja2FnZSBib290c3RyYXAtaW1hZ2UtMS4wLXIwOiB0YXNrIGRvX3BhY2thZ2Vf
dXBkYXRlX2luZGV4X2lwazogRmFpbGVkDQpFUlJPUjogRnVuY3Rpb24gJ2RvX3BhY2thZ2VfdXBk
YXRlX2luZGV4X2lwaycgZmFpbGVkIChzZWUgL2hvbWUvY3JhaWdtL29wZW5lbWJlZGRlZC9zdHVm
Zi90bXAvd29yay9teDI4ZXZrLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvYm9vdHN0cmFwLWltYWdl
LTEuMC1yMC90ZW1wL2xvZy5kb19wYWNrYWdlX3VwZGF0ZV9pbmRleF9pcGsuMjAwNDkgZm9yIGZ1
cnRoZXIgaW5mb3JtYXRpb24pDQpFUlJPUjogVGFzayAxOCAoL2hvbWUvY3JhaWdtL29wZW5lbWJl
ZGRlZC9zdHVmZi9vcGVuZW1iZWRkZWQvcmVjaXBlcy9pbWFnZXMvYm9vdHN0cmFwLWltYWdlLmJi
LCBkb19wYWNrYWdlX3VwZGF0ZV9pbmRleF9pcGspIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAnMScN
CkVSUk9SOiAnL2hvbWUvY3JhaWdtL29wZW5lbWJlZGRlZC9zdHVmZi9vcGVuZW1iZWRkZWQvcmVj
aXBlcy9pbWFnZXMvYm9vdHN0cmFwLWltYWdlLmJiJyBmYWlsZWQNCg0K



