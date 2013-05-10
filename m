Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UarIC-0000cB-C8
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 19:39:40 +0200
Received: by mail-pd0-f176.google.com with SMTP id x10so2931579pdj.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 10:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=d+KjdeiNWLCAa61GU8C9XppWtPvB4gYR8PX/VM1eWCk=;
	b=VoXhTuzzNNt0ON8ggjLA8aIBhQdXBfQVnR8YWb41+2yuG9DlzGBZQmxPlThuIxqoa1
	WaJ7Hv3NWoAg4KpULQS9So1T+bRszvCO2mA+irFpnAqKR62Ra4AzizzHRU7MkVUcpEkG
	WQG7El8RV1geIx9fJOpcnYeDJ7ZtIeNPBd9iz0zkXSnCCp3hr4CKH/DsRvKGV0cWa/n7
	nmgshKWAL2omQCt+mggAqufO9VovC/DjnYJi4CR6LCu0aFdmJrqJg1XHWZNgPx5kVcXi
	i+YYDcqgeGGr9It80cVXJMK/M9iLvLNoLyNfYSRahd0pkvOXQQuGcnyXCW2kjV9RjSeU
	/QIw==
X-Received: by 10.68.212.168 with SMTP id nl8mr18175399pbc.43.1368206493981;
	Fri, 10 May 2013 10:21:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	at1sm2170960pbc.10.2013.05.10.10.21.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 10:21:32 -0700 (PDT)
Date: Fri, 10 May 2013 19:21:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130510172126.GG12329@jama.dyndns-home.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
	<1367966513-12566-7-git-send-email-schnitzeltony@googlemail.com>
	<518CCC61.5080504@opendreambox.org>
	<CALbNGRQZ-6XVzhCOZ7mX8_MF0Cqgzu4W49TmmWqxBCEKZ6ENHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQZ-6XVzhCOZ7mX8_MF0Cqgzu4W49TmmWqxBCEKZ6ENHA@mail.gmail.com>
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
X-List-Received-Date: Fri, 10 May 2013 17:39:40 -0000
X-Groupsio-MsgNum: 44658
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yZnyZsPjQYjG7xG7"
Content-Disposition: inline

--yZnyZsPjQYjG7xG7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2013 at 07:03:40PM +0200, Andreas M=FCller wrote:
> On Fri, May 10, 2013 at 12:30 PM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
> > On 08.05.2013 00:41, Andreas M=FCller wrote:
> >> warning was:
> >>
> >> | configure: WARNING: unrecognized options: --disable-poppler-qt, --di=
sable-abiword-output
> >>
> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> ---
> >>  meta-oe/recipes-support/poppler/poppler.inc       |    1 -
> >>  meta-oe/recipes-support/poppler/poppler_0.18.4.bb |    2 --
> >>  2 files changed, 0 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-support/poppler/poppler.inc b/meta-oe/rec=
ipes-support/poppler/poppler.inc
> >> index d0c0074..11286bc 100644
> >> --- a/meta-oe/recipes-support/poppler/poppler.inc
> >> +++ b/meta-oe/recipes-support/poppler/poppler.inc
> >> @@ -11,7 +11,6 @@ EXTRA_OECONF =3D "\
> >>      --enable-xpdf-headers \
> >>      --disable-gtk-test \
> >>      --disable-poppler-qt \
> >> -    --disable-poppler-qt4 \
> >>      --enable-zlib \
> >>  "
> >
> > This hunk doesn't match the cited warning.
> >
> > Regards,
> > Andreas
> Oops - will send a correcting patch.

I've also noticed that newer poppler fails to build on some
architectures (I know, too late, it was building fine on qemu* on
jenkins, but om-gta02 - armv4t fails with:

| Splash.cc: In member function 'void Splash::drawAALine(SplashPipe*, int, =
int, int)':
| Splash.cc:1497:19: error: conversion from 'SplashCoord {aka FixedPoint}' =
to 'Guchar {aka unsigned char}' is ambiguous
|        pipe->shape =3D aaGamma[t];
|                    ^
| Splash.cc:1497:30: note: candidates are:
|        pipe->shape =3D aaGamma[t];
|                               ^
| In file included from SplashMath.h:27:0,
|                  from Splash.cc:44:
| ../goo/FixedPoint.h:45:3: note: FixedPoint::operator int()
|    operator int()
|    ^
| ../goo/FixedPoint.h:43:3: note: FixedPoint::operator double()
|    operator double()
|    ^
| ../goo/FixedPoint.h:41:3: note: FixedPoint::operator float()
|    operator float()
|    ^

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yZnyZsPjQYjG7xG7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGNLJYACgkQN1Ujt2V2gBx74gCgsy31E3dQFBK/ycHBWX3swa9D
958AnA3VihpQGmKSrPmkJlIThUPQpRoi
=I3uZ
-----END PGP SIGNATURE-----

--yZnyZsPjQYjG7xG7--
