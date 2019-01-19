Return-Path: <albert_zhang@xtev.cn>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 19 Jan 2019 07:07:15 UTC
Received: from smtpbg368.qq.com (smtpbg368.qq.com [163.177.87.252])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF857BEF1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 07:07:15 +0000 (UTC)
X-QQ-GoodBg: 2
X-QQ-SSF: 00400000000000F0
X-QQ-FEAT: /A5Igf99+LSDyoadXvgk5VAC/K786izPuICJBZlD8/rIX6OWFD8DXKEeCScHX
	8I/hjVerA3imX334CuerJ9v1hNmcNeF8eUapL4v0mL/Ia4xBtaMsLIJ6L8dU0Z4fH3WxBG3
	mjGgDbMhcXs2f6pN0j3zcgUXS3Ak/E6lRCEHxbcA+n5MJh8uCnuDmnc1AHh20l5ABYK3oJt
	1KMTk2BLBCivhy2ooaalB479YkqXMZ9hJcm7/PV4dzeXEVsUTIrr35X0gO0AWFqXXsIxxZh
	WV7idUH0LCvy10ABzYxQC20x8=
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 101.254.31.0
X-QQ-STYLE: 
X-QQ-mid: bizmailvip86t1547881174t20603
From: "=?utf-8?B?5byg5YGl6b6Z?=" <albert_zhang@xtev.cn>
To: "=?utf-8?B?b3BlbmVtYmVkZGVkLWRldmVs?="
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0
Date: Sat, 19 Jan 2019 14:59:34 +0800
X-Priority: 3
Message-ID: <tencent_24F5095019CF14775C33C5CE@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
	id ; Sat, 19 Jan 2019 14:59:35 +0800 (CST)
Feedback-ID: bizmailvip:xtev.cn:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: About Qualcomm mdm9607 armv7a-neon-vfp-oe cross-compile toolchain
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
X-List-Received-Date: Sat, 19 Jan 2019 07:07:16 -0000
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpXaGVuIGkgd2FubmEgdG8gYnVpbGQgYXJtdjdhLW5lb24tdmZwLW9lIGNyb3NzLWNv
bXBpbGUgdG9vbGNoYWluIGZvciBxdWFsY29tbSBtZG05NjA3LCBiZWNhdXNlIGkganVzdCB3
YW5uYSBidWlsZCB0aGlyZC1wYXJ0eSBzb2Z0d2FyZSBvbiB0aGlzIHRhcmdldCBtYWNoaW5l
LiBCdXQgaSBhbHdheXMgYnVpbHQgZmFpbGVkIHdoZW4gaSB1c2Ugb2UtY29yZS4NCg0KDQpB
dCBmaXJzdCwgaSBjbG9uZSB0aGUgb2UtY29yZSBmcm9tIGNvZGVhdXJvcmE6DQokIHJlcG8g
aW5pdCAtdSBnaXQ6Ly9jb2RlYXVyb3JhLm9yZy9xdWljL2xlL21hbmlmZXN0LmdpdCAtYiBy
ZWxlYXNlIC1tIExFLkJSLjEuMi4xLTg0MDAwLTl4MDcueG1sIC0tcmVwby11cmw9Z2l0Oi8v
Y29kZWF1cm9yYS5vcmcvdG9vbHMvcmVwby5naXQNCiQgcmVwbyBzeW5jDQpBZnRlciBpIGdl
dCB0aGlzIHJlY2lwZXMsIGkgZm9sbG93IHRoZSBXaWtpIG9mIE9wZW5FbWJlZGRlZCBGb3Ig
TVNNLDoNCiQgc291cmNlIG9lLWNvcmUvYnVpbGQvY29uZi9zZXRfYmJfZW52LnNoDQokIGJp
dGJha2UgIC12IG1ldGEtdG9vbGNoYWluDQpCdXQgaSBhbHdheXMgZ2V0IGFuIGVycm9yIHRo
YXQgbWVudGlvbiBtZSBjYW4ndCBpbmhlcml0IHFjb21tb24uYmJjbGFzcywgYmVjYXVzZSBp
biB0aGUgcHJvamVjdCwgaSBjYW4ndCBmaW5kIHRoZSBmaWxlLCBpIGRvbid0IGtub3cgaG93
IHRvIGZpeCB0aGlzIGVycm9yLCBhbmQgd2hpY2ggcmVjaXBlIHNob3VsZCBpIHVzZSB0byBz
ZXR1cCB0aGUgbWFjaGluZSBpbiBiYmxheWVycy5jb25mLg0KDQoNCkkgdHJ5IG1hbnkgbWV0
aG9kIHRvIGdldCB0aGUgdG9vbGNoYWluLCBpIGFsc2UgY2hlY2sgdGhlIGVtYWlsOg0KaHR0
cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvcGlwZXJtYWlsL29wZW5lbWJlZGRlZC1kZXZl
bC8yMDE0LUFwcmlsLzA5NTIyMi5odG1sDQphbmQgT3BlbkVtYmVkZGVkIGRvY3VtZW50cyBh
bmQgR05VUmFkaW8sIGkgZ290IG90aGVycyB0b29sY2hhaW4gc2NyaXB0ZSwgaSBkaWRuJ3Qg
Z2V0IHRoZSBxdWFsY29tbSBtZG05NjA3IHRvb2xjaGFpbi4NCg0KDQpIb3cgY2FuIGkgYnVp
bGQgdGhlIGFybXY3YS1uZW9uLXZmcC1vZSB0b29sY2hhaW4/DQoNCg0KVGhhbmtzDQphbGJl
cnQ=

