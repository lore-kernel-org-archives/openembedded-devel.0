Return-Path: <Adrian.Calianu@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.39])
	by mail.openembedded.org (Postfix) with ESMTP id 85E3671989
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 09:24:26 +0000 (UTC)
Received: from 1cjjRq-0003Bv-TO by out10b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Calianu@enea.com>)
	id 1cjjRq-0003DW-UK; Fri, 03 Mar 2017 01:24:26 -0800
Received: by emcmailer; Fri, 03 Mar 2017 01:24:26 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10b.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <Adrian.Calianu@enea.com>)
	id 1cjjRq-0003Bv-TO; Fri, 03 Mar 2017 01:24:26 -0800
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0319.002; Fri, 3 Mar 2017 10:24:26 +0100
From: Adrian Calianu <Adrian.Calianu@enea.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] krb5: allow to generate empty package
Thread-Index: AQHSk2/9RhqJzZm65EiPMqygyxm2A6GBszOAgAEkfaA=
Date: Fri, 3 Mar 2017 09:24:24 +0000
Message-ID: <A1661D2DDD942248A02617DE63569A01AC279256@SESTOEX04.enea.se>
References: <1488471230-46540-1-git-send-email-adrian.calianu@enea.com>
	<CA+chaQecKFVLcU6zXnNSUfogCNRmp08bJW1gnyvxTVoXaJ_Ezg@mail.gmail.com>
In-Reply-To: <CA+chaQecKFVLcU6zXnNSUfogCNRmp08bJW1gnyvxTVoXaJ_Ezg@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.15.162]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Calianu@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] krb5: allow to generate empty package
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
X-List-Received-Date: Fri, 03 Mar 2017 09:24:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFydGluLA0KDQpGcm9tOiBNYXJ0aW4gSmFuc2EgW21haWx0bzptYXJ0aW4uamFuc2FAZ21h
aWwuY29tXQ0KU2VudDogVGh1cnNkYXksIE1hcmNoIDAyLCAyMDE3IDY6NTMgUE0NClRvOiBBZHJp
YW4gQ2FsaWFudSA8QWRyaWFuLkNhbGlhbnVAZW5lYS5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWRl
dmVsIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6
IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSF0ga3JiNTogYWxsb3cgdG8gZ2VuZXJhdGUgZW1wdHkg
cGFja2FnZQ0KDQo+IFNpbmNlIG90aGVyIHBhY2thZ2VzIG1heSBkZXBlbmQgb24ga3JiNSgke1BO
fSkuDQoNClRoZW4gZml4IHRoZXNlIG90aGVyIHBhY2thZ2VzLg0KW0FkcmlhbiBDYWxpYW51XSAg
ICAgICAgICAgSWYgeW91IHdhbnQgdG8gaW5zdGFsbCBrcmI1LWRldiwga3JiNS1kYmcgcGFja2Fn
ZXMsIHRoZXkgYXJlIGRlcGVuZGVudCBvbiBrcmI1IGJ1dCBpdCBkb2VzIG5vdCBleGlzdHMhDQoN
Ci9BZHJpYW4NCg0KDQpPbiBUaHUsIE1hciAyLCAyMDE3IGF0IDU6MTMgUE0sIEFkcmlhbiBDYWxp
YW51IDxhZHJpYW4uY2FsaWFudUBlbmVhLmNvbTxtYWlsdG86YWRyaWFuLmNhbGlhbnVAZW5lYS5j
b20+PiB3cm90ZToNClNpbmNlIG90aGVyIHBhY2thZ2VzIG1heSBkZXBlbmQgb24ga3JiNSgke1BO
fSkuDQoNClNpZ25lZC1vZmYtYnk6IEFkcmlhbiBDYWxpYW51IDxhZHJpYW4uY2FsaWFudUBlbmVh
LmNvbTxtYWlsdG86YWRyaWFuLmNhbGlhbnVAZW5lYS5jb20+Pg0KLS0tDQogbWV0YS1vZS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9rcmI1L2tyYjVfMS4xMy42LmJiPGh0dHA6Ly9rcmI1XzEuMTMuNi5i
Yj4gfCAyICsrDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0
IGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9rcmI1L2tyYjVfMS4xMy42LmJiPGh0dHA6
Ly9rcmI1XzEuMTMuNi5iYj4gYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2tyYjUva3Ji
NV8xLjEzLjYuYmI8aHR0cDovL2tyYjVfMS4xMy42LmJiPg0KaW5kZXggNjU2YTAyZi4uYTA1ODlh
NiAxMDA2NDQNCi0tLSBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkva3JiNS9rcmI1XzEu
MTMuNi5iYjxodHRwOi8va3JiNV8xLjEzLjYuYmI+DQorKysgYi9tZXRhLW9lL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2tyYjUva3JiNV8xLjEzLjYuYmI8aHR0cDovL2tyYjVfMS4xMy42LmJiPg0KQEAg
LTEwNyw2ICsxMDcsOCBAQCBQQUNLQUdFUyA9KyAiJHtQTn0tYWRtaW4tc2VydmVyIFwNCiAgICAg
ICAgICAgICAgbGlia3JiNXN1cHBvcnQgXA0KICAgICAgICAgICAgICBsaWJ2ZXJ0byINCg0KK0FM
TE9XX0VNUFRZXyR7UE59ID0gIjEiDQorDQogRklMRVNfJHtQTn0gPSAiIg0KIEZJTEVTXyR7UE59
LWRvYyArPSAiJHtkYXRhZGlyfS9leGFtcGxlcyINCiBGSUxFU18ke1BOfS1kYmcgKz0gIiR7bGli
ZGlyfS9rcmI1L3BsdWdpbnMvKi8uZGVidWciDQotLQ0KMS45LjENCg0KLS0NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpPcGVuZW1iZWRkZWQtZGV2ZWwg
bWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxt
YWlsdG86T3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpodHRwOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZl
bA0KDQo=

