Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4ZHZ-0004kk-Dn
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:20:45 +0200
Received: by fxi1 with SMTP id 1so1807907fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 07:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iOSdHtOvL16PSy+d2RbLitX9aRlJZlSiLq/AvVUR0FU=;
	b=kjpC5wkCpzS2HeinY/ZleKm2BchgtGZTEYmv7PSB8GMOkznHvkMsibGJv09/d3Ybkg
	6fcBsOCM59kpASYCmnhoXMFmHUiNJIThHUzKgunBEDx/bQN/OX77UYpNEnzvAgB02Rlx
	V2pHr7OM43ECZimQvLPRD4ddcQ/B7NkqqaVrk=
Received: by 10.223.30.214 with SMTP id v22mr565072fac.108.1316182532959;
	Fri, 16 Sep 2011 07:15:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a7sm10670365fam.22.2011.09.16.07.15.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 07:15:31 -0700 (PDT)
Date: Fri, 16 Sep 2011 16:15:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110916141524.GN7445@jama.jama.net>
References: <cover.1316156827.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1316156827.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 0/4] Pull request #22
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
X-List-Received-Date: Fri, 16 Sep 2011 14:20:45 -0000
X-Groupsio-MsgNum: 34307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JVu9XMG6uEpKCPDY"
Content-Disposition: inline

--JVu9XMG6uEpKCPDY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 09:07:39AM +0200, Martin Jansa wrote:
> The following changes since commit 9c4ff53d2fa688581d257eb7e045f9e6a20470=
d3:
>=20
>   vlc: update to 1.1.11 and fix xml2 build (2011-09-15 15:59:26 +0200)
>=20
> are available in the git repository at:
>   git://git.openembedded.org/meta-openembedded-contrib jansa/meta-efl
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/meta-oe

sorry about this bogus pull request.. I've changed -b param of
create-pull-request to jansa/meta-oe, but forget to git checkout
jansa/meta-oe branch before it..

btw: is it easier for you to apply 2 pull requests or can I send pull
requests with [meta-oe][meta-efl][meta-gnome] if I have changes to
multiple sublayers?

Regards,

> pespin (4):
>   enjoy: Add var LIC_FILES_CHKSUM to recipe
>   enjoy: Add inherit gettext
>   enjoy: Update gstreamer package names in RDEPENDS
>   enjoy: Add gst-plugins-good-autodetect to RDEPENDS
>=20
>  meta-efl/recipes-efl/e17/enjoy_svn.bb |   15 ++++++++-------
>  1 files changed, 8 insertions(+), 7 deletions(-)
>=20
> --=20
> 1.7.6.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JVu9XMG6uEpKCPDY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5zWfwACgkQN1Ujt2V2gBz3EQCgl2WT6DbSpB2ZFVGRqwTAtHgI
CasAoIFT9Ai/GKn3KW5gcWTpqWzeFA3u
=3zeR
-----END PGP SIGNATURE-----

--JVu9XMG6uEpKCPDY--
