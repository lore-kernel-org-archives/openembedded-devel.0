Return-Path: <nick.lewis@usa.g4s.com>
X-Greylist: delayed 423 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 13:14:56 UTC
Received: from mail1.bemta14.messagelabs.com (mail1.bemta14.messagelabs.com
	[193.109.254.107])
	by mail.openembedded.org (Postfix) with ESMTP id ED69165FDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 13:14:56 +0000 (UTC)
Received: from [85.158.140.195:30419] by server-3.bemta-14.messagelabs.com id
	94/72-22179-9AED8635; Tue, 06 May 2014 13:07:53 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-13.tower-193.messagelabs.com!1399381638!11876832!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17178 invoked from network); 6 May 2014 13:07:18 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-13.tower-193.messagelabs.com with RC4-SHA encrypted SMTP;
	6 May 2014 13:07:18 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Tue, 6 May 2014
	14:07:17 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 6 May 2014 14:07:16 +0100
Thread-Topic: Fix for libxml++_ptest.patch with out-of-source build
Thread-Index: Ac9pK4mbW4sFdOQsQFSIp5+yt9wqjg==
Message-ID: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC0@GBTWK10E001.Technology.local>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Fix for libxml++_ptest.patch with out-of-source build
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
X-List-Received-Date: Tue, 06 May 2014 13:14:58 -0000
X-Groupsio-MsgNum: 49716
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC0GBTWK10E001Te_"

--_004_AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC0GBTWK10E001Te_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The libxml++_ptest.patch currently supplied with the libxml++ recipe does n=
ot produce a Makefile that works for out-of-source builds. Please find atta=
ched a patch that resolves this problem

Apologies
Nick

Nick Lewis
nick.lewis@usa.g4s.com<mailto:nick.lewis@usa.g4s.com>
+44 1684 277137<tel:+441684277137>
www.g4stechnology.com<http://www.g4stechnology.com/>
New Challenge House, International Drive, Tewkesbury, Gloucestershire, GL20=
 8UQ, UK

P Please consider the environment before printing this email


________________________________
The details of this company are as follows:
G4S Technology Limited, Registered Office: Challenge House, International D=
rive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 23823=
38.

This communication may contain information which is confidential, personal =
and/or privileged.

It is for the exclusive use of the intended recipient(s).
If you are not the intended recipient(s), please note that any distribution=
, forwarding, copying or use of this communication or the information in it=
 is strictly prohibited.

Any personal views expressed in this e-mail are those of the individual sen=
der and the company does not endorse or accept responsibility for them.

Prior to taking any action based upon this e-mail message, you should seek =
appropriate confirmation of its authenticity.

This e-mail has been scanned for all viruses by MessageLabs.

--_004_AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC0GBTWK10E001Te_
Content-Type: application/octet-stream;
	name="0001-Fix-libxml-_ptest.patch-with-out-of-source-build.patch"
Content-Description: 0001-Fix-libxml-_ptest.patch-with-out-of-source-build.patch
Content-Disposition: attachment;
	filename="0001-Fix-libxml-_ptest.patch-with-out-of-source-build.patch";
	size=1247; creation-date="Tue, 06 May 2014 14:01:32 GMT";
	modification-date="Tue, 06 May 2014 13:57:48 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2NmI1NzI2MDE2NGU2Y2Y0ODZiZDdmN2YyNmM0MTExMmU2MDNkZmQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWNrIExld2lzIDxuaWNrLmxld2lzQHVzYS5nNHMuY29tPgpE
YXRlOiBUdWUsIDYgTWF5IDIwMTQgMTM6Mzg6MDQgKzAxMDAKU3ViamVjdDogW1BBVENIXSBGaXgg
bGlieG1sKytfcHRlc3QucGF0Y2ggd2l0aCBvdXQtb2Ytc291cmNlIGJ1aWxkCgotLS0KIG1ldGEt
b2UvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwrKy0yLjM3LjEvbGlieG1sKytfcHRlc3QucGF0
Y2ggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbCsrLTIu
MzcuMS9saWJ4bWwrK19wdGVzdC5wYXRjaCBiL21ldGEtb2UvcmVjaXBlcy1jb3JlL2xpYnhtbC9s
aWJ4bWwrKy0yLjM3LjEvbGlieG1sKytfcHRlc3QucGF0Y2gKaW5kZXggYTE4ODIyZi4uMWU4NDdi
ZSAxMDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbCsrLTIuMzcu
MS9saWJ4bWwrK19wdGVzdC5wYXRjaAorKysgYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9saWJ4bWwv
bGlieG1sKystMi4zNy4xL2xpYnhtbCsrX3B0ZXN0LnBhdGNoCkBAIC02NSw5ICs2NSw5IEBAIGlu
ZGV4IGQ5NTQxY2EuLmMyOGI0OWMgMTAwNjQ0CiArCSQoTUtESVJfUCkgJChERVNURElSKS9leGFt
cGxlcwogKwljcCAtLXBhcmVudHMgJChjaGVja19ET1RMSUJTKSAkKERFU1RESVIpL2V4YW1wbGVz
CiArCWNwIC0tcGFyZW50cyAkKGNoZWNrX1NDUklQVFMpICQoREVTVERJUikvZXhhbXBsZXMKLSsJ
Y3AgLS1wYXJlbnRzICQoZGlzdF9ub2luc3RfREFUQSkgJChERVNURElSKS9leGFtcGxlcworKwkk
KGZvcmVhY2ggaSwgJChkaXN0X25vaW5zdF9EQVRBKSwgY3AgLS1wYXJlbnRzICQoc3JjZGlyKS8k
KGkpICQoREVTVERJUikvZXhhbXBsZXM7KQogKwljcCBNYWtlZmlsZSAkKERFU1RESVIpL2V4YW1w
bGVzCiArCSQoTUtESVJfUCkgJChERVNURElSKS9tYWNyb3MKLSsJY3AgLi4vbWFjcm9zL3Rlc3Qt
ZHJpdmVyICQoREVTVERJUikvbWFjcm9zCisrCWNwICQoc3JjZGlyKS8uLi9tYWNyb3MvdGVzdC1k
cml2ZXIgJChERVNURElSKS9tYWNyb3MKICsJc2VkIC1pIC1lICdzfF5NYWtlZmlsZTp8X01ha2Vm
aWxlOnwnICQoREVTVERJUikvZXhhbXBsZXMvTWFrZWZpbGUKICsKLS0gCjEuOS4xCgo=

--_004_AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC0GBTWK10E001Te_--
