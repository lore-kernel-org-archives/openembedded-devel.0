Return-Path: <csmiley@icontrol.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0138.outbound.protection.outlook.com [157.56.110.138])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4D671F23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2015 18:43:37 +0000 (UTC)
Received: from BL2PR05MB034.namprd05.prod.outlook.com (10.255.228.147) by
	BL2PR05MB033.namprd05.prod.outlook.com (10.255.228.139) with Microsoft
	SMTP Server (TLS) id 15.1.59.20; Mon, 19 Jan 2015 18:43:36 +0000
Received: from BL2PR05MB034.namprd05.prod.outlook.com ([169.254.15.57]) by
	BL2PR05MB034.namprd05.prod.outlook.com ([169.254.15.57]) with mapi id
	15.01.0059.007; Mon, 19 Jan 2015 18:43:36 +0000
From: Colin Smiley <csmiley@icontrol.com>
To: Otavio Salvador <otavio@ossystems.com.br>, Max Krummenacher
	<max.oss.09@gmail.com>
Thread-Topic: [oe] Query on meta-java layer openjdk-7-jre build
Thread-Index: AQHQMFUhIJi5tkepc0OlnLBIPLSk0pzATxEAgAC9coCAAJ0DgIAFs8wAgAAMgACAAACVgA==
Date: Mon, 19 Jan 2015 18:43:35 +0000
Message-ID: <D0E2AB9D.8D80%csmiley@icontrol.com>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
	<CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
	<loom.20150115T002923-253@post.gmane.org>
	<CAP9ODKpZzfTV41SDZjacbMi9=_BKkA7AoTgU+az4+7oUDreB3Q@mail.gmail.com>
	<CAEHkU3WoztGsMLVriJWqFCSuYboaQAFf8G_y1EtYHiyrh3i0UQ@mail.gmail.com>
	<CAEHkU3VmOOfi+nmyB2gERxghmb7n0uNXaNhiQ1zbaYtH33vAaw@mail.gmail.com>
	<CAEHkU3UwSPmDXcXVeZpTWWjxvQ3DxJts7_Ci964f=Lrv8xNH0Q@mail.gmail.com>
	<CAP9ODKrmQ2hLL-NFUqrB_sa24wB+WyzTPsdkssYgkknFKNO65A@mail.gmail.com>
