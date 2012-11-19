Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TaReY-00023a-Nm
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 14:44:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAJDUgMU016579
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Nov 2012 05:30:42 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 19 Nov 2012 05:30:41 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id E7CED7FD0;	Mon, 19 Nov 2012 08:30:03 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	C3F066A7C2E; Mon, 19 Nov 2012 08:30:40 -0500 (EST)
Date: Mon, 19 Nov 2012 08:30:40 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121119133040.GB5534@windriver.com>
References: <1353031219-16200-1-git-send-email-b40290@freescale.com>
	<CAP9ODKpfdpS3ULMNPig7d-n+2y5tvvvKmHi+1fP8UP+E=dqtDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpfdpS3ULMNPig7d-n+2y5tvvvKmHi+1fP8UP+E=dqtDA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: B29882@freescale.com, B19537@freescale.com
Subject: Re: [meta-networking v5 ] inetutils : Update to 1.9.1
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
X-List-Received-Date: Mon, 19 Nov 2012 13:44:47 -0000
X-Groupsio-MsgNum: 41552
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline

--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking v5 ] inetutils : Update to 1.9.1] On 12.11.19 (M=
on 08:34) Otavio Salvador wrote:

> On Fri, Nov 16, 2012 at 12:00 AM, Chunrong Guo <b40290@freescale.com> wro=
te:
>=20
> >   * There are difference spaces between  inetutils-1.8/COPYING
> >     and inetutils-1.9.1/COPYING,so md5sum is changed.
> >
> > Signed-off-by: Chunrong Guo <b40290@freescale.com>
> >
>=20
> I did not built or tested it but the commit log might be improved to
> express what happened to the patches you removed. I assume they were fixed
> upstream but it is not clear looking at the changes or commit log.
>=20
> Please make it explicit.

I agree.  I only got do to a proper build test yesterday, and all seemed
well, but I'd like to see the log expanded a bit as well.

Almost there!  And thanks for the update to the new version, that's
something I'd been thinking I was going to need to get to soon, so it's
saving me some time.

--=20
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind Ri=
ver
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCqNIAACgkQPN8S4W6ZZndm7ACcDi7wxkgTZGI6qnttqleZO53/
DbIAmwUVrQzwOAoLvd0JYtghOJbkvCEl
=jpW6
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
