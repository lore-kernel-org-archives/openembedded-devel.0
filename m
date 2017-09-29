Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id A95E271BE5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 15:09:38 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v8TF9Zph025228
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 29 Sep 2017 17:09:36 +0200
Received: from DEFTHW99ERNMSX.ww902.siemens.net
	(defthw99ernmsx.ww902.siemens.net [139.22.70.141])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id v8TF9F60002168
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 29 Sep 2017 17:09:35 +0200
Received: from DENBGAT9ERTMSX.ww902.siemens.net (139.22.70.192) by
	DEFTHW99ERNMSX.ww902.siemens.net (139.22.70.141) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 29 Sep 2017 17:09:24 +0200
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.143]) by
	DENBGAT9ERTMSX.ww902.siemens.net ([139.22.70.192]) with mapi id
	14.03.0361.001; Fri, 29 Sep 2017 17:09:23 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [oe] [meta-mono][PATCH] libgdiplus: include name in downloaded
	file
Thread-Index: AQHTOTLb5yeXs4M01kigU/pmFsAg9aLL1GeAgAAi4ZA=
Date: Fri, 29 Sep 2017 15:09:23 +0000
Message-ID: <355BE46A91031048906B695426A8D8E61720813F@DEFTHW99EH4MSX.ww902.siemens.net>
References: <1506696867-21375-1-git-send-email-pascal.bach@siemens.com>
	<CAJTo0LaYGtz0JYs276zyfzKKvvDHGX5xwXO7L0PhjCUuyvWtTg@mail.gmail.com>
