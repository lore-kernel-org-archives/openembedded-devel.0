Return-Path: <nick.lewis@usa.g4s.com>
X-Greylist: delayed 378 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 15:52:56 UTC
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.143])
	by mail.openembedded.org (Postfix) with ESMTP id 132AF66011
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 15:52:56 +0000 (UTC)
Received: from [85.158.139.19:28852] by server-7.bemta-5.messagelabs.com id
	1C/3B-20531-BD309635; Tue, 06 May 2014 15:46:35 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-14.tower-178.messagelabs.com!1399391195!27115158!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14684 invoked from network); 6 May 2014 15:46:35 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-14.tower-178.messagelabs.com with RC4-SHA encrypted SMTP;
	6 May 2014 15:46:35 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Tue, 6 May 2014
	16:46:34 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 6 May 2014 16:46:34 +0100
Thread-Topic: [PATCH] libxml plus plus ptest with B noteq S
Thread-Index: Ac9pQnTPSONgJqtuTkC05Et2O+zEnw==
Message-ID: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC4@GBTWK10E001.Technology.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: [PATCH] libxml plus plus ptest with B noteq S
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
X-List-Received-Date: Tue, 06 May 2014 15:52:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbSA2YzFiYjBjMTI2YzMyMjEyYjM0NjY0NzA5ODc0MjE1ZjQzODRjY2M0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogTmljayBMZXdpcyA8bmljay5sZXdpc0B1c2EuZzRzLmNvbT4N
CkRhdGU6IFR1ZSwgNiBNYXkgMjAxNCAxNjozNjowNSArMDEwMA0KU3ViamVjdDogW1BBVENIXSBs
aWJ4bWwgcGx1cyBwbHVzIHB0ZXN0IHdpdGggQiBub3RlcSBTDQoNClNpZ25lZC1vZmYtYnk6IE5p
Y2sgTGV3aXMgPG5pY2subGV3aXNAdXNhLmc0cy5jb20+DQotLS0NCiBtZXRhLW9lL3JlY2lwZXMt
Y29yZS9saWJ4bWwvbGlieG1sKystMi4zNy4xL2xpYnhtbCsrX3B0ZXN0LnBhdGNoIHwgNCArKy0t
DQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwrKy0yLjM3LjEvbGli
eG1sKytfcHRlc3QucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sKyst
Mi4zNy4xL2xpYnhtbCsrX3B0ZXN0LnBhdGNoDQppbmRleCBhMTg4MjJmLi4xZTg0N2JlIDEwMDY0
NA0KLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbCsrLTIuMzcuMS9saWJ4
bWwrK19wdGVzdC5wYXRjaA0KKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnht
bCsrLTIuMzcuMS9saWJ4bWwrK19wdGVzdC5wYXRjaA0KQEAgLTY1LDkgKzY1LDkgQEAgaW5kZXgg
ZDk1NDFjYS4uYzI4YjQ5YyAxMDA2NDQNCiArICAgICAgJChNS0RJUl9QKSAkKERFU1RESVIpL2V4
YW1wbGVzDQogKyAgICAgIGNwIC0tcGFyZW50cyAkKGNoZWNrX0RPVExJQlMpICQoREVTVERJUikv
ZXhhbXBsZXMNCiArICAgICAgY3AgLS1wYXJlbnRzICQoY2hlY2tfU0NSSVBUUykgJChERVNURElS
KS9leGFtcGxlcw0KLSsgICAgICBjcCAtLXBhcmVudHMgJChkaXN0X25vaW5zdF9EQVRBKSAkKERF
U1RESVIpL2V4YW1wbGVzDQorKyAgICAgICQoZm9yZWFjaCBpLCAkKGRpc3Rfbm9pbnN0X0RBVEEp
LCBjcCAtLXBhcmVudHMgJChzcmNkaXIpLyQoaSkgJChERVNURElSKS9leGFtcGxlczspDQogKyAg
ICAgIGNwIE1ha2VmaWxlICQoREVTVERJUikvZXhhbXBsZXMNCiArICAgICAgJChNS0RJUl9QKSAk
KERFU1RESVIpL21hY3Jvcw0KLSsgICAgICBjcCAuLi9tYWNyb3MvdGVzdC1kcml2ZXIgJChERVNU
RElSKS9tYWNyb3MNCisrICAgICAgY3AgJChzcmNkaXIpLy4uL21hY3Jvcy90ZXN0LWRyaXZlciAk
KERFU1RESVIpL21hY3Jvcw0KICsgICAgICBzZWQgLWkgLWUgJ3N8Xk1ha2VmaWxlOnxfTWFrZWZp
bGU6fCcgJChERVNURElSKS9leGFtcGxlcy9NYWtlZmlsZQ0KICsNCi0tDQoxLjkuMQ0KDQoNCk5p
Y2sgTGV3aXMNCm5pY2subGV3aXNAdXNhLmc0cy5jb20NCis0NCAxNjg0IDI3NzEzNw0Kd3d3Lmc0
c3RlY2hub2xvZ3kuY29tDQpOZXcgQ2hhbGxlbmdlIEhvdXNlLCBJbnRlcm5hdGlvbmFsIERyaXZl
LCBUZXdrZXNidXJ5LCBHbG91Y2VzdGVyc2hpcmUsIEdMMjAgOFVRLCBVSw0KDQrvgZAgUGxlYXNl
IGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlbWFpbA0KDQoN
ClRoZSBkZXRhaWxzIG9mIHRoaXMgY29tcGFueSBhcmUgYXMgZm9sbG93czoNCkc0UyBUZWNobm9s
b2d5IExpbWl0ZWQsIFJlZ2lzdGVyZWQgT2ZmaWNlOiBDaGFsbGVuZ2UgSG91c2UsIEludGVybmF0
aW9uYWwgRHJpdmUsIFRld2tlc2J1cnksIEdsb3VjZXN0ZXJzaGlyZSBHTDIwIDhVUSwgUmVnaXN0
ZXJlZCBpbiBFbmdsYW5kIE5vLiAyMzgyMzM4Lg0KDQpUaGlzIGNvbW11bmljYXRpb24gbWF5IGNv
bnRhaW4gaW5mb3JtYXRpb24gd2hpY2ggaXMgY29uZmlkZW50aWFsLCBwZXJzb25hbCBhbmQvb3Ig
cHJpdmlsZWdlZC4NCg0KSXQgaXMgZm9yIHRoZSBleGNsdXNpdmUgdXNlIG9mIHRoZSBpbnRlbmRl
ZCByZWNpcGllbnQocykuDQpJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMp
LCBwbGVhc2Ugbm90ZSB0aGF0IGFueSBkaXN0cmlidXRpb24sIGZvcndhcmRpbmcsIGNvcHlpbmcg
b3IgdXNlIG9mIHRoaXMgY29tbXVuaWNhdGlvbiBvciB0aGUgaW5mb3JtYXRpb24gaW4gaXQgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZC4NCg0KQW55IHBlcnNvbmFsIHZpZXdzIGV4cHJlc3NlZCBpbiB0
aGlzIGUtbWFpbCBhcmUgdGhvc2Ugb2YgdGhlIGluZGl2aWR1YWwgc2VuZGVyIGFuZCB0aGUgY29t
cGFueSBkb2VzIG5vdCBlbmRvcnNlIG9yIGFjY2VwdCByZXNwb25zaWJpbGl0eSBmb3IgdGhlbS4N
Cg0KUHJpb3IgdG8gdGFraW5nIGFueSBhY3Rpb24gYmFzZWQgdXBvbiB0aGlzIGUtbWFpbCBtZXNz
YWdlLCB5b3Ugc2hvdWxkIHNlZWsgYXBwcm9wcmlhdGUgY29uZmlybWF0aW9uIG9mIGl0cyBhdXRo
ZW50aWNpdHkuDQoNClRoaXMgZS1tYWlsIGhhcyBiZWVuIHNjYW5uZWQgZm9yIGFsbCB2aXJ1c2Vz
IGJ5IE1lc3NhZ2VMYWJzLg0K

