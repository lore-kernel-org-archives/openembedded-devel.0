Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1U6Ccu-0007cM-5P
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 05:10:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1F3sHQM020175
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 19:54:17 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 14 Feb 2013 19:54:15 -0800
Received: from yow-jmacdona-l1 (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 156577FCE;
	Thu, 14 Feb 2013 22:54:13 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 0A31720468; Thu,
	14 Feb 2013 22:54:13 -0500 (EST)
Date: Thu, 14 Feb 2013 22:54:13 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Aws Ismail <aws.ismail@windriver.com>
Message-ID: <20130215035413.GA28541@windriver.com>
References: <1360878665-17503-1-git-send-email-aws.ismail@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1360878665-17503-1-git-send-email-aws.ismail@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/3][V3] multilib fixes for some networking recipes
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
X-List-Received-Date: Fri, 15 Feb 2013 04:10:26 -0000
X-Groupsio-MsgNum: 43172
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking][PATCH  0/3][V3] multilib fixes for some networking recip=
es] On 13.02.14 (Thu 16:51) Aws Ismail wrote:

> *** V3 ****
> separate the commits by recipe basis.
> ***********
>=20
> Aws Ismail (3):
>   accel-ppp: resolve QA warnings and satisfy multilib
>   netcat-openbsd: resolve multilib issues.
>   traceroute: resolve multilib issues
>=20
>  .../recipes-protocols/accel-ppp/accel-ppp_git.bb   |    7 +++++++
>  .../recipes-support/netcat/netcat-openbsd_1.89.bb  |    6 +++---
>  .../traceroute/traceroute_2.0.18.bb                |   10 ++++++----
>  3 files changed, 16 insertions(+), 7 deletions(-)

Merged, thanks Aws.

--=20
-Joe MacDonald.
:wq

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEdsWUACgkQPN8S4W6ZZndlYwCggHdb/mvnYYChtVWCkOqO/zuJ
OzwAn27qvbT0wMCpLLdMcSsg5d3pg/Y4
=FX+K
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
