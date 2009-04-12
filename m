Received: from [209.85.198.243] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1Lt1WK-0002VJ-91
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Apr 2009 17:22:58 +0200
Received: by rv-out-0708.google.com with SMTP id l33so1185039rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Apr 2009 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=abmTSqFsteX0r6ylzXi0YrzBBMuRgbnQtYCQ3DvZ3qw=;
	b=m4AmZBfgheunOss5z0g4zdteQ/qiUyDAMiaSbt+3B8fXSFAp3HAYsyfqIRf2Jsx1HN
	mm6a9zvIBRmlqFnlqmJy0+a2ca47Yp2GZxzHQC5LGu40KWzbECR9UptGuz0HI3uTu5Ux
	mw2EVdIZdbyml9psf7gQ78OyrDQqGFM29SJhY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=X2p2LHSRwUHQI0v9ZgccYiHJAh6ag5Zd+76U3J8u9ocE+FJ875J2yzkjuYNlG9C4EO
	Rrz1K9l3ZPMNklqnowYW4Nd57Q55wOXURClfB0DQsokTkiWzXUJawZ1/D1IDHxZVWFVI
	1Jed1g5NFUqDTywa/UqarPjj6/gWcQAL1dmSw=
MIME-Version: 1.0
Received: by 10.141.98.13 with SMTP id a13mr2364707rvm.5.1239549567172; Sun, 
	12 Apr 2009 08:19:27 -0700 (PDT)
In-Reply-To: <565965130904120524l46b9e4e7x4e8762ad9cbb1f6d@mail.gmail.com>
References: <565965130904120524l46b9e4e7x4e8762ad9cbb1f6d@mail.gmail.com>
Date: Sun, 12 Apr 2009 23:19:27 +0800
Message-ID: <565965130904120819v5fde7a0fq8bf08a6fc6db08d5@mail.gmail.com>
From: Tick <ticktock35@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.198.243
X-SA-Exim-Mail-From: ticktock35@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bb file of madbutterfly
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
X-List-Received-Date: Sun, 12 Apr 2009 15:22:59 -0000
X-Groupsio-MsgNum: 9301
Content-Type: multipart/mixed; boundary=000e0cd1b694a200c104675d1fb5

--000e0cd1b694a200c104675d1fb5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ouch... Sorry forgot the attach patch


On Sun, Apr 12, 2009 at 8:24 PM, Tick <ticktock35@gmail.com> wrote:
> Hi Koen,
> =C2=A0I had created a bb file for madbutterfly,
> http://www.assembla.com/wiki/show/MadButterfly.
> It's a library controlling SVG objects. You can use this library to
> create applications that breaks the widget boundary.
> =C2=A0Would you like to take a review of this patch. If you think it's
> okay I want to commit this into recipes.
>
> Thanks
> Tick
>

--000e0cd1b694a200c104675d1fb5
Content-Type: text/x-diff; charset=US-ASCII; name="adding_madbutterfly_bbfile.patch"
Content-Disposition: attachment; filename="adding_madbutterfly_bbfile.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ftfvta6w0

