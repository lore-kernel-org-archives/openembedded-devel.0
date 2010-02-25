Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <majo.huber@googlemail.com>) id 1NkgJ0-0007sv-Eu
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 17:11:18 +0100
Received: by wyf28 with SMTP id 28so1818101wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 08:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=9R9yZopvRDI0G72EjhqlKQU2XSPNzfP1eo75pY6wboc=;
	b=N6E302xfa0YfPMfFIgJ9ujnafbp8Nam1p1lCC8rP0DFnl8VlPtktR2ZkpIePRqE42l
	ZPHYuQXbba3dvxz/QkJn3reHVg2VCzoYVR0t5jLHleECy1EtwPPSRzOWQ7j95gao3YOi
	9tkvGFIp+iPsjZtRD/MD3oOUXGQvoEDhU0hE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=j/b31fKoAv3KKP+VlPSK6WD8R8yaGxqdnzOEoRkdb55q2R6mci44VoMwViUNqzga5D
	MvGQ79R6uiEcJc350Qk4/pdeByZHlpidoc7T2MaVCgyT4Zw4CR83tBPUKFm4mlQn1uja
	9AKA1dJwmKktzPzgdfSe/kGOU7ITxJZ7KuCWI=
MIME-Version: 1.0
Received: by 10.216.86.132 with SMTP id w4mr791076wee.87.1267114107146; Thu, 
	25 Feb 2010 08:08:27 -0800 (PST)
Date: Thu, 25 Feb 2010 17:08:26 +0100
Message-ID: <40d782961002250808h3faf16e4yc36e8e36199af1c1@mail.gmail.com>
From: majo huber <majo.huber@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: majo.huber@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][omniorb]
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
X-List-Received-Date: Thu, 25 Feb 2010 16:11:18 -0000
X-Groupsio-MsgNum: 17073
Content-Type: multipart/mixed; boundary=0016e6d77ed33f12ce04806efe1c

--0016e6d77ed33f12ce04806efe1c
Content-Type: text/plain; charset=ISO-8859-1

Hi@all,

The attached files are a newer recipie for omniorb (4.1.4 instead of 4.0.7).
I'd kinly request if someone could push it to the dev branch.

Thanks in advance,
majo

--0016e6d77ed33f12ce04806efe1c
Content-Type: application/octet-stream; name="omniorb-native_4.1.4.bb"
Content-Disposition: attachment; filename="omniorb-native_4.1.4.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g63qsny10

U0VDVElPTiA9ICJkZXZlbCIKREVQRU5EUyArPSAicHl0aG9uLW5hdGl2ZSIKUFIgPSAicjAiCgpT
UkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS9vbW5pb3JiL29tbmlPUkItJHtQVn0udGFy
Lmd6IFwKCSAgZmlsZTovL29tbmlvcmJfNC4xLjQucGF0Y2g7cGF0Y2g9MSBcCiIKClMgPSAiJHtX
T1JLRElSfS9vbW5pT1JCLSR7UFZ9IgoKaW5oZXJpdCBuYXRpdmUgYXV0b3Rvb2xzCgpkb19jb21w
aWxlICgpIHsKICAgICAgICBvZV9ydW5tYWtlCn0KIyBVZ2x5IGhhY2sgc28gbGlidG9vbCBkb2Vz
IG5vdCBmaW5kIG5hdGl2ZSBsaWJzIHdoZW4gYnVpbGRpbmcgY3Jvc3MgcGFja2FnZXMKIyBXZSBy
ZWFsbHkgb25seSBidWlsZCB0aGlzIHBhY2thZ2UgZm9yIG9tbmlpZGwgYW55d2F5CmRvX3N0YWdl
X2FwcGVuZCgpIHsKICAgICAgICBybSAtZiAgJHtTVEFHSU5HX0xJQkRJUl9OQVRJVkV9L2xpYm9t
bmkqCn0K

--0016e6d77ed33f12ce04806efe1c
Content-Type: application/octet-stream; name="omniorb_4.1.4.bb"
Content-Disposition: attachment; filename="omniorb_4.1.4.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g63qsnyb1

