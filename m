Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjIJK-0000Bc-6M
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 00:35:26 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so999552dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 15:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dFabm/1x189dk96PabvAmtR/gkWhMT+3HfmFWDuKpvw=;
	b=JKcWl2JF9y1SWSPrHcV2XnET5Jntz9x0IR48Zk/tBG1EnwbY4lVw+8tov81qvHsIRH
	J6jvzas3hyVqNPW+BBPXNHPLSPh0AnE69wMSC0qrf9cvLvIz0Eplud/EmmCeXQPeTpti
	GBfDhqEcXM8Mtg3ZWN2is01SccepgFH9JwtAwUVN5H5aHLv0m9imFQv9L8ssVfaFYUAj
	hyFl5ZajbJEM/41PGLA3JoMzdASAKX68oGvYQpPftc25KawuHxFLWEB2mpNgAhKdZBXx
	hJ3smzW1gJeE6fcw0FL/SeNqSWcHzrGxFmHkizy7IQQKR9k25ZG5xo7MJs7W0yhYOGdi
	aniA==
Received: by 10.66.78.67 with SMTP id z3mr10562186paw.33.1355440849881;
	Thu, 13 Dec 2012 15:20:49 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u1sm2006364pav.16.2012.12.13.15.20.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 15:20:46 -0800 (PST)
Date: Fri, 14 Dec 2012 00:20:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121213232058.GA5567@jama.jama.net>
References: <3145293.jEgb7vZ7zI@helios>
MIME-Version: 1.0
In-Reply-To: <3145293.jEgb7vZ7zI@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: OE-Classic patches in patchwork
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
X-List-Received-Date: Thu, 13 Dec 2012 23:35:26 -0000
X-Groupsio-MsgNum: 42155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2012 at 06:11:22PM +0000, Paul Eggleton wrote:
> Hi all,
>=20
> There is a significant volume of patches in the OE patchwork [1] that are=
=20
> intended to apply to OE-Classic. Apart from the 2011.3-maintenance branch=
, OE-
> Classic is no longer maintained in favour of OE-Core + layers, so the que=
stion=20
> is what should we do with these patches? At the moment I'm thinking we sh=
ould=20
> just mark them as "archived" so that they disappear from the queue; peopl=
e can=20
> still get access to them if needed.
>=20
> Thoughts?

There is also 70 patches from chase maupin just updating LICENSE to
contain also version.

I'm not using oe-classic anymore, but I believe he prepared them
carefully and it's worth merging.

I'll create bundle from it and apply it tomorrow if nobody objects.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDKYtoACgkQN1Ujt2V2gBx0FACdES9pjUrR6w/Hn/XPJQnJ6wh6
pF0AoKxnw64qyXNkPsKuGcGS0ut1/3uH
=4nCh
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
