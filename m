Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anilm@mistralsolutions.com>) id 1PKUUd-0003YR-Gk
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 12:23:33 +0100
Received: by iwn4 with SMTP id 4so29182iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 03:22:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.231.10.134 with SMTP id p6mr6764033ibp.50.1290424941215; Mon,
	22 Nov 2010 03:22:21 -0800 (PST)
Received: by 10.231.199.201 with HTTP; Mon, 22 Nov 2010 03:22:21 -0800 (PST)
In-Reply-To: <AANLkTimR1ZUrvsJHkwo9v536eCvkbFk4vCt1sJHZAKZy@mail.gmail.com>
References: <AANLkTimHzbQ-OzrP_7bk2ZbwL2QPftnkBA6UMjBzJxtd@mail.gmail.com>
	<AANLkTimR1ZUrvsJHkwo9v536eCvkbFk4vCt1sJHZAKZy@mail.gmail.com>
Date: Mon, 22 Nov 2010 16:52:21 +0530
Message-ID: <AANLkTikpcAqrvC942sozd1E-RtHV430f=UVPNRnSLcC1@mail.gmail.com>
From: Anil Kumar Mamidala <anilm@mistralsolutions.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: anilm@mistralsolutions.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Nagendra T S <nagendra@mistralsolutions.com>,
	Srinath R <srinath@mistralsolutions.com>,
	Umesh Krishnan <umeshk@mistralsolutions.com>, jdk@ti.com
Subject: am3517/05 : Add am3517-crane machine type
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
X-List-Received-Date: Mon, 22 Nov 2010 11:23:33 -0000
X-Groupsio-MsgNum: 26410
Content-Type: multipart/mixed; boundary=0022152d7fed3b06020495a278b6

--0022152d7fed3b06020495a278b6
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

Adding support for AM3517/05-Craneboard machine type to openembedded.

Craneboard is a hardware development platform based on the Sitara AM3517 ARM
Cortex - A8 microprocessor device. This is a low cost reference design.

Please find the attached patches for am3517-crane board machine type and
modified sort.sh file to support am3517-crane board.

--0022152d7fed3b06020495a278b6
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-Adding-new-am3517-crane-machine-type.patch"
Content-Disposition: attachment; 
	filename="0001-Adding-new-am3517-crane-machine-type.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ggt7ougq0