In-Reply-To: <CAJTo0LaYGtz0JYs276zyfzKKvvDHGX5xwXO7L0PhjCUuyvWtTg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.32]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-mono][PATCH] libgdiplus: include name in downloaded file
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
X-List-Received-Date: Fri, 29 Sep 2017 15:09:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIFJvc3MNCg0KVGhhdOKAmXMgZXZlbiBiZXR0ZXIuIEkgd2lsbCBzdWJtaXQgYSB2MiBw
YXRjaCB1c2luZyB0aGUgbmV3IFVSTC4NCg0KUGFzY2FsDQoNCkZyb206IEJ1cnRvbiwgUm9zcyBb
bWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNvbV0NClNlbnQ6IEZyZWl0YWcsIDI5LiBTZXB0ZW1i
ZXIgMjAxNyAxNzowNA0KVG86IEJhY2gsIFBhc2NhbCAoQlQgQ1BTIFImRCBaRyBGVyBDQ1ApIDxw
YXNjYWwuYmFjaEBzaWVtZW5zLmNvbT4NCkNjOiBPcGVuRW1iZWRkZWQgRGV2ZWwgTGlzdCA8b3Bl
bmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW29l
XSBbbWV0YS1tb25vXVtQQVRDSF0gbGliZ2RpcGx1czogaW5jbHVkZSBuYW1lIGluIGRvd25sb2Fk
ZWQgZmlsZQ0KDQpGWUksIGdpdGh1Yi5jb208aHR0cDovL2dpdGh1Yi5jb20+IC9hcmNoaXZlLyBV
UkxzIHJlc3VsdCBpbiB0YXJiYWxscyB0aGF0IGNhbiBhbmQgZG8gY2hhbmdlIG92ZXIgdGltZSwg
c28gaXQncyByZWNvbW1lbmRlZCB0byB1c2UgZWl0aGVyIGV4cGxpY2l0bHkgdXBsb2FkZWQgdGFy
YmFsbHMgZ2VuZXJhdGVkIGJ5IHRoZSBtYWludGFpbmVyLCBvciBhIGdpdCBjbG9uZS4NCg0KVGhl
IGdpdGh1YiByZXBvIGRvZXNuJ3QgaG9zdCBhbnkgbWFpbnRhaW5lci1nZW5lcmF0ZWQgdGFyYmFs
bHMgYnV0IGx1Y2tpbHkgdGhlIE1vbm8gcHJvamVjdCBpdHNlbGYgZG9lczogaHR0cHM6Ly9kb3du
bG9hZC5tb25vLXByb2plY3QuY29tL3NvdXJjZXMvbGliZ2RpcGx1cy8uICBJJ2QgaGVhdmlseSBy
ZWNvbW1lbmQgY2hhbmdpbmcgdG8gdXNlIHRob3NlIHRhcmJhbGxzIGluc3RlYWQgb2YgdGhlIC9h
cmNoaXZlLyB0YXJiYWxscy4NCg0KUm9zcw0KDQpPbiAyOSBTZXB0ZW1iZXIgMjAxNyBhdCAxNTo1
NCwgUGFzY2FsIEJhY2ggPHBhc2NhbC5iYWNoQHNpZW1lbnMuY29tPG1haWx0bzpwYXNjYWwuYmFj
aEBzaWVtZW5zLmNvbT4+IHdyb3RlOg0KV2l0aG91dCB0aGlzIGNoYW5nZSB0aGUgZmlsZSBpcyBu
YW1lZCAke1BWfS50YXIuZ3oNCg0KU2lnbmVkLW9mZi1ieTogUGFzY2FsIEJhY2ggPHBhc2NhbC5i
YWNoQHNpZW1lbnMuY29tPG1haWx0bzpwYXNjYWwuYmFjaEBzaWVtZW5zLmNvbT4+DQotLS0NCiBy
ZWNpcGVzLW1vbm8vbGliZ2RpcGx1cy9saWJnZGlwbHVzLW5hdGl2ZV80LjIuYmI8aHR0cDovL2xp
YmdkaXBsdXMtbmF0aXZlXzQuMi5iYj4gfCAzICstLQ0KIHJlY2lwZXMtbW9uby9saWJnZGlwbHVz
L2xpYmdkaXBsdXNfNC4yLmJiPGh0dHA6Ly9saWJnZGlwbHVzXzQuMi5iYj4gICAgICAgIHwgNiAr
KystLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL3JlY2lwZXMtbW9uby9saWJnZGlwbHVzL2xpYmdkaXBsdXMtbmF0aXZl
XzQuMi5iYjxodHRwOi8vbGliZ2RpcGx1cy1uYXRpdmVfNC4yLmJiPiBiL3JlY2lwZXMtbW9uby9s
aWJnZGlwbHVzL2xpYmdkaXBsdXMtbmF0aXZlXzQuMi5iYjxodHRwOi8vbGliZ2RpcGx1cy1uYXRp
dmVfNC4yLmJiPg0KaW5kZXggNGRlZTZhMC4uZDNhOTg4ZSAxMDA2NDQNCi0tLSBhL3JlY2lwZXMt
bW9uby9saWJnZGlwbHVzL2xpYmdkaXBsdXMtbmF0aXZlXzQuMi5iYjxodHRwOi8vbGliZ2RpcGx1
cy1uYXRpdmVfNC4yLmJiPg0KKysrIGIvcmVjaXBlcy1tb25vL2xpYmdkaXBsdXMvbGliZ2RpcGx1
cy1uYXRpdmVfNC4yLmJiPGh0dHA6Ly9saWJnZGlwbHVzLW5hdGl2ZV80LjIuYmI+DQpAQCAtNiw4
ICs2LDcgQEAgU0VDVElPTiA9ICJsaWJzIg0KIExJQ0VOU0UgPSAiTUlUIg0KIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWZlNzM2NGRmY2U5ZjM2ODllYjY5OTVlN2NkZDU2
ODc5PGZpbGU6Ly8vXFxDT1BZSU5HO21kNT1mZTczNjRkZmNlOWYzNjg5ZWI2OTk1ZTdjZGQ1Njg3
OT4iDQoNCi1TUkNfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9tb25vL2xpYmdkaXBsdXMvYXJj
aGl2ZS8ke1BWfS50YXIuZ3o8aHR0cHM6Ly9naXRodWIuY29tL21vbm8vbGliZ2RpcGx1cy9hcmNo
aXZlLyQlN2JQViU3ZC50YXIuZ3o+IFwNCi0gICAgICAgIg0KK1NSQ19VUkkgPSAiaHR0cHM6Ly9n
aXRodWIuY29tL21vbm8vbGliZ2RpcGx1cy9hcmNoaXZlLyR7UFZ9LnRhci5nejtkb3dubG9hZGZp
bGVuYW1lPWxpYmdkaXBsdXMtJHtQVn0udGFyLmd6PGh0dHBzOi8vZ2l0aHViLmNvbS9tb25vL2xp
YmdkaXBsdXMvYXJjaGl2ZS8kJTdiUFYlN2QudGFyLmd6O2Rvd25sb2FkZmlsZW5hbWU9bGliZ2Rp
cGx1cy0kJTdiUFYlN2QudGFyLmd6PiINCg0KIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBu
YXRpdmUNCg0KZGlmZiAtLWdpdCBhL3JlY2lwZXMtbW9uby9saWJnZGlwbHVzL2xpYmdkaXBsdXNf
NC4yLmJiPGh0dHA6Ly9saWJnZGlwbHVzXzQuMi5iYj4gYi9yZWNpcGVzLW1vbm8vbGliZ2RpcGx1
cy9saWJnZGlwbHVzXzQuMi5iYjxodHRwOi8vbGliZ2RpcGx1c180LjIuYmI+DQppbmRleCAwMGVi
NDA2Li4wM2Q4N2Y3IDEwMDY0NA0KLS0tIGEvcmVjaXBlcy1tb25vL2xpYmdkaXBsdXMvbGliZ2Rp
cGx1c180LjIuYmI8aHR0cDovL2xpYmdkaXBsdXNfNC4yLmJiPg0KKysrIGIvcmVjaXBlcy1tb25v
L2xpYmdkaXBsdXMvbGliZ2RpcGx1c180LjIuYmI8aHR0cDovL2xpYmdkaXBsdXNfNC4yLmJiPg0K
QEAgLTEyLDkgKzEyLDkgQEAgUEFDS0FHRUNPTkZJR1t0aWZmXSA9ICItLXdpdGgtbGlidGlmZiwt
LXdpdGhvdXQtbGlidGlmZix0aWZmIg0KIFBBQ0tBR0VDT05GSUdbZ2lmXSA9ICItLXdpdGgtbGli
Z2lmLC0td2l0aG91dC1saWJnaWYsZ2lmbGliIg0KIFBBQ0tBR0VDT05GSUdbZXhpZl0gPSAiLS13
aXRoLWxpYmV4aWYsLS13aXRob3V0LWxpYmV4aWYsbGliZXhpZiINCg0KLVNSQ19VUkkgPSAiaHR0
cHM6Ly9naXRodWIuY29tL21vbm8vbGliZ2RpcGx1cy9hcmNoaXZlLyR7UFZ9LnRhci5nejxodHRw
czovL2dpdGh1Yi5jb20vbW9uby9saWJnZGlwbHVzL2FyY2hpdmUvJCU3YlBWJTdkLnRhci5nej4g
XA0KLSAgICAgICAgICBmaWxlOi8vMDEtcmVtb3ZlLWxpYmpwZWctcGF0aC5wYXRjaCBcDQotICAg
ICAgICINCitTUkNfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9tb25vL2xpYmdkaXBsdXMvYXJj
aGl2ZS8ke1BWfS50YXIuZ3o7ZG93bmxvYWRmaWxlbmFtZT1saWJnZGlwbHVzLSR7UFZ9LnRhci5n
ejxodHRwczovL2dpdGh1Yi5jb20vbW9uby9saWJnZGlwbHVzL2FyY2hpdmUvJCU3YlBWJTdkLnRh
ci5nejtkb3dubG9hZGZpbGVuYW1lPWxpYmdkaXBsdXMtJCU3YlBWJTdkLnRhci5nej4gXA0KKyAg
ICAgICAgICAgZmlsZTovLzAxLXJlbW92ZS1saWJqcGVnLXBhdGgucGF0Y2ggXA0KKyAgICAgICAg
ICAiDQoNCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcNCg0KLS0NCjIuMS40DQoNCi0tDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KT3BlbmVtYmVk
ZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc8bWFpbHRvOk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
Pg0KaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1i
ZWRkZWQtZGV2ZWwNCg0K

