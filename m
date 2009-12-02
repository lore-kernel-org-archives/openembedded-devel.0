Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1NFnk7-0005Xg-EA
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 12:51:38 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id E9C14140B0; Wed,  2 Dec 2009 12:49:59 +0100 (CET)
Date: Wed, 2 Dec 2009 12:49:59 +0100
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091202114959.GA8668@zlo.nu>
References: <4B14BAD9.2060402@fqingenieria.es>
	<20091201072521.GA11505@denix.org> <4B14D2E1.6050506@SSpaeth.de>
	<20091201194025.GB11505@denix.org> <4B1611C3.7050101@SSpaeth.de>
MIME-Version: 1.0
In-Reply-To: <4B1611C3.7050101@SSpaeth.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recipes relation tree
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
X-List-Received-Date: Wed, 02 Dec 2009 11:51:38 -0000
X-Groupsio-MsgNum: 14786
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2009 at 08:05:39AM +0100, Sebastian Spaeth wrote:
> Denys Dmytriyenko wrote:
> >> A related question. This generates depends.dot just fine, but I found a
> >> reference to rdepends.dot in some manual. I would be very much
> >> interested in an RDEPENDS tree, is there a way to get this?
> >=20
> > Actually it does generate both.
>=20
> Interesting, here with bitbake 1.8 I definitely only get
> 	depends.dot  task-depends.dot
>=20
> Is this only in 1.10, or am I missing a secret config option?

The rdepends are the lines in depends.dot with '[style=3Ddashed]'.

Marc

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksWVGcACgkQezjnobFOgrHNVACgnLqen954x+a2MHVyOsyrbEB9
z2oAoIN5or94HdOtU3YbUVDLUhhRgw9P
=YPuh
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
