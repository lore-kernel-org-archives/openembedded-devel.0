Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SxN14-0004wO-EV
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 20:54:30 +0200
Received: by wibhq4 with SMTP id hq4so5680976wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 11:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=508AVolLclOzTyV1YMnO1eO0pWGJAbcRSudAa3WHXKc=;
	b=X3d+55eLHpp4SCww6lfYaPM3f6EIKkb/l9Dwv/dreh/YhGVmxhjdZo3d/+Q5HP/kid
	m4MOKH9GTdn0F9iWPNHKZtN5Q5/10Gne6rGABZodL6p6tZLAGGo4/dY9ihkSMZ09xzy1
	Wu1M31HchS40WGEbzsd5RZRv94b7dXreJwW0e9priVM54joCm9kmv8VarFAyEKuMnBjZ
	LbBcfNKzVx3KEs8fmaSsrEkwTzr8yVDwoScNr3ekdoXDhCxlbRaL+zr/6IL5qZwNEdjC
	aYANK0KVrYK0m6OXD+XY+JpZnO/xeuCfqZbcGdIxPT++B6OdpAhsv7UMFHRfrfUkweKv
	nrGw==
Received: by 10.180.74.33 with SMTP id q1mr15392336wiv.4.1344019369313;
	Fri, 03 Aug 2012 11:42:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm41035157wiv.11.2012.08.03.11.42.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 11:42:48 -0700 (PDT)
Date: Fri, 3 Aug 2012 20:42:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120803184247.GD30148@jama.jama.net>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<jvbgus$ove$1@dough.gmane.org>
	<BCFACC99-6EAF-4C57-B8E2-18DA0E62BAB3@gmail.com>
	<671950423.c3foblMkXu@helios>
	<6602C8C9-45EA-47B9-B446-C96264B142B7@gmail.com>
	<jvggnd$naj$1@dough.gmane.org>
	<CAMKF1sqqyahA8QXH2eOo0SPM-vRtygE1iiyOWMLanV=mGxLfNg@mail.gmail.com>
	<jvgr60$ig7$1@dough.gmane.org>
	<E805BE26-25B7-4EC5-80C6-4200151E1DC5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <E805BE26-25B7-4EC5-80C6-4200151E1DC5@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH V2 1/7] systemd: Upgrade to 187
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
X-List-Received-Date: Fri, 03 Aug 2012 18:54:30 -0000
X-Groupsio-MsgNum: 40021
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Content-Disposition: inline

--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 03, 2012 at 11:39:43AM -0700, Khem Raj wrote:
>=20
> On Aug 3, 2012, at 8:36 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> . However, my original motivation is to make this layer independent=20
> >> enough and remove the layer dependencies it has It will make both laye=
rs
> >> thrive IMO. I proposed removal of using gitpkgv you did not like that,
> >> then I proposed this to remove use of SRCREV completely this also is
> >> objected on. may I ask what other option do you have ? I am willing to=
=20
> >> make a solution. Ultimately this will make systemd integration into
> >> OE-Core as reference init system easier.
> >=20
> > Move gitpkgv into oe-core
>=20
>=20
> will it even be necessary with autopr ?

Yes as PR is applied after SRCPV

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAcG6cACgkQN1Ujt2V2gBwlsQCfQy0F3DCvZZ9s4dMzT1bQKlC7
A8IAnioN64io88nB2ZUZP7Ru6r1zKgiy
=574B
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--
