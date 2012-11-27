Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TdRFj-0004Hd-LA
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 20:55:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qARJfHB5029486
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 11:41:17 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 27 Nov 2012 11:41:16 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 73A0C7FCE	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 14:40:29 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	E83736A7E20; Tue, 27 Nov 2012 14:41:15 -0500 (EST)
Date: Tue, 27 Nov 2012 14:41:15 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121127194115.GF18359@windriver.com>
References: <cover.1354015335.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1354015335.git.paul.eggleton@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH v3 0/8] Networking recipes
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
X-List-Received-Date: Tue, 27 Nov 2012 19:55:33 -0000
X-Groupsio-MsgNum: 41766
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kR3zbvD4cgoYnS/6"
Content-Disposition: inline

--kR3zbvD4cgoYnS/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH v3 0/8] Networking recipes] On 12.11.27 (Tue =
11:25) Paul Eggleton wrote:

> Since v2, address feedback from Aws Ismail and fix one other issue I
> noticed:
> * quagga: don't use -A with single watch daemon in watchquagga config
> * quagga: use correct D_PATH /usr/sbin in initscript
> * quagga: set PATH in initscript to have sbin dirs first as per comment
>=20
>=20
> The following changes since commit e4236266b7ac6103e4b9400eb51b5cb0037f3b=
a9:
>=20
>   hiawatha: add CONFFILES and a php example (2012-11-27 10:48:24 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/networking
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/networking
>=20
> Paul Eggleton (8):
>   tftp-hpa: add from OE-Classic, update and tidy up
>   tunctl: add from OE-Classic and tweak
>   quagga: add from OE-Classic, update and tidy-up
>   radvd: add from OE-Classic, update and tidy up
>   vblade: add from OE-Classic, update and tidy up
>   xl2tpd: add from OE-Classic, update and tidy up
>   proftpd: add from meta-baryon
>   mtr: add from OE-Classic, update and tidy up
>=20
[...]
>=20

Merged.  Thanks.

--=20
-Joe MacDonald.
:wq

--kR3zbvD4cgoYnS/6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlC1F1sACgkQPN8S4W6ZZncMPwCdHD8tRj7zrZjrc2W0aIRK9j2U
TvMAnRaskLY5eH3dpkjO16JhgqDZk1Eb
=e+Xr
-----END PGP SIGNATURE-----

--kR3zbvD4cgoYnS/6--