In-Reply-To: <CAP9ODKrmQ2hLL-NFUqrB_sa24wB+WyzTPsdkssYgkknFKNO65A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [63.239.122.42]
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=csmiley@icontrol.com; 
x-dmarcaction-test: None
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BL2PR05MB033;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BL2PR05MB033;
x-forefront-prvs: 046164D5C4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(199003)(189002)(377424004)(377454003)(51704005)(69224002)(479174004)(62966003)(19580395003)(66066001)(68736005)(77156002)(40100003)(102836002)(2900100001)(86362001)(2950100001)(122556002)(87936001)(101416001)(46102003)(230783001)(50986999)(64706001)(99286002)(2656002)(97736003)(19580405001)(105586002)(106356001)(106116001)(36756003)(15975445007)(54356999)(92566002)(76176999)(93886004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR05MB033;
	H:BL2PR05MB034.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: icontrol.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: icontrol.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2015 18:43:35.8621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 56af53c7-f954-4c24-b63a-3d793c349485
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR05MB033
Cc: Henning Heinold <heinold@inf.fu-berlin.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, Alex
	de Cabo <alejandro.de-cabo-garcia@congatec.com>
Subject: Re: Query on meta-java layer openjdk-7-jre build
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
X-List-Received-Date: Mon, 19 Jan 2015 18:43:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <43FC7B2F93B990499769307B3FAC98DA@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64

TWF4LCBPdGF2aW8sDQoNClRoYW5rIHlvdSBmb3IgdGhlIGNvbnRpbnVlZCB3b3JrIHlvdeKAmXJl
IGRvaW5nIG9uIHRoaXMuDQoNCg0KT24gMS8xOS8xNSwgNjo0MSBBTSwgIk90YXZpbyBTYWx2YWRv
ciIgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPiB3cm90ZToNCg0KPkhlbGxvIE1heCwNCj4NCj5P
biBNb24sIEphbiAxOSwgMjAxNSBhdCA5OjU2IEFNLCBNYXggS3J1bW1lbmFjaGVyIDxtYXgub3Nz
LjA5QGdtYWlsLmNvbT4NCj53cm90ZToNCj4+IEkgbWFkZSBzb21lIHByb2dyZXNzLg0KPj4gV2Ug
c2VlbSB0byBiZSBkaXNjdXNzaW5nIHR3byBpc3N1ZXMNCg0KLi4uDQoNCj4+IDIpDQo+PiBxZW11
IHJ1bnMgaW5kZWZpbml0ZWx5Lg0KPj4gV2hpbGUgaHVudGluZyB0aGUgYWJvdmUgbWVudGlvbmVk
IGJ1ZyBJIGZvdW5kIHRoYXQgd2hlbiB1c2luZyBxZW11DQo+PiB3aXRoIHRoZSBzeXNyb290LCBp
LmUuIHVzaW5nIHRoZSAtTCA8cGF0aC10by1zeXNyb290PiBwYXJhbWV0ZXIgcWVtdQ0KPj4gZXhl
Y3V0ZXMgYW5kIG5ldmVyIHJldHVybnMuDQo+PiBPbiBteSBtYWNoaW5lIGZyZWUgc2hvd3MgaW5j
cmVhc2luZ2x5IHVzZWQgUkFNIGJ1dCBJIHdhcyB0byBpbXBhdGllbnQNCj4+IHRvIGV2ZXIgc2Vl
IGFuIE9PTSBraWxsIG9mIHFlbXUgYnV0IG1heWJlIHRoaXMgaXMgYWxzbyB3aGF0IENvbGluDQo+
PiBleHBlcmllbmNlcyBhbmQgcHJvYmFibHkgYWxzbyB3aHkgQWxleCBkb2VzIGhhdmUgaXNzdWVz
IHdpdGggdGhlICItTCINCj4+IGNoYW5nZS4NCj4NCj5Bd2Vzb21lIGFuYWx5c2lzOyBJJ3ZlIGJl
ZW4gbG9va2luZyBmb3Igc29tZSBmcmVlIHRpbWUgdG8gZGVidWcgdGhpcw0KPmZvciBhIHdoaWxl
IGRvIGEgSFVHRSB0aGFua3MgZm9yIGFsbCB5b3VyIHdvcmsgb24gdGhpcyA6LSkNCj4NCj4+IEFu
IHN0cmFjZSBxZW11IC4uLi4gcnVuIHNob3dzIHRoYXQgcWVtdSBydW5zIGluIGNpcmNsZXMgb2Yg
cmVjdXJzaXZlDQo+PiBzeW1saW5rIGluIC91c3IvbGliL3VkZXYvcHRlc3QvLi4uLiBmaWxlcy4N
Cj4+IFVzaW5nIHRoZSBmc2wtYXJtIHNldHVwIHdpdGggcG9reSBlbmFibGVzIHB0ZXN0LiBXaGVu
IHVkZXYgaGFzIGJlZW4NCj4+IGNvbXBpbGVkIGluIHRoaXMgc2V0dXAgdGhvc2UgdGVzdGZpbGVz
IGhhdmUgYmVlbiBzdGFnZWQgYW5kIHFlbXUNCj4+IGNob2tlcyBvbiB0aGVtLi4NCj4+IA0KPj5o
dHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwvb3BlbmVtYmVkZGVkLWNvcmUv
MjAxNC1TZXB0ZW1iZXIvDQo+PjA5NzA5OC5odG1sDQo+Pg0KPj4gYSkgT25lIHdheSB0byBnbyB3
b3VsZCBiZSB0byBmaXggdWRldiBpbiBvZS1jb3JlLCBlLmcuDQo+PiBpbmRleCAwZjhlOWI2Li5h
OTNiNThkIDEwMDY0NA0KPj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdWRldi91ZGV2L2FkZC1p
bnN0YWxsLXB0ZXN0LnBhdGNoDQo+PiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS91ZGV2L3VkZXYv
YWRkLWluc3RhbGwtcHRlc3QucGF0Y2gNCj4+IEBAIC0yMSw3ICsyMSw3IEBAIFVwc3RyZWFtLVN0
YXR1czogUGVuZGluZw0KPj4gICsgICAgc2VkIC1pIC1lICdzfF5NYWtlZmlsZTp8X01ha2VmaWxl
OnwnICQoREVTVERJUikvTWFrZWZpbGUNCj4+ICArICAgICQoTUtESVJfUCkgJChERVNURElSKS90
ZXN0DQo+PiAgKyAgICAoY2QgJCh0b3Bfc3JjZGlyKSAmJiBpbnN0YWxsICQoVEVTVFMpICQoREVT
VERJUikvdGVzdCkNCj4+IC0rICAgIHRhciAtQyAkKERFU1RESVIpL3Rlc3QvIC14SmYgJCh0b3Bf
c3JjZGlyKS90ZXN0L3N5cy50YXIueHoNCj4+ICsrICAgIGNwICAkKHRvcF9zcmNkaXIpL3Rlc3Qv
c3lzLnRhci54eiAkKERFU1RESVIpL3Rlc3QvDQo+PiAgLS0tIGEvdGVzdC91ZGV2LXRlc3QucGwg
ICAgMjAxMi0wMy0xOCAxNjo0MzozNi4wMDAwMDAwMDAgKzAxMDANCj4+ICArKysgYi90ZXN0L3Vk
ZXYtdGVzdC5wbCAgICAyMDEzLTAyLTE4IDEwOjMxOjI5LjcwNjM1NzMyMSArMDEwMA0KPj4gIEBA
IC0xNDU5LDExICsxNDU5LDEzIEBADQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
dWRldi91ZGV2L3J1bi1wdGVzdA0KPj4gYi9tZXRhL3JlY2lwZXMtY29yZS91ZGV2L3VkZXYvcnVu
LXB0ZXN0DQo+PiBpbmRleCBjNjk2MWNlLi4wZTM5ODA2IDEwMDY0NA0KPj4gLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvcmUvdWRldi91ZGV2L3J1bi1wdGVzdA0KPj4gKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvdWRldi91ZGV2L3J1bi1wdGVzdA0KPj4gQEAgLTEsMyArMSw1IEBADQo+PiAgIyEvYmluL3No
DQo+Pg0KPj4gK3RhciAtQyB0ZXN0LyAteEpmIHRlc3Qvc3lzLnRhci54eg0KPj4gIG1ha2UgLWsg
Y2hlY2stVEVTVFMNCj4+ICttYWtlIHRlc3Qtc3lzLWRpc3RjbGVhbg0KPj4gLS0NCj4+IDEuOC40
LjUNCj4NCj5JdCdkIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBwcmVwYXJlIGEgcGF0Y2ggdG8gYWRk
cmVzcyB0aGlzIGluIE9FLUNvcmU7DQo+b25jZSBpdCBwcm92ZXMgc3RhYmxlIHdlIGNhbiBhc2sg
Zm9yIGl0IHRvIGJlIGJhY2twb3J0ZWQgZm9yIERpenp5Lg0KDQoNCklmIHRoaXMgaXMgd2hhdCBp
cyBjYXVzaW5nIHRoZSBtZXRhLWphdmEgcWVtdSBwcm9ibGVtcywgd291bGRu4oCZdCB0aGlzIGhh
dmUNCnRvIGJlIHBvcnRlZCBiYWNrIHRvIGRhaXN5IGFzIHdlbGw/IERhaXN5IGlzIHRoZSBsYXRl
c3QgYnJhbmNoIG1ldGEtamF2YQ0Kc2F5cyBpdCBzdXBwb3J0cyAoaXTigJlzIHRoZSBvbmUgSeKA
mXZlIGJlZW4gdXNpbmcsIGFueXdheSkuDQoNCg0KQ29saW4NCg0KDQo=

