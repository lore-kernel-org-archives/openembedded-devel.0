Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TaUWA-0006qO-E0
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 17:48:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAJGYFP0019690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 08:34:15 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 19 Nov 2012 08:34:14 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id CEFD17FD0;	Mon, 19 Nov 2012 11:33:36 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	CC7E46A7C43; Mon, 19 Nov 2012 11:34:13 -0500 (EST)
Date: Mon, 19 Nov 2012 11:34:13 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <dennis.hall@windriver.com>
Message-ID: <20121119163413.GO5534@windriver.com>
References: <1352315721-7792-1-git-send-email-joe.macdonald@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1352315721-7792-1-git-send-email-joe.macdonald@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Adding aoetools to meta-networking
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
X-List-Received-Date: Mon, 19 Nov 2012 16:48:19 -0000
X-Groupsio-MsgNum: 41556
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YyxzkC/DtE3JUx8+"
Content-Disposition: inline

--YyxzkC/DtE3JUx8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] Adding aoetools to meta-networking] On 12.11.07 (Wed 14:15) Joe MacDo=
nald wrote:

> This work was actually done by Dennis Hall (copied here) but since he's n=
ot yet
> on the list, I'm forwarding it for him.
>=20
> Dennis:  I made a couple of minor changes to your recipe after you sent i=
t to
> me, collecting the SRC_URI values into a single block, removing the PRIRO=
ITY
> field which I think is an artifact from the OE-Classic recipe, and moving
> LIC_FILES_CHKSUM to be next to LICENSE.  I think other than those trivial
> changes, this is exactly what you sent me.
>=20
> --
> -Joe MacDonald.
> :wq

Merged.

--=20
-Joe MacDonald.
:wq

--YyxzkC/DtE3JUx8+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCqX4UACgkQPN8S4W6ZZneO7wCfUjBI9jo/uqAWOyVpG+krNSCN
L1QAnjSB4ubnObXjLsYBwDY4ZfUiEoXf
=WTIW
-----END PGP SIGNATURE-----

--YyxzkC/DtE3JUx8+--
