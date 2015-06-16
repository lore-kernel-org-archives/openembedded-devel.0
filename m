Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 600D97413A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jun 2015 02:12:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,617,1427731200"; d="scan'208";a="97105718"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jun 2015 10:16:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5G2B4ht031060;
	Tue, 16 Jun 2015 10:11:05 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Tue, 16 Jun 2015 10:12:52 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [oe] [meta-oe][PATCH 1/7] wafsamba: add class
Thread-Index: AQHQp0nTUyGZja6Xu0i2Ui6popKBe52s/8IAgAFgrKA=
Date: Tue, 16 Jun 2015 02:12:42 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC73E0F73A@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
	<1434358336-34981-2-git-send-email-biannm@cn.fujitsu.com>
	<5108170.4M7I4gz10Q@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <5108170.4M7I4gz10Q@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/7] wafsamba: add class
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
X-List-Received-Date: Tue, 16 Jun 2015 02:12:41 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgUGF1bA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF1bCBFZ2dsZXRvbiBbbWFpbHRvOnBhdWwuZWdnbGV0b25A
bGludXguaW50ZWwuY29tXQ0KPiBTZW50OiBNb25kYXksIEp1bmUgMTUsIDIwMTUgODo1MyBQTQ0K
PiBUbzogQmlhbiwgTmFpbWVuZy+ZxCCUVJbSDQo+IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0gg
MS83XSB3YWZzYW1iYTogYWRkIGNsYXNzDQo+IA0KPiBIaSBCaWFuLA0KPiANCj4gT24gTW9uZGF5
IDE1IEp1bmUgMjAxNSAxNjo1MjoxMCBCaWFuIE5haW1lbmcgd3JvdGU6DQo+ID4gd2Fmc2FtYmEg
aXMgYSBidWlsZCBzeXN0ZW0gdXNlZCBieSBzYW1iYSByZWxhdGVkIHNvZnR3YXJlDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWFuIE5haW1lbmcgPGJpYW5ubUBjbi5mdWppdHN1LmNvbT4NCj4g
PiAtLS0NCj4gPiAgbWV0YS1vZS9jbGFzc2VzL3dhZnNhbWJhLmJiY2xhc3MgfCA1NQ0KPiA+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysgMSBmaWxlIGNoYW5nZWQsIDU1
DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyBpbnNlcnRpb25z
KCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL2NsYXNzZXMvd2Fmc2FtYmEuYmJj
bGFzcw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvY2xhc3Nlcy93YWZzYW1iYS5iYmNs
YXNzDQo+ID4gYi9tZXRhLW9lL2NsYXNzZXMvd2Fmc2FtYmEuYmJjbGFzcyBuZXcgZmlsZSBtb2Rl
IDEwMDY0NCBpbmRleA0KPiA+IDAwMDAwMDAuLjc2NGI1MzANCj4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gKysrIGIvbWV0YS1vZS9jbGFzc2VzL3dhZnNhbWJhLmJiY2xhc3MNCj4gDQo+IFRoaXMgc2hv
dWxkIHJlYWxseSBiZSBuYW1lZCB3YWYtc2FtYmEuYmJjbGFzcy4gSSdtIGFsc28gd29uZGVyaW5n
IGhvdyB0aGlzDQo+IHJlbGF0ZXMgdG8gd2FmLmJiY2xhc3MgdGhhdCB3ZSBoYXZlIGluIE9FLUNv
cmUgLSB0aGV5IGRvIGxvb2sgcXVpdGUgZGlmZmVyZW50DQo+IHRob3VnaC4NCj4gDQoNCkkgd2ls
bCByZW5hbWUgaXQgdG8gd2FmLXNhbWJhLmJiY2xhc3MuDQoNCkkgZG9uJ3Qga25vdyB3aGF0J3Mg
dGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHdhZi5iYmNsYXNzIGFuZCB3YWYtc2FtYmEuYmJjbGFz
cyBjbGVhcmx5LA0Kd2FmLmJiY2xhc3MgaXMgYSBiYXNpYyBjbGFzcyBmb3Igd2FmIGJ1aWxkIHN5
c3RlbSwgYnV0IGl0IGRvZXMgbm90IHdvcmsgZm9yIHNhbWJhNCBkaXJlY3RseS4NCg0KSSBqdXN0
IGNyZWF0ZSB3YWYtc2FtYmEuYmJjbGFzcyBhY2NvcmRpbmcgdG8gaHR0cHM6Ly93aWtpLnNhbWJh
Lm9yZy9pbmRleC5waHAvV2FmLA0KZXNwZWNpYWxseSB0aGUgc2VjdGlvbiAnY3Jvc3MtY29tcGls
aW5nJy4NCg0KPiA+IEBAIC0wLDAgKzEsNTUgQEANCj4gPiArIyB3YWYgaXMgYSBidWlsZCBzeXN0
ZW0gd2hpY2ggaXMgdXNlZCBieSBzYW1iYSByZWxhdGVkIHByb2plY3QuDQo+ID4gKyMgT2J0YWlu
IGRldGFpbHMgZnJvbSBodHRwczovL3dpa2kuc2FtYmEub3JnL2luZGV4LnBocC9XYWYNCj4gPiAr
Iw0KPiA+ICtpbmhlcml0IHFlbXUgcHl0aG9ubmF0aXZlDQo+ID4gKw0KPiA+ICtERVBFTkRTICs9
ICJxZW11LW5hdGl2ZSBsaWJ4c2x0LW5hdGl2ZSBkb2Nib29rLXhzbC1zdHlsZXNoZWV0cy1uYXRp
dmUNCj4gPiBweXRob24iDQo+ID4gKw0KPiA+ICtDT05GSUdVUkVPUFRTID0gIiAtLXByZWZpeD0k
e3ByZWZpeH0gXA0KPiA+ICsgICAgICAgICAgICAgICAgICAtLWJpbmRpcj0ke2JpbmRpcn0gXA0K
PiA+ICsgICAgICAgICAgICAgICAgICAtLXNiaW5kaXI9JHtzYmluZGlyfSBcDQo+ID4gKyAgICAg
ICAgICAgICAgICAgIC0tbGliZXhlY2Rpcj0ke2xpYmV4ZWNkaXJ9IFwNCj4gPiArICAgICAgICAg
ICAgICAgICAgLS1kYXRhZGlyPSR7ZGF0YWRpcn0gXA0KPiA+ICsgICAgICAgICAgICAgICAgICAt
LXN5c2NvbmZkaXI9JHtzeXNjb25mZGlyfSBcDQo+ID4gKyAgICAgICAgICAgICAgICAgIC0tc2hh
cmVkc3RhdGVkaXI9JHtzaGFyZWRzdGF0ZWRpcn0gXA0KPiA+ICsgICAgICAgICAgICAgICAgICAt
LWxvY2Fsc3RhdGVkaXI9JHtsb2NhbHN0YXRlZGlyfSBcDQo+ID4gKyAgICAgICAgICAgICAgICAg
IC0tbGliZGlyPSR7bGliZGlyfSBcDQo+ID4gKyAgICAgICAgICAgICAgICAgIC0taW5jbHVkZWRp
cj0ke2luY2x1ZGVkaXJ9IFwNCj4gPiArICAgICAgICAgICAgICAgICAgLS1vbGRpbmNsdWRlZGly
PSR7b2xkaW5jbHVkZWRpcn0gXA0KPiA+ICsgICAgICAgICAgICAgICAgICAtLWluZm9kaXI9JHtp
bmZvZGlyfSBcDQo+ID4gKyAgICAgICAgICAgICAgICAgIC0tbWFuZGlyPSR7bWFuZGlyfSBcDQo+
ID4gKyAgICAgICAgICAgICAgICAiDQo+ID4gKw0KPiA+ICtkb19jb25maWd1cmUoKSB7DQo+ID4g
KyAgICBxZW11X2JpbmFyeT0iJHtAcWVtdV90YXJnZXRfYmluYXJ5KGQpfSINCj4gPiArICAgIGlm
IFsgJHtxZW11X2JpbmFyeX0gPT0gInFlbXUtYWxsYXJjaCIgXTsgdGhlbg0KPiA+ICsgICAgICAg
IHFlbXVfYmluYXJ5PSJxZW11d3JhcHBlciINCj4gPiArICAgIGZpDQo+ID4gKw0KPiA+ICsgICAg
bGliZGlyX3FlbXU9IiR7U1RBR0lOR19ESVJfSE9TVH0vJHtsaWJkaXJ9Ig0KPiA+ICsgICAgYmFz
ZV9saWJkaXJfcWVtdT0iJHtTVEFHSU5HX0RJUl9IT1NUfS8ke2Jhc2VfbGliZGlyfSINCj4gPiAr
ICAgIG9sZGVzdF9rZXJuZWxfcWVtdT0ke09MREVTVF9LRVJORUx9DQo+ID4gKw0KPiA+ICsgICAg
Q1JPU1NfRVhFQz0iJHtxZW11X2JpbmFyeX0gXA0KPiA+ICsgICAgICAgICAgICAgICAgLXIgJHtv
bGRlc3Rfa2VybmVsX3FlbXV9IFwNCj4gPiArICAgICAgICAgICAgICAgIC1MICR7U1RBR0lOR19E
SVJfSE9TVH0gXA0KPiA+ICsgICAgICAgICAgICAgICAgLUUgTERfTElCUkFSWV9QQVRIPSR7bGli
ZGlyX3FlbXV9OiR7YmFzZV9saWJkaXJfcWVtdX0iDQo+ID4gKw0KPiA+ICsgICAgZXhwb3J0IEJV
SUxEX1NZUz0ke0JVSUxEX1NZU30NCj4gPiArICAgIGV4cG9ydCBIT1NUX1NZUz0ke0hPU1RfU1lT
fQ0KPiA+ICsgICAgZXhwb3J0IEJVSUxEX0FSQ0g9JHtCVUlMRF9BUkNIfQ0KPiA+ICsgICAgZXhw
b3J0IEhPU1RfQVJDSD0ke0hPU1RfQVJDSH0NCj4gPiArICAgIGV4cG9ydCBTVEFHSU5HX0xJQkRJ
Uj0ke1NUQUdJTkdfTElCRElSfQ0KPiA+ICsgICAgZXhwb3J0IFNUQUdJTkdfSU5DRElSPSR7U1RB
R0lOR19JTkNESVJ9DQo+ID4gKyAgICBleHBvcnQgUFlUSE9OUEFUSD0ke1NUQUdJTkdfRElSX0hP
U1R9JHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0NCj4gPiArDQo+ID4gKyAgICAuL2NvbmZpZ3Vy
ZSAke0NPTkZJR1VSRU9QVFN9ICR7RVhUUkFfT0VDT05GfSAtLWNyb3NzLWNvbXBpbGUNCj4gPiAt
LWNyb3NzLWV4ZWN1dGU9IiR7Q1JPU1NfRVhFQ30iICt9DQo+ID4gKw0KPiA+ICtkb19jb21waWxl
ICgpIHsNCj4gPiArICAgIGJhc2VfZG9fY29tcGlsZQ0KPiA+ICt9DQo+IA0KPiBJcyB0aGlzIGRv
X2NvbXBpbGUgcmVhbGx5IG5lZWRlZD8gQUZBSUNUIHRoaXMgaXNuJ3QgZG9pbmcgYW55dGhpbmcg
YmVjYXVzZQ0KPiBiYXNlX2RvX2NvbXBpbGUgd2lsbCBhbHJlYWR5IGJlIGJlaW5nIHJ1biBieSB3
YXkgb2YgRVhQT1JUX0ZVTkNUSU9OUy4NCj4gDQoNClllcywgaXQncyByaWdodCwgSSB3aWxsIHJl
bW92ZSBpdCBpbiB0aGUgVjIgcGF0Y2guDQoNClRoYW5rcw0KIEJpYW4NCg0KPiBDaGVlcnMsDQo+
IFBhdWwNCj4gDQo+IC0tDQo+IA0KPiBQYXVsIEVnZ2xldG9uDQo+IEludGVsIE9wZW4gU291cmNl
IFRlY2hub2xvZ3kgQ2VudHJlDQo=