RnJvbSAwZTEwYTBkMDg5ZTMzNTA4ZDI0MjNhOTVjNGUwZmUxYmMxOWVmZjZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmlsIEt1bWFyIDxhbmlsbUBtaXN0cmFsc29sdXRpb25zLmNv
bT4KRGF0ZTogVGh1LCAxOCBOb3YgMjAxMCAyMToyMzoyMyArMDUzMApTdWJqZWN0OiBbUEFUQ0hd
IEFkZGluZyBuZXcgYW0zNTE3LWNyYW5lIG1hY2hpbmUgdHlwZQoKU2lnbmVkLW9mZi1ieTogQW5p
bCBLdW1hciA8YW5pbG1AbWlzdHJhbHNvbHV0aW9ucy5jb20+Ci0tLQogY29uZi9tYWNoaW5lL2Ft
MzUxNy1jcmFuZS5jb25mIHwgICA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZi9tYWNoaW5lL2FtMzUxNy1jcmFuZS5jb25mCgpkaWZm
IC0tZ2l0IGEvY29uZi9tYWNoaW5lL2FtMzUxNy1jcmFuZS5jb25mIGIvY29uZi9tYWNoaW5lL2Ft
MzUxNy1jcmFuZS5jb25mCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmRhZDQ2
MjUKLS0tIC9kZXYvbnVsbAorKysgYi9jb25mL21hY2hpbmUvYW0zNTE3LWNyYW5lLmNvbmYKQEAg
LTAsMCArMSw1MiBAQAorI0BUWVBFOiBNYWNoaW5lCisjQE5BTUU6IGNyYW5lYm9hcmQgbWFjaGlu
ZQorI0BERVNDUklQVElPTjogTWFjaGluZSBjb25maWd1cmF0aW9uIGZvciB0aGUgQU0zNTE3IENy
YW5lIGJvYXJkCitUQVJHRVRfQVJDSCA9ICJhcm0iCitQUkVGRVJSRURfUFJPVklERVJfdmlydHVh
bC94c2VydmVyID0gInhzZXJ2ZXIteG9yZyIKK1hTRVJWRVIgPSAieHNlcnZlci14b3JnIFwKKyAg
ICAgICAgICAgeGY4Ni1pbnB1dC1ldmRldiBcCisgICAgICAgICAgIHhmODYtaW5wdXQtbW91c2Ug
XAorICAgICAgICAgICB4Zjg2LXZpZGVvLW9tYXBmYiBcCisgICAgICAgICAgIHhmODYtaW5wdXQt
a2V5Ym9hcmQiCisKKyMgT25seSBoYXMgRFZJIGNvbm5lY3RvciBmb3IgZXh0ZXJuYWwgc2NyZWVu
CitHVUlfTUFDSElORV9DTEFTUyA9ICJiaWdzY3JlZW4iCisKK3JlcXVpcmUgY29uZi9tYWNoaW5l
L2luY2x1ZGUvb21hcDMuaW5jCisKKyMgU2hpcCBhbGwga2VybmVsIG1vZHVsZXMKKworSU1BR0Vf
RlNUWVBFUyA/PSAiamZmczIgdGFyLmJ6MiIKK0VYVFJBX0lNQUdFQ01EX2pmZnMyID0gIi1sbnAg
LWUgMHgyMDAwMCAtcyAyMDQ4IgorRVhUUkFfSU1BR0VERVBFTkRTICs9ICIgdS1ib290IHgtbG9h
ZCIKKworU0VSSUFMX0NPTlNPTEUgPSAiMTE1MjAwIHR0eVMyIgorVVNFX1ZUID0gIjIiCisKK1BS
RUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL2tlcm5lbCA9ICJsaW51eC1vbWFwLXBzcCIKKworUFJF
RkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvYm9vdGxvYWRlciA9ICJ1LWJvb3QiCisKK1VCT09UX0FS
Q0ggPSAiYXJtIgorVUJPT1RfTUFDSElORSA9ICJhbTM1MTdfY3JhbmVfY29uZmlnIgorWExPQURf
TUFDSElORSA9ICJhbTM1MTdjcmFuZV9jb25maWciCisKK01BQ0hJTkVfRkVBVFVSRVMgPSAia2Vy
bmVsMjYgYXBtIHVzYmdhZGdldCB1c2Job3N0IHZmYXQgZXh0MiBzY3JlZW4gZXRoZXJuZXQiCisK
KyMgTk9URTogdGhlcmUgYXJlIE5BTkQgYW5kIE9uZU5BTkQgdmVyc2lvbnMgb2YgdGhpcyBib2Fy
ZC4uLgorCisjIGRvIHViaWF0dGFjaCAvZGV2L3ViaV9jdHJsIC1tIDQKKyMgRnJvbSBkbWVzZzoK
KyMgVUJJOiBzbWFsbGVzdCBmbGFzaCBJL08gdW5pdDogICAgMjA0OAorIyBVQkk6IGxvZ2ljYWwg
ZXJhc2VibG9jayBzaXplOiAgICAxMjkwMjQgYnl0ZXMKKyMgZnJvbSB1YmlhdHRhY2ggc3Rkb3V0
OgorIyBVQkkgZGV2aWNlIG51bWJlciAwLCB0b3RhbCAxOTk2IExFQnMKK01LVUJJRlNfQVJHUyA9
ICItbSAyMDQ4IC1lIDEyOTAyNCAtYyAxOTk2IgorCisjIGRvIHViaWF0dGFjaCAvZGV2L3ViaV9j
dHJsIC1tIDQKKyMgZnJvbSBkbWVzZzoKKyMgVUJJOiBzbWFsbGVzdCBmbGFzaCBJL08gdW5pdDog
ICAgMjA0OAorIyBVQkk6IHBoeXNpY2FsIGVyYXNlYmxvY2sgc2l6ZTogICAxMzEwNzIgYnl0ZXMg
KDEyOCBLaUIpCisjIFVCSTogc3ViLXBhZ2Ugc2l6ZTogICAgICAgICAgICAgIDUxMgorVUJJTkla
RV9BUkdTID0gIi1tIDIwNDggLXAgMTI4S2lCIC1zIDUxMiIKKwotLSAKMS43LjAuNAoK

