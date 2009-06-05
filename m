Received: from [193.109.254.163] (helo=mail21.messagelabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <luciani@microsol.ie>)
	id 1MCXQ8-0006DR-ID; Fri, 05 Jun 2009 13:17:12 +0200
X-VirusChecked: Checked
X-Env-Sender: luciani@microsol.ie
X-Msg-Ref: server-10.tower-21.messagelabs.com!1244200085!8271637!1
X-StarScan-Version: 6.0.0; banners=microsol.ie,-,-
X-Originating-IP: [87.198.251.22]
Received: (qmail 8763 invoked from network); 5 Jun 2009 11:08:05 -0000
Received: from 87-198-251-22.ptr.magnet.ie (HELO mail.microsol.ie)
	(87.198.251.22)
	by server-10.tower-21.messagelabs.com with RC4-SHA encrypted SMTP;
	5 Jun 2009 11:08:05 -0000
Received: from mail.microsol.ie ([192.168.32.3]) by mail.microsol.ie
	([192.168.32.3]) with mapi; Fri, 5 Jun 2009 12:08:02 +0100
From: Lucian Ion <luciani@microsol.ie>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Date: Fri, 5 Jun 2009 12:05:01 +0100
Thread-Topic: add log4cxx checksum
Thread-Index: AQHJ5c3PBJL9L90nJESis8aUpjAaoQ==
Message-ID: <974C3B6C9F0A4A43918BACCA33390AC270D44F3462@mail.microsol.ie>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, en-IE
MIME-Version: 1.0
Subject: add log4cxx checksum
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
X-List-Received-Date: Fri, 05 Jun 2009 11:17:12 -0000
X-Groupsio-MsgNum: 11040
Content-Language: en-IE
Content-Type: multipart/mixed;
	boundary="_002_974C3B6C9F0A4A43918BACCA33390AC270D44F3462mailmicrosoli_"

--_002_974C3B6C9F0A4A43918BACCA33390AC270D44F3462mailmicrosoli_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry=20for=20the=20empty=20message,
I=20did=20attach=20the=20patch=20but=20I=20don't=20know=20why=20it=20is=20=
not=20in=20the=20final=20email.
Should=20I=20paste=20the=20patch=20in=20the=20text.=20Does=20this=20help?
How=20do=20I=20send=20this=20patch?

From=20b2aff377af0df1e3820f25b45af3bf6216aecc76=20Mon=20Sep=2017=2000:00:0=
0=202001
From:=20Lucian=20Ion=20<luciani@luciani-laptop.(none)>
Date:=20Fri,=205=20Jun=202009=2011:41:05=20+0100
Subject:=20[PATCH]=20add=20log4cxx=20checksum=20from=20apache

---
=20conf/checksums.ini=20|=20=20=20=204=20++++
=201=20files=20changed,=204=20insertions(+),=200=20deletions(-)

diff=20--git=20a/conf/checksums.ini=20b/conf/checksums.ini
index=202cca3f8..085fac0=20100644
---=20a/conf/checksums.ini
+++=20b/conf/checksums.ini
@@=20-15506,6=20+15506,10=20@@=20sha256=3D138b70379317b4d2962694879c26f757=
9f7771256bd67d462012bed17f1fcba5
=20md5=3D9b9b6da3612b629f40b97d295c8854f0
=20sha256=3Daeab92eb4f81b3ae12a1d4e3d8d9b3650cc0f37ce7f9d1562c29364567d87a=
cb

