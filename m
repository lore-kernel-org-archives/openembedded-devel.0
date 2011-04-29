Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QFiIl-0001JR-Cx
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 09:39:47 +0200
Received: by bwz5 with SMTP id 5so3274614bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 00:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=C+H29zqimEMJna7XZidJm+2oMeBtUXoCG+8ezfSUGvw=;
	b=TDM/TTrnVvILXConR9mEWSDGhv+RsWyl3FACncBg75pa/zHjK9/ENXSPrt5AEtYQQO
	aUCO9GMxYnv3QMG4rxqKtDae0LeHwkoJD7Loqr0KDnK5VI1x1B2pGEh+awGAC5HW4VnA
	HDE1hpyFfKSlymYDRwluRGGiIWNobnqXVJlIw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Yyqv1GL957zCRhX8l6nF0nq8el2L6UE3fVRDHQAk0VkgLr+eIUZ/7BiCniij+19o2y
	yHh7e5fstWU8ZmPYKytFW7E/MCTEATwzQCfSbQMG5OnanBzbIZ4UXvr6bj0CjbhcMueh
	FLHPo5uPkVn52sZPoVf9u8DafgTZApMvFznas=
Received: by 10.204.74.9 with SMTP id s9mr609009bkj.184.1304062633326;
	Fri, 29 Apr 2011 00:37:13 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q24sm579119bks.9.2011.04.29.00.37.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Apr 2011 00:37:12 -0700 (PDT)
Date: Fri, 29 Apr 2011 09:37:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110429073710.GA3373@jama.jama.net>
References: <E1QFUM3-0005Zf-8J@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1QFUM3-0005Zf-8J@melo.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Andrea Adami : etk-theme-ninja_svn: move from /obsolete to /obsolete/shr
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
X-List-Received-Date: Fri, 29 Apr 2011 07:39:47 -0000
X-Groupsio-MsgNum: 31520
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 04:46:15PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 0e7618a8bd3539f059ae9c7c05f91cf667c041aa
> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3D0e7618a8bd3539f059ae9c7c05f91cf667c041aa
>=20
> Author: Andrea Adami <andrea.adami@gmail.com>
> Date:   Thu Apr 28 18:43:16 2011 +0200
>=20
> etk-theme-ninja_svn: move from /obsolete to /obsolete/shr
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

FYI: etk-theme-ninja wasn't introduced by SHR people or ever used in SHR
images/feeds, I've moved it to obsolete after obsoleting etk itself..

So I don't understand this change, but don't care about obsolete dir struct=
ure...

>=20
> ---
>=20
>  recipes/obsolete/{ =3D> shr}/etk-theme-ninja_svn.bb |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/obsolete/etk-theme-ninja_svn.bb b/recipes/obsolete/s=
hr/etk-theme-ninja_svn.bb
> similarity index 100%
> rename from recipes/obsolete/etk-theme-ninja_svn.bb
> rename to recipes/obsolete/shr/etk-theme-ninja_svn.bb
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk26aqYACgkQN1Ujt2V2gBw03QCghZeWq+RdYTJeLHF8b7OKjUpP
hnMAnRlOkgO+tJH6lArG3VTtGLsRCUl/
=FZ0S
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
