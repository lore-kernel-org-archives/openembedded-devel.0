Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OrQI3-0000oH-NI
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 09:02:27 +0200
Received: by gya6 with SMTP id 6so635047gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 00:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=dggJGQTpj2W4UwRmV6+vw3XaOQsrgvU5RM3RGPvaX9Y=;
	b=wwFuX+8wHNTOffc67WRgtMeTKQX/D4eGUffU+OPVKQp7I1xKP3+nyL4uKI1At9QcUi
	AMIxXmd4B2F94yH8jJ6VvRyU8QkgHXdAQqinc16pUd4ZUkmcqSNnJ3K9rUnEOPd/GYco
	P8ixJC2TWIGriYWo0vd3aY3XmLOXEroLbw96I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=nRV2GlZJJv7fCNnJq5s+NfuRONkbIRziFaEmWJM3wWlDfirYqI/GmhWUBdew0HHUJR
	lmjs9lRt/b2KxKDuhtMGFc7Y8Fx5BH+bdgE5fTLEtIx71mvSi/HfAfMfC3qFr0B9Zk+T
	93qs6a6xweCcWkAe96nRq3wB4SWVBjBynrq4U=
Received: by 10.90.90.16 with SMTP id n16mr79370agb.118.1283497307170; Fri, 03
	Sep 2010 00:01:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 3 Sep 2010 00:01:26 -0700 (PDT)
In-Reply-To: <i5nnsf$1sq$2@dough.gmane.org>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
	<1283027073-12308-12-git-send-email-raj.khem@gmail.com>
	<i5das3$v2$3@dough.gmane.org>
	<AANLkTikE=wDnQPu5txDEL4QdOjfrD3YK1DOphAqvZZ4h@mail.gmail.com>
	<AANLkTin3L-dJY_KRx5BjdSPCfU1nr-iTYvkzuE5KNE3B@mail.gmail.com>
	<i5nnsf$1sq$2@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Sep 2010 00:01:26 -0700
Message-ID: <AANLkTintRQq9RKAYhr48K7oyJFhG9WzX2k4e5KZbXr9m@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 11/23] udev-compat141_141.bb: if machine is not one of spitz akita c70x poodle then it is not needed to RDEPEND'ed on udev-compat-wrapper
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
X-List-Received-Date: Fri, 03 Sep 2010 07:02:27 -0000
X-Groupsio-MsgNum: 23108
Content-Type: multipart/mixed; boundary=0016361e889c106bad048f55817c

--0016361e889c106bad048f55817c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2010 at 1:39 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote=
:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-09-10 23:40, Khem Raj wrote:
>> On Sun, Aug 29, 2010 at 11:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sun, Aug 29, 2010 at 2:56 AM, Koen Kooi <k.kooi@student.utwente.nl> =
wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> On 28-08-10 22:24, Khem Raj wrote:
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>> =A0recipes/udev/udev-compat141_141.bb | =A0 =A06 +++++-
>>>>> =A01 files changed, 5 insertions(+), 1 deletions(-)
>>>>>
>>>>> diff --git a/recipes/udev/udev-compat141_141.bb b/recipes/udev/udev-c=
ompat141_141.bb
>>>>> index 2411fc6..c39d4cb 100644
>>>>> --- a/recipes/udev/udev-compat141_141.bb
>>>>> +++ b/recipes/udev/udev-compat141_141.bb
>>>>> @@ -15,7 +15,11 @@ PACKAGES =3D "${PN} ${PN}-dbg"
>>>>> =A0PROVIDES =3D "udev-compat"
>>>>>
>>>>> =A0# Need udev with udev-compat-wrapper support and nothing else.
>>>>> -RDEPENDS_${PN} =3D "udev-compat-wrapper"
>>>>> +RDEPENDS_${PN}_spitz =3D "udev-compat-wrapper"
>>>>> +RDEPENDS_${PN}_akita =3D "udev-compat-wrapper"
>>>>> +RDEPENDS_${PN}_c7x0 =3D "udev-compat-wrapper"
>>>>> +RDEPENDS_${PN}_poodle =3D "udev-compat-wrapper"
>>>>> +
>>>>> =A0# Remove hotplug RPROVIDES
>>>>> =A0RPROVIDES_${PN} =3D "udev-compat"
>>>>
>>>> NAK, this is a generic wrapper to use recent udev on older kernels, no=
t
>>>> specific to zaurus.
>>>
>>> OK then why is this wrapper only rprovided for specific machines and
>>> not rprovided always for every machine ?
>>> It seems its does not do what you are saying IIUC.
>>
>> ping ?
>
> The zaurus people screwed up when adding this, it is still intended as a
> generic stopgap measure for device stuck on <2.6.27 kernels.

