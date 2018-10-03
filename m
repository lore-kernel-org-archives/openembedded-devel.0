Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id DE70874A13
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 20:56:45 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id c20-v6so6998072otl.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 13:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Iv0qva2vHwMRhZl7C5oa46HVHEJAUq5pgqEK7AZBxuM=;
	b=s+MhKMH5aw8/0TVcIO81EFNPPJM7CH91hqzqHEWnKuGcj+hvt7gGotzsIOkbYCuSI+
	/2WeQp/ZcZjne8EpBHCG9FavzgZJcsPWs9ktop9WUvPshOj2KbWFBqXJMCbStonekOoc
	ubAnYc/bkBj86xVl7/ztGkYqsqQ1Es6FbR4gxzxYBVjLDgI2S+6huXoegHkoRezTvldR
	zY7cQPCXu2JNTfnaNwaJTrECdE9hpg752V8gg00+sOxvrZHBQd1eyoOtbZUzQYy5X1oI
	AL07SYvVE4DOHXBXi0yZ7f0J9vmR78k6dWxk6O4bKIGpg5uSQ3m09btPS2aMRtzKbFVE
	sIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Iv0qva2vHwMRhZl7C5oa46HVHEJAUq5pgqEK7AZBxuM=;
	b=CoqzUerRyhG6F2w2gO89+8POfLWLLQJghzjPFltjGbv+AjUbzVWOG2po8ctBHOBo81
	xFzBXD3mX5us7T63t0lJ48/wnZ0JG7i9sHsl+hs46tbO4tNa7zNqZUYRi8lcgPzhZclh
	aoTtRQ4Qvrs4/X8pHLLqh5WXvY2hBvuJdqHEJEXKqetBNT2VTQ8mSy67UiwcpXLTEqdO
	VCxNd9/daL0Rw9uj91MggJa3+9suAbd0OszLDd5WmuOtL50iLU8F3miTfnDJfBw+Mhhk
	FLyLRh3/m1aBDwKMhzOxjsy0GjqLSuR91dNiHNl8hJ1pl5mcyO3l9wEa2XiT6lnlq1NL
	GyoA==
X-Gm-Message-State: ABuFfohA6qtSPVtbQkIiH2jGrwJ6g/302STQ95Ab/yQsbIz+VLuxyYz8
	5hfUquWPKJrA6icYFdKnxeMrhRW38GeEGaL3lqM=
X-Google-Smtp-Source: ACcGV62HCppB1ybwn+NXglyNPEGIc4NrD95QvzSbD7FEeD41CaaR0V1/1oqTDxdjZG0IfDMyOS1lQnyl1Jh1UBSrO6o=
X-Received: by 2002:a9d:3b85:: with SMTP id k5-v6mr2056344otc.3.1538600206663; 
	Wed, 03 Oct 2018 13:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
	<CAMKF1sotCFH3POn6S11GOdkuH2A886iKN=PGdPA_81c59TzwhA@mail.gmail.com>
In-Reply-To: <CAMKF1sotCFH3POn6S11GOdkuH2A886iKN=PGdPA_81c59TzwhA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 3 Oct 2018 22:56:33 +0200
Message-ID: <CALbNGRR0v4Nm1O7J2RQC0-MqRVLZNpDHn1jDYVRedpttr3AY9w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] libsdl-gfx: initial add 2.0.25
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
X-List-Received-Date: Wed, 03 Oct 2018 20:56:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 3, 2018 at 10:32 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Oct 3, 2018 at 12:25 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > Recipes like this live in in meta-games and meta-game-emulators. Once a=
pplied
> > here, pull requests will go out.
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb | 20 ++++++++++++=
++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.b=
b
> >
> > diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
> > new file mode 100644
> > index 000000000..c9910cb1b
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "SDL graphics drawing primitives and other support functio=
ns"
> > +SECTION =3D "libs"
> > +LICENSE =3D "Zlib"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d1de21f0b70830e299905eac34=
19084"
> > +
> > +DEPENDS =3D "virtual/libsdl"
> > +
> > +SRC_URI =3D "http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-${PV=
}.tar.gz"
> > +SRC_URI[md5sum] =3D "ea24ed4b82ff1304809c363494fa8e16"
> > +SRC_URI[sha256sum] =3D "556eedc06b6cf29eb495b6d27f2dcc51bf909ad82389ba=
2fa7bdc4dec89059c0"
> > +
> > +S =3D "${WORKDIR}/SDL_gfx-${PV}"
> > +
> > +inherit autotools pkgconfig
> > +
> > +EXTRA_OECONF +=3D " \
> > +    SDL_CONFIG=3D${STAGING_BINDIR_CROSS}/pkg-config sdl \
>
> is the intention to have SDL_CONFIG point to pkg-config here
>
I was under the impression it replaces sdl-config (sdl-config supports
for basic stuff as cflags and libs same arguments as pkg-config). Now
that you ask I checked and grepping did not show my why I should set
it (it is mentioned in the doc but...).
So I tested and it builds fine without setting SDL_CONFIG. So V2 is
near - thanks for the pointer.

Andreas

