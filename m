Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 600BD73CF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 02:26:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99869262"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Aug 2015 10:29:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7L2QU0d005525;
	Fri, 21 Aug 2015 10:26:31 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Fri, 21 Aug 2015 10:26:34 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-oe][PATCH 1/5] waf-samba: add new class
Thread-Index: AQHQ22E5ErdPZgiuqkeA0G+SrwUi554VoqPw//+FsQCAAI4zEA==
Date: Fri, 21 Aug 2015 02:26:33 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC011C1F957A@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
	<1440086369-3321-2-git-send-email-koen@dominion.thruhere.net>
	<30DC4EDFD798C94083F3E083754532CC011C1F94CC@G08CNEXMBPEKD03.g08.fujitsu.local>
	<E7B82DA7-F22E-48D9-A3A5-A21E22DF54FE@dominion.thruhere.net>
In-Reply-To: <E7B82DA7-F22E-48D9-A3A5-A21E22DF54FE@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 21 Aug 2015 02:26:43 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLb2VuIEtvb2kgW21haWx0bzpr
b2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldF0NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMjEsIDIw
MTUgOTo0MiBBTQ0KPiBUbzogQmlhbiwgTmFpbWVuZw0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVs
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFttZXRhLW9lXVtQQVRDSCAx
LzVdIHdhZi1zYW1iYTogYWRkIG5ldyBjbGFzcw0KPiANCj4gT3AgMjEgYXVnLiAyMDE1IG9tIDAz
OjExIGhlZWZ0IEJpYW4sIE5haW1lbmcgPGJpYW5ubUBjbi5mdWppdHN1LmNvbT4gaGV0DQo+IHZv
bGdlbmRlIGdlc2NocmV2ZW46DQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBLb2VuIEtvb2kgW21haWx0bzprb2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldF0N
Cj4gPj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAyMCwgMjAxNSAxMTo1OSBQTQ0KPiA+PiBUbzog
b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gQ2M6IEJpYW4s
IE5haW1lbmc7IEtvZW4gS29vaQ0KPiA+PiBTdWJqZWN0OiBbbWV0YS1vZV1bUEFUQ0ggMS81XSB3
YWYtc2FtYmE6IGFkZCBuZXcgY2xhc3MNCj4gPj4NCj4gPj4gRnJvbTogQmlhbiBOYWltZW5nIDxi
aWFubm1AY24uZnVqaXRzdS5jb20+DQo+ID4+DQo+ID4+IHdhZi1zYW1iYSBpcyBhIGJ1aWxkIHN5
c3RlbSB1c2VkIGJ5IHNhbWJhIHJlbGF0ZWQgc29mdHdhcmUNCj4gPj4NCj4gPj4gU2lnbmVkLW9m
Zi1ieTogQmlhbiBOYWltZW5nIDxiaWFubm1AY24uZnVqaXRzdS5jb20+DQo+ID4+IFNpZ25lZC1v
ZmYtYnk6IEtvZW4gS29vaSA8a29lbkBkb21pbmlvbi50aHJ1aGVyZS5uZXQ+DQo+ID4+IC0tLQ0K
PiA+PiBtZXRhLW9lL2NsYXNzZXMvd2FmLXNhbWJhLmJiY2xhc3MgfCA1MQ0KPiA+PiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4gMSBmaWxlIGNoYW5nZWQsIDUx
IGluc2VydGlvbnMoKykNCj4gPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvY2xhc3Nlcy93
YWYtc2FtYmEuYmJjbGFzcw0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9jbGFzc2Vz
L3dhZi1zYW1iYS5iYmNsYXNzDQo+ID4+IGIvbWV0YS1vZS9jbGFzc2VzL3dhZi1zYW1iYS5iYmNs
YXNzDQo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+IGluZGV4IDAwMDAwMDAuLmI4ZTAx
MGENCj4gPj4gLS0tIC9kZXYvbnVsbA0KPiA+PiArKysgYi9tZXRhLW9lL2NsYXNzZXMvd2FmLXNh
bWJhLmJiY2xhc3MNCj4gPj4gQEAgLTAsMCArMSw1MSBAQA0KPiA+PiArIyB3YWYgaXMgYSBidWls
ZCBzeXN0ZW0gd2hpY2ggaXMgdXNlZCBieSBzYW1iYSByZWxhdGVkIHByb2plY3QuDQo+ID4+ICsj
IE9idGFpbiBkZXRhaWxzIGZyb20gaHR0cHM6Ly93aWtpLnNhbWJhLm9yZy9pbmRleC5waHAvV2Fm
DQo+ID4+ICsjDQo+ID4+ICtpbmhlcml0IHFlbXUgcHl0aG9ubmF0aXZlDQo+ID4+ICsNCj4gPj4g
K0RFUEVORFMgKz0gInFlbXUtbmF0aXZlIGxpYnhzbHQtbmF0aXZlDQo+ID4+ICtkb2Nib29rLXhz
bC1zdHlsZXNoZWV0cy1uYXRpdmUNCj4gPj4gcHl0aG9uIg0KPiA+PiArDQo+ID4+ICtDT05GSUdV
UkVPUFRTID0gIiAtLXByZWZpeD0ke3ByZWZpeH0gwqUNCj4gPj4gKyAgICAgICAgICAgICAgICAg
IC0tYmluZGlyPSR7YmluZGlyfSDCpQ0KPiA+PiArICAgICAgICAgICAgICAgICAgLS1zYmluZGly
PSR7c2JpbmRpcn0gwqUNCj4gPj4gKyAgICAgICAgICAgICAgICAgIC0tbGliZXhlY2Rpcj0ke2xp
YmV4ZWNkaXJ9IMKlDQo+ID4+ICsgICAgICAgICAgICAgICAgICAtLWRhdGFkaXI9JHtkYXRhZGly
fSDCpQ0KPiA+PiArICAgICAgICAgICAgICAgICAgLS1zeXNjb25mZGlyPSR7c3lzY29uZmRpcn0g
wqUNCj4gPj4gKyAgICAgICAgICAgICAgICAgIC0tc2hhcmVkc3RhdGVkaXI9JHtzaGFyZWRzdGF0
ZWRpcn0gwqUNCj4gPj4gKyAgICAgICAgICAgICAgICAgIC0tbG9jYWxzdGF0ZWRpcj0ke2xvY2Fs
c3RhdGVkaXJ9IMKlDQo+ID4+ICsgICAgICAgICAgICAgICAgICAtLWxpYmRpcj0ke2xpYmRpcn0g
wqUNCj4gPj4gKyAgICAgICAgICAgICAgICAgIC0taW5jbHVkZWRpcj0ke2luY2x1ZGVkaXJ9IMKl
DQo+ID4+ICsgICAgICAgICAgICAgICAgICAtLW9sZGluY2x1ZGVkaXI9JHtvbGRpbmNsdWRlZGly
fSDCpQ0KPiA+PiArICAgICAgICAgICAgICAgICAgLS1pbmZvZGlyPSR7aW5mb2Rpcn0gwqUNCj4g
Pj4gKyAgICAgICAgICAgICAgICAgIC0tbWFuZGlyPSR7bWFuZGlyfSDCpQ0KPiA+PiArICAgICAg
ICAgICAgICAgICINCj4gPj4gKw0KPiA+PiArZG9fY29uZmlndXJlKCkgew0KPiA+PiArICAgIHFl
bXVfYmluYXJ5PSIke0BxZW11X3RhcmdldF9iaW5hcnkoZCl9Ig0KPiA+PiArICAgIGlmIFsgJHtx
ZW11X2JpbmFyeX0gPT0gInFlbXUtYWxsYXJjaCIgXTsgdGhlbg0KPiA+PiArICAgICAgICBxZW11
X2JpbmFyeT0icWVtdXdyYXBwZXIiDQo+ID4+ICsgICAgZmkNCj4gPj4gKw0KPiA+PiArICAgIGxp
YmRpcl9xZW11PSIke1NUQUdJTkdfRElSX0hPU1R9LyR7bGliZGlyfSINCj4gPj4gKyAgICBiYXNl
X2xpYmRpcl9xZW11PSIke1NUQUdJTkdfRElSX0hPU1R9LyR7YmFzZV9saWJkaXJ9Ig0KPiA+PiAr
ICAgIG9sZGVzdF9rZXJuZWxfcWVtdT0ke09MREVTVF9LRVJORUx9DQo+ID4+ICsNCj4gPj4gKyAg
ICBDUk9TU19FWEVDPSIke3FlbXVfYmluYXJ5fSDCpQ0KPiA+PiArICAgICAgICAgICAgICAgIC1y
ICR7b2xkZXN0X2tlcm5lbF9xZW11fSDCpQ0KPiA+PiArICAgICAgICAgICAgICAgIC1MICR7U1RB
R0lOR19ESVJfSE9TVH0gwqUNCj4gPj4gKyAgICAgICAgICAgICAgICAtRSBMRF9MSUJSQVJZX1BB
VEg9JHtsaWJkaXJfcWVtdX06JHtiYXNlX2xpYmRpcl9xZW11fSINCj4gPj4gKw0KPiA+PiArICAg
IGV4cG9ydCBCVUlMRF9TWVM9JHtCVUlMRF9TWVN9DQo+ID4+ICsgICAgZXhwb3J0IEhPU1RfU1lT
PSR7SE9TVF9TWVN9DQo+ID4+ICsgICAgZXhwb3J0IEJVSUxEX0FSQ0g9JHtCVUlMRF9BUkNIfQ0K
PiA+PiArICAgIGV4cG9ydCBIT1NUX0FSQ0g9JHtIT1NUX0FSQ0h9DQo+ID4+ICsgICAgZXhwb3J0
IFNUQUdJTkdfTElCRElSPSR7U1RBR0lOR19MSUJESVJ9DQo+ID4+ICsgICAgZXhwb3J0IFNUQUdJ
TkdfSU5DRElSPSR7U1RBR0lOR19JTkNESVJ9DQo+ID4+ICsgICAgZXhwb3J0IFBZVEhPTlBBVEg9
JHtTVEFHSU5HX0RJUl9IT1NUfSR7UFlUSE9OX1NJVEVQQUNLQUdFU19ESVJ9DQo+ID4+ICsNCj4g
Pj4gKyAgICAuL2NvbmZpZ3VyZSAke0NPTkZJR1VSRU9QVFN9ICR7RVhUUkFfT0VDT05GfSAtLWNy
b3NzLWNvbXBpbGUNCj4gPj4gLS1jcm9zcy1leGVjdXRlPSIke0NST1NTX0VYRUN9Ig0KPiA+PiAt
LWNyb3NzLWFuc3dlcnM9JHtCfS9jcm9zcy1hbnN3ZXJzLSR7VEFSR0VUX0FSQ0h9LnR4dA0KPiA+
DQo+ID4gVGhhbmtzIGZvciB5b3VyIHVwZGF0ZS4NCj4gPg0KPiA+IFdvdWxkIHlvdSB0ZWxsIG1l
IHdoeSBib3RoIC0tY3Jvc3MtZXhlY3V0ZSBhbmQgLS1jcm9zcy1hbnN3ZXIgYXJlIHJlcXVpcmVk
Lg0KPiANCj4gdGhhdCdzIHRoZSBuZXcgaHlicmlkIG1vZGUsIGl0IHdpbGwgZ2VuZXJhdGUgY3Jv
c3NhbnN3ZXJzIGZpbGVzIHVzaW5nIHFlbXUuDQo+IEkgYWxzbyBoYXZlIHBsYXRmb3JtcyB3aXRo
b3V0IHFlbXUgc3VwcG9ydA0KPiANCg0KRG9lcyBpdCBtZWFuIGNyb3NzYW5zd2VycyBmaWxlIGNh
biBiZSBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBxZW11IHdoaWxlIGRvaW5nIGNvbmZpZ3Vy
ZS4NCklmIHNvLCBpdCdzIGdvb2QgdG8gbWUuDQoNClRoYW5rcw0KIEJpYW4NCg0KPiANCj4gPiBJ
ZiB0aGUgLS1jcm9zcy1hbnN3ZXJzIGlzIG5vdCBiZSByZXF1aXJlZCwgSU1PLCB3ZSBkbyBub3Qg
bmVlZCBzdXBwb3J0IGl0Lg0KPiA+IEJlY2F1c2UgaXQgd2lsbCBiZSBub3QgYW4gZWFzeSBqb2Ig
dG8gbWFpbnRhaW4NCj4gPiBjcm9zcy1hbnN3ZXJzLSR7VEFSR0VUX0FSQ0h9LnR4dCBmb3IgZWFj
aCB3YWYtc2FtYmEuYmJjbGFzcyBiYXNlZCByZWNpcGUuDQo+ID4NCj4gPiBUaGFua3MNCj4gPiBC
aWFuDQo+ID4NCj4gPj4gK30NCj4gPj4gKw0KPiA+PiArZG9faW5zdGFsbCgpIHsNCj4gPj4gKyAg
ICBvZV9ydW5tYWtlIGluc3RhbGwgREVTVERJUj0ke0R9DQo+ID4+ICt9DQo+ID4+IC0tDQo+ID4+
IDIuMC4xDQo+ID4NCg==

