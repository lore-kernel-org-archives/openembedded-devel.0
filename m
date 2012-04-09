Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SHGNA-0001UX-5s
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:19:16 +0200
Received: by ggcy3 with SMTP id y3so1783602ggc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MW94cuxOKJpIlqI4B9b3/I9EA9zksRwNmrEwT7b5ffo=;
	b=AOXguVJ/tsAGaX5zCWoWyvShlfFEd9xqXFba2aKAyRMlS6J+ISAbSwtLxDEi5qHOTb
	jfIXjmI5GgG7yv5aWdtagQ4OjMNvdYbfVQu8HyBFiyrWbbeD1FNB8t+JbekvNUF/Y6pY
	rw4x52IvdumRqgIdnPegA/kyI3bWdvikEbWNDeW7wXUS3BRu81AbgfH3qsLDC5CEAxul
	c3cGybh14ERVwtxBj56aukiSqJzH0F4eFnCHFkF2baD9v+Z06UT8HPmLC2r3JASN7jUH
	/3uuA06NDG3Uj18fQpTpEyfHpOzlmf1Mg0pw1CwvrXP7145d7jmpN8zhA6sSQn4aewax
	VgPQ==
Received: by 10.60.172.231 with SMTP id bf7mr10686755oec.45.1333984199181;
	Mon, 09 Apr 2012 08:09:59 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id by5sm16461091obb.19.2012.04.09.08.09.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:09:57 -0700 (PDT)
Date: Mon, 9 Apr 2012 08:09:59 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120409150959.GA26986@bill-the-cat>
References: <cover.1333534095.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cover.1333534095.git.sledz@dresearch-fe.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/1] pull request 20120404
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
X-List-Received-Date: Mon, 09 Apr 2012 15:19:16 -0000
X-Groupsio-MsgNum: 38154
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 04, 2012 at 12:13:56PM +0200, Steffen Sledz wrote:

> Hi Tom,
>=20
> please pull this commit backported from oe-core fixing a problem with doc=
book-utils-native.
>=20
> Thx,
> Steffen
>=20
> The following changes since commit 71df8a759f91e821a2daee22f34eaa3a317087=
75:
>=20
>   python-2.6.6: Fix python-2.6.6 build failure on linux-3.x (2012-03-27 1=
3:08:38 +0200)
>=20
> are available in the git repository at:
>   git://github.com/sledz/oe pull-request-1
>   https://github.com/sledz/oe/tree/pull-request-1
>=20
> Steffen Sledz (1):
>   docbook-utils-native: fix syntax problem in jw.in
>=20
>  .../docbook-utils/docbook-utils-0.6.14/re.patch    |   29 ++++++++++++++=
++++++
>  .../docbook-utils/docbook-utils-native_0.6.14.bb   |    8 ++++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/docbook-utils/docbook-utils-0.6.14/re.patch

Applied, thanks!

--=20
Tom

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk+C+8cACgkQdZngf2G4WwMtfQCfcI+SY945Sh3SNyH+fo1a3CA9
nUAAn2XgqFSlqVCultDWCdHySruTdjR5
=CaGU
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
