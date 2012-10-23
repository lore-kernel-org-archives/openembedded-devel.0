Received: from 206-248-190-39.dsl.teksavvy.com ([206.248.190.39]
	helo=yow-jmacdona-d2.wrs.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TQgcE-0005z0-46
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 17:42:02 +0200
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)
	id 0CA146A7953; Tue, 23 Oct 2012 11:28:36 -0400 (EDT)
Date: Tue, 23 Oct 2012 11:28:36 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121023152835.GA4871@windriver.com>
References: <1350679091-5909-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1350679091-5909-1-git-send-email-morgan.little@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-networking][PATCH 0/3] ntp updates
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
X-List-Received-Date: Tue, 23 Oct 2012 15:42:02 -0000
X-Groupsio-MsgNum: 41235
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Morgan,

Can you send out an updated set of patches based on the feedback you've
received so far?  I only saw Otavio's suggestions, I think, but if
you've got anything else, please address them as well.

I'm fine with the patch set with Otavio's suggested changes integrated.

-J.

[[oe] [meta-oe][meta-networking][PATCH 0/3] ntp updates] On 12.10.19 (Fri 1=
6:38) Morgan Little wrote:

> The following changes since commit a660f4a0289884f516ed85a75a25c722e31e88=
c9:
>   Paul Eggleton (1):
>         modphp: make LICENSE more accurate
>=20
> are available in the git repository at:
>=20
>   git@github.com:morganlittle/meta-oe.git ntp
>=20
> Morgan Little (3):
>       ntp: Move from meta-oe to meta-networking
>       ntp: Uprev from 4.2.6p3 to 4.2.6p5
>       ntp: Clean up recipes
>=20
>  .../recipes-support/ntp/files/ntp                  |    0
>  .../ntp/files/ntp-4.2.4_p6-nano.patch              |    0
>  .../recipes-support/ntp/files/ntp.conf             |    0
>  .../recipes-support/ntp/files/ntpd                 |    0
>  .../recipes-support/ntp/files/ntpdate              |    0
>  .../recipes-support/ntp/files/tickadj.c.patch      |    0
>  .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         |   12 +++
>  meta-networking/recipes-support/ntp/ntp.inc        |   72 ++++++++++++++=
++++++
>  meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |    6 ++
>  meta-oe/recipes-support/ntp/ntp-ssl_4.2.6p3.bb     |   11 ---
>  meta-oe/recipes-support/ntp/ntp.inc                |   35 ----------
>  meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   47 -------------
>  12 files changed, 90 insertions(+), 93 deletions(-)
>  rename {meta-oe =3D> meta-networking}/recipes-support/ntp/files/ntp (100=
%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/ntp/files/ntp-4.2.=
4_p6-nano.patch (100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/ntp/files/ntp.conf=
 (100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/ntp/files/ntpd (10=
0%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/ntp/files/ntpdate =
(100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/ntp/files/tickadj.=
c.patch (100%)
>  create mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
>  create mode 100644 meta-networking/recipes-support/ntp/ntp.inc
>  create mode 100644 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
>  delete mode 100644 meta-oe/recipes-support/ntp/ntp-ssl_4.2.6p3.bb
>  delete mode 100644 meta-oe/recipes-support/ntp/ntp.inc
>  delete mode 100644 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind Ri=
ver
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCGt6MACgkQPN8S4W6ZZneMdwCdH6Ac/z+FkEQ4R4Vw489A7Pzl
D7gAmwXmr0hs298RbR8mm90Yu3DUOFtF
=tDLW
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
