Received: from [209.85.198.184] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IIKhO-0000My-Mh
	for Openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2007 10:45:55 +0200
Received: by rv-out-0910.google.com with SMTP id c24so1230320rvf
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2007 01:43:23 -0700 (PDT)
Received: by 10.114.92.2 with SMTP id p2mr6481468wab.1186476203398;
	Tue, 07 Aug 2007 01:43:23 -0700 (PDT)
Received: by 10.114.208.14 with HTTP; Tue, 7 Aug 2007 01:43:20 -0700 (PDT)
Message-ID: <19c1b8a90708070143m4d96e7a4l83f5bf02feafc395@mail.gmail.com>
Date: Tue, 7 Aug 2007 01:43:23 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: koen@dominion.kabel.utwente.nl
MIME-Version: 1.0
Cc: Openembedded-devel@lists.openembedded.org
Subject: Patch to enable eglibc-intermediate
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2007 08:45:55 -0000
X-Groupsio-MsgNum: 2642
Content-Type: multipart/mixed; 
	boundary="----=_Part_115184_32372901.1186476203364"

------=_Part_115184_32372901.1186476203364
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Koen

This patch is needed to select eglibc-intermediate when eglibc is
selected right now the defines from angstrom-eglibc.inc gets
overridden.

OK?

Thanks

-Khem

------=_Part_115184_32372901.1186476203364
Content-Type: application/octet-stream; name=diff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f52582qv
Content-Disposition: attachment; filename="diff"

IwojIG9sZF9yZXZpc2lvbiBbMjAyOWU4NWI3ZjhmZGIxNmUxMDMxYTVlYWEzMzA0NzE3MzZjNjYw
NV0KIwojIHBhdGNoICJjb25mL2Rpc3Ryby9hbmdzdHJvbS0yMDA3LjEuY29uZiIKIyAgZnJvbSBb
MTMwZTkzMDZlZjlmZmFiZjMzNGIyYzg1NDk0MTliZTUyNjc3ZGI4Ml0KIyAgICB0byBbYTQzNWEw
ZTNhMmYyN2MyMmMwZWRkYWU5M2YzMGQ2NWRiYjVlNmRkMV0KIwo9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGNvbmYvZGlzdHJv
L2FuZ3N0cm9tLTIwMDcuMS5jb25mCTEzMGU5MzA2ZWY5ZmZhYmYzMzRiMmM4NTQ5NDE5YmU1MjY3
N2RiODIKKysrIGNvbmYvZGlzdHJvL2FuZ3N0cm9tLTIwMDcuMS5jb25mCWE0MzVhMGUzYTJmMjdj
MjJjMGVkZGFlOTNmMzBkNjVkYmI1ZTZkZDEKQEAgLTI0MiwxMyArMjQyLDEzIEBAIFBSRUZFUlJF
RF9QUk9WSURFUl92aXJ0dWFsLyR7VEFSR0VUX1BSRUYKIFBSRUZFUlJFRF9QUk9WSURFUl92aXJ0
dWFsLyR7VEFSR0VUX1BSRUZJWH1nKysgPSAiZ2NjLWNyb3NzIgogCiAjU2V0IHByZWZlcnJlZCBw
cm92aWRlciBmb3IgdGhlIEMgbGlicmFyeSB0aGF0IGlzIHVzZWQgdG8gYnVpbGQgdGhlIGNyb3Nz
Y29tcGlsZXIgKE5QVEwgdm9vZG9vKQotUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvJHtUQVJH
RVRfUFJFRklYfWxpYmMtZm9yLWdjYyAgICAgICAgICAgICAgID0gImdsaWJjLWludGVybWVkaWF0
ZSIKLVBSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL2FybS1hbmdzdHJvbS1saW51eC1nbnVlYWJp
LWxpYmMtZm9yLWdjYyAgICA9ICJnbGliYy1pbnRlcm1lZGlhdGUiCi1QUkVGRVJSRURfUFJPVklE
RVJfdmlydHVhbC9hcm1lYi1hbmdzdHJvbS1saW51eC1nbnVlYWJpLWxpYmMtZm9yLWdjYyAgPSAi
Z2xpYmMtaW50ZXJtZWRpYXRlIgotUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvYXJtLWFuZ3N0
cm9tLWxpbnV4LWxpYmMtZm9yLWdjYyAgICAgICAgICAgID0gImdsaWJjLWludGVybWVkaWF0ZSIK
LVBSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL3Bvd2VycGMtYW5nc3Ryb20tbGludXgtbGliYy1m
b3ItZ2NjICAgICAgICA9ICJnbGliYy1pbnRlcm1lZGlhdGUiCi1QUkVGRVJSRURfUFJPVklERVJf
dmlydHVhbC9taXBzZWwtYW5nc3Ryb20tbGludXgtbGliYy1mb3ItZ2NjICAgICAgICAgPSAiZ2xp
YmMtaW50ZXJtZWRpYXRlIgotUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvc3BhcmMtYW5nc3Ry
b20tbGludXgtbGliYy1mb3ItZ2NjICAgICAgICAgID0gImdsaWJjLWludGVybWVkaWF0ZSIKK1BS
RUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsLyR7VEFSR0VUX1BSRUZJWH1saWJjLWZvci1nY2MgICAg
ICAgICAgICAgICA/PSAiZ2xpYmMtaW50ZXJtZWRpYXRlIgorUFJFRkVSUkVEX1BST1ZJREVSX3Zp
cnR1YWwvYXJtLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmktbGliYy1mb3ItZ2NjICAgID89ICJnbGli
Yy1pbnRlcm1lZGlhdGUiCitQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9hcm1lYi1hbmdzdHJv
bS1saW51eC1nbnVlYWJpLWxpYmMtZm9yLWdjYyAgPz0gImdsaWJjLWludGVybWVkaWF0ZSIKK1BS
RUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL2FybS1hbmdzdHJvbS1saW51eC1saWJjLWZvci1nY2Mg
ICAgICAgICAgICA/PSAiZ2xpYmMtaW50ZXJtZWRpYXRlIgorUFJFRkVSUkVEX1BST1ZJREVSX3Zp
cnR1YWwvcG93ZXJwYy1hbmdzdHJvbS1saW51eC1saWJjLWZvci1nY2MgICAgICAgID89ICJnbGli
Yy1pbnRlcm1lZGlhdGUiCitQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9taXBzZWwtYW5nc3Ry
b20tbGludXgtbGliYy1mb3ItZ2NjICAgICAgICAgPz0gImdsaWJjLWludGVybWVkaWF0ZSIKK1BS
RUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL3NwYXJjLWFuZ3N0cm9tLWxpbnV4LWxpYmMtZm9yLWdj
YyAgICAgICAgICA/PSAiZ2xpYmMtaW50ZXJtZWRpYXRlIgogCiBQUkVGRVJSRURfUFJPVklERVJf
dmlydHVhbC9hcm0tYW5nc3Ryb20tbGludXgtdWNsaWJjZ251ZWFiaS1saWJjLWZvci1nY2MgICAg
PSAidWNsaWJjLWluaXRpYWwiCiBQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9hcm1lYi1hbmdz
dHJvbS1saW51eC11Y2xpYmNnbnVlYWJpLWxpYmMtZm9yLWdjYyAgPSAidWNsaWJjLWluaXRpYWwi
Cg==

------=_Part_115184_32372901.1186476203364--
