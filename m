Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 4875 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Nov 2014 15:28:08 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0132.outbound.protection.outlook.com [157.56.111.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3477D65CA0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Nov 2014 15:28:08 +0000 (UTC)
Received: from BLUPR05MB039.namprd05.prod.outlook.com (10.255.210.148) by
	BLUPR05MB546.namprd05.prod.outlook.com (10.141.202.14) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Thu, 6 Nov 2014 15:28:07 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB039.namprd05.prod.outlook.com (10.255.210.148) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Thu, 6 Nov 2014 15:28:05 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.45]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.45]) with mapi id
	15.01.0011.000; Thu, 6 Nov 2014 15:28:05 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Upgrading files identified as CONFFILES?
Thread-Index: Ac/5yU7QRBMArZ3lTly8PxdgPYe0ZgABZxIAAAGxM2A=
Date: Thu, 6 Nov 2014 15:28:05 +0000
Message-ID: <2cc110b58da14640a9cb17d57ef353d4@BLUPR05MB037.namprd05.prod.outlook.com>
References: <e27387e29a0b4a7ea1620837f6507de1@BLUPR05MB037.namprd05.prod.outlook.com>
	<CANyK_8eahU+SLTCO_B8GhW3uZVsf-UtGsWSW628uCCPAwpb_og@mail.gmail.com>
In-Reply-To: <CANyK_8eahU+SLTCO_B8GhW3uZVsf-UtGsWSW628uCCPAwpb_og@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 008D21F4008700008D2341
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB039;UriScan:;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(51704005)(377454003)(51914003)(24454002)(164054003)(189002)(13464003)(64706001)(74316001)(92566001)(77156002)(20776003)(110136001)(33646002)(86362001)(15202345003)(46102003)(62966003)(77096003)(122556002)(50986999)(107046002)(66066001)(76176999)(54356999)(40100003)(97736003)(15975445006)(2656002)(4396001)(87936001)(76576001)(19580395003)(19580405001)(101416001)(105586002)(31966008)(95666004)(106356001)(2351001)(99286002)(99396003)(108616004)(120916001)(21056001)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR05MB039;
	H:BLUPR05MB037.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:3; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB546;
