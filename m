Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 35F1B601EB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2020 17:25:59 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id e25so8033265qtr.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Feb 2020 09:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+i9p5u+8TRSQnUuaWlvtMergN634fobALuqN4QlhGYI=;
	b=vfRZzIwcsjZQtihrmikHnVeJVmW3riITAuAWC2zR2Lv3aRzhs3Vkal9DEG0hL/SDDF
	CJpJVZJ76Ehc7aOtgx2D170iHi/MIG06WGMAR5BrPYowe6QoZoWXD/5iVx888NS/Z9Eg
	fpgSHSv0prMIydJqAWMbts+l+Le/xcHiDcXQSuMQDRAPuVySvhNLX8lHerZtpv4kZb0N
	dKTFoEw5vrHZrgXqNhHI5Qmui+ZIFc2qJ3razPqeIG4Ko6s2XR+SOSB+Xy/6tkUZnkOl
	Vnr2L0knp5AAAL28OXByymsyo731RlGY8vJ8ACqER1a8XIICjVQdDeExq55j8+VHHE18
	1t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+i9p5u+8TRSQnUuaWlvtMergN634fobALuqN4QlhGYI=;
	b=ioBoZi2s6XibRObmW60wNIkblydbbdu4SQ0WMNDcfqf4VRRlToTF3h3xpTlMvRlTu5
	ih/ocPemcinnwIlqIMvoeHL6g89zh1jMPreBWpXqJuvKZi/hbRrOyAO7P3rM+DnO8w7t
	Dxi7lLyfIMncL9bVRjhzwI018w0/qCoB1/bJ6W0ahTTveOyLnyaSn05HZvGtCGzaY8R/
	kN+ETQyUWYAOCSi2r6OjjL84VjS+EaMSi8omEWuf4XHuZU68nS7wkBUdMRA1wCXXw2VW
	FrXbJMu7VCfATUdQfyFYGhTsOI+57CCIlU1ScYutkeYxdozxcB9WTMlpN3IywqZnCMNm
	j0hw==
X-Gm-Message-State: APjAAAXrVlWbipmJJW36GBVbY0blb+GsTWbvvyG7Uc1+mBvtpbNootii
	3SdHIsqsOIsBIb/VnvagwCklPwMxXRALWlZlE/o=
X-Google-Smtp-Source: APXvYqyvLbFeW5m/L9QPrAEyDud78XE937f3e/4LL5QeucJvVQ0NMRySralE165OY7kBv77SoJZ6UW2wS2IwudmKfpA=
X-Received: by 2002:ac8:145:: with SMTP id f5mr16119722qtg.194.1580577959886; 
	Sat, 01 Feb 2020 09:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20200201163703.4264-1-schnitzeltony@gmail.com>
	<20200201163703.4264-3-schnitzeltony@gmail.com>
	<11ab5995-8055-2b57-caa9-93cabab79be7@windriver.com>
In-Reply-To: <11ab5995-8055-2b57-caa9-93cabab79be7@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Feb 2020 09:25:33 -0800
Message-ID: <CAMKF1sodecN8LizT+VqpEECVTDd3JvpaX_LPdx4uMVfa_O68pw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/4] poppler: upgrade 0.84.0 -> 0.84.0
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
X-List-Received-Date: Sat, 01 Feb 2020 17:25:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have fixed it already locally.

On Sat, Feb 1, 2020 at 9:23 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Typo:
>
> Re: [oe] [PATCH 2/4] poppler: upgrade 0.84.0 -> 0.84.0
> should be:
> Re: [oe] [PATCH 2/4] poppler: upgrade 0.84.0 -> 0.85.0
>
> Thanks,
> ../Randy
>
>
> On 2/1/20 11:37 AM, Andreas M=C3=BCller wrote:
> > Release 0.85.0:
> > core:
> >   * Fix case unsensitive search for Deseret and Osage. Issue #853
> >   * Fix crash in unicodeToAscii7
> >   * CairoOutputDev: make initialisation thread-safe
> >   * Fix crash on broken files. Issues #869, #870
> >   * Internal code improvements
> >
> > qt5:
> >   * Fix FormField::name encoding
> >   * Accept UTF-16 uiNames for form fields
> >   * Fix search for "complex" characters
> >   * Allow to load document from QIODevice
> >
> > utils:
> >   * pdftoppm/pdftocairo: Fix -e/-o printing the wrong pages. Issue #873
> >   * pdftohtml: Fix issue with the font size sometimes being huge
> >
> > glib:
> >   * make the frontend initialization thread safe.
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >   .../poppler/{poppler_0.84.0.bb =3D> poppler_0.85.0.bb}          | 4 +=
+--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >   rename meta-oe/recipes-support/poppler/{poppler_0.84.0.bb =3D> popple=
r_0.85.0.bb} (93%)
> >
> > diff --git a/meta-oe/recipes-support/poppler/poppler_0.84.0.bb b/meta-o=
e/recipes-support/poppler/poppler_0.85.0.bb
> > similarity index 93%
> > rename from meta-oe/recipes-support/poppler/poppler_0.84.0.bb
> > rename to meta-oe/recipes-support/poppler/poppler_0.85.0.bb
> > index 5153868b6..857b67ff9 100644
> > --- a/meta-oe/recipes-support/poppler/poppler_0.84.0.bb
> > +++ b/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
> > @@ -7,8 +7,8 @@ SRC_URI =3D "http://poppler.freedesktop.org/${BP}.tar.x=
z \
> >              file://0001-Do-not-overwrite-all-our-build-flags.patch \
> >              file://basename-include.patch \
> >              "
> > -SRC_URI[md5sum] =3D "e14a8aca8809908ad4364c32c17bcb92"
> > -SRC_URI[sha256sum] =3D "c7a130da743b38a548f7a21fe5940506fb1949f4ebdd32=
09f0e5b302fa139731"
> > +SRC_URI[md5sum] =3D "5315084523a4d73e9514f51eef78a332"
> > +SRC_URI[sha256sum] =3D "2bc875eb323002ae6b287e09980473518e2b2ed6b5b7d2=
e1089e36a6cd00d94b"
> >
> >   DEPENDS =3D "fontconfig zlib cairo lcms glib-2.0"
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

