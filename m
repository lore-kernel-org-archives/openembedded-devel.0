Received: from 206-248-190-39.dsl.teksavvy.com ([206.248.190.39]
	helo=yow-jmacdona-d2.wrs.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TQf72-0000ml-P3
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 16:05:44 +0200
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)
	id 0508D6A3358; Fri, 19 Oct 2012 08:10:35 -0400 (EDT)
Date: Fri, 19 Oct 2012 08:10:35 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121019121035.GA5000@windriver.com>
References: <1347905904-814-1-git-send-email-fcooper@ti.com>
	<k39bug$tlg$1@ger.gmane.org>
	<CANBf+V0uVAWNCt_E+MD42MxFjsu5XOkuaaOyx7Fy3xbBcMXFWg@mail.gmail.com>
	<168838562.YJes5mSNF6@helios>
MIME-Version: 1.0
In-Reply-To: <168838562.YJes5mSNF6@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] thttpd: Port thttpd from oe-classic.
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
X-List-Received-Date: Tue, 23 Oct 2012 14:05:45 -0000
X-Groupsio-MsgNum: 41231
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][PATCH] thttpd: Port thttpd from oe-classic.] On 12.10.1=
9 (Fri 11:44) Paul Eggleton wrote:

> On Tuesday 18 September 2012 11:39:24 Joe MacDonald wrote:
> > On Tue, Sep 18, 2012 at 4:38 AM, Koen Kooi <koen@dominion.thruhere.net>=
=20
> wrote:
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >=20
> > > Op 17-09-12 20:18, Franklin S. Cooper Jr schreef:
> > >> * Port thttpd recipe from oe-classic to meta-oe.
> > >=20
> > > It should go into meta-networking
> >=20
> > Agreed.  Once it's been LSB'd, please put the recipe in
> > meta-networking/recipes-daemons/
>=20
> meta-networking or meta-webserver?

I'd originally had it on my proposed meta-networking list, but that
pre-dated the meta-webserver layer.  I'm okay with either location, but
there does seem to be a natural fit with meta-webserver, now that I
think about it.

--=20
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind Ri=
ver
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCBQzcACgkQPN8S4W6ZZnfQTACbB4nCwmfK0xjP04Og5eO/6ALD
12gAn1XJ6ahiUr0P0u3T9KU1Y0RITWxu
=olTy
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
