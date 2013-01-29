Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0B8x-0002WS-8q
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 14:22:43 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so271568pbc.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 05:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VUGkW3+v891xfPRpCzK8KwjX2WymWdQlfCFHFqzpZ2Q=;
	b=EAXZNGpqxEfj0Fzb5Yfw+WBPcEY7u9qLO8itk+5BXodXAqjoz5Ijk3teNpCm8wHtqw
	pBZL1TZ/c3ZNzoEQGynQ2G0PtSpFi4jKGEZOWCjEuByfQ1UZEcoCPqtpFSD9LkZKsyBa
	4SQ2ZCKCs5O7u0PehCSQsKHXPU4vI6TerjaZhhjvImnR1mdEu7aAv4ZyZg3/MlX39Idp
	KkiNhDFFMAxpwnb2UKJytcBku37IpDThrDMxPKQEL2p1jnKLm+y014wIFJzvBpmNdztt
	g0+fp6LOCkThYYx3e51LuyV1Xz+v+3//B9qZKnp/oyoCOpt88CvXuRGQWxuGhpKBLipP
	Stdg==
X-Received: by 10.68.241.103 with SMTP id wh7mr2088224pbc.153.1359464810845;
	Tue, 29 Jan 2013 05:06:50 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x2sm8911627paw.8.2013.01.29.05.06.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 05:06:49 -0800 (PST)
Date: Tue, 29 Jan 2013 14:06:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130129130650.GN16904@jama.palm1.palmone.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
	<c693696c02e012de92fd19dddeee0d85ab0e687e.1359462547.git.Martin.Jansa@gmail.com>
	<ke8h9h$gak$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ke8h9h$gak$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/5] move broken recipes to nonworking directories
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
X-List-Received-Date: Tue, 29 Jan 2013 13:22:46 -0000
X-Groupsio-MsgNum: 42907
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aWauiwyUFlp3+edf"
Content-Disposition: inline

--aWauiwyUFlp3+edf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 02:02:47PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 29-01-13 13:29, Martin Jansa schreef:
> > * this set does not build with distroless qemuarm as reported in 'State
> > of bitbake world' thread, nobody volunteered to fix them
>=20
> Let me have a look at fbida and the cloud9 stuff before moving them.

Sure, thanks!

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFRB8h3MkyGM64RGpERApC6AJ9rOSpV/4CVlUD5zgykmd8pcZsdtwCeOmYl
> fOvd7+XtTG+kZHl7XI5Vwzc=3D
> =3DFSkc
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aWauiwyUFlp3+edf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEHyWoACgkQN1Ujt2V2gByCQwCfX1tCHCIab9Z337S75hYTzdXH
z7EAoLH0BJhXeA3sWf5w6jFHQKXEcdrx
=O1mE
-----END PGP SIGNATURE-----

--aWauiwyUFlp3+edf--
