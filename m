Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SvxOI-0001Gx-5B
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 23:20:38 +0200
Received: by yenl13 with SMTP id l13so4814668yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 14:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=t3x2LtBivT1Gg4n3vrKeU3+i+AyMzXSyokRd/7LLylk=;
	b=n4cjZS5DYugB67kS8t2bwAL7PivdQsKqNEUQ4co7WCEFSHlQ4AwP/X6XOGxl2z2hH+
	Lv8sPXJP+hfzG+HatMi+8gKWfW4Cn7hUFAzORFRgNZaoV6e1AhNG+s/Z4zOn0KGerj86
	fP/NDEuEUBefmgkBtwTVuyz/bXe0IXmKlFgsbxnvXK77HupqjDqK8C/U/kkF9rikf5sf
	F6WEsn1tjai/2p3w3tEnDOJvZrjVIpPk0IJSKPrOqCUZn/8BUZLVk7+SNiJUrnmAHGaW
	fG5hK9/o41uq9Rem9YdOpAQG5PyybaWNFT97u5Lz6+60TSnLaCRO7royDAGN56Zffl3O
	n8Iw==
Received: by 10.68.204.129 with SMTP id ky1mr39157841pbc.32.1343682541057;
	Mon, 30 Jul 2012 14:09:01 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:b058:e4b1:e360:44b4])
	by mx.google.com with ESMTPS id qd10sm8594026pbb.38.2012.07.30.14.09.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 14:09:00 -0700 (PDT)
Date: Mon, 30 Jul 2012 14:09:07 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120730210907.GF9554@bill-the-cat>
References: <cover.1343104879.git.denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <cover.1343104879.git.denys@ti.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 0/1] Pull request 20110723
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
X-List-Received-Date: Mon, 30 Jul 2012 21:20:38 -0000
X-Groupsio-MsgNum: 39936
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline

--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2012 at 12:52:28AM -0400, Denys Dmytriyenko wrote:
> Tom,
>=20
> Please pull this commit that fixes opkg-utils when generating pkg index
>=20
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>   Branch: 2011.03-maintenance
>   Browse: http://arago-project.org/git/people/?p=3Ddenix/openembedded.git=
;a=3Dshortlog;h=3Drefs/heads/2011.03-maintenance
>=20
> Thanks,
>     Denys Dmytriyenko <denys@ti.com>
> ---
>=20
> The following changes since commit f9611c025109a3e0d6cebf12f49ae24c97759c=
09:
>=20
>   psplash: convert from svn.o-hand.com to git.yoctoproject.org (2012-07-0=
4 22:34:04 +0200)
>=20
> are available in the git repository at:
>   git://arago-project.org/git/people/denix/openembedded 2011.03-maintenan=
ce
>=20
> Denys Dmytriyenko (1):
>   opkg-utils: bump SRCREV to pick up subprocess.check_output fixes
>=20
>  recipes/opkg-utils/opkg-utils_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

--=20
Tom

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlAW9/MACgkQdZngf2G4WwNO1gCfc2XtDUF2Hpiz9dI11iea65Tv
aJ8An3qa4qTiRkK4MHQSD+xbJKClSsoV
=kPtU
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
