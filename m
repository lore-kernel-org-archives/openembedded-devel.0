Received: from mail-wg0-f51.google.com ([74.125.82.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2ftg-0008VK-9g
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 11:37:13 +0100
Received: by mail-wg0-f51.google.com with SMTP id 8so5578911wgl.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qmflBMEp5xzFXKTLrAnBzGapnbw9Q/ZwBveu5tJwsno=;
	b=U8b938022ha8JAnIzcnlLPuefz09EoRfd2PN6VxhNHZCNQncybJCuaYzcVN8UJZ9wG
	024lpUJjlmwi0izIjYpnQ2IJ+QMTXFhqTyxug9L2PflwF4y818ApEbB9wdsHa75bc6a2
	1fxJkogL1V9itH2O8R5qY4cwic2ZP8NY6BEMYdlVDz9sFJgntEVo5gu1X0UQ6oT/cU/+
	qquOgf70Htnj/daIso3M4afz+HCbEV2hwooWB79rIy+MB5duu5Oxnw6OxHX46OyzZuoC
	GOocRsf3T1fBuoOBMS3c8of+HL2gbvuExPdwavbPnMPWX889JP38uYz0gsxBQBuS91sU
	rt4w==
X-Received: by 10.180.85.97 with SMTP id g1mr16103804wiz.29.1360059675135;
	Tue, 05 Feb 2013 02:21:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o13sm194796wie.10.2013.02.05.02.21.14
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 02:21:14 -0800 (PST)
Date: Tue, 5 Feb 2013 11:21:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205102114.GK3271@jama>
References: <CAFeBWL4CDCgUaY_2yuMdMmYFR64WdWSyxA9BN6PKHFWOM=U+DA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL4CDCgUaY_2yuMdMmYFR64WdWSyxA9BN6PKHFWOM=U+DA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: ImageMagick recipe oudated - fetch failure
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
X-List-Received-Date: Tue, 05 Feb 2013 10:37:15 -0000
X-Groupsio-MsgNum: 42997
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2xzXx3ruJf7hsAzo"
Content-Disposition: inline

--2xzXx3ruJf7hsAzo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2013 at 03:08:30PM -0800, Adam Lee wrote:
> Hi there,
>=20
> I am getting no such file error when building Image Magick.
> The recipe points to
> ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-6.7.5-6.tar.bz2, but it
> looks like the ftp server has updated file (ImageMagick-6.8.2-1.tar.bz2)
> instead.
>=20
> Please update the recipe :)

Patches welcome

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2xzXx3ruJf7hsAzo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAlEQ3RoACgkQN1Ujt2V2gBwQjgCdElV5sHfTgbCdTyp4Q1m5xWOy
AtEAl1ssKiMLCN0Rm+rTEAyRTNoTzoY=
=Aywh
-----END PGP SIGNATURE-----

--2xzXx3ruJf7hsAzo--
