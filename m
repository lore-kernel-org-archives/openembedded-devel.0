Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 902D06C73F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:43:27 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so1572325eaj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 02:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VZ/muoRh4OtaTURKSLhCclr4X1tgCK33ZqjidwZOT0E=;
	b=fcJiKBku7MqkpkHC4ydB91uwxP0sKR0TzVOwsSMlJD+Uz3CiI0kPcELqHMtsRfJS5G
	Yky9i1iHbI1AkRB87bv5+j8gxwTeGFwikXUA9KjTmxGu7AXy/QtyJrkkTZIZDaOxR6Ss
	p27XOgGYa/nAr8Yp/fl7xjqEFa+gTV5iJan39Axc9ZeFAu+12QUD2IVNzd9N34hjA3u0
	wxyxs4yUVCPUmgp6Cso/OM1QX8CMdrYJ4IDvMSCAJZP/liu7LNcXUCVMFzAjYf+Pls9y
	zf5Q7PjBJ3o4tYNAUr0YxQd+8Uu1vdePrNoJhJSAAYjba0cZTKd9TIXyEUdvGwWIMz/X
	bKGg==
X-Received: by 10.14.93.133 with SMTP id l5mr123601eef.125.1384944209052;
	Wed, 20 Nov 2013 02:43:29 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x4sm58252300eef.1.2013.11.20.02.43.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 02:43:28 -0800 (PST)
Date: Wed, 20 Nov 2013 11:43:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131120104331.GK3708@jama>
References: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
	<1384813274-7231-6-git-send-email-Martin.Jansa@gmail.com>
	<1404521.4vplx1e1VT@helios>
MIME-Version: 1.0
In-Reply-To: <1404521.4vplx1e1VT@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 6/6] usb-modeswitch-data: Drop allarch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Nov 2013 10:43:28 -0000
X-Groupsio-MsgNum: 47202
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="08ATZu8fEq0x2T3M"
Content-Disposition: inline

--08ATZu8fEq0x2T3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 10:29:46AM +0000, Paul Eggleton wrote:
> Hi Martin,
>=20
> On Monday 18 November 2013 23:21:14 Martin Jansa wrote:
> > * has runtime dependency on TUNE_PKGARCH usb-modeswitch
> >   Hash for dependent task usb-modeswitch_1.2.5.bb.do_packagedata changed
> > from 5709ee415d286847b58e7b438b5b9f75 to fbef5eee3bb2bacb805a0bead2095b=
52
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb=
 | 2
> > -- 1 file changed, 2 deletions(-)
> >=20
> > diff --git
> > a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
> > b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
> > index fc0fbfb..8b71618 100644
> > --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_201308=
07.bb
> > +++
> > b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.b=
b @@
> > -2,8 +2,6 @@ DESCRIPTION =3D "Data files for usbmodeswitch"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> >=20
> > -inherit allarch
> > -
> >  SRC_URI =3D
> > "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-${PV}.ta=
r.bz
> > 2" SRC_URI[md5sum] =3D "91feff51deba6e48e78506b8f4db2274"
> >  SRC_URI[sha256sum] =3D
> > "a3114e2c1f38eed3ad0067df30e53a96313908a9539a8ea5d94a4d35651699eb"
>=20
> To be honest I view these in the same way as the corresponding OE-Core pa=
tches=20
> - if the contents of the output package or its metadata does not change=
=20
> dependent on the other package, then we should use other means to fix thi=
s=20
> issue rather than the huge hammer of removing allarch.

OK, I'll send patch for layer.conf, but the point is that incorrectly
using allarch is worse than not using it at all.

Most allarch recipes are very quick to build and their signatures stay
valid for long time even after they are changed to TUNE_PKGARCH, but with
issue like this and allarch they are rebuilt after each MACHINE switch.

So on concrete example of SHR distribution with 3 supported
TUNE_PKGARCHs in binary feed, it's faster to build=20
3x TUNE_PKGARCH usb-modeswitch-data and keep the same .ipk for some time
than build it 3 times as allarch every single day in daily build which
populates binary feed.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--08ATZu8fEq0x2T3M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKMklMACgkQN1Ujt2V2gBzpFwCfXoObjSXu0H32nWZAbTOFgbVF
YIMAn1Hp6lUHtVHvzugA7Q0kzqTsi3NH
=SzNB
-----END PGP SIGNATURE-----

--08ATZu8fEq0x2T3M--
