Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 25A286067D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 08:22:43 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l124so21532616wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 01:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ClSQhJOTLKd10YYuidPGm0ct7ONA9Trtpa+syRyfPtg=;
	b=JL662ibbLYgCyXMj6NB77ejwNOM3bWN77uzsEvPZ/EO0dyf6CYzLQPUGUj9oxaRVWX
	gLEI0WQek6f6im7rnvScqWJ1AwB8YkA9mugNnWaBYMDrM/SKugB7yPN6Zx5WU0LtjT3z
	HbFdXodbdw4d5dNUHY1zR3U5Z4QCH7lXxSwH+7uZCjMpOKLXA7Kq3mbD1ssIIWxW2Wo1
	8z8qHD4IvkC7xQ+yt3RdhIPY+GMGn7IQhX1tDWweOtICSeWjbjlA/CVt9WvMTma5MgSv
	pSEy4DQ+hVc0QKSUVdrI/OicTXuS2t5KaI4ZnoRsHO2GrfAmmIGm+hf7180FTXQRWeJI
	Hp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ClSQhJOTLKd10YYuidPGm0ct7ONA9Trtpa+syRyfPtg=;
	b=S1P3y3T5ksqnOy8ThAUoKF3GpWR+/QSQce83YbbeBXCf6JJntrXO/m3i1tGdZQYJMv
	qtxkbmANqwu7TYJ0nlWp7nsh3bT3i+ZZr6VY1PmF0bpmj/UFI6e6LcfRWvpGs5NpjTR3
	NZhQ2PRLhZqZVvKBf9WlPQcLkxpyxZTPaA1sWItfefqYlhYqTh1z2o1SVUoyXxGIRqX1
	Sq+GtzzR4lKmJf4buD6CnKmD4StCmdSino4vNiJmd/OKMD2VMB6DLrbbJzxCqOCe/p4E
	s0NKg39C6Blr3s0fmen2NWHzH+2lGPHNelEX1l7DvmS/Jc6G6yXvKXbxixtzuGeJOpV7
	tjZg==
X-Gm-Message-State: AD7BkJLpNsHdR1rJZ0Kx/oS87cdhVtxdVVpsi5vvDIu/DP0n73WxlKeh12iOThkKXKdT0zE4kDJsy5FF1CoVLQ==
MIME-Version: 1.0
X-Received: by 10.28.176.200 with SMTP id z191mr15619138wme.91.1458289364198; 
	Fri, 18 Mar 2016 01:22:44 -0700 (PDT)
Received: by 10.194.102.74 with HTTP; Fri, 18 Mar 2016 01:22:44 -0700 (PDT)
In-Reply-To: <56EBA6A8.5080404@mlbassoc.com>
References: <1457626042-28653-1-git-send-email-gary@mlbassoc.com>
	<1457626042-28653-2-git-send-email-gary@mlbassoc.com>
	<20160317144440.GC2553@jama> <56EBA6A8.5080404@mlbassoc.com>
Date: Fri, 18 Mar 2016 09:22:44 +0100
Message-ID: <CA+chaQeoeV1fWC7KS=UzEqQL4OQcVBCbT=enQQ-T=7gugcaJ4w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3 1/2] libass: Update to latest version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Mar 2016 08:22:44 -0000
Content-Type: text/plain; charset=UTF-8

See first line:
http://www.openembedded.org/wiki/Bitbake_World_Status

On Fri, Mar 18, 2016 at 7:56 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2016-03-17 15:44, Martin Jansa wrote:
>
>> On Thu, Mar 10, 2016 at 05:07:21PM +0100, Gary Thomas wrote:
>>
>>> libass has moved from Google to github.com
>>> Also update to the latest version (libass.so.5)
>>>
>>
>> libass-0.13.2: ELF binary
>>
>> '/tmp/work/i586-oe-linux/libass/0.13.2-r0/packages-split/libass/usr/lib/libass.so.5.3.0'
>> has relocations in .text [textrel]
>>
>>
> Hmm, this doesn't happen on arm (cortexa9) builds :-(
>
> Please tell me how you do "world builds" and I'll try to duplicate this
> and the mpv issues.
>
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>>> ---
>>>   meta-oe/recipes-multimedia/libass/libass.inc       | 7 ++-----
>>>   meta-oe/recipes-multimedia/libass/libass_0.10.1.bb | 5 -----
>>>   meta-oe/recipes-multimedia/libass/libass_0.13.2.bb | 4 ++++
>>>   3 files changed, 6 insertions(+), 10 deletions(-)
>>>   delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
>>>   create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
>>>
>>> diff --git a/meta-oe/recipes-multimedia/libass/libass.inc
>>> b/meta-oe/recipes-multimedia/libass/libass.inc
>>> index 328cd14..a394c56 100644
>>> --- a/meta-oe/recipes-multimedia/libass/libass.inc
>>> +++ b/meta-oe/recipes-multimedia/libass/libass.inc
>>> @@ -1,5 +1,5 @@
>>>   DESCRIPTION = "libass is a portable subtitle renderer for the ASS/SSA
>>> (Advanced Substation Alpha/Substation Alpha) subtitle format. It is mostly
>>> compatible with VSFilter."
>>> -HOMEPAGE = "http://code.google.com/p/libass/"
>>> +HOMEPAGE = "http://github.com/libass/libass/"
>>>   SECTION = "libs/multimedia"
>>>
>>>   LICENSE = "ISC"
>>> @@ -7,10 +7,7 @@ LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=8ae98663bac55afe5d989919d296f28a"
>>>
>>>   DEPENDS = "enca fontconfig freetype libpng fribidi"
>>>
>>> -INC_PR = "r1"
>>> -
>>> -SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz
>>> <http://googlecode.com/files/$%7BBP%7D.tar.gz>"
>>> -
>>> +SRC_URI = "
>>> https://github.com/${PN}/${PN}/releases/download/0.13.2/${BP}.tar.gz"
>>>   inherit autotools pkgconfig
>>>
>>>   PACKAGECONFIG ??= ""
>>> diff --git a/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
>>> b/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
>>> deleted file mode 100644
>>> index 0b32276..0000000
>>> --- a/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
>>> +++ /dev/null
>>> @@ -1,5 +0,0 @@
>>> -require ${PN}.inc
>>> -PR = "${INC_PR}.0"
>>> -
>>> -SRC_URI[md5sum] = "6cace482a013a3c4bf3b31a68ac66026"
>>> -SRC_URI[sha256sum] =
>>> "629a7e81fff92dea8d0399b818a41fd1b61e381c67a5961b1eaec2efadb14c6c"
>>> diff --git a/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
>>> b/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
>>> new file mode 100644
>>> index 0000000..123c9dd
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
>>> @@ -0,0 +1,4 @@
>>> +require ${PN}.inc
>>> +
>>> +SRC_URI[md5sum] = "b4d82616bb18e8e954b18746a105a3b8"
>>> +SRC_URI[sha256sum] =
>>> "8baccf663553b62977b1c017d18b3879835da0ef79dc4d3b708f2566762f1d5e"
>>> --
>>> 2.5.0
>>>
>>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>

