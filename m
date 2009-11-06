Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <serra82@gmail.com>) id 1N6M91-0001OC-A4
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 11:34:18 +0100
Received: by fxm1 with SMTP id 1so170673fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 02:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=qPYutIK9IxcjidUrfwaE/rcBSvTtHrFKjVmugD+xORY=;
	b=qEPMj+v466ANuA7JmY+DTG2PVEqLRQFqiijnTzdtbadTlXjAbihXE45VyMBVFlVCdX
	ZlD8HszYAz7NJJQf2RdbkvAvUeQjJjcfB1Fo9BjY5pmgvccTuafBomlCiHHSgUaxYgN4
	DvyNY3H9spEECWuQp305TnIB94vg5oh9MjfO4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rjBe/1WElWfBRAfDswNdukCNOPuw77+1iMybT1FCVjNz7zLFQJlAHlCSboq+uYKphA
	vOP33TTEK8MhiWhXJ86BLLUGeMdMRaN/mo5BnCyhRs1YYZuRO5rEh/AhH2IrnbAc3bv+
	olaKtnB1E3Za5hgOkAH0WuIIVZgk9rS9+4e24=
MIME-Version: 1.0
Received: by 10.103.81.35 with SMTP id i35mr1620427mul.43.1257503116714; Fri, 
	06 Nov 2009 02:25:16 -0800 (PST)
In-Reply-To: <hcuqs7$elg$1@ger.gmane.org>
References: <afb7987a0911040032g2bebec62j70a81dd409561c17@mail.gmail.com>
	<hcuqs7$elg$1@ger.gmane.org>
Date: Fri, 6 Nov 2009 11:25:16 +0100
Message-ID: <afb7987a0911060225y481161bej290d5efaa3ed4c3f@mail.gmail.com>
From: Andrea <serra82@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: serra82@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [patch] ti-cs1-omap3530 upgrade
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
X-List-Received-Date: Fri, 06 Nov 2009 10:34:18 -0000
X-Groupsio-MsgNum: 13940
Content-Type: multipart/mixed; boundary=0016e656b6e49363ce0477b142be

--0016e656b6e49363ce0477b142be
Content-Type: text/plain; charset=ISO-8859-1

Is it now correct?
thank you
Andrea

2009/11/5 Koen Kooi <k.kooi@student.utwente.nl>:
> Hello Andrea,
>
> Thank you for you patch! Could you send it in git-format-patch format so we
> can properly attribute it to you?
>
> regards,
>
> Koen
>

--0016e656b6e49363ce0477b142be
Content-Type: text/x-diff; charset=US-ASCII; 
	name="ti-cs1-omap3530-add-version-1.0.1.44-and-checksums.patch"
Content-Disposition: attachment; 
	filename="ti-cs1-omap3530-add-version-1.0.1.44-and-checksums.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g1oqnw8f0

