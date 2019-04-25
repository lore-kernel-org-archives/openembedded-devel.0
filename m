Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 63FEE7D8EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 13:05:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,393,1549900800"; d="scan'208";a="60574422"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Apr 2019 21:05:40 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 12ECD4CD8861
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 21:05:42 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Thu, 25 Apr 2019 21:05:49 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][patch v2] dnf-plugin-tui: new recipe
Thread-Index: AQHU9ZDLHjziLjoTpEmZIzvatFKls6ZM48tw
Date: Thu, 25 Apr 2019 13:05:47 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C15036@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555093001-41848-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C13EB0@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C13EB0@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 12ECD4CD8861.AE302
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [meta-oe][patch v2] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Thu, 25 Apr 2019 13:05:41 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UGluZw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IG9wZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YN
Cj4gWmhlbmcsIFJ1b3Fpbg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMTgs
IDIwMTkgMTA6NDUgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRh
LW9lXVtwYXRjaCB2Ml0gZG5mLXBsdWdpbi10dWk6IG5ldyByZWNpcGUNCj4g
DQo+IFBpbmcNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IFpoZW5nIFJ1b3Fpbg0KPiBOYW5q
aW5nIEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZO
U1QpDQo+IEFERFIuOiBOby42IFdlbnpodSBSb2FkLCBTb2Z0d2FyZSBBdmVu
dWUsDQo+ICAgICAgICBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQo+IE1BSUwg
OiB6aGVuZ3JxLmZuc3RAY24uZnVqaXN0dS5jb20NCj4gDQo+IA0KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogWmhlbmcsIFJ1
b3Fpbi/WoyDI9MfVDQo+ID4gU2VudDogU2F0dXJkYXksIEFwcmlsIDEzLCAy
MDE5IDI6MTcgQU0NCj4gPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBDYzogWmhlbmcsIFJ1b3Fpbi/WoyDI
9MfVIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+ID4gU3ViamVj
dDogW29lXVttZXRhLW9lXVtwYXRjaCB2Ml0gZG5mLXBsdWdpbi10dWk6IG5l
dyByZWNpcGUNCj4gPg0KPiA+IFRoaXMgZG5mIHBsdWdpbiBhaW1zIHRvIHN1
cHBseSBhIHR1aSBpbnRlcmZhY2UgZm9yIHVzZXIgdG8gbWFuYWdlDQo+ID4g
cGFja2FnZXMuIEl0IGhhcyBmZWF0dXJlcyBhcyBmb2xsb3dpbmc6DQo+ID4g
ICAxLiBBZGQgbmV3IGNvbW1hbmQgZG5mIHR1aSAtLWluaXQgdG8gbWFrZSBk
bmYgdG8gd29yayBvbiBob3N0Lg0KPiA+ICAgMi4gVGV4dC1iYXNlZCB1c2Vy
IGludGVyZmFjZSBmb3IgZG5mLg0KPiA+ICAgMy4gTWFuYWdlIFNQRFggZmls
ZXMuDQo+ID4gICA0LiBNYW5hZ2UgU1JQTSBmaWxlcy4NCj4gPiAgIDUuIEFk
ZCBpbnN0YWxsYXRpb24gc2FtcGxlcyBmb3IgZG5mLg0KPiA+DQo+ID4gTW9y
ZSBkZXRhaWxzIHBsZWFzZSByZWZlciB0byBodHRwczovL2dpdGh1Yi5jb20v
dWJpbnV4L2RuZi1wbHVnaW4tdHVpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogWmhlbmcgUnVvcWluIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+
DQo+ID4gLS0tDQo+ID4gIC4uLi9kbmYtcGx1Z2luLXR1aS9kbmYtcGx1Z2lu
LXR1aV9naXQuYmIgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+ICAuLi4vZG5mLXBsdWdpbi10dWkvZmlsZXMvb2UtcmVtb3Rl
LnJlcG8uc2FtcGxlICAgICB8ICA1ICsrKw0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQzIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+ID4gbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2RuZi1wbHVnaW4tdHVp
L2RuZi1wbHVnaW4tDQo+ID4gdHVpX2dpdC5iYg0KPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2RuZi1wbHVnaW4t
dHVpL2ZpbGVzL29lLQ0KPiA+IHJlbW90ZS5yZXBvLnNhbXBsZQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdA0KPiA+IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xz
L2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dpdC5iYg0KPiA+IGIv
bWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2RuZi1wbHVnaW4tdHVpL2RuZi1w
bHVnaW4tdHVpX2dpdC5iYg0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
ID4gaW5kZXggMDAwMDAwMC4uZTg5MTg2OA0KPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdp
bi10dWkvZG5mLXBsdWdpbi10dWlfZ2l0LmJiDQo+ID4gQEAgLTAsMCArMSwz
OCBAQA0KPiA+ICtTVU1NQVJZID0gIkEgdGV4dC1iYXNlZCB1c2VyIGludGVy
ZmFjZSBwbHVnaW4gb2YgZG5mIGZvciB1c2VyIHRvDQo+ID4gK21hbmFnZQ0K
PiA+IHBhY2thZ2VzLiAiDQo+ID4gK0xJQ0VOU0UgPSAiR1BMdjIiDQo+ID4g
Kw0KPiA+ICtMSUNfRklMRVNfQ0hLU1VNID0NCj4gPiAiZmlsZTovL0NPUFlJ
Tkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIg0KPiA+
ICsNCj4gPiArU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3ViaW51eC9k
bmYtcGx1Z2luLXR1aS5naXQ7YnJhbmNoPW1hc3RlciAiDQo+ID4gK1NSQ1JF
ViA9ICIzMWQ2ODY2ZDVlZGEwMmJlOWE2YmZiMWZjYTllOTA5NWIxMmVlY2Qx
Ig0KPiA+ICtQViA9ICIxLjAiDQo+ID4gKw0KPiA+ICtTUkNfVVJJX2FwcGVu
ZF9jbGFzcy10YXJnZXQgPSAiZmlsZTovL29lLXJlbW90ZS5yZXBvLnNhbXBs
ZSINCj4gPiArDQo+ID4gK2luaGVyaXQgZGlzdHV0aWxzMy1iYXNlDQo+ID4g
Kw0KPiA+ICtTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+ICsNCj4gPiArZG9f
aW5zdGFsbF9hcHBlbmQoKSB7DQo+ID4gKyAgICAgICAgaW5zdGFsbCAtZCAk
e0R9JHtkYXRhZGlyfS9kbmYNCj4gPiArICAgICAgICBpbnN0YWxsIC1tIDA3
NTUgJHtTfS9zYW1wbGVzLyogJHtEfSR7ZGF0YWRpcn0vZG5mDQo+ID4gKyAg
ICAgICAgaW5zdGFsbCAtZCAke0R9JHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJ
Un0vZG5mLXBsdWdpbnMvbWtpbWcNCj4gPiArICAgICAgICBpbnN0YWxsIC1t
IDA3NTUgJHtTfS9kbmYtcGx1Z2lucy9ta2ltZy8qDQo+ID4gJHtEfSR7UFlU
SE9OX1NJVEVQQUNLQUdFU19ESVJ9L2RuZi1wbHVnaW5zL21raW1nDQo+ID4g
KyAgICAgICAgZm9yIGZpbGUgaW4gJChscyAke1N9L2RuZi1wbHVnaW5zLyB8
IGdyZXAgLXYgbWtpbWcpOyBkbw0KPiA+ICsgICAgICAgICAgICBpbnN0YWxs
IC1tIDA3NTUgJHtTfS9kbmYtcGx1Z2lucy8kZmlsZQ0KPiA+ICR7RH0ke1BZ
VEhPTl9TSVRFUEFDS0FHRVNfRElSfS9kbmYtcGx1Z2lucw0KPiA+ICsgICAg
ICAgIGRvbmUNCj4gPiArfQ0KPiA+ICsNCj4gPiArZG9faW5zdGFsbF9hcHBl
bmRfY2xhc3MtdGFyZ2V0KCkgew0KPiA+ICsgICAgICAgIGluc3RhbGwgLWQg
JHtEfSR7c3lzY29uZmRpcn0veXVtLnJlcG9zLmQNCj4gPiArICAgICAgICBp
bnN0YWxsIC1tIDA2NDQgJHtXT1JLRElSfS9vZS1yZW1vdGUucmVwby5zYW1w
bGUNCj4gPiArJHtEfSR7c3lzY29uZmRpcn0veXVtLnJlcG9zLmQgfQ0KPiA+
ICsNCj4gPiArRklMRVNfJHtQTn0gKz0gIiR7ZGF0YWRpcn0vZG5mIg0KPiA+
ICsNCj4gPiArUkRFUEVORFNfJHtQTn0gKz0gIiBcDQo+ID4gKyAgZG5mIFwN
Cj4gPiArICBsaWJuZXd0LXB5dGhvbiBcDQo+ID4gKyAgIg0KPiA+ICsNCj4g
PiArQkJDTEFTU0VYVEVORCA9ICJuYXRpdmVzZGsiDQo+ID4gZGlmZiAtLWdp
dCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9m
aWxlcy9vZS0NCj4gPiByZW1vdGUucmVwby5zYW1wbGUgYi9tZXRhLW9lL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZmlsZXMvb2UtDQo+ID4g
cmVtb3RlLnJlcG8uc2FtcGxlDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gPiBpbmRleCAwMDAwMDAwLi42YzQ1MDJlDQo+ID4gLS0tIC9kZXYvbnVs
bA0KPiA+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9kbmYtcGx1
Z2luLXR1aS9maWxlcy9vZS1yZW1vdGUucmVwby5zYW0NCj4gPiArKysgcGwN
Cj4gPiArKysgZQ0KPiA+IEBAIC0wLDAgKzEsNSBAQA0KPiA+ICtbYmFzZV0N
Cj4gPiArbmFtZT1teXJlcG8NCj4gPiArYmFzZXVybD1odHRwOi8vMTI3LjAu
MC4xL29lX3JlcG8vDQo+ID4gK2VuYWJsZWQ9MQ0KPiA+ICtncGdjaGVjaz0w
DQo+ID4gLS0NCj4gPiAxLjguMy4xDQo+IA0KPiANCj4gDQo+IC0tDQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gT3BlbmVt
YmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
ZW1iZWRkZWQtZGV2ZWwNCgoK

