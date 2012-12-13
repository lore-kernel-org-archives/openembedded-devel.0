Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tj3jo-0005pC-10
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 09:01:48 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so541729eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 23:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=99TJC7F2WOxEWP/sLHeMWgSZg25gQ2c6wx+YdomCDu8=;
	b=KJDLdJ4trZZ7bwdzIdIHJfjiOgAfEm5tKTyKfpGQ4LpjBYVRjVJ4V2/Pbp4QCZoQPY
	02aUo2hHVONaYiqFbCuVrnZOx+oBPAnMXNtI3anAwPG7UU31+iHvWz+tl5XIO6Fq0Ra8
	uS9cvv9NpA0B+1Omg8BKMiEqAtU7MJG7230iPDkNNjZW6LMpirPiEd6JNpoMEaTEVGXg
	u5LZX5koFjYEzuwsnMK6yrVh/bx7GbwQkS5BNM5h4bTQQxlXjh0rTMVZMJaftPWjYjz0
	RVqONKW1K0I93qbDmP9j04PcsGEw/82b4IUUlj0ZBrggOJNcfTzTKKz4ek7lIj4Afv0z
	HoUw==
Received: by 10.14.178.196 with SMTP id f44mr2927222eem.14.1355384833611;
	Wed, 12 Dec 2012 23:47:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w3sm1371804eel.17.2012.12.12.23.47.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 23:47:12 -0800 (PST)
Date: Thu, 13 Dec 2012 08:47:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20121213074729.GB3356@jama.jama.net>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1354622319.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/5] [meta-oe][danny] Small fixes from master
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
X-List-Received-Date: Thu, 13 Dec 2012 08:01:48 -0000
X-Groupsio-MsgNum: 42111
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline

--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2012 at 12:59:51PM +0100, Martin Jansa wrote:
> The following changes since commit f8ad0760abf8055bac27036853c56f56b40a36=
c7:
>=20
>   README: update to danny (2012-11-23 15:22:46 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib jansa/for-danny
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/for-danny
>=20
> Andrei Dinu (1):
>   gypsy: added to meta-oe/recipes-navigation
>=20
> Martin Jansa (1):
>   samba: update waf-as-source.patch to apply
>=20
> Paul Eggleton (3):
>   ntp: cleanup recipes and fix SSL support
>   ntp: make servers configurable and default to none configured
>   meta-systemd: ntp: update for server config improvements

ping?

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDJiBEACgkQN1Ujt2V2gBzQogCgjYYxp5bJCj1fU8bdmi99PgIW
sF4AoIWjQNbjvqMxA/Ce2nREctIwk6tZ
=4XXX
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
