Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TdRGR-0004Mh-9e
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 20:56:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qARJfhRZ029492
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2012 11:41:43 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 27 Nov 2012 11:41:42 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 8D10F7FCE;	Tue, 27 Nov 2012 14:40:55 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	1BD9B6A7E20; Tue, 27 Nov 2012 14:41:42 -0500 (EST)
Date: Tue, 27 Nov 2012 14:41:42 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121127194141.GG18359@windriver.com>
References: <1353395437-10948-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1353395437-10948-1-git-send-email-b40290@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: B29882@freescale.com, B19537@freescale.com
Subject: Re: [meta-networking v6 ] inetutils : Update to 1.9.1
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
X-List-Received-Date: Tue, 27 Nov 2012 19:56:44 -0000
X-Groupsio-MsgNum: 41767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kadn00tgSopKmJ1H"
Content-Disposition: inline

--kadn00tgSopKmJ1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking v6 ] inetutils : Update to 1.9.1] On 12.11.20 (Tue 1=
5:10) Chunrong Guo wrote:

>    * There are difference spaces between  inetutils-1.8/COPYING
>      and inetutils-1.9.1/COPYING,so md5sum is changed.
>=20
>    * the following patches are accepted by inetutils 1.9.1 upstream
>      inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
>      inetutils-1.8-1004-detect-fork-support.patch
>      inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
>      inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.pa=
tch
>      inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision=
=2Epatch
>      inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
>=20
> Signed-off-by: Chunrong Guo <b40290@freescale.com>
> ---

Merged.  Thanks.

--=20
-Joe MacDonald.
:wq

--kadn00tgSopKmJ1H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlC1F3UACgkQPN8S4W6ZZndWsQCfbvgJiQjb3s1ZKNZp4FYv3WsJ
6/oAn1yL242ACCPt6FBufeqRfwXgwepo
=1CrH
-----END PGP SIGNATURE-----

--kadn00tgSopKmJ1H--