Y29tbWl0IDRkOWQ1YTUzYTRkMzMyZjRmOGRlM2ZmODBjNTgxNjFmNmQ1MTkyNDcKQXV0aG9yOiBU
aWNrIENoZW4gPHRpY2t0b2NrMzVAZ21haWwuY29tPgpEYXRlOiAgIFdlZCBBcHIgOCAwMjozNDoz
OSAyMDA5ICswODAwCgogICAgbWFkYnV0dGVyZmx5OiBhZGRpbmcgbmV3IGJiIGZpbGUgZm9yIG1h
ZGJ1dHRlcmZseQoKZGlmZiAtLWdpdCBhL2NvbmYvZGlzdHJvL2luY2x1ZGUvc2FuZS1zcmNyZXZz
LmluYyBiL2NvbmYvZGlzdHJvL2luY2x1ZGUvc2FuZS1zcmNyZXZzLmluYwppbmRleCBhNzFiODM1
Li5lZTgyOWQ0IDEwMDY0NAotLS0gYS9jb25mL2Rpc3Ryby9pbmNsdWRlL3NhbmUtc3JjcmV2cy5p
bmMKKysrIGIvY29uZi9kaXN0cm8vaW5jbHVkZS9zYW5lLXNyY3JldnMuaW5jCkBAIC0xMTAsNiAr
MTEwLDcgQEAgU1JDUkVWX3BuLWxpbnV4LW9wZW5tb2tvLWRldmVsID89ICJiOWFhNWJmMzQ1YTBi
ODAyYWYwZDEwYjZjZjEwNzk3MzhmZTRmZDEyIgogU1JDUkVWX3BuLWxpbnV4LWV0ZW4gPz0gImFi
MmQ0MTRmNGYxMzgxNmFmMGVjMDQwMWI2MDgxMzNjYTk0NjYyNGEiCiBTUkNSRVZfcG4tbGx2bS1n
Y2M0ID89ICIzNzQiCiBTUkNSRVZfcG4tbGx2bS1nY2M0LWNyb3NzID89ICIzNzQiCitTUkNSRVZf
cG4tbWFkYnV0dGVyZmx5ID89ICJlY2QxODQyNzE0YjVlOTgyZjMxMzhjYmRkMzU4NTE3ZDU3YmU2
YWEzIgogU1JDUkVWX3BuLW1hZW1vLW1hcHBlciA/PSAiMTE4IgogU1JDUkVWX3BuLW1hbW9uYWlt
X2VfYXBwbGV0ID89ICI1MWM3NDc4NDlmNzE5ODFiZDFkYzllYjE4MDdkZjQ5OTNhZDk3ZDA0Igog
U1JDUkVWX3BuLW1hbW9uYV9pbnB1dF9tZXRob2RzID89ICI3ZTZhOGNjOTQ3Njg5YTA0NWQwZmJh
OTAwMTVkYTU5OTI3NTM0N2Q5IgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy9tYWRidWZmZXJmbHkvbWFk
YnV0dGVyZmx5LzAwMV9tYWtlZmlsZS5hbV9idWdzLnBhdGNoIGIvcmVjaXBlcy9tYWRidWZmZXJm
bHkvbWFkYnV0dGVyZmx5LzAwMV9tYWtlZmlsZS5hbV9idWdzLnBhdGNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAuLjM1YTllNTAKLS0tIC9kZXYvbnVsbAorKysgYi9yZWNpcGVz
L21hZGJ1ZmZlcmZseS9tYWRidXR0ZXJmbHkvMDAxX21ha2VmaWxlLmFtX2J1Z3MucGF0Y2gKQEAg
LTAsMCArMSw2NiBAQAorSW5kZXg6IGdpdC9zcmMvTWFrZWZpbGUuYW0KKz09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKy0t
LSBnaXQub3JpZy9zcmMvTWFrZWZpbGUuYW0JMjAwOS0wNC0wOCAwMjoyNDowMS4wMDAwMDAwMDAg
KzA4MDAKKysrKyBnaXQvc3JjL01ha2VmaWxlLmFtCTIwMDktMDQtMDggMDI6Mjg6NTMuMDAwMDAw
MDAwICswODAwCitAQCAtMiwxOCArMiw0OSBAQAorIAorIGxpYl9MVExJQlJBUklFUyA9IGxpYm1i
Zmx5LmxhCisgCistbm9pbnN0X1BST0dSQU1TID0gWF9tYWluCisgTUJBRl9TT1VSQ0VTPW1iYWYv
bWJhcHAuYyBtYmFmL21iYnV0dG9uLmMgbWJhZi9tYm9iamVjdC5jIG1iYWYvYW5pbWF0ZWRfbWVu
dS5jCistbGlibWJmbHlfbGFfU09VUkNFUyA9IGFuaW1hdGUuYyBjaGdjb2xvci5jIGNvb3JkLmMg
ZXZlbnQuYyBnZW8uYwlcCistCW9ic2VydmVyLmMgcGFpbnQuYyByZWRyYXdfbWFuLmMgcm90YXRl
LmMgc2hhcGVfcGF0aC5jCQlcCistCXNoYXBlX3JlY3QuYyBzaGFwZV90ZXh0LmMgc2hpZnQuYyBz
dWJ0cmVlX2ZyZWUuYyB0aW1lci5jIAlcCistCXRpbWVydG9vbC5jIHRvb2xzLmMgdmlzaWJpbGl0
eS5jIFhfc3VwcC5jIHByb3AuYyBzcHJpdGUuYwlcCistCW1vdXNlLmMgc2hhcGVfaW1hZ2UuYyBp
bWdfbGRyLmMgJChNQkFGX1NPVVJDRVMpCisrbGlibWJmbHlfbGFfU09VUkNFUyA9CWFuaW1hdGUu
YyBcCisrCQkgICAgICAJY2hnY29sb3IuYyBcCisrCQkJY29vcmQuYyAgXAorKwkJCWV2ZW50LmMg
XAorKwkJCWdlby5jCVwKKysJCQlvYnNlcnZlci5jIFwKKysJCQlwYWludC5jIFwKKysJCQlyZWRy
YXdfbWFuLmMgXAorKwkJCXJvdGF0ZS5jIFwKKysJCQlzaGFwZV9wYXRoLmMgXAorKwkJCXNoYXBl
X3JlY3QuYyBcCisrCQkJc2hhcGVfdGV4dC5jIFwKKysJCQlzaGlmdC5jIFwKKysJCQlzdWJ0cmVl
X2ZyZWUuYyBcCisrCQkJdGltZXIuYyBcCisrCQkJdGltZXJ0b29sLmMgXAorKwkJCXRvb2xzLmMg
XAorKwkJCXZpc2liaWxpdHkuYyBcCisrCQkJWF9zdXBwLmMgXAorKwkJCXByb3AuYyBcCisrCQkJ
c3ByaXRlLmMgXAorKwkJCW1vdXNlLmMgXAorKwkJCXNoYXBlX2ltYWdlLmMgXAorKwkJCWltZ19s
ZHIuYyBcCisrCQkJJChNQkFGX1NPVVJDRVMpCisrCisrbGlibWJmbHlfbGFfQ0ZMQUdTID0gQGNh
aXJvX0NGTEFHU0AgXAorKwkJICAgICBAcGFuZ29jYWlyb19DRkxBR1NACisrbGlibWJmbHlfbGFf
TERGTEFHUyA9IEBjYWlyb19MSUJTQCBcCisrCQkgICAgICBAcGFuZ29jYWlyb19MSUJTQAorIAor
LWxpYm1iZmx5X2xhX0NQUEZMQUdTID0gQGNhaXJvX0NGTEFHU0AgQHBhbmdvY2Fpcm9fQ0ZMQUdT
QAorLWxpYm1iZmx5X2xhX0xERkxBR1MgPSBAY2Fpcm9fTElCU0AgQHBhbmdvY2Fpcm9fTElCU0AK
KytiaW5fUFJPR1JBTVMgPSBYX21haW4KKytub2luc3RfUFJPR1JBTVMgPSBYX21haW4KKyAKKyBY
X21haW5fU09VUkNFUyA9IFhfbWFpbi5jCistWF9tYWluX0xEQUREID0gJCh0b3BfYnVpbGRkaXIp
L3NyYy9saWJtYmZseS5sYQorLVhfbWFpbl9DUFBGTEFHUyA9IEBwYW5nb2NhaXJvX0NGTEFHU0Ag
LUkkKHRvcF9idWlsZGRpcikvc3JjCistWF9tYWluX0xERkxBR1MgPSBAcGFuZ29jYWlyb19MSUJT
QAorK1hfbWFpbl9MREFERCA9ICR7dG9wX2J1aWxkZGlyfS9zcmMvbGlibWJmbHkubGEKKytYX21h
aW5fQ0ZMQUdTID0gQHBhbmdvY2Fpcm9fQ0ZMQUdTQCBcCisrICAgICAgICAgICAgICAgICBAY2Fp
cm9fQ0ZMQUdTQCBcCisrICAgICAgICAgICAgICAgICAtSSR7dG9wX2J1aWxkZGlyfS9pbmNsdWRl
CisrWF9tYWluX0xERkxBR1MgPSBAcGFuZ29jYWlyb19MSUJTQCBcCisrICAgICAgICAgICAgICAg
IEBjYWlyb19MSUJTQAorKworK1hfbWFpbjogbGlibWJmbHkubGEKKysJJChMSUJUT09MKSAtLXRh
Zz1DQyAgIC0tbW9kZT1saW5rICQoQ0MpICQoWF9tYWluX0NGTEFHUykgJChYX21haW5fTElCQURE
KSBYX21haW4uYyAtbyAkQCAkPAorKworCmRpZmYgLS1naXQgYS9yZWNpcGVzL21hZGJ1ZmZlcmZs
eS9tYWRidXR0ZXJmbHlfZ2l0LmJiIGIvcmVjaXBlcy9tYWRidWZmZXJmbHkvbWFkYnV0dGVyZmx5
X2dpdC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi45ZmE1NjI2Ci0tLSAv
ZGV2L251bGwKKysrIGIvcmVjaXBlcy9tYWRidWZmZXJmbHkvbWFkYnV0dGVyZmx5X2dpdC5iYgpA
QCAtMCwwICsxLDE3IEBACitERVNDUklQVElPTiA9ICJNYWRCdXR0ZXJmbHkgaXMgYSBTVkcgYnJv
d3Nlci4gSXQgY2FuIGJlIHVzZWQgdG8gYmUgR1VJIGVudmlyb25tZW50IG9mIGVtYmVkZGVkIHN5
c3RlbSBvciBkZXNrdG9wLiIKK1NFQ1RJT04gPSAibGlicyIKK1BSSU9SSVRZID0gIm9wdGlvbmFs
IgorTElDRU5TRSA9ICJCU0QiCitERVBFTkRTID0gImNhaXJvIHBhbmdvIgorUEUgPSAiMCIKK1BS
ID0gInIwLjMiCisKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0LmdpdG9yaW91cy5vcmcvbWFkYnV0dGVy
Zmx5L21haW5saW5lLmdpdDtwcm90b2NvbD1naXQgXAorICAgICAgICAgICBmaWxlOi8vMDAxX21h
a2VmaWxlLmFtX2J1Z3MucGF0Y2g7cGF0Y2g9MSIKKworUyA9ICIke1dPUktESVJ9L2dpdCIKKwor
aW5oZXJpdCBhdXRvdG9vbHNfc3RhZ2UKKworRklMRVNfJHtQTn0gKz0gIiR7bGliZGlyfS8qLnNv
ICAke2RhdGFkaXJ9LyogL2Jpbi8qIgorRklMRVNfJHtQTn0tZGV2ICs9ICIke2xpYmRpcn0vKmEg
JHtsaWJkaXJ9L3BrZ2NvbmZpZy8qICR7aW5jbHVkZWRpcn0vKiIK

--000e0cd1b694a200c104675d1fb5--