RnJvbSAxMDVjZWU4MTI4NDY0ZTM3MTdmMmU3ZDQ0OTJmODI5MDJiZTU4NTUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZWEgU2VyYWdoaXRpIDxzZXJyYTgyQGdtYWlsLmNvbT4K
RGF0ZTogRnJpLCA2IE5vdiAyMDA5IDExOjAwOjMxICswMTAwClN1YmplY3Q6IFtQQVRDSF0gdGkt
Y3MxLW9tYXAzNTMwOiBhZGQgdmVyc2lvbiAxLjAuMS40NCBhbmQgY2hlY2tzdW1zCgoKU2lnbmVk
LW9mZi1ieTogQW5kcmVhIFNlcmFnaGl0aSA8c2VycmE4MkBnbWFpbC5jb20+Ci0tLQogY29uZi9j
aGVja3N1bXMuaW5pICAgICAgICAgICAgICAgICAgfCAgICA2ICsrKy0tLQogcmVjaXBlcy90aS90
aS1jczEtb21hcDM1MzBfMS4wLjEuYmIgfCAgICA4ICsrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9jb25mL2NoZWNr
c3Vtcy5pbmkgYi9jb25mL2NoZWNrc3Vtcy5pbmkKaW5kZXggODA4Y2MxMS4uMWFmN2IyYyAxMDA2
NDQKLS0tIGEvY29uZi9jaGVja3N1bXMuaW5pCisrKyBiL2NvbmYvY2hlY2tzdW1zLmluaQpAQCAt
NDU4Niw5ICs0NTg2LDkgQEAgc2hhMjU2PThiNzE4YzM0NGNmMTk0MTc0NDdjYmMxNjg2N2QyZTA0
NDM0NjU0YzEzYjMzMDU5OGI5NjcyMGVhZDE0NmI5NjEKIG1kNT0wYWEyZjk0YzM5MTIzZjFhMDM1
Mjk4M2U1MzY2MTc5Ywogc2hhMjU2PTRiYWI1MjlhZmEwMGNhZmRlM2JjNWRmMjc2OTU3OGM4ODQz
OGY4MGM1MTUyZDQyNTdjZDBlODY5ODZmOTViYzQKIAotW2h0dHA6Ly9zb2Z0d2FyZS1kbC50aS5j
b20vZHNwcy9kc3BzX3B1YmxpY19zdy9zZG9fc2IvdGFyZ2V0Y29udGVudC9kdnNkay9EVlNES18z
XzAwL2xhdGVzdC8vZXhwb3J0cy9jczFvbWFwMzUzMF9zZXR1cGxpbnV4XzFfMDBfMDEtNDIuYmlu
XQotbWQ1PWExZTE5ZWYzNzYzOGU5NzdkMDU5ZmQyMmFmNjY2MzAxCi1zaGEyNTY9ZmM3YWMyODI5
ZGY4ZDM5NDYzNWFhMWNjNzA0Yjc4ZTkzY2EyODcxMTFkZjEwMDFlNTczOGFlMjI4MjY5MTIxOQor
W2h0dHA6Ly9zb2Z0d2FyZS1kbC50aS5jb20vZHNwcy9kc3BzX3B1YmxpY19zdy9zZG9fc2IvdGFy
Z2V0Y29udGVudC9kdnNkay9EVlNES18zXzAwL2xhdGVzdC8vZXhwb3J0cy9jczFvbWFwMzUzMF9z
ZXR1cGxpbnV4XzFfMDBfMDEtNDQuYmluXQorbWQ1PTRkYjU2NzI1MmU2YzQzMTE5ZTFjMGFhZmU0
MDFhNjc5CitzaGEyNTY9ZTA0MmUxYWFkNDJhNjcyOGFkZjVjOTU1ZGMzOGU0ZjgzMzFmYzBlYWNk
ODMzZjFjZDc1ZDljYmI0ZmFmZjBiNQogCiBbaHR0cDovL3NvZnR3YXJlLWRsLnRpLmNvbS9kc3Bz
L2RzcHNfcHVibGljX3N3L3Nkb19zYi90YXJnZXRjb250ZW50L2R2c2RrL0RWU0RLXzNfMDAvbGF0
ZXN0Ly9leHBvcnRzL2NzMW9tYXAzNTMwX3NldHVwbGludXhfMV8wMF8wMS5iaW5dCiBtZDU9Nzc5
NDE1ODcyYzc3MWI1ODBlNGM2ZDEwMzQ2YjNhNzkKZGlmZiAtLWdpdCBhL3JlY2lwZXMvdGkvdGkt
Y3MxLW9tYXAzNTMwXzEuMC4xLmJiIGIvcmVjaXBlcy90aS90aS1jczEtb21hcDM1MzBfMS4wLjEu
YmIKaW5kZXggOTc3OWMzMy4uYTJkMDg4ZCAxMDA2NDQKLS0tIGEvcmVjaXBlcy90aS90aS1jczEt
b21hcDM1MzBfMS4wLjEuYmIKKysrIGIvcmVjaXBlcy90aS90aS1jczEtb21hcDM1MzBfMS4wLjEu
YmIKQEAgLTEsMTIgKzEsMTIgQEAKIHJlcXVpcmUgdGktY29kZWMuaW5jCiByZXF1aXJlIHRpLWNz
MS1vbWFwMzUzMC5pbmMKIAotU1JDX1VSSQk9ICJodHRwOi8vc29mdHdhcmUtZGwudGkuY29tL2Rz
cHMvZHNwc19wdWJsaWNfc3cvc2RvX3NiL3RhcmdldGNvbnRlbnQvZHZzZGsvRFZTREtfM18wMC9s
YXRlc3QvL2V4cG9ydHMvY3Mxb21hcDM1MzBfc2V0dXBsaW51eF8xXzAwXzAxLTQyLmJpbiIKK1NS
Q19VUkkJPSAiaHR0cDovL3NvZnR3YXJlLWRsLnRpLmNvbS9kc3BzL2RzcHNfcHVibGljX3N3L3Nk
b19zYi90YXJnZXRjb250ZW50L2R2c2RrL0RWU0RLXzNfMDAvbGF0ZXN0Ly9leHBvcnRzL2NzMW9t
YXAzNTMwX3NldHVwbGludXhfMV8wMF8wMS00NC5iaW4iCiAKICMgU3BlY2lmeSBuYW1lcyBvZiB0
aGUgSW5zdGFsbEphbW1lciBiaW5hcnkgZmlsZSBhbmQgdGhlIHRhcmJhbGwgaXQgZXh0cmFjdHMK
LUJJTkZJTEUgPSAiY3Mxb21hcDM1MzBfc2V0dXBsaW51eF8xXzAwXzAxLTQyLmJpbiIKK0JJTkZJ
TEUgPSAiY3Mxb21hcDM1MzBfc2V0dXBsaW51eF8xXzAwXzAxLTQ0LmJpbiIKIAotUyA9ICIke1dP
UktESVJ9L2R2c2RrXzNfMDBfMDFfNDIvY3Mxb21hcDM1MzBfMV8wMF8wMSIKK1MgPSAiJHtXT1JL
RElSfS9kdnNka18zXzAwXzAyXzQ0L2NzMW9tYXAzNTMwXzFfMDBfMDEiCiAKIERFUEVORFM9InRp
LWNvZGVjLWVuZ2luZSB0aS1kc3BsaW5rLW1vZHVsZSIKIApAQCAtMTQsNyArMTQsNyBAQCBleHBv
cnQgQ09ERUdFTl9JTlNUQUxMX0RJUgogCiAjIFllcywgdGhlIHhkYyBzdHVmZiBzdGlsbCBicmVh
a3Mgd2l0aCBhICcuJyBpbiBQV0QKIFBWID0gIjEwMSIKLVBSID0gInI1IgorUFIgPSAicjYiCiAK
IGRvX2NvbXBpbGUoKSB7CiAKLS0gCjEuNS42LjUKCg==

--0016e656b6e49363ce0477b142be--