+[http://archive.apache.org/dist/logging/log4cxx/log4cxx-0.9.7.tar.gz]
+md5=3Dfd09abc90b8c0c8af1d5146a75590792
+sha256=3D5b41b2fc267595bdb0fa4cd1152309413bc70e6d9196293113ebb82751eb7ec6=

+
=20[ftp://ftp.logilab.fr/pub/common/logilab-common-0.37.1.tar.gz]
=20md5=3D39561a45c74f8ff11e2ddd872f4ee5bc
=20sha256=3Dc5974c1e98bed62bb3153a8144069c43229c6b208ef599bc77c84fb493c229=
1b
--
1.6.0.4




Regards,
Lucian=20Ion
Software=20Engineer
Microsol=20Ltd.
Tel:=20=20=20+353-1-4153716
Fax:=20=20+353-1-6716343
________________________________________
From:=20openembedded-commits-bounces@lists.openembedded.org=20[openembedde=
d-commits-bounces@lists.openembedded.org]=20On=20Behalf=20Of=20Lucian=20Io=
n=20[luciani@microsol.ie]
Sent:=2005=20June=202009=2011:56
To:=20openembedded-commits@lists.openembedded.org
Subject:=20[oe-commits]=20add=20log4cxx=20checksum

Regards,
Lucian=20Ion
Software=20Engineer
Microsol=20Ltd.
Tel:=20=20=20+353-1-4153716
Fax:=20=20+353-1-6716343

_______________________________________________________________________

This=20email=20and=20any=20files=20transmitted=20with=20it=20are=20confide=
ntial=20and=20intended=20solely=20for=20the=20use=20of=20the=20individual=20=
or=20entity=20to=20which=20they=20are=20addressed.

If=20you=20have=20received=20this=20email=20in=20error=20please=20notify=20=
the=20originator=20of=20the=20message.
This=20footer=20also=20confirms=20that=20this=20email=20message=20has=20be=
en=20scanned=20for=20the=20presence=20of=20computer=20viruses.

Any=20views=20expressed=20in=20this=20message=20are=20those=20of=20the=20i=
ndividual=20sender,=20except=20where=20the=20sender=20specifies=20and=20wi=
th=20authority,=20states=20them=20to=20be=20the=20views=20of=20Microsol.

If=20you=20have=20received=20this=20mail=20in=20error=20you=20are=20reques=
ted=20to=20e-mail=20us=20(info@microsol.ie)=20or=20by=20telephoning=20Micr=
osol=20on=20+353=2014153700.

Please=20Visit=20our=20website=20at
http://www.microsol.com

_______________________________________________________________________

This=20email=20has=20been=20scanned=20for=20all=20viruses.
_______________________________________________________________________

________________________________________________________________________
This=20email=20has=20been=20scanned=20for=20all=20viruses.
________________________________________________________________________

_______________________________________________________________________

This=20email=20and=20any=20files=20transmitted=20with=20it=20are=20confide=
ntial=20and=20intended=20solely=20for=20the=20use=20of=20the=20individual=20=
or=20entity=20to=20which=20they=20are=20addressed.

If=20you=20have=20received=20this=20email=20in=20error=20please=20notify=20=
the=20originator=20of=20the=20message.=20
This=20footer=20also=20confirms=20that=20this=20email=20message=20has=20be=
en=20scanned=20for=20the=20presence=20of=20computer=20viruses.

Any=20views=20expressed=20in=20this=20message=20are=20those=20of=20the=20i=
ndividual=20sender,=20except=20where=20the=20sender=20specifies=20and=20wi=
th=20authority,=20states=20them=20to=20be=20the=20views=20of=20Microsol.

If=20you=20have=20received=20this=20mail=20in=20error=20you=20are=20reques=
ted=20to=20e-mail=20us=20(info@microsol.ie)=20or=20by=20telephoning=20Micr=
osol=20on=20+353=2014153700.

Please=20Visit=20our=20website=20at
http://www.microsol.com

_______________________________________________________________________

This=20email=20has=20been=20scanned=20for=20all=20viruses.
_______________________________________________________________________

--_002_974C3B6C9F0A4A43918BACCA33390AC270D44F3462mailmicrosoli_
Content-Type: text/x-diff;
	name="0001-add-log4cxx-checksum-from-apache.patch"
Content-Description: 0001-add-log4cxx-checksum-from-apache.patch
Content-Disposition: attachment;
	filename="0001-add-log4cxx-checksum-from-apache.patch"; size=0;
	creation-date="Fri, 05 Jun 2009 11:07:43 GMT";
	modification-date="Fri, 05 Jun 2009 11:07:43 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiMmFmZjM3N2FmMGRmMWUzODIwZjI1YjQ1YWYzYmY2MjE2YWVjYzc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMdWNpYW4gSW9uIDxsdWNpYW5pQGx1Y2lhbmktbGFwdG9wLihu
b25lKT4KRGF0ZTogRnJpLCA1IEp1biAyMDA5IDExOjQxOjA1ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gYWRkIGxvZzRjeHggY2hlY2tzdW0gZnJvbSBhcGFjaGUKCi0tLQogY29uZi9jaGVja3N1bXMu
aW5pIHwgICAgNCArKysrCiAxIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9jb25mL2NoZWNrc3Vtcy5pbmkgYi9jb25mL2NoZWNrc3Vt
cy5pbmkKaW5kZXggMmNjYTNmOC4uMDg1ZmFjMCAxMDA2NDQKLS0tIGEvY29uZi9jaGVja3N1bXMu
aW5pCisrKyBiL2NvbmYvY2hlY2tzdW1zLmluaQpAQCAtMTU1MDYsNiArMTU1MDYsMTAgQEAgc2hh
MjU2PTEzOGI3MDM3OTMxN2I0ZDI5NjI2OTQ4NzljMjZmNzU3OWY3NzcxMjU2YmQ2N2Q0NjIwMTJi
ZWQxN2YxZmNiYTUKIG1kNT05YjliNmRhMzYxMmI2MjlmNDBiOTdkMjk1Yzg4NTRmMAogc2hhMjU2
PWFlYWI5MmViNGY4MWIzYWUxMmExZDRlM2Q4ZDliMzY1MGNjMGYzN2NlN2Y5ZDE1NjJjMjkzNjQ1
NjdkODdhY2IKIAorW2h0dHA6Ly9hcmNoaXZlLmFwYWNoZS5vcmcvZGlzdC9sb2dnaW5nL2xvZzRj
eHgvbG9nNGN4eC0wLjkuNy50YXIuZ3pdCittZDU9ZmQwOWFiYzkwYjhjMGM4YWYxZDUxNDZhNzU1
OTA3OTIKK3NoYTI1Nj01YjQxYjJmYzI2NzU5NWJkYjBmYTRjZDExNTIzMDk0MTNiYzcwZTZkOTE5
NjI5MzExM2ViYjgyNzUxZWI3ZWM2CisKIFtmdHA6Ly9mdHAubG9naWxhYi5mci9wdWIvY29tbW9u
L2xvZ2lsYWItY29tbW9uLTAuMzcuMS50YXIuZ3pdCiBtZDU9Mzk1NjFhNDVjNzRmOGZmMTFlMmRk
ZDg3MmY0ZWU1YmMKIHNoYTI1Nj1jNTk3NGMxZTk4YmVkNjJiYjMxNTNhODE0NDA2OWM0MzIyOWM2
YjIwOGVmNTk5YmM3N2M4NGZiNDkzYzIyOTFiCi0tIAoxLjYuMC40Cgo=

--_002_974C3B6C9F0A4A43918BACCA33390AC270D44F3462mailmicrosoli_--
