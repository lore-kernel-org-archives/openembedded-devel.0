Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id DD5B47D2D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 16:34:22 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id z17so3915107qts.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2019 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ItRVk3nq1bLVCxQU+ANEt1j5mRyfK8vc67GBSTa68bo=;
	b=g9S1yu2bZxM36TFupNNTfuJvRiRVvvzrlBBQqOohSDvobhetSLKyrQGcAmVEekv7ba
	MB9URSTOEZAhS+X/7H+4BzolW9Vea9pdK9rG2M+PYDSpR5LxAnOlvYlEj8wvpOxyTUhg
	9vietxzpxwrqHdQQRRglpyRVMUsd7BkT9wE15edfR7yZ7k1ELSzqJGKpJPZSOqPA7i3h
	r/VnhJyMJjs11qxk/S7sQyU4qSDaYPzhEzgMPdiSdopJVSZeTLHVT7qvUlHIepLCbeyO
	3Sfmhpw+wT2wq0yVhStBe0SpES7xhBefriKxJ2Vzwq+HA9CZLly0bytequI9LvT3TAPV
	1mDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ItRVk3nq1bLVCxQU+ANEt1j5mRyfK8vc67GBSTa68bo=;
	b=nEN9CCs5Q42OmEpdDLr7v7wUKkF1IxfK8hvHxIf+9CFSNX93UwojRHEVFuMYKEeC+G
	1aoZigv4ziPEz/hdMnTOAznB8i4zLB4YkpYlA/SqdEZpV4GuuieulhrFPy1utsm+krwu
	2pO5VZgzj/YHIC6XPnUvxuOhi5HCTL/rzBFqVIewjUUtnVTjvEg28+c4FpHxfxeZl2cY
	kVy0JlqawAz3/btZRmte4TZY7u/kcWHUv6FkE0C5/gJ0+mBUESaWduocuMPL0ziYl9Mv
	dR/TkUt0bFFEhtk3tblbmjXsMLfqFHUpVmfW/hRt0f1xva1R+LEfU9Pvi0zicSyB2jTs
	pn5A==
X-Gm-Message-State: APjAAAWtK52GbM23qYHry3VMwKDif35CSTPEloKVvgRKz9unGkNwuvdW
	g2Cla5dG96prmoy7CqQ7lozDAemPRLbUKatKUuqRqg==
X-Google-Smtp-Source: APXvYqwoG+3do6/Cd6S/cfX4hLQlFd/eiNkiOsa6SWxYCTxBWTKvuIkMnAoZRJRl3ZJ7UA3G9tC8n3xGu9EpWw9GORY=
X-Received: by 2002:ac8:1833:: with SMTP id q48mr6260448qtj.133.1554395663551; 
	Thu, 04 Apr 2019 09:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
	<CAMKF1so1Y08xAu8Xk_4X388kc-W3nVbRcdy+qt6GQo0h1LN=VQ@mail.gmail.com>
	<CAB2nKc9Mr7yTn=U_HNrKU1V5_nBM8AMjA2dpe3JOjrkJ83-d5Q@mail.gmail.com>
	<CAB2nKc-H-8KDVc1ycGBXgCMQs6H9R5neoBt8_GNq-Sk=dfukXQ@mail.gmail.com>
In-Reply-To: <CAB2nKc-H-8KDVc1ycGBXgCMQs6H9R5neoBt8_GNq-Sk=dfukXQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Apr 2019 09:34:12 -0700
Message-ID: <CAMKF1sp=iGmZgsQj9LeveCeF0hjbXOwu5KpdQU8w9Cd3_g6t9w@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Thu, 04 Apr 2019 16:34:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, go ahead.

On Thu, Apr 4, 2019 at 2:12 AM Vincent Prince <vincent.prince.fr@gmail.com>
wrote:

> I just look at cppzmq, and version is only 4.3.0 and not 4.3.1, my mistak=
e.
>
> By the way, 4.3.0 version uses googletest for tests and I disabled it
> because cmake fetcher hangs,
> Moreover, master version uses another test framework (catch), so it will
> be quite some work to add googletest support then remove it for next
> version.
>
> Khem, do you think I can keep EXTRA_OECMAKE =3D "-DCPPZMQ_BUILD_TESTS=3DO=
FF"
> for now with this explanation in commit log?
> Will send v3 after your decision,
>
> Thanks,
> Vincent
>
>
> Le mer. 3 avr. 2019 =C3=A0 21:33, Vincent Prince <vincent.prince.fr@gmail=
.com>
> a =C3=A9crit :
>
>> Hi Khem,
>>
>> To be honest I disabled it because I don't have much time to add ptest
>> stuff and I had a failure with it.
>> I'll try to rework that part and at least put it in a packageconfig knob
>> as suggested.
>>
>> Thanks for review,
>> Vincent
>>
>> Le mer. 3 avr. 2019 =C3=A0 18:52, Khem Raj <raj.khem@gmail.com> a =C3=A9=
crit :
>>
>>> On Wed, Apr 3, 2019 at 1:30 AM Vincent Prince
>>> <vincent.prince.fr@gmail.com> wrote:
>>> >
>>> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
>>> > ---
>>> >  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
>>> >  1 file changed, 4 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>>> b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>>> > index 9aff59c..2f99417 100644
>>> > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>>> > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
>>> > @@ -4,8 +4,8 @@ LICENSE =3D "MIT"
>>> >  LIC_FILES_CHKSUM =3D
>>> "file://LICENSE;md5=3Ddb174eaf7b55a34a7c89551197f66e94"
>>> >  DEPENDS =3D "zeromq"
>>> >
>>> > -SRCREV =3D "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
>>> > -PV =3D "4.2.3+git${SRCPV}"
>>> > +SRCREV =3D "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
>>> > +PV =3D "4.3.1+git${SRCPV}"
>>> >
>>> >  SRC_URI =3D "git://github.com/zeromq/cppzmq.git"
>>> >
>>> > @@ -13,6 +13,8 @@ S =3D "${WORKDIR}/git"
>>> >
>>> >  inherit cmake
>>> >
>>> > +EXTRA_OECMAKE =3D "-DCPPZMQ_BUILD_TESTS=3DOFF"
>>> > +
>>>
>>> explaining why tests are disabled would be helpful for future changes
>>> where someone might
>>> want to enable it and if its an optimization then turn it into
>>> packageconfig knob.
>>>
>>> >  PACKAGES =3D "${PN}-dev"
>>> >
>>> >  RDEPENDS_${PN}-dev =3D "zeromq-dev"
>>> > --
>>> > 2.7.4
>>> >
>>> > --
>>> > _______________________________________________
>>> > Openembedded-devel mailing list
>>> > Openembedded-devel@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>

