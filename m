Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE9D78374
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 02:27:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5G2RY23007349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 19:27:35 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([fe80::d894:a649:cd4c:89b7]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Thu, 15 Jun 2017 19:27:34 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "BURTON, ROSS" <ross.burton@intel.com>
Thread-Topic: [oe] [meta-oe][PATCH 1/1 v2] microcode-ctl: add new recipe
Thread-Index: AQHS5cxGA3iioAMcg0ap7YJp1pc8P6Imwm+g
Date: Fri, 16 Jun 2017 02:27:33 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B7F1FCA@ALA-MBD.corp.ad.wrs.com>
References: <cover.1497428466.git.jackie.huang@windriver.com>
	<88d795d0702cfafe40b7a821c2d09df76b6f3dc0.1497428466.git.jackie.huang@windriver.com>
	<CAJTo0LYda7e5GHATvCt=rcr44_jj+mZww51OQfCLa9nxLOM+zw@mail.gmail.com>
In-Reply-To: <CAJTo0LYda7e5GHATvCt=rcr44_jj+mZww51OQfCLa9nxLOM+zw@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.168]
MIME-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1 v2] microcode-ctl: add new recipe
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
X-List-Received-Date: Fri, 16 Jun 2017 02:27:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiANCj4gDQo+IEZyb206IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNv
bV0gDQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDE1LCAyMDE3IDE5OjQxDQo+IFRvOiBIdWFuZywg
SmllIChKYWNraWUpDQo+IENjOiBPcGVuRW1iZWRkZWQgRGV2ZWwgTGlzdA0KPiBTdWJqZWN0OiBS
ZTogW29lXSBbbWV0YS1vZV1bUEFUQ0ggMS8xIHYyXSBtaWNyb2NvZGUtY3RsOiBhZGQgbmV3IHJl
Y2lwZQ0KPiANCj4gDQo+IE9uIDE1IEp1bmUgMjAxNyBhdCAwMjozNiwgPGphY2tpZS5odWFuZ0B3
aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gVGhlIG1pY3JvY29kZV9jdGwgdXRpbGl0eSBpcyBhIGNv
bXBhbmlvbiB0byB0aGUNCj4gSUEzMiBtaWNyb2NvZGUgZHJpdmVyLg0KPiANCj4gV291bGRuJ3Qg
aXQgbWFrZSBzZW5zZSBmb3IgdGhpcyB0byBiZSBpbiBtZXRhLWludGVsLCBhbG9uZ3NpZGUgdGhl
IG1pY3JvY29kZT8gQWxzbyB3aGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGlzIGFuZCBp
dWNvZGUtdG9vbCwgd2hpY2ggaXMgYWxyZWFkeSBpbiBtZXRhLWludGVsPw0KDQpTb3JyeSBJIGRp
ZG4ndCB1c2UgbWV0YS1pbnRlbCBhbmQgbm90IGF3YXJlIG9mIHRoYXQsIGFuZCB5ZXMsIGl0IG1h
a2Ugc2Vuc2VzIHRvIGJlIGluIG1ldGEtaW50ZWwsIEkgd2lsbCBpbnZlc3RpZ2F0ZSB0aGUgZGlm
ZmVyZW5jZSB0byBzZWUgaWYgdGhpcyBzdGlsbCBuZWVkZWQuDQoNClRoYW5rcywNCkphY2tpZQ0K
DQo+IA0KPiBSb3NzDQo+DQo=