alright got it. what do you think of attached patch ?

Thanks

-Khem

--0016361e889c106bad048f55817c
Content-Type: text/x-diff; charset=US-ASCII; 
	name="0001-udev-udev-compat141-Fix-machine-specific-RDEPENDS.patch"
Content-Disposition: attachment; 
	filename="0001-udev-udev-compat141-Fix-machine-specific-RDEPENDS.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gdmp4ho30

RnJvbSBlNDhhMjEwZmYwNzJjYmI4MmNkODZjN2ZiMzdkYjJlY2M3MWQ5ZmJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgpEYXRlOiBT
YXQsIDI4IEF1ZyAyMDEwIDEyOjAyOjAyIC0wNzAwClN1YmplY3Q6IFtQQVRDSF0gdWRldix1ZGV2
LWNvbXBhdDE0MTogRml4IG1hY2hpbmUgc3BlY2lmaWMgUkRFUEVORFMKClNpZ25lZC1vZmYtYnk6
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLQogcmVjaXBlcy91ZGV2L3VkZXYtY29t
cGF0MTQxXzE0MS5iYiB8ICAgIDEgKwogcmVjaXBlcy91ZGV2L3VkZXYuaW5jICAgICAgICAgICAg
ICB8ICAgIDcgKystLS0tLQogcmVjaXBlcy91ZGV2L3VkZXZfMTUxLmJiICAgICAgICAgICB8ICAg
MTUgKysrKysrLS0tLS0tLS0tCiByZWNpcGVzL3VkZXYvdWRldl8xNTQuYmIgICAgICAgICAgIHwg
ICAxNSArKysrKystLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy91ZGV2L3VkZXYtY29tcGF0MTQx
XzE0MS5iYiBiL3JlY2lwZXMvdWRldi91ZGV2LWNvbXBhdDE0MV8xNDEuYmIKaW5kZXggMjQxMWZj
Ni4uMjRhYjhiNiAxMDA2NDQKLS0tIGEvcmVjaXBlcy91ZGV2L3VkZXYtY29tcGF0MTQxXzE0MS5i
YgorKysgYi9yZWNpcGVzL3VkZXYvdWRldi1jb21wYXQxNDFfMTQxLmJiCkBAIC0xNiw2ICsxNiw3
IEBAIFBST1ZJREVTID0gInVkZXYtY29tcGF0IgogCiAjIE5lZWQgdWRldiB3aXRoIHVkZXYtY29t
cGF0LXdyYXBwZXIgc3VwcG9ydCBhbmQgbm90aGluZyBlbHNlLgogUkRFUEVORFNfJHtQTn0gPSAi
dWRldi1jb21wYXQtd3JhcHBlciIKKwogIyBSZW1vdmUgaG90cGx1ZyBSUFJPVklERVMKIFJQUk9W
SURFU18ke1BOfSA9ICJ1ZGV2LWNvbXBhdCIKIApkaWZmIC0tZ2l0IGEvcmVjaXBlcy91ZGV2L3Vk
ZXYuaW5jIGIvcmVjaXBlcy91ZGV2L3VkZXYuaW5jCmluZGV4IDc1MDIwOTQuLjBjOGE2NjIgMTAw
NjQ0Ci0tLSBhL3JlY2lwZXMvdWRldi91ZGV2LmluYworKysgYi9yZWNpcGVzL3VkZXYvdWRldi5p
bmMKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8va2VybmVsLm9yZy9wdWIvbGlu
dXgvdXRpbHMva2VybmVsL2hvdHBsdWcvdWRldi0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBm
aWxlOi8vaW5pdCBcCiAJICAgZmlsZTovL3VkZXYtY29tcGF0LXdyYXBwZXItcGF0Y2giCiAKLUlO
Q19QUiA9ICJyMjkiCitJTkNfUFIgPSAicjMwIgogCiBpbmhlcml0IHVwZGF0ZS1yYy5kIGF1dG90
b29scyBwa2djb25maWcKIApAQCAtNDMsMjIgKzQzLDE5IEBAIEVYVFJBX09FTUFLRSA9ICItZSBc
CiAJCSdFWFRSQVM9JHtVREVWX0VYVFJBU30nIFwKIAkJJ1NUUklQPWVjaG8nIgogCi1SUFJPVklE
RVNfdWRldl9zcGl0eiArPSAidWRldi1jb21wYXQtd3JhcHBlciIKK1JQUk9WSURFU191ZGV2X2Fw
cGVuZCA9ICIgdWRldi1jb21wYXQtd3JhcHBlciIKIFJERVBFTkRTX3VkZXZfc3BpdHogKz0gInVk
ZXYtY29tcGF0IgogZG9fdW5wYWNrX2FwcGVuZF9zcGl0eigpIHsKIAliYi5idWlsZC5leGVjX2Z1
bmMoJ2RvX2FwcGx5X2NvbXBhdF93cmFwcGVyJywgZCkKIH0KLVJQUk9WSURFU191ZGV2X2FraXRh
ICs9ICJ1ZGV2LWNvbXBhdC13cmFwcGVyIgogUkRFUEVORFNfdWRldl9ha2l0YSArPSAidWRldi1j
b21wYXQiCiBkb191bnBhY2tfYXBwZW5kX2FraXRhKCkgewogCWJiLmJ1aWxkLmV4ZWNfZnVuYygn
ZG9fYXBwbHlfY29tcGF0X3dyYXBwZXInLCBkKQogfQotUlBST1ZJREVTX3VkZXZfYzd4MCArPSAi
dWRldi1jb21wYXQtd3JhcHBlciIKIFJERVBFTkRTX3VkZXZfYzd4MCArPSAidWRldi1jb21wYXQi
CiBkb191bnBhY2tfYXBwZW5kX2M3eDAoKSB7CiAJYmIuYnVpbGQuZXhlY19mdW5jKCdkb19hcHBs
eV9jb21wYXRfd3JhcHBlcicsIGQpCiB9Ci1SUFJPVklERVNfdWRldl9wb29kbGUgKz0gInVkZXYt
Y29tcGF0LXdyYXBwZXIiCiBSREVQRU5EU191ZGV2X3Bvb2RsZSArPSAidWRldi1jb21wYXQiCiBk
b191bnBhY2tfYXBwZW5kX3Bvb2RsZSgpIHsKIAliYi5idWlsZC5leGVjX2Z1bmMoJ2RvX2FwcGx5
X2NvbXBhdF93cmFwcGVyJywgZCkKZGlmZiAtLWdpdCBhL3JlY2lwZXMvdWRldi91ZGV2XzE1MS5i
YiBiL3JlY2lwZXMvdWRldi91ZGV2XzE1MS5iYgppbmRleCA4NDIzZmY0Li5kNmE4NThkIDEwMDY0
NAotLS0gYS9yZWNpcGVzL3VkZXYvdWRldl8xNTEuYmIKKysrIGIvcmVjaXBlcy91ZGV2L3VkZXZf
MTUxLmJiCkBAIC0zLDcgKzMsNyBAQCBERVNDUklQVElPTiA9ICJ1ZGV2IGlzIGEgZGFlbW9uIHdo
aWNoIGR5bmFtaWNhbGx5IGNyZWF0ZXMgYW5kIHJlbW92ZXMgZGV2aWNlIG5vZAogdGhlIGhvdHBs
dWcgcGFja2FnZSBhbmQgcmVxdWlyZXMgYSBrZXJuZWwgbm90IG9sZGVyIHRoYW4gMi42LjEyLiIK
IExJQ0VOU0UgPSAiR1BMdjIrIgogCi1QUiA9ICJyMTYiCitQUiA9ICJyMTciCiAKICMgVW50ZXN0
ZWQKIERFRkFVTFRfUFJFRkVSRU5DRSA9ICItMSIKQEAgLTc1LDIzICs3NSwyMCBAQCBGSUxFU18k
e1BOfS1kYmcgKz0gIiR7dXNyYmluZGlyfS8uZGVidWcgJHt1c3JzYmluZGlyfS8uZGVidWciCiBG
SUxFU18ke1BOfSArPSAiL2xpYi91ZGV2KiAke2xpYmRpcn0vQ29uc29sZUtpdCIKIEZJTEVTXyR7
UE59LWRiZyArPSAiL2xpYi91ZGV2Ly5kZWJ1ZyIKIAotUlBST1ZJREVTX3VkZXZfYXBwZW5kX3Nw
aXR6ICs9ICJ1ZGV2LWNvbXBhdC13cmFwcGVyIgotUkRFUEVORFNfdWRldl9hcHBlbmRfc3BpdHog
Kz0gInVkZXYtY29tcGF0IgorUlBST1ZJREVTX3VkZXZfYXBwZW5kID0gIiB1ZGV2LWNvbXBhdC13
cmFwcGVyIgorUkRFUEVORFNfdWRldl9hcHBlbmRfc3BpdHogPSAiIHVkZXYtY29tcGF0IgogZG9f
dW5wYWNrX2FwcGVuZF9zcGl0eigpIHsKIAliYi5idWlsZC5leGVjX2Z1bmMoJ2RvX2FwcGx5X2Nv
bXBhdF93cmFwcGVyJywgZCkKIH0KLVJQUk9WSURFU191ZGV2X2FwcGVuZF9ha2l0YSArPSAidWRl
di1jb21wYXQtd3JhcHBlciIKLVJERVBFTkRTX3VkZXZfYXBwZW5kX2FraXRhICs9ICJ1ZGV2LWNv
bXBhdCIKK1JERVBFTkRTX3VkZXZfYXBwZW5kX2FraXRhID0gIiB1ZGV2LWNvbXBhdCIKIGRvX3Vu
cGFja19hcHBlbmRfYWtpdGEoKSB7CiAJYmIuYnVpbGQuZXhlY19mdW5jKCdkb19hcHBseV9jb21w
YXRfd3JhcHBlcicsIGQpCiB9Ci1SUFJPVklERVNfdWRldl9hcHBlbmRfYzd4MCArPSAidWRldi1j
b21wYXQtd3JhcHBlciIKLVJERVBFTkRTX3VkZXZfYXBwZW5kX2M3eDAgKz0gInVkZXYtY29tcGF0
IgorUkRFUEVORFNfdWRldl9hcHBlbmRfYzd4MCA9ICIgdWRldi1jb21wYXQiCiBkb191bnBhY2tf
YXBwZW5kX2M3eDAoKSB7CiAJYmIuYnVpbGQuZXhlY19mdW5jKCdkb19hcHBseV9jb21wYXRfd3Jh
cHBlcicsIGQpCiB9Ci1SUFJPVklERVNfdWRldl9hcHBlbmRfcG9vZGxlICs9ICJ1ZGV2LWNvbXBh
dC13cmFwcGVyIgotUkRFUEVORFNfdWRldl9hcHBlbmRfcG9vZGxlICs9ICJ1ZGV2LWNvbXBhdCIK
K1JERVBFTkRTX3VkZXZfYXBwZW5kX3Bvb2RsZSA9ICIgdWRldi1jb21wYXQiCiBkb191bnBhY2tf
YXBwZW5kX3Bvb2RsZSgpIHsKIAliYi5idWlsZC5leGVjX2Z1bmMoJ2RvX2FwcGx5X2NvbXBhdF93
cmFwcGVyJywgZCkKIH0KZGlmZiAtLWdpdCBhL3JlY2lwZXMvdWRldi91ZGV2XzE1NC5iYiBiL3Jl
Y2lwZXMvdWRldi91ZGV2XzE1NC5iYgppbmRleCBlNGRjNDhiLi5kYzgxZWMxIDEwMDY0NAotLS0g
YS9yZWNpcGVzL3VkZXYvdWRldl8xNTQuYmIKKysrIGIvcmVjaXBlcy91ZGV2L3VkZXZfMTU0LmJi
CkBAIC0zLDcgKzMsNyBAQCBERVNDUklQVElPTiA9ICJ1ZGV2IGlzIGEgZGFlbW9uIHdoaWNoIGR5
bmFtaWNhbGx5IGNyZWF0ZXMgYW5kIHJlbW92ZXMgZGV2aWNlIG5vZAogdGhlIGhvdHBsdWcgcGFj
a2FnZSBhbmQgcmVxdWlyZXMgYSBrZXJuZWwgbm90IG9sZGVyIHRoYW4gMi42LjEyLiIKIExJQ0VO
U0UgPSAiR1BMdjIrIgogCi1QUiA9ICJyMyIKK1BSID0gInI0IgogCiAjIFVudGVzdGVkCiBERUZB
VUxUX1BSRUZFUkVOQ0UgPSAiLTEiCkBAIC03NiwyMyArNzYsMjAgQEAgRklMRVNfJHtQTn0tZGJn
ICs9ICIke3VzcmJpbmRpcn0vLmRlYnVnICR7dXNyc2JpbmRpcn0vLmRlYnVnIgogRklMRVNfJHtQ
Tn0gKz0gIi9saWIvdWRldiogJHtsaWJkaXJ9L0NvbnNvbGVLaXQiCiBGSUxFU18ke1BOfS1kYmcg
Kz0gIi9saWIvdWRldi8uZGVidWciCiAKLVJQUk9WSURFU191ZGV2X2FwcGVuZF9zcGl0eiArPSAi
dWRldi1jb21wYXQtd3JhcHBlciIKLVJERVBFTkRTX3VkZXZfYXBwZW5kX3NwaXR6ICs9ICJ1ZGV2
LWNvbXBhdCIKK1JQUk9WSURFU191ZGV2X2FwcGVuZCA9ICIgdWRldi1jb21wYXQtd3JhcHBlciIK
K1JERVBFTkRTX3VkZXZfYXBwZW5kX3NwaXR6ID0gIiB1ZGV2LWNvbXBhdCIKIGRvX3VucGFja19h
cHBlbmRfc3BpdHooKSB7CiAJYmIuYnVpbGQuZXhlY19mdW5jKCdkb19hcHBseV9jb21wYXRfd3Jh
cHBlcicsIGQpCiB9Ci1SUFJPVklERVNfdWRldl9hcHBlbmRfYWtpdGEgKz0gInVkZXYtY29tcGF0
LXdyYXBwZXIiCi1SREVQRU5EU191ZGV2X2FwcGVuZF9ha2l0YSArPSAidWRldi1jb21wYXQiCitS
REVQRU5EU191ZGV2X2FwcGVuZF9ha2l0YSA9ICIgdWRldi1jb21wYXQiCiBkb191bnBhY2tfYXBw
ZW5kX2FraXRhKCkgewogCWJiLmJ1aWxkLmV4ZWNfZnVuYygnZG9fYXBwbHlfY29tcGF0X3dyYXBw
ZXInLCBkKQogfQotUlBST1ZJREVTX3VkZXZfYXBwZW5kX2M3eDAgKz0gInVkZXYtY29tcGF0LXdy
YXBwZXIiCi1SREVQRU5EU191ZGV2X2FwcGVuZF9jN3gwICs9ICJ1ZGV2LWNvbXBhdCIKK1JERVBF
TkRTX3VkZXZfYXBwZW5kX2M3eDAgPSAiIHVkZXYtY29tcGF0IgogZG9fdW5wYWNrX2FwcGVuZF9j
N3gwKCkgewogCWJiLmJ1aWxkLmV4ZWNfZnVuYygnZG9fYXBwbHlfY29tcGF0X3dyYXBwZXInLCBk
KQogfQotUlBST1ZJREVTX3VkZXZfYXBwZW5kX3Bvb2RsZSArPSAidWRldi1jb21wYXQtd3JhcHBl
ciIKLVJERVBFTkRTX3VkZXZfYXBwZW5kX3Bvb2RsZSArPSAidWRldi1jb21wYXQiCitSREVQRU5E
U191ZGV2X2FwcGVuZF9wb29kbGUgPSAiIHVkZXYtY29tcGF0IgogZG9fdW5wYWNrX2FwcGVuZF9w
b29kbGUoKSB7CiAJYmIuYnVpbGQuZXhlY19mdW5jKCdkb19hcHBseV9jb21wYXRfd3JhcHBlcics
IGQpCiB9Ci0tIAoxLjcuMQoK

--0016361e889c106bad048f55817c--
