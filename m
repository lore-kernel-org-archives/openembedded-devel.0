Received: from relay02.stack.nl
	([131.155.140.104] helo=mx1.stack.nl ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ruud@il.fontys.nl>) id 1NgKTS-0003Oa-3m
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 17:04:05 +0100
Received: by mx1.stack.nl (Postfix, from userid 65534)
	id BA7E235A85F; Sat, 13 Feb 2010 17:01:26 +0100 (CET)
Received: from mail.il.fontys.nl (mail.il.fontys.nl
	[IPv6:2001:4128:1000:1000::7])
	(using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mailhost.stack.nl (Postfix) with ESMTPS id A52EA35A840
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 17:01:24 +0100 (CET)
Received: by mail.il.fontys.nl (Postfix, from userid 1004)
	id 4CD9711526; Sat, 13 Feb 2010 17:01:24 +0100 (CET)
Received: from charm.il.fontys.nl (charm.il.fontys.nl
	[IPv6:2001:4128:1000:1000::34])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.il.fontys.nl (Postfix) with ESMTPS id 6A96611505
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 17:01:22 +0100 (CET)
Received: by charm.il.fontys.nl (Postfix, from userid 1838)
	id 2E808412B; Sat, 13 Feb 2010 17:01:22 +0100 (CET)
Date: Sat, 13 Feb 2010 17:01:22 +0100
From: Ruud Althuizen <ruud@il.fontys.nl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100213160121.GK1638@il.fontys.nl>
References: <20100203104829.GL17820@il.fontys.nl>
	<1265195232.5591.75.camel@mattotaupa>
	<20100203111649.GN17820@il.fontys.nl>
	<20100210072033.GF1638@il.fontys.nl>
	<ac9c93b11002092333s3a90d623xd6234e392d84925d@mail.gmail.com>
	<20100212085414.GG1638@il.fontys.nl>
	<ac9c93b11002121033s6b25910fj87fbe29373cf6870@mail.gmail.com>
	<20100212194114.GH1638@il.fontys.nl>
	<ac9c93b11002121346l6cf2b82s59b71ebaa8849123@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11002121346l6cf2b82s59b71ebaa8849123@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 131.155.140.104
X-SA-Exim-Mail-From: ruud@il.fontys.nl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New machine: Embedded Artists LPC3250
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
X-List-Received-Date: Sat, 13 Feb 2010 16:04:05 -0000
X-Groupsio-MsgNum: 16755
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cN519qCC4CN1mUcX"
Content-Disposition: inline

--cN519qCC4CN1mUcX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 12 Feb 2010 10:46 PM, Frans Meulenbroeks wrote:
> 2010/2/12 Ruud Althuizen <ruud@il.fontys.nl>:
> > On Fri 12 Feb 2010 07:33 PM, Frans Meulenbroeks wrote:
> >> Ruud, can you resend your patch.
> >> I wanted to apply it, but you've submitted two patches and the text in
> >> the first one reads:
> >>
> >> This is a kernel recipe for the LPC32XX (LPC3250) based Embedded Artis=
ts
> >> development board. It uses public patches provided by NXP and Embedded
> >> Artists. The other two patches provide drivers for the PWM capabilities
> >> and fix one NXP patch.
> >>
> >> (and there are 4 files in the patch).
> >> In order not to make an error I wanted to verify what exactly need to
> >> be patched.
> > 0001-linux-ea3250-New-recipe.patch:
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel recipe, defconfig and 2 extra patches=
 (included in git-patch)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0to fix update5 and make it possible to use t=
he PWM pins.
> >
> > 0002-ea3250.conf-New-machine-config.patch:
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0Machine config (depends on kernel) and updat=
ed checksums.ini
>=20
> Patch applied.
>=20
> Ruud, thanks for the patch.
> Please verify that everything is ok in the archive.
Looks oke, thanks :).

--=20
Kind regards,
Ruud Althuizen

--cN519qCC4CN1mUcX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (FreeBSD)

iEYEARECAAYFAkt2zNAACgkQkqncCMFskRVj4ACfTQN5+oZRlY7L6g5LAtMh0R0N
eK4Anj8StgFS/LHDfeiIbF82jNg82B0h
=sQ/d
-----END PGP SIGNATURE-----

--cN519qCC4CN1mUcX--
