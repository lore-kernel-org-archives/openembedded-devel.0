Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OiRPY-0002ZF-Ez for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 14:25:01 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 09 Aug 2010 14:21:57 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.7381); 
	Mon, 9 Aug 2010 14:19:58 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 9 Aug 2010 14:19:57 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 9 Aug 2010 14:19:57 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E6B@deimsg40.de.net.world>
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Thread-Topic: [PATCH][v2 2/2] busybox: fix defconfig handling problems
	triggered by "configure according to {MACHINE,
	DISTRO}_FEATURES"; added inetd handling
Thread-Index: Acs3qdzsn0zj6peDT7mUH7SpFtLE6g==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 09 Aug 2010 12:19:57.0791 (UTC)
	FILETIME=[2E7446F0:01CB37BD]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][v2 2/2] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Aug 2010 12:25:01 -0000
X-Groupsio-MsgNum: 21995
Content-class: urn:content-classes:message
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01CB37BD.2E31226A"

------_=_NextPart_001_01CB37BD.2E31226A
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ok now splitted.

Regards
Wolfgang Hauser

------_=_NextPart_001_01CB37BD.2E31226A
Content-Type: text/plain;
	name="busybox_inetd_2.txt"
Content-Transfer-Encoding: base64
Content-Description: busybox_inetd_2.txt
Content-Disposition: attachment;
	filename="busybox_inetd_2.txt"

YnVzeWJveDogcmV2aXNpb24gY2hhbmdlDQoNClNpZ25lZC1vZmYtYnk6IFdvbGZnYW5nIEhhdXNl
ciA8d29sZmdhbmcuaGF1c2VyLmV4dGVybmFsQGVhZHMuY29tPg0KLS0tDQogcmVjaXBlcy9idXN5
Ym94L2J1c3lib3guaW5jICAgICAgIHwgICAgMiArLQ0KIHJlY2lwZXMvYnVzeWJveC9idXN5Ym94
XzEuMTYuMi5iYiB8ICAgIDIgKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3JlY2lwZXMvYnVzeWJveC9idXN5Ym94Lmlu
YyBiL3JlY2lwZXMvYnVzeWJveC9idXN5Ym94LmluYw0KaW5kZXggYjQ2NjNmMC4uZjc3NjEzZSAx
MDA2NDQNCi0tLSBhL3JlY2lwZXMvYnVzeWJveC9idXN5Ym94LmluYw0KKysrIGIvcmVjaXBlcy9i
dXN5Ym94L2J1c3lib3guaW5jDQpAQCAtMTEsNyArMTEsNyBAQCBMSUNFTlNFID0gIkdQTHYyIg0K
IFNFQ1RJT04gPSAiYmFzZSINCiBQUklPUklUWSA9ICJyZXF1aXJlZCINCiANCi1JTkNfUFIgPSAi
cjMyIg0KK0lOQ19QUiA9ICJyMzMiDQogDQogU1JDX1VSSSA9ICJcDQogICBmaWxlOi8vYnVzeWJv
eC1jcm9uIFwNCmRpZmYgLS1naXQgYS9yZWNpcGVzL2J1c3lib3gvYnVzeWJveF8xLjE2LjIuYmIg
Yi9yZWNpcGVzL2J1c3lib3gvYnVzeWJveF8xLjE2LjIuYmINCmluZGV4IDY0MDFiZmEuLjBlNmEy
NTAgMTAwNjQ0DQotLS0gYS9yZWNpcGVzL2J1c3lib3gvYnVzeWJveF8xLjE2LjIuYmINCisrKyBi
L3JlY2lwZXMvYnVzeWJveC9idXN5Ym94XzEuMTYuMi5iYg0KQEAgLTEsNSArMSw1IEBADQogcmVx
dWlyZSBidXN5Ym94LmluYw0KLVBSID0gIiR7SU5DX1BSfS4yIg0KK1BSID0gIiR7SU5DX1BSfS4z
Ig0KIA0KIERFRkFVTFRfUFJFRkVSRU5DRSA9ICItMSINCiBERUZBVUxUX1BSRUZFUkVOQ0Vfc2hy
ID0gIjEiDQotLSANCjEuNS42LjUNCg==

------_=_NextPart_001_01CB37BD.2E31226A--
