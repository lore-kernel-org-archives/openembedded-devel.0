Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1Tn8ax-0001Hd-FS
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2012 15:01:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBODke9t021831
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Dec 2012 05:46:40 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 24 Dec 2012 05:46:39 -0800
Received: from yow-jmacdona-d2.windriver.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 5B4637FE2;	Mon, 24 Dec 2012 08:45:20 -0500 (EST)
Received: by yow-jmacdona-d2.windriver.com (Postfix, from userid 1000)	id
	E9C2D6A3850; Mon, 24 Dec 2012 08:46:37 -0500 (EST)
Date: Mon, 24 Dec 2012 08:46:37 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20121224134637.GJ5270@windriver.com>
References: <20121220133018.GJ14543@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121220133018.GJ14543@jama.palm1.palmone.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] patches on patchwork
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
X-List-Received-Date: Mon, 24 Dec 2012 14:01:40 -0000
X-Groupsio-MsgNum: 42406
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GlnCQLZWzqLRJED8"
Content-Disposition: inline

--GlnCQLZWzqLRJED8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking] patches on patchwork] On 12.12.20 (Thu 14:30) Martin Jan=
sa wrote:

> Hi, can you check and update patches in meta-networking bundle?
> http://patches.openembedded.org/bundle/jama/meta-networking/?archive=3Dbo=
th

Hmm.  Seems like I don't have access to do anything with patchworks
except download bundles.  All three currently in the meta-networking
queue should be rejected.  My old junk from September aren't relevant
now, there's a better approach coming along, and this:

http://patches.openembedded.org/patch/38813/

has simply been miscategorized.  Who can clean up the queue for me?  Or
can help me figure out how to clean up the queue?

Thanks.

--=20
-Joe MacDonald.
:wq

--GlnCQLZWzqLRJED8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlDYXL0ACgkQPN8S4W6ZZndMHwCfdgIf52vQ2HV7lAehOpgZQwmk
iKEAnA62SVImnnrQEetNBnXfgMEnUMzR
=QtCU
-----END PGP SIGNATURE-----

--GlnCQLZWzqLRJED8--