REVTQ1JJUFRJT04gPSAiT21uaU9SQiBIaWdoIFBlcmZvcm1hbmNlIE9SQiIKU0VDVElPTiA9ICJk
ZXZlbCIKUFJJT1JJVFkgPSAib3B0aW9uYWwiCkxJQ0VOU0UgPSAiTEdQTCIKREVQRU5EUyA9ICJv
bW5pb3JiLW5hdGl2ZSIKUFIgPSAicjAiCgpTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9S
fS9vbW5pb3JiL29tbmlPUkItJHtQVn0udGFyLmd6IFwKZmlsZTovL29tbmlvcmJfNC4xLjQucGF0
Y2g7cGF0Y2g9MSBcIApmaWxlOi8vb21uaU9SQi5jZmcgXApmaWxlOi8vb21uaU9SQi1jcm9zcy5w
YXRjaDtwYXRjaD0xIFwKZmlsZTovL29tbmlPUkJfZW1iZWRkZWRfYXBwbC5wYXRjaDtwYXRjaD0x
IFwKZmlsZTovL3JtX0xvbmdEb3VibGUucGF0Y2g7cGF0Y2g9MSBcCiIKClMgPSAiJHtXT1JLRElS
fS9vbW5pT1JCLSR7UFZ9IgoKRklMRVNfJHtQTn0tZGV2ICs9ICIke2RhdGFkaXJ9L2lkbC9vbW5p
T1JCLyogJHtkYXRhZGlyfS9pZGwvb21uaU9SQi9jb3MvKgpUQVJHRVRfQ0NfQVJDSCArPSAke0xE
RkxBR1N9Cgppbmhlcml0IGF1dG90b29scyBwa2djb25maWcgCgpkb19jb21waWxlICgpIHsKICAg
ICAgICBleHBvcnQgRW1iZWRkZWRTeXN0ZW09MQogICAgICAgIGV4cG9ydCBUT09MQklORElSPSR7
U1RBR0lOR19CSU5ESVJfTkFUSVZFfQoJb2VfcnVubWFrZQoJCn0KZG9faW5zdGFsbCAoKSB7CiAg
ICAgICAgZXhwb3J0IEVtYmVkZGVkU3lzdGVtPTEKICAgICAgICBtYWtlIERFU1RESVI9JHtEfSBp
bnN0YWxsCiAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfQogICAgICAgIGluc3Rh
bGwgLW0gMDY0NCAke1dPUktESVJ9L29tbmlPUkIuY2ZnICR7RH0ke3N5c2NvbmZkaXJ9CiAgICAg
ICAgaW5zdGFsbCAtZCAke0R9JHtsb2NhbHN0YXRlZGlyfS9vbW5pbmFtZXMKCQoJI29ubHkgZXhl
Y3V0YWJsZSBsaWJyYXJpZXMgYXJlIHN0cmlwcGVkIGJ5IHRoZSBzdHJpcHBlcgoJY2htb2QgK3gg
JHtXT1JLRElSfS9pbWFnZS91c3IvbGliL2xpYioKfQpkb19zdGFnZSAoKSB7CiAgICAgICAgZXhw
b3J0IEVtYmVkZGVkU3lzdGVtPTEKICAgICAgICBhdXRvdG9vbHNfc3RhZ2VfYWxsCn0K

--0016e6d77ed33f12ce04806efe1c
Content-Type: application/octet-stream; name="omniorb_4.1.4.patch"
Content-Disposition: attachment; filename="omniorb_4.1.4.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g63qt97c2

ZGlmZiAtYXVyIC0tcmVjdXJzaXZlIG9tbmlvcmJfbmF0aXZlX29yZy9jb25maWd1cmUuYWMgb21u
aW9yYl9uYXRpdmVfY29wL2NvbmZpZ3VyZS5hYwotLS0gb21uaW9yYl9uYXRpdmVfb3JnL2NvbmZp
Z3VyZS5hYwkyMDEwLTAyLTE5IDE0OjAwOjA2LjkwNTc3NzUyOSArMDEwMAorKysgb21uaW9yYl9u
YXRpdmVfY29wL2NvbmZpZ3VyZS5hYwkyMDEwLTAyLTE5IDEzOjM4OjIwLjAwMDAwMDAwMCArMDEw
MApAQCAtMTAsNiArMTAsNyBAQAogCiBBQ19DT05GSUdfSEVBREVSUyhpbmNsdWRlL29tbmlPUkI0
L2FjY29uZmlnLmgpCgorbTRfcGF0dGVybl9hbGxvdyhQS0dfQ09ORklHX0xJQkRJUikKIGRubCAq
KiBDRkxBR1MgLyBDWFhGTEFHUwogCiBpZiB0ZXN0ICIke0NGTEFHUytzZXR9IiAhPSBzZXQ7IHRo
ZW4KICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAj

--0016e6d77ed33f12ce04806efe1c--
