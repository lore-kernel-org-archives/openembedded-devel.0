Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id 37D807BF70
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 19:34:10 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id 139so13192589ita.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 12:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WOd3POD/10MVyOI2Z13z6NS94c7Z3roTTDcbuVKfVao=;
	b=nUknEgRiUXugrN+HYnHyZh+cyzgdjGXGXwJ+Xlu69Z2FGREk4kc6IRqNrNTM11e6qP
	BlQsP/G5HfbZ4s9f56w2KDo2takyPNdGdV2zT2iNnhMNyU6zbxNn7VLlFWVW2Q7eDhqD
	vDcGwA5OnrZwt12zQ3D+IMSJSCfWNrDf0KdJmlWsep1hunzsbFrwoGRlLR/4Dci0lOlG
	YCTdgBUKaS0D1jRXqhRBElm+NU5HkuniHQ85A2H1jeLDDzj866GcPLzZuLhf5oGdsynJ
	rV9oatuMLuZ3yjGv7Frfb1DmHHO9o0KtobgGhF4LUP0zMtJOSRi76vWM+e/2w80SLzno
	kWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WOd3POD/10MVyOI2Z13z6NS94c7Z3roTTDcbuVKfVao=;
	b=H8IDbwkhI6Vl8OeyDqW8JtFd1RuyKH0OaXkYG5sIHWvaQe1UxRco/vmbaDaF0Kr37t
	WLX6NT5AJ8OArKvSvtbwp4ib491kFgMYo1vCkLSDLTRUx9cXke5kzS49cpMLSdrsXZVI
	Iu913Wbqs1CoF/dMvmc+mdH+wpG5ppNz4RG4Z8f0ut8LvcW1G3rSkw2S7x5clvRAzsn7
	LXfat16S+SuZePWaNAfRv1lRpFFV7/2KxPPVQAmkI4cFhS6fyKJ2vmAsdohQ5Y5aw9uw
	JF9vTzTz4s4Ubn3Jc65c/IuRxAI232R0ZyBOvvCvdLtT2N/NBE8Tk5P5Z1ZZ/vOBOuvi
	70TA==
X-Gm-Message-State: APjAAAXcOUvywkR4fShib8JrzYDCxYygNWT/HAGzmlYHukZUvEkYW8Ci
	PrIP9iwAdL/+o0AkWTKxfJURdrYuKpn1cU40j1k=
X-Google-Smtp-Source: APXvYqyHnd2xXQ2APvdxihl3aLWuOfLUVnjfR9c3aGsIy6F+HDkgqj/jOYO7BRoT1mh5InsiH/hUzpznvxkoVyjT3ZM=
X-Received: by 2002:a24:46cc:: with SMTP id j195mr1601562itb.161.1554320051169;
	Wed, 03 Apr 2019 12:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
	<CAMKF1so1Y08xAu8Xk_4X388kc-W3nVbRcdy+qt6GQo0h1LN=VQ@mail.gmail.com>
In-Reply-To: <CAMKF1so1Y08xAu8Xk_4X388kc-W3nVbRcdy+qt6GQo0h1LN=VQ@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 3 Apr 2019 21:33:57 +0200
Message-ID: <CAB2nKc9Mr7yTn=U_HNrKU1V5_nBM8AMjA2dpe3JOjrkJ83-d5Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 03 Apr 2019 19:34:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

To be honest I disabled it because I don't have much time to add ptest
stuff and I had a failure with it.
I'll try to rework that part and at least put it in a packageconfig knob as
suggested.

Thanks for review,
Vincent

Le mer. 3 avr. 2019 =C3=A0 18:52, Khem Raj <raj.khem@gmail.com> a =C3=A9cri=
t :

> On Wed, Apr 3, 2019 at 1:30 AM Vincent Prince
> <vincent.prince.fr@gmail.com> wrote:
> >
> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> > ---
> >  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > index 9aff59c..2f99417 100644
> > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > @@ -4,8 +4,8 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb174eaf7b55a34a7c89551197f=
66e94"
> >  DEPENDS =3D "zeromq"
> >
> > -SRCREV =3D "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
> > -PV =3D "4.2.3+git${SRCPV}"
> > +SRCREV =3D "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
> > +PV =3D "4.3.1+git${SRCPV}"
> >
> >  SRC_URI =3D "git://github.com/zeromq/cppzmq.git"
> >
> > @@ -13,6 +13,8 @@ S =3D "${WORKDIR}/git"
> >
> >  inherit cmake
> >
> > +EXTRA_OECMAKE =3D "-DCPPZMQ_BUILD_TESTS=3DOFF"
> > +
>
> explaining why tests are disabled would be helpful for future changes
> where someone might
> want to enable it and if its an optimization then turn it into
> packageconfig knob.
>
> >  PACKAGES =3D "${PN}-dev"
> >
> >  RDEPENDS_${PN}-dev =3D "zeromq-dev"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

