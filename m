Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1N7nT1-0005TY-DY
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 10:56:54 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 894D214030; Tue, 10 Nov 2009 10:55:34 +0100 (CET)
Date: Tue, 10 Nov 2009 10:55:34 +0100
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091110095534.GA18137@zlo.nu>
References: <20091104125439.GA20450@zlo.nu>
	<be7a9f3d0911051703p33a3f0e1p223219ead98055eb@mail.gmail.com>
	<20091109155414.GA13145@zlo.nu>
	<be7a9f3d0911090900s1d2ca377u96751e5fd5670e66@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0911090900s1d2ca377u96751e5fd5670e66@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Add dhcp 3.1.2p1 and fix unneeded bash dependency in 3.0.*
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
X-List-Received-Date: Tue, 10 Nov 2009 09:56:54 -0000
X-Groupsio-MsgNum: 14066
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2009 at 03:00:47PM -0200, Otavio Salvador wrote:
> Thanks by looking at it again; the only missing things to us to commit it=
 are:
>=20
>  - use a patch for .inc move
>  - use a patch for the new version
>  - export both using git format-patch and mail them
>=20
> Doing the last allow us to give the credit to you and keep tracking
> who did what in the project; this help a lot and allow us to ping
> people in case of problems or radical changes that might affect your
> usage.

Ok, done, in 3 patches (inc move, add new version, bash-patch).

Marc

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr5OJYACgkQezjnobFOgrFbqQCgkYta7pvivmcMcWniOn926+IS
XjsAmwYa8yL2DAmn2VTTW4Y1zKTmTAoY
=O+zO
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
