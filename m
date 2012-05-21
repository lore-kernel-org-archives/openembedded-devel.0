Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1SWQMR-0007Ix-Mm
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 13:01:11 +0200
Received: by wibhm14 with SMTP id hm14so1959488wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=pT7h54adCeFXn39XTQ//AfirsOgIq8AgY3QIN4su2k0=;
	b=DFC1po4n4IuAtjoNKelqOCRrNe/kQYFsHe1qFbFFuI8Lbbp4z8MfGPf/MNqu+hTi48
	FAb9zMFokZC2NI5Zg5TjnNblEuESSoIHVy58VgHKshNzaKW3SLxbDBdjcfRTm5Wg5t5D
	PdcINKLWDkGjbvePzqaWsiTcLg1SocTPa65RhtARemePV47olPsyhEKJ1TKx0cAMkL0l
	neKdE7QcHAF8ReIPoNSu8FBv4zNKBape5SXE0hf+v32nWEVdwn5mg0UEzOyF7uwxQBZO
	q4cj2zy4AhfdkPgKV+Kdu92btvpwoxz7zkEoS7sLQQFUQUVygWv8qxdeDEIkmLo4koLc
	Cr6g==
MIME-Version: 1.0
Received: by 10.180.78.161 with SMTP id c1mr24323940wix.1.1337597464185; Mon,
	21 May 2012 03:51:04 -0700 (PDT)
Sender: pabigot@gmail.com
Received: by 10.216.235.73 with HTTP; Mon, 21 May 2012 03:51:02 -0700 (PDT)
In-Reply-To: <4FB98FCC.9050306@mindchasers.com>
References: <CAPOJ94OspH5H4G-=wQNqb=DdHratNwV3LHYnYo2BW43sbavk+g@mail.gmail.com>
	<4FB98FCC.9050306@mindchasers.com>
Date: Mon, 21 May 2012 05:51:02 -0500
X-Google-Sender-Auth: iK5OfMvy270Z8kwhmPtoe4FBu5Y
Message-ID: <CAPOJ94MRKKK2mgKw1oh7KWUUWg81fHg94Asu2TPNiZh6kaO7yw@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: Bob Cochran <openembedded@mindchasers.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: oe-core license description practices
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
X-List-Received-Date: Mon, 21 May 2012 11:01:11 -0000
X-Groupsio-MsgNum: 38916
Content-Type: multipart/mixed; boundary=f46d0435c032b48ca404c089ad8a

--f46d0435c032b48ca404c089ad8a
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, May 20, 2012 at 7:43 PM, Bob Cochran
<openembedded@mindchasers.com> wrote:
> On 01/15/2012 10:15 AM, Peter Bigot wrote:
>>
>> I need a resolution to this question so I can complete the port of an
>> oe-classic recipe to oe-core.
>>
>> http://www.openembedded.org/wiki/OpenEmbedded-Core states that the
>> LICENSE field should be "as correct as possible (e.g. 'GPLv2', not
>> just 'GPL')". =A0If the upstream package self-describes as "GPL", is it
>> necessary that this be refined to a more specific version? =A0I again
>> note there are numerous existing recipes that do not provide more than
>> "GPL".
>>
>> Depending on the answer, I will resubmit with a license of GPL | HPND
>> or will attempt to contact the upstream maintainer for clarification.
>>
>> Thanks.
>>
>> Peter
>>
>> On Sat, Dec 31, 2011 at 3:28 PM, Peter Bigot<bigotp@acm.org> =A0wrote:
>>>
>>> On Sat, Dec 31, 2011 at 1:40 PM, Koen Kooi<koen@dominion.thruhere.net>
>>> =A0wrote:
>>>>
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>
> snip
>
>
> Hi Peter,
>
> Did this get resolved? =A0I'm not finding python-mysqldb on the git serve=
r
> outside of classic.

No, I never got what I felt was a legally approved answer to the basic
question, and haven't worked OE for a couple months so didn't pursue
it.

