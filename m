Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1NAj56-0004iH-Nb
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 12:52:19 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 20B54140B0; Wed, 18 Nov 2009 12:50:53 +0100 (CET)
Date: Wed, 18 Nov 2009 12:50:53 +0100
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091118115053.GD17441@zlo.nu>
References: <1258467896-28370-1-git-send-email-zlo@zlo.nu>
	<1258541929.26517.96.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1258541929.26517.96.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] cURL: Add 7.19.7 which supports CRLs.
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
X-List-Received-Date: Wed, 18 Nov 2009 11:52:19 -0000
X-Groupsio-MsgNum: 14419
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline

--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2009 at 10:58:49AM +0000, Phil Blundell wrote:
> > Also remove unused curl checksums for older versions.
> > ---
> >  conf/checksums.ini          |   32 ++++----------------------------
> >  recipes/curl/curl_7.19.7.bb |    5 +++++
> >  2 files changed, 9 insertions(+), 28 deletions(-)
> >  create mode 100644 recipes/curl/curl_7.19.7.bb
>=20
> Thanks for the patch.  I checked in the latter half of this but not the
> former: there doesn't seem to be any real merit in removing things from
> checksums.ini.

By the way, is there a developer wiki page or something where I could
have read about best common practices like this ?

My reworking of the iproute2 directory layout was something I wondered
about as well and it would be nice if I could be pointed in the correct
direction about things like that. ;-)

Marc

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksD350ACgkQezjnobFOgrH9MACdF9LDEH4F4ovi59CkTogNOmSN
7pQAniFGxRrZj88vxWtbo+Vuc+72Yr4O
=G99N
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--
