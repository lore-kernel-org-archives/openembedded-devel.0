Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UcI5H-0004XF-Gb
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 18:28:16 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz10so657051pad.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 09:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=j/0NaF6Z2/KRmPYn5YA03V/htOJkHPPXdA4sgPVs8F0=;
	b=MbcEM23/EMOICCVSJZZ7zPXp8ER/tJWyx0znzkyxSw0SLD+RkaoKuWpOOSEwj9yjaH
	jPhbJBNCBP7xU1a+v9E5k9Y2de1U88QlxE6E2JKi7Ljz+veKwLDRSJ2zH5bAQjlN1/x0
	JTTWFcJUvIfqiph9os5HylfEKfYD289Sofl0I71sZ7l87si7PVxFoBDB6wBQco3cHdUt
	68JNya2XPvo2jl1QwL1qlokfjWItZVxyYBP6b/pg5TMqXrtPzM3FxYBe+RpSDeYr8N6o
	HERrwT5Uqcu1ZOOThAbIxSzzdcMVmKnfiQgWBmp7nQFEJGRhJTOJYSZkEe3RjYoAZp2s
	rLCQ==
X-Received: by 10.66.233.97 with SMTP id tv1mr35343587pac.96.1368547803491;
	Tue, 14 May 2013 09:10:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	qb1sm18764766pbb.33.2013.05.14.09.10.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 14 May 2013 09:10:02 -0700 (PDT)
Date: Tue, 14 May 2013 18:10:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130514161001.GK3187@jama>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
	<1367966513-12566-7-git-send-email-schnitzeltony@googlemail.com>
	<518CCC61.5080504@opendreambox.org>
	<CALbNGRQZ-6XVzhCOZ7mX8_MF0Cqgzu4W49TmmWqxBCEKZ6ENHA@mail.gmail.com>
	<20130510172126.GG12329@jama.dyndns-home.com>
	<CALbNGRR9Sr6P9UPCVc=nJQ_DYSH8HOgqNf7JCbMg1p-1N0jO2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRR9Sr6P9UPCVc=nJQ_DYSH8HOgqNf7JCbMg1p-1N0jO2A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/meta-gnome 06/15] poppler: remove unrecognized configure options
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
X-List-Received-Date: Tue, 14 May 2013 16:28:17 -0000
X-Groupsio-MsgNum: 44712
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pz0BBB9QxoYXlT+x"
Content-Disposition: inline

--Pz0BBB9QxoYXlT+x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2013 at 12:35:49PM +0200, Andreas M=FCller wrote:
> On Fri, May 10, 2013 at 7:21 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, May 10, 2013 at 07:03:40PM +0200, Andreas M=FCller wrote:
> >> On Fri, May 10, 2013 at 12:30 PM, Andreas Oberritter
> >> <obi@opendreambox.org> wrote:
> >> > On 08.05.2013 00:41, Andreas M=FCller wrote:
> >> >> warning was:
> >> >>
> >> >> | configure: WARNING: unrecognized options: --disable-poppler-qt, -=
-disable-abiword-output
> >> >>
> >> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> >> ---
> >> >>  meta-oe/recipes-support/poppler/poppler.inc       |    1 -
> >> >>  meta-oe/recipes-support/poppler/poppler_0.18.4.bb |    2 --
> >> >>  2 files changed, 0 insertions(+), 3 deletions(-)
> >> >>
> >> >> diff --git a/meta-oe/recipes-support/poppler/poppler.inc b/meta-oe/=
recipes-support/poppler/poppler.inc
> >> >> index d0c0074..11286bc 100644
> >> >> --- a/meta-oe/recipes-support/poppler/poppler.inc
> >> >> +++ b/meta-oe/recipes-support/poppler/poppler.inc
> >> >> @@ -11,7 +11,6 @@ EXTRA_OECONF =3D "\
> >> >>      --enable-xpdf-headers \
> >> >>      --disable-gtk-test \
> >> >>      --disable-poppler-qt \
> >> >> -    --disable-poppler-qt4 \
> >> >>      --enable-zlib \
> >> >>  "
> >> >
> >> > This hunk doesn't match the cited warning.
> >> >
> >> > Regards,
> >> > Andreas
> >> Oops - will send a correcting patch.
> >
> > I've also noticed that newer poppler fails to build on some
> > architectures (I know, too late, it was building fine on qemu* on
> > jenkins, but om-gta02 - armv4t fails with:
> >
> > | Splash.cc: In member function 'void Splash::drawAALine(SplashPipe*, i=
nt, int, int)':
> > | Splash.cc:1497:19: error: conversion from 'SplashCoord {aka FixedPoin=
t}' to 'Guchar {aka unsigned char}' is ambiguous
> > |        pipe->shape =3D aaGamma[t];
> > |                    ^
> > | Splash.cc:1497:30: note: candidates are:
> > |        pipe->shape =3D aaGamma[t];
> > |                               ^
> > | In file included from SplashMath.h:27:0,
> > |                  from Splash.cc:44:
> > | ../goo/FixedPoint.h:45:3: note: FixedPoint::operator int()
> > |    operator int()
> > |    ^
> > | ../goo/FixedPoint.h:43:3: note: FixedPoint::operator double()
> > |    operator double()
> > |    ^
> > | ../goo/FixedPoint.h:41:3: note: FixedPoint::operator float()
> > |    operator float()
> > |    ^
> >
> > --
> Can you send me log.do_configure for this?

Sorry for late reply, but your patch "poppler: fix build for soft FPU
machines" fixed that already, thanks!

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pz0BBB9QxoYXlT+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGSYdkACgkQN1Ujt2V2gBy7+ACfUuwH/UXVtwtKM+pZY9ekh2ah
B5UAnRJmdzfeyMz6dFT9SHMc+0egngXj
=zfDc
-----END PGP SIGNATURE-----

--Pz0BBB9QxoYXlT+x--