X-OriginatorOrg: melinkcorp.com
Subject: Re: Upgrading files identified as CONFFILES?
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
X-List-Received-Date: Thu, 06 Nov 2014 15:28:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGF1bCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRk
ZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVt
YmVkZGVkLWRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24NCj4gQmVoYWxm
IE9mIFBhdWwgQmFya2VyDQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAwNiwgMjAxNCA5OjM2
IEFNDQo+IFRvOiBPRSBEZXZlbA0KPiBTdWJqZWN0OiBSZTogW29lXSBVcGdyYWRpbmcgZmlsZXMg
aWRlbnRpZmllZCBhcyBDT05GRklMRVM/DQo+IA0KPiBPbiA2IE5vdmVtYmVyIDIwMTQgMTQ6MDYs
IEJyeWFuIEV2ZW5zb24gPGJldmVuc29uQG1lbGlua2NvcnAuY29tPg0KPiB3cm90ZToNCj4gPiBB
bGwsDQo+ID4NCj4gPiBGaXJzdCwgcGxlYXNlIGxldCBtZSBrbm93IGlmIEkgc2hvdWxkIGJlIGRp
cmVjdGluZyB0aGlzIHRvIGEgZGlmZmVyZW50IE9FL3lvY3RvDQo+IG1haWxpbmcgbGlzdDsgSSBo
YXZlIGEgaGFyZCB0aW1lIGZpZ3VyaW5nIG91dCB3aGljaCBsaXN0IGlzIGFwcHJvcHJpYXRlIGF0
IHRpbWVzLg0KPiA+DQo+ID4gSSBhbSBvbiBwb2t5L2R5bGFuIGFuZCBhbSB1c2luZyBOVFAgb24g
bXkgdGFyZ2V0IHN5c3RlbS4gIEkgd291bGQgbGlrZSB0bw0KPiBjaGFuZ2UgdGhlIGNvbmZpZ3Vy
YXRpb24gZm9yIE5UUCBhbmQgcHVzaCBvdXQgdGhlIGNoYW5nZXMgdG8gZGV2aWNlcyB0aGF0DQo+
IGFyZSBmaXJtd2FyZSB1cGdyYWRhYmxlLiAgSSBtYWRlIHRoZSBjaGFuZ2UgYW5kIHB1c2hlZCBv
dXQgdGhlIHVwZ3JhZGUsDQo+IGJ1dCBJIHNlZSB0aGF0IG50cC5jb25mIGRpZCBub3QgZ2V0IGNo
YW5nZWQgb24gYXQgbGVhc3Qgb25lIG9mIHRoZSBzeXN0ZW1zDQo+ICh0aGUgZmlyc3Qgb25lIEkg
Y2hlY2tlZCkuICBOb3cgSSBzZWUgdGhhdCBudHAuY29uZiBpcyBsaXN0ZWQgdW5kZXIgQ09ORkZJ
TEVTDQo+IGluIHRoZSBtYWluIG50cCByZWNpcGUgKGh0dHA6Ly93d3cueW9jdG9wcm9qZWN0Lm9y
Zy9kb2NzLzEuNy9tZWdhLQ0KPiBtYW51YWwvbWVnYS1tYW51YWwuaHRtbCN2YXItQ09ORkZJTEVT
KSwgd2hpY2ggZXhwbGFpbnMgd2h5IGl0IHdhcyBub3QNCj4gdXBncmFkZWQuDQo+ID4NCj4gPiBG
aXJzdCwgSSB3YW50IHRvIGNvbmZpcm0gaG93IHRoZSBDT05GRklMRVMgcGFyYW1ldGVyIHdvcmtz
LiAgSWYgYSBmaWxlIGlzDQo+IGxpc3RlZCB1bmRlciBDT05GRklMRVMsIGlzIHRoYXQgZmlsZSBu
ZXZlciBtb2RpZmllZCBkdXJpbmcgYW4gdXBncmFkZSBvciBpcyBpdA0KPiBvbmx5IHVwZ3JhZGVk
IGlmIGl0IGhhcyBub3QgYmVlbiBtb2RpZmllZCAobWF0Y2hlcyB0aGUgZGVmYXVsdCBmaWxlIGZy
b20gdGhlDQo+IHByZXZpb3VzIHBhY2thZ2UgdmVyc2lvbik/ICBJIGFtIHVzaW5nIG9wa2cgZm9y
IHBhY2thZ2UgbWFuYWdlbWVudCBpZiB0aGF0DQo+IG1ha2VzIGEgZGlmZmVyZW5jZS4NCj4gPg0K
PiA+IFNlY29uZCwgaG93IGRvIEkgZm9yY2UgdGhlIE5UUCBjb25maWd1cmF0aW9uIHRvIGJlIHVw
Z3JhZGVkPyAgRm9yIG15DQo+IHN5c3RlbSwgdGhlIHVzZXIgaGFzIG5vIGludGVyZmFjZSB0byBt
b2RpZnkgdGhlIE5UUCBjb25maWd1cmF0aW9uLiAgU28gZXZlbg0KPiB0aG91Z2ggaXQgaXMgYSBj
b25maWd1cmF0aW9uIGZpbGUsIGluIG15IGNhc2UgSSB3YW50IG50cC5jb25mIHRvIGFsd2F5cyBt
YXRjaA0KPiB0aGUgdmVyc2lvbiBwcm92aWRlZCBieSB0aGUgdXBncmFkZWQgcGFja2FnZS4NCj4g
Pg0KPiA+IFRoYW5rcywNCj4gPiBCcnlhbg0KPiA+DQo+IA0KPiBUaGlzIGxhcmdlbHkgZGVwZW5k
cyBvbiB0aGUgcGFja2FnZSBtYW5hZ2VyLiBJIGNhbiB0ZWxsIHlvdSBob3cgb3BrZw0KPiB3b3Jr
cy4uLiBJZiBhIGZpbGUgaXMgbGlzdGVkIGluIENPTkZGSUxFUyBpdCBpcyBiYWNrZWQgdXAgYmVm
b3JlIGFuIHVwZGF0ZSBpcw0KPiBhcHBsaWVkLiBCeSBkZWZhdWx0LCBpZiBhIGNvbmZmaWxlIGhh
cyBjaGFuZ2VkLCB0aGUgbmV3IGNoYW5nZXMgZ28gaW50byBhIGZpbGUNCj4gbmFtZWQgIiVzLW9w
a2ciIHdoZXJlICVzIGlzIHRoZSBvcmlnaW5hbCBmaWxlIG5hbWUuIElmICItLWZvcmNlLW1haW50
YWluZXIiDQo+IGlzIHBhc3NlZCBhcyBhbiBhcmd1bWVudCBvciB0aGUgb3B0aW9uICJmb3JjZV9t
YWludGFpbmVyIiBpcyBzZXQsIHRoZSBuZXcNCj4gY2hhbmdlcyBvdmVyd3JpdGUgdGhlIHZlcnNp
b24gaW4gdGhlIGZpbGUgc3lzdGVtLiBJbiBvcGtnIHYwLjMuMCB0aGVyZSB3aWxsIGJlDQo+IGEg
bmV3ICItLWlnbm9yZS1tYWludGFpbmVyIiBhcmd1bWVudCBhbmQgImlnbm9yZV9tYWludGFpbmVy
IiBvcHRpb24gdG8NCj4ga2VlcCB0aGUgY29uZmZpbGUgdW5tb2RpZmllZCBidXQgbm90IHN0b3Jl
IHRoZSBjaGFuZ2VzIGluICIlcy1vcGtnIi4NCj4gDQo+IEhvcGUgdGhhdCBoZWxwcywNCj4gDQoN
ClRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGV4cGxhbmF0aW9uLiAgQW5kIGp1c3QgdG8gZXhwbG9y
ZSBteSBvcHRpb25zLCBpZiBJIHdlcmUgdG8gYWRkIHRoZSBmb2xsb3dpbmcgaW4gbXkgbnRwIGJi
YXBwZW5kOg0KDQpDT05GRklMRVNfJHtQTn0gPSAiIg0KDQp3b3VsZCB0aGF0IHJlbW92ZSBudHAu
Y29uZiBmcm9tIHRoZSBDT05GRklMRVMgbGlzdCBhbmQgZm9yY2UgdGhlIGNvbmZpZ3VyYXRpb24g
dG8gYmUgdXBkYXRlZCBlYWNoIHRpbWUgaXQgY2hhbmdlcz8NCg0KVGhhbmtzLA0KQnJ5YW4NCg==

