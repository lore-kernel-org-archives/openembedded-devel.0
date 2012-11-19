Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TaUXG-0006xY-EZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 17:49:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAJGZNMj019729
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Nov 2012 08:35:23 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 19 Nov 2012 08:35:22 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 88E297FD0;	Mon, 19 Nov 2012 11:34:44 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	8A6226A7C43; Mon, 19 Nov 2012 11:35:21 -0500 (EST)
Date: Mon, 19 Nov 2012 11:35:21 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121119163521.GQ5534@windriver.com>
References: <1352713186-2637-1-git-send-email-Xin.Ouyang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1352713186-2637-1-git-send-email-Xin.Ouyang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH V2][meta-networking] netperf: import from oe-classic and upgrade to 2.6.0
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
X-List-Received-Date: Mon, 19 Nov 2012 16:49:26 -0000
X-Groupsio-MsgNum: 41558
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xJjS+Ds6jmpBvWv0"
Content-Disposition: inline

--xJjS+Ds6jmpBvWv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.

[[oe] [PATCH V2][meta-networking] netperf: import from oe-classic and upgra=
de to 2.6.0] On 12.11.12 (Mon 17:39) Xin Ouyang wrote:

> V2 Updates:
>  * merge two patches into one
>  * bb recipe: LICENSE back to "netperf"
>  * initscript: add LSB headers
>  * initscript: "sed" to replace the hardcodes /usr/sbin to $sbindir.
>=20
> Xin Ouyang (1):
>   netperf: import from oe-classic and upgrade to 2.6.0
>=20
>  .../recipes-support/netperf/files/cpu_set.patch    |   30 ++++++++++
>  meta-networking/recipes-support/netperf/files/init |   62 ++++++++++++++=
++++++
>  .../recipes-support/netperf/files/vfork.patch      |   58 ++++++++++++++=
++++
>  .../recipes-support/netperf/netperf_2.6.0.bb       |   57 ++++++++++++++=
++++
>  4 files changed, 207 insertions(+)
>  create mode 100644 meta-networking/recipes-support/netperf/files/cpu_set=
=2Epatch
>  create mode 100644 meta-networking/recipes-support/netperf/files/init
>  create mode 100644 meta-networking/recipes-support/netperf/files/vfork.p=
atch
>  create mode 100644 meta-networking/recipes-support/netperf/netperf_2.6.0=
=2Ebb
>=20
--=20
-Joe MacDonald.
:wq

--xJjS+Ds6jmpBvWv0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCqX8kACgkQPN8S4W6ZZnetuACfZEIeeMaCyi+EJM+uWCek0Iig
ADcAn2X3cS7eDh4G4jY8wj7QSKP/J5gy
=/HDG
-----END PGP SIGNATURE-----

--xJjS+Ds6jmpBvWv0--