--0022152d7fed3b06020495a278b6
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-Added-support-for-am3517-crane-in-sort.sh-file.patch"
Content-Disposition: attachment; 
	filename="0001-Added-support-for-am3517-crane-in-sort.sh-file.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ggt8j13t1

RnJvbSA2OWY2YWZjY2ZmNTMzNjYwNDdjNzdmNTIwODZjY2E2OGU4OWNmMDkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmlsIEt1bWFyIDxhbmlsbUBtaXN0cmFsc29sdXRpb25zLmNv
bT4KRGF0ZTogRnJpLCAxOSBOb3YgMjAxMCAyMDo1NDoyOCArMDUzMApTdWJqZWN0OiBbUEFUQ0hd
IEFkZGVkIHN1cHBvcnQgZm9yIGFtMzUxNy1jcmFuZSBpbiBzb3J0LnNoIGZpbGUKClNpZ25lZC1v
ZmYtYnk6IEFuaWwgS3VtYXIgPGFuaWxtQG1pc3RyYWxzb2x1dGlvbnMuY29tPgotLS0KIGNvbnRy
aWIvYW5nc3Ryb20vc29ydC5zaCB8ICAgIDYgKysrKystCiAxIGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9jb250cmliL2FuZ3N0cm9t
L3NvcnQuc2ggYi9jb250cmliL2FuZ3N0cm9tL3NvcnQuc2gKaW5kZXggM2U1OTQ2Ni4uYzg4Y2Iz
ZCAxMDA3NTUKLS0tIGEvY29udHJpYi9hbmdzdHJvbS9zb3J0LnNoCisrKyBiL2NvbnRyaWIvYW5n
c3Ryb20vc29ydC5zaApAQCAtNzksNyArNzksMTEgQEAgY2FzZSAiJGFyY2giIGluCiAJImFybXY2
LW5vdmZwIikKIAkJCW1hY2hpbmVzPSJodGNibGFja3N0b25lIGh0Y2RpYW1vbmQgaHRjZHJlYW0g
aHRja2Fpc2VyIGh0Y25pa2UgaHRjcG9sYXJpcyBodGNyYXBoYWVsIGh0Y3RpdGFuIGh0Y3ZvZ3Vl
IiA7OwogCSJhcm12N2EiKQotCQkJbWFjaGluZXM9ImFtMzUxNy1ldm0gYXJjaG9zNSBhcmNob3M1
aXQgYmVhZ2xlYm9hcmQgYnVnMjAgY20tdDM1IGRtMzd4LWV2bSBhbTM3eC1ldm0gYW0zODl4LWV2
bSBiYWJiYWdlIGM2YTgxNngtZXZtIGVmaWthbXggaHRjbGVvIGlnZXAwMDIwIG5va2lhOTAwIG9t
YXAzNTE3LWV2bSBvbWFwM2V2bSBvbWFwMy1wYW5kb3JhIG9tYXAzLXRvdWNoYm9vayBvbWFwNDQz
MC1zZHAgb21hcHpvb20gb21hcHpvb20yIG9tYXB6b29tMzZ4IG92ZXJvIHBhbG1wcmUgb21hcDQ0
MzAtcGFuZGEiIDs7CisJCQltYWNoaW5lcz0iYW0zNTE3LWNyYW5lIGFtMzUxNy1ldm0gYXJjaG9z
NSBhcmNob3M1aXQKKyBiZWFnbGVib2FyZCBidWcyMCBjbS10MzUgZG0zN3gtZXZtIGFtMzd4LWV2
bSBhbTM4OXgtZXZtIGJhYmJhZ2UgYzZhODE2eC1ldm0KKyBlZmlrYW14IGh0Y2xlbyBpZ2VwMDAy
MCBub2tpYTkwMCBvbWFwMzUxNy1ldm0gb21hcDNldm0gb21hcDMtcGFuZG9yYQorIG9tYXAzLXRv
dWNoYm9vayBvbWFwNDQzMC1zZHAgb21hcHpvb20gb21hcHpvb20yIG9tYXB6b29tMzZ4IG92ZXJv
IHBhbG1wcmUKKyBvbWFwNDQzMC1wYW5kYSIgOzsKIAkiYXZyMzIiKQogCQkJbWFjaGluZXM9ImF0
MzJzdGsxMDAwIGF0bmd3MTAwIiA7OwogCSJiZmluIikKLS0gCjEuNy4wLjQKCg==

--0022152d7fed3b06020495a278b6--
