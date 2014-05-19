Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 915 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 May 2014 15:17:35 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com (unknown
	[207.46.163.206])
	by mail.openembedded.org (Postfix) with ESMTP id BD47865F1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 May 2014 15:17:34 +0000 (UTC)
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB040.namprd05.prod.outlook.com (10.255.210.156) with Microsoft
	SMTP Server (TLS) id 15.0.944.11; Mon, 19 May 2014 15:02:07 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.15.171]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.15.171]) with mapi id
	15.00.0944.000; Mon, 19 May 2014 15:02:07 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: update-alternatives for ifplugd?
Thread-Index: Ac9zcovOghSE8UWaQsyefn5iOT4llQ==
Date: Mon, 19 May 2014 15:02:06 +0000
Message-ID: <c5fdb12297784423b71b07246b8960c8@BLUPR05MB037.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 00B3EA230072C200B3EB70
x-originating-ip: [98.100.91.242]
x-forefront-prvs: 021670B4D2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(6009001)(428001)(199002)(189002)(87936001)(79102001)(2656002)(80022001)(66066001)(54356999)(50986999)(85852003)(74316001)(15202345003)(64706001)(20776003)(86362001)(101416001)(76576001)(83072002)(46102001)(92566001)(31966008)(15975445006)(4396001)(19580395003)(77982001)(99286001)(21056001)(74502001)(99396002)(81542001)(83322001)(33646001)(76482001)(81342001)(24736002);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR05MB040;
	H:BLUPR05MB037.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (: melinkcorp.com does not designate permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bevenson@melinkcorp.com; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
Subject: update-alternatives for ifplugd?
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
X-List-Received-Date: Mon, 19 May 2014 15:17:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxsLA0KDQpUaGlzIGlzIHJlbGF0ZWQgdG8gdGhlIGlmcGx1Z2QgcGF0Y2ggdGhyZWFkIGZyb20g
YSBmZXcgd2Vla3MgYWdvLCB3aGljaCB5b3UgY2FuIGZpbmQgaGVyZTogaHR0cDovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvcGlwZXJtYWlsL29wZW5lbWJlZGRlZC1kZXZlbC8yMDE0LU1heS8wOTU3
NTEuaHRtbC4gIEV2ZW4gdGhvdWdoIHRoaXMgcmVsYXRlcyB0byB0aGF0IHRocmVhZCwgSSBmaWd1
cmVkIHRoZSBxdWVzdGlvbiB3YXMgZGlmZmVyZW50IGVub3VnaCB0byB3YXJyYW50IGEgbmV3IHRo
cmVhZC4NCg0KSSBwbGFuIG9uIHVzaW5nIGlmcGx1Z2Qgb24gbXkgc3lzdGVtLiAgQ29ubm1hbiB3
aXRoIGl0cyBkZXBlbmRlbmNpZXMgYWRkZWQgYWJvdXQgNSBNQiB0byBteSBpbWFnZSBhbmQgSSBj
b3VsZG4ndCBqdXN0aWZ5IHRoZSBhZGRlZCBzcGFjZSB3aGVuIGEgc21hbGxlciBhcHBsaWNhdGlv
biB3b3VsZCBkbyB0aGUgc2FtZSBqb2IgZm9yIHVzLiAgSSBoYXZlIHRyaWVkIHVzaW5nIHRoZSBp
ZnBsdWdkIGFwcGxldCB3aXRoIEJ1c3lib3ggd2l0aG91dCBzdWNjZXNzLCBidXQgdGhlIGZ1bGwg
aWZwbHVnZCBwYWNrYWdlIGdlbmVyYXRlZCB3aXRoIHRoZSByZWNpcGUgaW4gdGhlIHByZXZpb3Vz
bHkgcmVmZXJlbmNlIHRocmVhZCB3b3JrcyBmb3IgbWUuICBIb3dldmVyLCBzaW5jZSBCdXN5Ym94
IGNhbiBiZSB1c2VkIGFzIGlmcGx1Z2QgZGVwZW5kaW5nIG9uIGl0cyBjb25maWd1cmF0aW9uLCBJ
J20gYXNzdW1pbmcgaXQnZCBiZSBiZXN0IHRvIGhhdmUgYW4gdXBkYXRlLWFsdGVybWF0aXZlcyBy
ZWZlcmVuY2UgaW4gdGhpcyBpZnBsdWdkIHJlY2lwZS4gIEFmdGVyIHJlYWRpbmcgdGhlIFlvY3Rv
IGRvY3VtZW50YXRpb24gYW5kIHNlZWluZyBzb21lIGV4YW1wbGVzLCBJIHN0aWxsIGRvbid0IHVu
ZGVyc3RhbmQgaG93IHVwZGF0ZS1hbHRlcm5hdGl2ZXMgd29ya3MgYW5kIGhvdyB0byB1c2UgaXQg
aW4gdGhpcyByZWNpcGUuDQoNClRoZXJlIGlzIGEgcmVhbCB3b3JsZCBzY2VuYXJpbyB0aGF0IEkn
bSB0cnlpbmcgdG8gaGFuZGxlLiAgSSBoYWQgc29tZSByZWxlYXNlcyBpbiB3aGljaCBCdXN5Ym94
IGhhZCB0aGUgaWZwbHVnZCBjb25maWd1cmF0aW9uIG9wdGlvbiBpbmNsdWRlZCwgYnV0IHRoYXQg
aXMgbm8gbG9uZ2VyIHRoZSBjYXNlLiBJZiBhIGZpcm13YXJlIHVwZ3JhZGUgaW5zdGFsbGVkIHRo
ZSBmdWxsIGlmcGx1Z2QgcGFja2FnZSBhbmQgdXBncmFkZWQgQnVzeWJveCB0byBubyBsb25nZXIg
aW5jbHVkZSBpZnBsdWdkLCB0aGUgaWZwbHVnZCBiaW5hcnkgd291bGQgbm90IGV4aXN0IGluIC91
c3IvYmluLiAgSSB0aGluayB0aGUgQnVzeWJveCB1cGdyYWRlIHdvdWxkIGRlbGV0ZSB0aGUgbm8t
bG9uZ2VyIG5lZWRlZCBzb2Z0bGluayB0byAvdXNyL2Jpbi9pZnBsdWdkLCBidXQgdGhpcyB3b3Vs
ZCBvY2N1ciBhZnRlciB0aGUgaWZwbHVnZCBwYWNrYWdlIHdhcyBpbnN0YWxsZWQuICBXb3VsZCB0
aGUgcHJvcGVyIHVwZGF0ZS1hbHRlcm5hdGl2ZXMgcmVmZXJlbmNlIGluIHRoaXMgcmVjaXBlIGZp
eCB0aGlzIHNjZW5hcmlvPw0KDQpSZWdhcmRzLA0KQnJ5YW4NCg0K

