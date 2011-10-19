Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGcel-0005Q5-C3
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 22:22:31 +0200
Received: by bkat8 with SMTP id t8so2812859bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7p7FAiN7kFuRwwOBvU1UnZ9vXy05+2okM40jl18ibNM=;
	b=upk8md3loYEvc9LUpXJhZX1AABpKiDcI2Dq59HqxUHWP088gy6fESjMjjatWDafcpZ
	1yiZKT6wiwYyzzVSODE5hPit8RqCfkY4yBNdtBLGJ1XEcvXj5ICrqmgx1avCo5Nz0kK5
	ivMNFCglC9dYgxqUJCQ9fUT4H2MW4zyOHdANA=
Received: by 10.204.129.193 with SMTP id p1mr5931678bks.19.1319055399937;
	Wed, 19 Oct 2011 13:16:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u18sm7263435bkn.6.2011.10.19.13.16.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 13:16:38 -0700 (PDT)
Date: Wed, 19 Oct 2011 22:16:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111019201633.GD3522@jama.jama.net>
References: <CAMKF1soq10mOoBn_L4VJTAygNn0=hRef5a2Ln-gdS1FFQXQcUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soq10mOoBn_L4VJTAygNn0=hRef5a2Ln-gdS1FFQXQcUA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: OE bugzilla to be decommissioned
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
X-List-Received-Date: Wed, 19 Oct 2011 20:22:31 -0000
X-Groupsio-MsgNum: 34907
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GpGaEY17fSl8rd50"
Content-Disposition: inline

--GpGaEY17fSl8rd50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2011 at 11:34:53AM -0700, Khem Raj wrote:
> Hi
>=20
> For many months OE bugzilla is available as read only instance, Now
> that OE web services have moved to a new server
> I would like to ask if we can decommission it completely. Since
> bringing it over to new server is some work and if there is
> no value in doing that it should be avoided.
> Opinons?

Please put static html (or redirect to sane wiki page) with information=20
about where to report bugs and send patches, so when someone finds old
link to bugzilla somewhere that he will know that it's gone.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GpGaEY17fSl8rd50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6fMCAACgkQN1Ujt2V2gBzKjgCfQk/2Im4TH8V94+/I0fcovueN
MGwAniIrE7ITZ2Be3vKwneifgRM9O69N
=vpwH
-----END PGP SIGNATURE-----

--GpGaEY17fSl8rd50--
