Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id AAD2875523
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 15:02:22 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b77-v6so6985545vkb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=21OTwmymQWBZgFmSWZ09+1c0wjGjRHY+WQbK+bZ/K7k=;
	b=f7YAyy03lbKjm1PkFjSy/zY+TVbxY01fhfZ+x2i01cr51AK9tJ377LYWZi6DnPnaHF
	E7f66Yaz0q4oaBWbXwP1LVKnG6smsENUFvrZwrPob9gESdsG+qMBmY5hbNtBZMnNJ1Q0
	awE/NFpPJ14l0wB1ssm/cSW9g/XQiNV8XKHmf4oVJTJE+yshRmWYmiGcH9kfFHFKUVw9
	ltgX2ltcJcoM8+9Mxvy2LBKnUquPJAG/fiKeWUr2Z/VA9tjmBqOS4ORTxJwSRxaQSsUX
	jIl/yC1NzkfKNc2kiHFQTpV2DU6r/RK+d/u+K7722v4Xk7/yLo09we1LHD9yXuZtmhll
	/5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=21OTwmymQWBZgFmSWZ09+1c0wjGjRHY+WQbK+bZ/K7k=;
	b=qkHlEBdzhk/p9q5lmBTVDt4rWkyzPwGWxh7fsPTio9DvXgMeZoOxBSpCADvQ1tfwJj
	+/iR03god/lo6QJfdeXbo0/i0ARTBK8iqyaTsoG435417/BBJrYzgOJGShgzmJeTlmeR
	y5U7l/FSaO2XAKkJVFotnBzyfXbOEyOBw7I3FHIVB7CBrLWqYAbKyk+tsG6p3zcB58tu
	xsf4+2sANcVMzcqf0J+bX+hLiqF9ATaxeITXaNhXoUy7cqQGMhshuBAL4iPC9slkFMg1
	4/I9gLzvzmeRAvnFYVpwgEMpC/12dsrn616cye4hIctazh+XR7ZeIRFdHC4H54jhBrDY
	jTHg==
X-Gm-Message-State: APt69E2wQMRF9HfdUvw8L1X71fCaF/j55HTl8qK1jrLCCEXg7uhGbWaV
	tRNwnDE61DTbNDn9ZIvUBCayWwXrdpzmiJFzR8k=
X-Google-Smtp-Source: AAOMgpcc4WBAJhhEv3JqkoEPkxPyf+5WW+0lNqv+xeS1WGyohWh7LqqPgh32IS/s03oLqEiEkySAJexsEn4DCaP0NZU=
X-Received: by 2002:a1f:20d4:: with SMTP id
	g203-v6mr5994520vkg.176.1530889343374; 
	Fri, 06 Jul 2018 08:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180705065408.103714-1-mingli.yu@windriver.com>
	<CAMKF1spY_iwTDuGjzD7N6cNq+n6W9KhhYYd=vhJCg=uE=aNQyQ@mail.gmail.com>
	<5B3F34E5.70101@windriver.com>
In-Reply-To: <5B3F34E5.70101@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jul 2018 08:01:19 -0700
Message-ID: <CAMKF1sqa49UG0+Una67_ES6jE-ZphxcqcwHDur80mAcz6oZPUw@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iozone3: Upgrade to 482
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
X-List-Received-Date: Fri, 06 Jul 2018 15:02:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 6, 2018 at 2:27 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 2018=E5=B9=B407=E6=9C=8806=E6=97=A5 00:00, Khem Raj wrote:
> > On Wed, Jul 4, 2018 at 11:54 PM <mingli.yu@windriver.com> wrote:
> >>
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> Update LIC_FILES_CHKSUM as the file iozone.c
> >> used for LIC_FILES_CHKSUM updated
> >>
> >
> > Please describe what has changed that is causing the checksums to
> > change.
>
> The source file iozone.c changed has causing the checksum change. I have
> already mention it in the commit message.

Commit message does not say what changed,  We already know something
has changed thats causing the checksum change but here we usually
document what changed specifically, purpose is to let users know of
any
change in licensing requirements that they need to be aware of

>
> Thanks,
>
> >
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   .../iozone3/{iozone3_465.bb =3D> iozone3_482.bb}              | 6 ++=
+---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>   rename meta-oe/recipes-benchmark/iozone3/{iozone3_465.bb =3D> iozone=
3_482.bb} (95%)
> >>
> >> diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb b/meta-o=
e/recipes-benchmark/iozone3/iozone3_482.bb
> >> similarity index 95%
> >> rename from meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
> >> rename to meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
> >> index 191b93425..09306e044 100644
> >> --- a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
> >> +++ b/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
> >> @@ -4,14 +4,14 @@ AUTHOR =3D "Don Capps <don.capps2@verizon.net>, Will=
iam D. Norcott <wnorcott@us.or
> >>   SECTION =3D "console/tests"
> >>   LICENSE =3D "iozone3"
> >>   LIC_FILES_CHKSUM =3D "file://iozone.c;beginline=3D37;endline=3D48;md=
5=3D7331260091868dcad0f9edea735b5f4b \
> >> -    file://iozone.c;beginline=3D260;endline=3D266;md5=3D77f9ee51e45b5=
7a7e7519c4fa0b4f00b \
> >> +    file://iozone.c;beginline=3D260;endline=3D266;md5=3D0aa488fd139ea=
c078be6eca86e1435e8 \
> >>   "
> >>   SRC_URI =3D "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
> >>       file://parallelism.patch \
> >>       file://copyright.txt \
> >>   "
> >> -SRC_URI[md5sum] =3D "c924e5e46fb1cf8145f420e8e57eb954"
> >> -SRC_URI[sha256sum] =3D "2e3d72916e7d7340a7c505fc0c3d28553fcc5ff2daf41=
d811368e55bd4e6a293"
> >> +SRC_URI[md5sum] =3D "31ca1d3d28bc375c20a2808217cf212c"
> >> +SRC_URI[sha256sum] =3D "2733feb63c96f77177c68f3d938f2294d5394d8554b27=
67c45cbe138b2f3ae30"
> >>
> >>   UPSTREAM_CHECK_REGEX =3D "iozone3_(?P<pver>\d+).tar"
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

