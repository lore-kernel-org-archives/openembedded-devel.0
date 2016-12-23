Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E513477752
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 04:58:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14203264"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Dec 2016 12:58:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4093C477B1D4;
	Fri, 23 Dec 2016 12:57:58 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0319.002; Fri, 23 Dec 2016 12:57:58 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "akuster808@gmail.com" <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe-jethro] [meta-xfce][PATCH] imsettings: move to correct
	directory
Thread-Index: AQHSXNiMdTdEPC0UpUW5vlxSwZ5KLqEU921A
Date: Fri, 23 Dec 2016 04:57:58 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDFE5B81EC@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1482468166-33076-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1482468166-33076-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.93]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 4093C477B1D4.AA40D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [oe-jethro] [meta-xfce][PATCH] imsettings: move to correct directory
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
X-List-Received-Date: Fri, 23 Dec 2016 04:58:01 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgYXJtaW4NCg0KUGxlYXNlIG1lcmdlIHRoaXMgcGF0Y2ggdG8gamV0aHJv
Lg0KDQpCZXN0IHJlZ2FyZHMuDQpMZWkNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZWksIE1hb2h1aQ0KPiBTZW50OiBGcmlk
YXksIERlY2VtYmVyIDIzLCAyMDE2IDEyOjQzIFBNDQo+IFRvOiBvcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogTGVp
LCBNYW9odWkNCj4gU3ViamVjdDogW29lLWpldGhyb10gW21ldGEteGZjZV1b
UEFUQ0hdIGltc2V0dGluZ3M6IG1vdmUgdG8gY29ycmVjdCBkaXJlY3RvcnkN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1hb2h1aUBj
bi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICAuLi4vaW1zZXR0aW5ncy97ID0+
IGltc2V0dGluZ3N9L2d0ay1pcy1yZXF1aXJlZC1ieS1ub3RpZnkucGF0Y2gg
ICAgICAgICAgIHwgMA0KPiAgLi4uL211bHRpLWxpbmUtQUNMT0NBTF9BTUZM
QUdTLWlzbm90LXN1cHBvcnRlZC1ieS1hdXRvcmVjb25mLnBhdGNoICAgICAg
ICB8IDANCj4gIG1ldGEteGZjZS9yZWNpcGVzLWV4dGVuZGVkL3sgPT4gaW1z
ZXR0aW5nc30vaW1zZXR0aW5nc18xLjYuOC5iYiAgICAgICAgICAgfCAwDQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlv
bnMoLSkgIHJlbmFtZSBtZXRhLXhmY2UvcmVjaXBlcy0NCj4gZXh0ZW5kZWQv
aW1zZXR0aW5ncy97ID0+IGltc2V0dGluZ3N9L2d0ay1pcy1yZXF1aXJlZC1i
eS1ub3RpZnkucGF0Y2ggKDEwMCUpDQo+IHJlbmFtZSBtZXRhLXhmY2UvcmVj
aXBlcy1leHRlbmRlZC9pbXNldHRpbmdzL3sgPT4gaW1zZXR0aW5nc30vbXVs
dGktbGluZS0NCj4gQUNMT0NBTF9BTUZMQUdTLWlzbm90LXN1cHBvcnRlZC1i
eS1hdXRvcmVjb25mLnBhdGNoICgxMDAlKSAgcmVuYW1lIG1ldGEtDQo+IHhm
Y2UvcmVjaXBlcy1leHRlbmRlZC97ID0+IGltc2V0dGluZ3N9L2ltc2V0dGlu
Z3NfMS42LjguYmIgKDEwMCUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS14
ZmNlL3JlY2lwZXMtZXh0ZW5kZWQvaW1zZXR0aW5ncy9ndGstaXMtcmVxdWly
ZWQtYnktDQo+IG5vdGlmeS5wYXRjaCBiL21ldGEteGZjZS9yZWNpcGVzLWV4
dGVuZGVkL2ltc2V0dGluZ3MvaW1zZXR0aW5ncy9ndGstaXMtDQo+IHJlcXVp
cmVkLWJ5LW5vdGlmeS5wYXRjaA0KPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUN
Cj4gcmVuYW1lIGZyb20gbWV0YS14ZmNlL3JlY2lwZXMtZXh0ZW5kZWQvaW1z
ZXR0aW5ncy9ndGstaXMtcmVxdWlyZWQtYnktDQo+IG5vdGlmeS5wYXRjaA0K
PiByZW5hbWUgdG8gbWV0YS14ZmNlL3JlY2lwZXMtZXh0ZW5kZWQvaW1zZXR0
aW5ncy9pbXNldHRpbmdzL2d0ay1pcy1yZXF1aXJlZC1ieS0NCj4gbm90aWZ5
LnBhdGNoDQo+IGRpZmYgLS1naXQgYS9tZXRhLXhmY2UvcmVjaXBlcy1leHRl
bmRlZC9pbXNldHRpbmdzL211bHRpLWxpbmUtQUNMT0NBTF9BTUZMQUdTLQ0K
PiBpc25vdC1zdXBwb3J0ZWQtYnktYXV0b3JlY29uZi5wYXRjaCBiL21ldGEt
eGZjZS9yZWNpcGVzLQ0KPiBleHRlbmRlZC9pbXNldHRpbmdzL2ltc2V0dGlu
Z3MvbXVsdGktbGluZS1BQ0xPQ0FMX0FNRkxBR1MtaXNub3Qtc3VwcG9ydGVk
LWJ5LQ0KPiBhdXRvcmVjb25mLnBhdGNoDQo+IHNpbWlsYXJpdHkgaW5kZXgg
MTAwJQ0KPiByZW5hbWUgZnJvbSBtZXRhLXhmY2UvcmVjaXBlcy1leHRlbmRl
ZC9pbXNldHRpbmdzL211bHRpLWxpbmUtQUNMT0NBTF9BTUZMQUdTLQ0KPiBp
c25vdC1zdXBwb3J0ZWQtYnktYXV0b3JlY29uZi5wYXRjaA0KPiByZW5hbWUg
dG8gbWV0YS14ZmNlL3JlY2lwZXMtZXh0ZW5kZWQvaW1zZXR0aW5ncy9pbXNl
dHRpbmdzL211bHRpLWxpbmUtDQo+IEFDTE9DQUxfQU1GTEFHUy1pc25vdC1z
dXBwb3J0ZWQtYnktYXV0b3JlY29uZi5wYXRjaA0KPiBkaWZmIC0tZ2l0IGEv
bWV0YS14ZmNlL3JlY2lwZXMtZXh0ZW5kZWQvaW1zZXR0aW5nc18xLjYuOC5i
YiBiL21ldGEtDQo+IHhmY2UvcmVjaXBlcy1leHRlbmRlZC9pbXNldHRpbmdz
L2ltc2V0dGluZ3NfMS42LjguYmINCj4gc2ltaWxhcml0eSBpbmRleCAxMDAl
DQo+IHJlbmFtZSBmcm9tIG1ldGEteGZjZS9yZWNpcGVzLWV4dGVuZGVkL2lt
c2V0dGluZ3NfMS42LjguYmINCj4gcmVuYW1lIHRvIG1ldGEteGZjZS9yZWNp
cGVzLWV4dGVuZGVkL2ltc2V0dGluZ3MvaW1zZXR0aW5nc18xLjYuOC5iYg0K
PiAtLQ0KPiAxLjguNC4yDQoNCgoK

