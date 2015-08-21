Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8BC73CF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 01:11:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99865934"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Aug 2015 09:14:19 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7L1B0dd000816;
	Fri, 21 Aug 2015 09:11:00 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Fri, 21 Aug 2015 09:11:04 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 1/5] waf-samba: add new class
Thread-Index: AQHQ22E5ErdPZgiuqkeA0G+SrwUi554VoqPw
Date: Fri, 21 Aug 2015 01:11:03 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC011C1F94CC@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
	<1440086369-3321-2-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1440086369-3321-2-git-send-email-koen@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/5] waf-samba: add new class
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
X-List-Received-Date: Fri, 21 Aug 2015 01:11:08 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLb2VuIEtvb2kgW21haWx0bzpr
b2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldF0NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAyMCwg
MjAxNSAxMTo1OSBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gQ2M6IEJpYW4sIE5haW1lbmc7IEtvZW4gS29vaQ0KPiBTdWJqZWN0OiBbbWV0YS1v
ZV1bUEFUQ0ggMS81XSB3YWYtc2FtYmE6IGFkZCBuZXcgY2xhc3MNCj4gDQo+IEZyb206IEJpYW4g
TmFpbWVuZyA8Ymlhbm5tQGNuLmZ1aml0c3UuY29tPg0KPiANCj4gd2FmLXNhbWJhIGlzIGEgYnVp
bGQgc3lzdGVtIHVzZWQgYnkgc2FtYmEgcmVsYXRlZCBzb2Z0d2FyZQ0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQmlhbiBOYWltZW5nIDxiaWFubm1AY24uZnVqaXRzdS5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IEtvZW4gS29vaSA8a29lbkBkb21pbmlvbi50aHJ1aGVyZS5uZXQ+DQo+IC0tLQ0KPiAgbWV0
YS1vZS9jbGFzc2VzL3dhZi1zYW1iYS5iYmNsYXNzIHwgNTENCj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygr
KQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvY2xhc3Nlcy93YWYtc2FtYmEuYmJjbGFz
cw0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvY2xhc3Nlcy93YWYtc2FtYmEuYmJjbGFzcw0K
PiBiL21ldGEtb2UvY2xhc3Nlcy93YWYtc2FtYmEuYmJjbGFzcw0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwLi5iOGUwMTBhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIv
bWV0YS1vZS9jbGFzc2VzL3dhZi1zYW1iYS5iYmNsYXNzDQo+IEBAIC0wLDAgKzEsNTEgQEANCj4g
KyMgd2FmIGlzIGEgYnVpbGQgc3lzdGVtIHdoaWNoIGlzIHVzZWQgYnkgc2FtYmEgcmVsYXRlZCBw
cm9qZWN0Lg0KPiArIyBPYnRhaW4gZGV0YWlscyBmcm9tIGh0dHBzOi8vd2lraS5zYW1iYS5vcmcv
aW5kZXgucGhwL1dhZg0KPiArIw0KPiAraW5oZXJpdCBxZW11IHB5dGhvbm5hdGl2ZQ0KPiArDQo+
ICtERVBFTkRTICs9ICJxZW11LW5hdGl2ZSBsaWJ4c2x0LW5hdGl2ZSBkb2Nib29rLXhzbC1zdHls
ZXNoZWV0cy1uYXRpdmUNCj4gcHl0aG9uIg0KPiArDQo+ICtDT05GSUdVUkVPUFRTID0gIiAtLXBy
ZWZpeD0ke3ByZWZpeH0gXA0KPiArICAgICAgICAgICAgICAgICAgLS1iaW5kaXI9JHtiaW5kaXJ9
IFwNCj4gKyAgICAgICAgICAgICAgICAgIC0tc2JpbmRpcj0ke3NiaW5kaXJ9IFwNCj4gKyAgICAg
ICAgICAgICAgICAgIC0tbGliZXhlY2Rpcj0ke2xpYmV4ZWNkaXJ9IFwNCj4gKyAgICAgICAgICAg
ICAgICAgIC0tZGF0YWRpcj0ke2RhdGFkaXJ9IFwNCj4gKyAgICAgICAgICAgICAgICAgIC0tc3lz
Y29uZmRpcj0ke3N5c2NvbmZkaXJ9IFwNCj4gKyAgICAgICAgICAgICAgICAgIC0tc2hhcmVkc3Rh
dGVkaXI9JHtzaGFyZWRzdGF0ZWRpcn0gXA0KPiArICAgICAgICAgICAgICAgICAgLS1sb2NhbHN0
YXRlZGlyPSR7bG9jYWxzdGF0ZWRpcn0gXA0KPiArICAgICAgICAgICAgICAgICAgLS1saWJkaXI9
JHtsaWJkaXJ9IFwNCj4gKyAgICAgICAgICAgICAgICAgIC0taW5jbHVkZWRpcj0ke2luY2x1ZGVk
aXJ9IFwNCj4gKyAgICAgICAgICAgICAgICAgIC0tb2xkaW5jbHVkZWRpcj0ke29sZGluY2x1ZGVk
aXJ9IFwNCj4gKyAgICAgICAgICAgICAgICAgIC0taW5mb2Rpcj0ke2luZm9kaXJ9IFwNCj4gKyAg
ICAgICAgICAgICAgICAgIC0tbWFuZGlyPSR7bWFuZGlyfSBcDQo+ICsgICAgICAgICAgICAgICAg
Ig0KPiArDQo+ICtkb19jb25maWd1cmUoKSB7DQo+ICsgICAgcWVtdV9iaW5hcnk9IiR7QHFlbXVf
dGFyZ2V0X2JpbmFyeShkKX0iDQo+ICsgICAgaWYgWyAke3FlbXVfYmluYXJ5fSA9PSAicWVtdS1h
bGxhcmNoIiBdOyB0aGVuDQo+ICsgICAgICAgIHFlbXVfYmluYXJ5PSJxZW11d3JhcHBlciINCj4g
KyAgICBmaQ0KPiArDQo+ICsgICAgbGliZGlyX3FlbXU9IiR7U1RBR0lOR19ESVJfSE9TVH0vJHts
aWJkaXJ9Ig0KPiArICAgIGJhc2VfbGliZGlyX3FlbXU9IiR7U1RBR0lOR19ESVJfSE9TVH0vJHti
YXNlX2xpYmRpcn0iDQo+ICsgICAgb2xkZXN0X2tlcm5lbF9xZW11PSR7T0xERVNUX0tFUk5FTH0N
Cj4gKw0KPiArICAgIENST1NTX0VYRUM9IiR7cWVtdV9iaW5hcnl9IFwNCj4gKyAgICAgICAgICAg
ICAgICAtciAke29sZGVzdF9rZXJuZWxfcWVtdX0gXA0KPiArICAgICAgICAgICAgICAgIC1MICR7
U1RBR0lOR19ESVJfSE9TVH0gXA0KPiArICAgICAgICAgICAgICAgIC1FIExEX0xJQlJBUllfUEFU
SD0ke2xpYmRpcl9xZW11fToke2Jhc2VfbGliZGlyX3FlbXV9Ig0KPiArDQo+ICsgICAgZXhwb3J0
IEJVSUxEX1NZUz0ke0JVSUxEX1NZU30NCj4gKyAgICBleHBvcnQgSE9TVF9TWVM9JHtIT1NUX1NZ
U30NCj4gKyAgICBleHBvcnQgQlVJTERfQVJDSD0ke0JVSUxEX0FSQ0h9DQo+ICsgICAgZXhwb3J0
IEhPU1RfQVJDSD0ke0hPU1RfQVJDSH0NCj4gKyAgICBleHBvcnQgU1RBR0lOR19MSUJESVI9JHtT
VEFHSU5HX0xJQkRJUn0NCj4gKyAgICBleHBvcnQgU1RBR0lOR19JTkNESVI9JHtTVEFHSU5HX0lO
Q0RJUn0NCj4gKyAgICBleHBvcnQgUFlUSE9OUEFUSD0ke1NUQUdJTkdfRElSX0hPU1R9JHtQWVRI
T05fU0lURVBBQ0tBR0VTX0RJUn0NCj4gKw0KPiArICAgIC4vY29uZmlndXJlICR7Q09ORklHVVJF
T1BUU30gJHtFWFRSQV9PRUNPTkZ9IC0tY3Jvc3MtY29tcGlsZQ0KPiAtLWNyb3NzLWV4ZWN1dGU9
IiR7Q1JPU1NfRVhFQ30iDQo+IC0tY3Jvc3MtYW5zd2Vycz0ke0J9L2Nyb3NzLWFuc3dlcnMtJHtU
QVJHRVRfQVJDSH0udHh0DQoNClRoYW5rcyBmb3IgeW91ciB1cGRhdGUuDQoNCldvdWxkIHlvdSB0
ZWxsIG1lIHdoeSBib3RoIC0tY3Jvc3MtZXhlY3V0ZSBhbmQgLS1jcm9zcy1hbnN3ZXIgYXJlIHJl
cXVpcmVkLg0KSWYgdGhlIC0tY3Jvc3MtYW5zd2VycyBpcyBub3QgYmUgcmVxdWlyZWQsIElNTywg
d2UgZG8gbm90IG5lZWQgc3VwcG9ydCBpdC4NCkJlY2F1c2UgaXQgd2lsbCBiZSBub3QgYW4gZWFz
eSBqb2IgdG8gbWFpbnRhaW4gY3Jvc3MtYW5zd2Vycy0ke1RBUkdFVF9BUkNIfS50eHQgZm9yDQpl
YWNoIHdhZi1zYW1iYS5iYmNsYXNzIGJhc2VkIHJlY2lwZS4NCg0KVGhhbmtzDQogQmlhbg0KDQo+
ICt9DQo+ICsNCj4gK2RvX2luc3RhbGwoKSB7DQo+ICsgICAgb2VfcnVubWFrZSBpbnN0YWxsIERF
U1RESVI9JHtEfQ0KPiArfQ0KPiAtLQ0KPiAyLjAuMQ0KDQo=

