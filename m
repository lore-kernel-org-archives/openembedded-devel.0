Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2E40D73341
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 03:20:45 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1YLkKc-0004FR-Lf from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Feb 2015 19:20:46 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 19:20:46 -0800
Received: by burninator (Postfix, from userid 1000)	id 99830581332; Wed, 11
	Feb 2015 22:20:45 -0500 (EST)
Date: Wed, 11 Feb 2015 22:20:45 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150212032045.GL30457@mentor.com>
References: <cover.1422236615.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1422236615.git.liezhi.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/5] 5 fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Feb 2015 03:20:53 -0000
X-Groupsio-MsgNum: 54198
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kunpHVz1op/+13PW"
Content-Disposition: inline

--kunpHVz1op/+13PW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged patches 2 and 3, dropped 4 as discussed.

-J.

[[oe] [PATCH 0/5] 5 fixes] On 15.01.25 (Sun 17:45) Robert Yang wrote:

> The following changes since commit ddd3ccd63949f9a24040eb39c136ef9730f266=
2a:
>=20
>   ntp: fix perl path (2015-01-23 07:45:20 -0500)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib rbt/5fixes
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Drbt/5fixes
>=20
> Robert Yang (5):
>   openldap: fix for new libtool
>   dnssec-conf: depends libxslt-native
>   nuttcp: fix HOMEPAGE and SRC_URI
>   wireshark: add PACKAGECONFIG for geoip
>   cherokee: add PACKAGECONFIG for geoip
>=20
>  .../dnssec-conf/dnssec-conf_2.02.bb                |    3 ++-
>  .../recipes-support/nuttcp/nuttcp_7.2.1.bb         |    6 +++---
>  .../recipes-support/wireshark/wireshark_1.12.2.bb  |    1 +
>  .../recipes-support/openldap/openldap_2.4.39.bb    |    2 +-
>  .../recipes-httpd/cherokee/cherokee_1.2.98.bb      |    1 +
>  5 files changed, 8 insertions(+), 5 deletions(-)
>=20
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--kunpHVz1op/+13PW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU3BwNAAoJEEn8ffcsOfaWTPMH/0rmaxva107gISBMw+5FwxoB
qpSzHR5elBucMSh1aBFSRG2pBUc87rXxcluCW716fwkUrO/jbz0c0odbSO3Z3aTz
cFaz+iC3RrJ2GZZcZXzwdFABIBtA7ZUXlyj659icaFqaLc37zFc1chDNTeiuTBWg
mI5Vh6QD8Li6dDn7XCga2RA4TZevMk6q6hrSKL8Pd84oHl2J0zIBrdgAmaGRIfpa
rRzMDI1ZPpOurt2EjqiG/jSYoM8j3x3iwXOGIilO2dwNJBC6RKEcGhh8PC1XxUvG
uHKp0xUI+MKH0XVORkEAhFnJzKpQOwhSFKw+7K6TN4KthxwwiIjogP/tcuFIamU=
=h7U8
-----END PGP SIGNATURE-----

--kunpHVz1op/+13PW--