Peter

> However, I did make use of the 1.2.3 patches you offered on 12/31/11, so
> thanks for that. =A0I have done some minimal testing with django tonight,=
 and
> it seems to be working OK.
>
> Bob
>
>
>

--f46d0435c032b48ca404c089ad8a
Content-Type: application/octet-stream; 
	name="0001-python-mysqldb-import-from-OE-classic-update-to-1.2..patch"
Content-Disposition: attachment; 
	filename="0001-python-mysqldb-import-from-OE-classic-update-to-1.2..patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h2hewudr0

RnJvbSAzMmM4YTA4YzBmMTBmMzg3MTU4ZWQ4OTlmNGJhNmY3NDdjZmIxMWJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiUGV0ZXIgQS4gQmlnb3QiIDxiaWdvdHBAYWNtLm9yZz4KRGF0
ZTogVHVlLCAzMSBKYW4gMjAxMiAwODo1MTo0NiAtMDYwMApTdWJqZWN0OiBbUEFUQ0hdIHB5dGhv
bi1teXNxbGRiOiBpbXBvcnQgZnJvbSBPRSBjbGFzc2ljLCB1cGRhdGUgdG8gMS4yLjMKCkNoYW5n
ZXMgZnJvbSBjbGFzc2ljIHJlY2lwZToKCiogQ29ycmVjdGVkIGxpY2Vuc2UgZGVzY3JpcHRpb24g
YmFzZWQgb24gdGV4dCBpbiBSRUFETUUuCgoqIFN3aXRjaGVkIHRvIHNldHVwdG9vbHMgc2luY2Ug
ZGlzdHV0aWxzIHByb2R1Y2VkIGFuIGVnZyB0aGF0IGhhZCB4ODYKICBlbmNvZGVkIGluIGl0LgoK
KiBPbGQgc2l0ZS5wYXRjaCBubyBsb25nZXIgbmVjZXNzYXJ5OyB0aHJlYWRzYWZlIGlzIEZhbHNl
IGluIHRoaXMgdmVyc2lvbi4KCk92ZXJhbGwgbGljZW5zaW5nIHRha2VuIGZyb20gUkVBRE1FOyBH
UEwgaW5mZXJyZWQgdG8gYmUgR1BMdjIrIGJhc2VkIG9uIHRleHQKYXQgdG9wIG9mIF9teXNxbC5j
CgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBBLiBCaWdvdCA8Ymlnb3RwQGFjbS5vcmc+Ci0tLQogLi4u
L3B5dGhvbi9weXRob24tbXlzcWxkYi9teXNxbHBhdGgucGF0Y2ggICAgICAgICAgfCAgIDE4ICsr
KysrKysrKysrKysrKwogLi4uL3B5dGhvbi9weXRob24tbXlzcWxkYl8xLjIuMy5iYiAgICAgICAg
ICAgICAgICAgfCAgIDI0ICsrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQy
IGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1v
ZS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tbXlzcWxkYi9teXNxbHBhdGgucGF0Y2gK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bi1teXNxbGRiXzEuMi4zLmJiCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24tbXlzcWxkYi9teXNxbHBhdGgucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1teXNxbGRiL215c3FscGF0aC5wYXRjaApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5hMzhkYTZmCi0tLSAvZGV2L251bGwKKysrIGIvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tbXlzcWxkYi9teXNxbHBhdGgucGF0
Y2gKQEAgLTAsMCArMSwxOCBAQAorLS0tIE15U1FMLXB5dGhvbi0xLjIuMy9fbXlzcWwuYy5vcmln
CTIwMTAtMDYtMTcgMDI6MjE6NTYuMDAwMDAwMDAwIC0wNTAwCisrKysgTXlTUUwtcHl0aG9uLTEu
Mi4zL19teXNxbC5jCTIwMTEtMTItMzEgMDk6NTA6MDcuODg4MDU2MzMxIC0wNjAwCitAQCAtMzMs
MTEgKzMzLDExIEBACisgI2luY2x1ZGUgPHdpbmRvd3MuaD4KKyAjaW5jbHVkZSA8Y29uZmlnLXdp
bi5oPgorICNlbHNlCistI2luY2x1ZGUgIm15X2NvbmZpZy5oIgorKyNpbmNsdWRlICJteXNxbC9t
eV9jb25maWcuaCIKKyAjZW5kaWYKKy0jaW5jbHVkZSAibXlzcWwuaCIKKy0jaW5jbHVkZSAibXlz
cWxkX2Vycm9yLmgiCistI2luY2x1ZGUgImVycm1zZy5oIgorKyNpbmNsdWRlICJteXNxbC9teXNx
bC5oIgorKyNpbmNsdWRlICJteXNxbC9teXNxbGRfZXJyb3IuaCIKKysjaW5jbHVkZSAibXlzcWwv
ZXJybXNnLmgiCisgCisgI2lmIFBZX1ZFUlNJT05fSEVYIDwgMHgwMjAyMDAwMAorICMgZGVmaW5l
IE15VHVwbGVfUmVzaXplKHQsbixkKSBfUHlUdXBsZV9SZXNpemUodCwgbiwgZCkKZGlmZiAtLWdp
dCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLW15c3FsZGJfMS4yLjMu
YmIgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1teXNxbGRiXzEuMi4z
LmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmFlMGM3Y2EKLS0tIC9kZXYv
bnVsbAorKysgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1teXNxbGRi
XzEuMi4zLmJiCkBAIC0wLDAgKzEsMjQgQEAKK0RFU0NSSVBUSU9OID0gIlB5dGhvbiBpbnRlcmZh
Y2UgdG8gTXlTUUwiCitIT01FUEFHRSA9ICJodHRwOi8vc291cmNlZm9yZ2UubmV0L3Byb2plY3Rz
L215c3FsLXB5dGhvbi8iCitTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKKyMgIkdQTCBvciB0aGUg
b3JpZ2luYWwgbGljZW5zZSBiYXNlZCBvbiBQeXRob24gMS41LjIncyBsaWNlbnNlIgorTElDRU5T
RSA9ICJHUEx2MisiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUU7bWQ1PWY5MmU1
ZDYwYjIxM2QzNTI4OGJjMTRmMThlMWUzMWI0IgorREVQRU5EUyA9ICJteXNxbDUiCisKK1NSQ19V
UkkgPSAiXAorICAke1NPVVJDRUZPUkdFX01JUlJPUn0vbXlzcWwtcHl0aG9uL015U1FMLXB5dGhv
bi0ke1BWfS50YXIuZ3ogXAorICBmaWxlOi8vbXlzcWxwYXRoLnBhdGNoIFwKKyIKK1NSQ19VUklb
bWQ1c3VtXSA9ICIyMTVlZGRiNmQ4NTNmNmY0YmU1YjRhZmM0MTU0MjkyZiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI3ZGU2NmZiYmY5MjM2MzRlN2M5NjVhZWFlZmE3NDY0MmJhNzVhZTIwZWUxY2Vm
Y2VmYzMwMDk1OTViN2E3ZTZlIgorCitTUkNOQU1FID0gIk15U1FMLXB5dGhvbiIKK1MgPSAiJHtX
T1JLRElSfS8ke1NSQ05BTUV9LSR7UFZ9IgorCitpbmhlcml0IHNldHVwdG9vbHMKKworZG9faW5z
dGFsbF9hcHBlbmQoKSB7CisgICAgaW5zdGFsbCAtZCAke0R9JHtkYXRhZGlyfS9kb2MvJHtQTn0v
CisgICAgaW5zdGFsbCAtbSAwNjQ0ICR7U30vZG9jLyoudHh0ICR7RH0ke2RhdGFkaXJ9L2RvYy8k
e1BOfS8KK30KLS0gCjEuNy43LjYKCg==

--f46d0435c032b48ca404c089ad8a--
