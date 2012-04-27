Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNg1X-0007Ed-PT
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 09:55:27 +0200
Received: by wgbdr1 with SMTP id dr1so321159wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 00:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=awLTcEYuBgu9UbycNWYAzkrwNKSyodRcMCTivN/8Rus=;
	b=zqs+j6eysMy4RlVnw50T8l6gjBixJ3xZwg6J+Av3poMhid1T2lMx4Lhx1ENBU7IJke
	VvPQJE92mINSTTHIe25GrEOifSQYEPzZR+PiUqYkp/PjpYdERIAgac67ycn8cXs4ycy4
	wbSs7wjpj/EKnKxKvNjCntO2+Ww5r7B2xP0vzUq5o8W0GeSfrn+vmJTSvmIz+iLjCVKi
	bTMJTq9WQJlASK2EPCTT/w99S3USbcaaXTcBNORD1JiOeQwR1FKc1iXdEHRcJ0OuvvAP
	URw7uGVtbvoIrzfLvLclBs5UoJximC5sBW0qiFkWU4o8fxvXm64Fesd2QWv/ktQiHxf6
	WpHg==
Received: by 10.216.218.193 with SMTP id k43mr6085018wep.104.1335512749759;
	Fri, 27 Apr 2012 00:45:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id du4sm4730322wib.10.2012.04.27.00.45.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 00:45:47 -0700 (PDT)
Date: Fri, 27 Apr 2012 09:45:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120427074550.GB3635@jama.jama.net>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
	<56a34a9e60b825908e84e340b3fb06f6842aa82f.1335444528.git.Martin.Jansa@gmail.com>
	<jndi4g$6vv$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jndi4g$6vv$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [[meta-oe][meta-efl] 01/15] kernel.bbclass: resync with oe-core version
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
X-List-Received-Date: Fri, 27 Apr 2012 07:55:27 -0000
X-Groupsio-MsgNum: 38425
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline

--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 27, 2012 at 09:33:37AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 26-04-12 14:50, Martin Jansa schreef:
> > * 4 spaces for anonymous python * don't recreate uImage if it already
> > exists
>=20
> Crap. I'll send a follow up patch that *does* recreate uImage. That is the
> whole point of that code, to clean up after the kernel.

Can you send it to oe-core people too?

Or make it configurable as suggested here?
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020243.ht=
ml

Cheers,

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iQIcBAEBAgAGBQJPmkvNAAoJEHZqAkdh1vT6+KwQAIeJ98cGO0l/nwc3JduPX65x
> q2nw/f6mpfGUa0LRFcelCD1/GD7TCrSRKXykvu9iqLR/EE0b9JIdFPFtQvpM4vCg
> 0BfvJEkA6b6OTVCKyGgE1xVYuurqypXMaaij0aghptVZl5yCUYY3UIAIT9HX46zW
> dNYMwjb6Qed8rzMEM/r0cJrM1erRWh6SfdbSJ/D952ZLWg8XH5sZCcLekY9eLAfX
> 3Itub9oj3ENfvz/APItTNwotGIpFvaVcG8qIeX33sk+V+N9HdCpfBuaXJ4sJwR2X
> YnfchX+d2pyPbF9xJBiL9pEl8jVimbLQiKAIRBTdW6Wq2EQsFkRTbkqpPKDTDV8K
> timcdV7q3RFjj3OF7YA2WB+4oh9PPeOP2HgELdhMtG8Hje9ma1HPFu7lmWybYt/V
> yyqJEFwsjQ3bmAWTzQCPM0BkRhV1Swb1YsGRuQIs72CyVlRjZ+5iL2EMZOWCh97C
> 4jJIRDhs+CfG9HxHTApUe3haPlvpKM/40QDyRA2eeLUaV8PDvCO6UhPqIl76+hI9
> RimwseKgjbJCsN1Flw/ct6OcS8v8zFHa+7F4yEto5OfIipbLIwx/NGrf/bfGXDZK
> 3bYr2aQUtzmBrRDUTnSYri7tUjMmJ72JkMZ23dJgY1hVZSk0xtq5ZA4c29grbc9d
> jlCpEup+Oi20B6dCiXDC
> =3D0Qgb
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+aTq4ACgkQN1Ujt2V2gBxhoACgkwJ4U0nUS/rIqzxJF5h0JrSc
cS0AnR3xtvGrIyeBHyrq5mXw9r+HVBHO
=sscT
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
