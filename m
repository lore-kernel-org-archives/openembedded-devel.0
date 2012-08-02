Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwpS7-0008MZ-0Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 09:04:11 +0200
Received: by wgbdr1 with SMTP id dr1so6781906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yPmD0YFFH1vMsQkHng2vFFkKauyImCqLR+tmvfVZaf4=;
	b=JWMmWLZnogne90Ej7Mto81836Cz9l6T2p8NFK2aBDEV1YnPX6NBNx92F2OsyqAPA8X
	iCmUn9PufPCmQ52QycfeaMXrzmzx4XcJjqBY7u8A6F76kegjkNah1elNKdaJjLyn4NEB
	cucw8SdrwK4XNiGaD2fwkSnDTUbO2M5ihj75HoIBjEL5gM3OuqDRkSKk0Uajo3wPub7f
	9cgPUaNCLEwl90ZLLMPZlVzrz/YgBVvTkCSpLbOs3BQPubpGK2lYJJ4kMyeM9t1J0ZQa
	98Ll197MyY2+gghZrp7qkJoHALrkbOfDI7QOeHzV0XUVzEZtvK7W7C/Lz99e4MRdIWTc
	OBlQ==
Received: by 10.180.97.135 with SMTP id ea7mr2090960wib.11.1343890351662;
	Wed, 01 Aug 2012 23:52:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm15006716wiy.4.2012.08.01.23.52.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 23:52:30 -0700 (PDT)
Date: Thu, 2 Aug 2012 08:52:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120802065228.GM16306@jama.jama.net>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
	<297d8ce601b52a6347bf0e5a8a14b8bf809cac1a.1343859304.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <297d8ce601b52a6347bf0e5a8a14b8bf809cac1a.1343859304.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 8/8] anki: import from oe-classic and upgrade to latest
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
X-List-Received-Date: Thu, 02 Aug 2012 07:04:11 -0000
X-Groupsio-MsgNum: 39995
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hnsKUeImFCk/igEn"
Content-Disposition: inline

--hnsKUeImFCk/igEn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 12:21:05AM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../no-need-for-pyqt-at-buildtime.patch            |   23 ++++++++++++++=
++++++
>  meta-oe/recipes-extended/anki/anki.inc             |   16 +++++++++++++
>  meta-oe/recipes-extended/anki/anki_1.2.11.bb       |    4 +++
>  .../no-need-for-pyqt-at-buildtime.patch            |   14 ++++++++++++
>  meta-oe/recipes-extended/anki/libanki_1.2.11.bb    |    6 +++++
>  5 files changed, 63 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/anki/anki-1.2.11/no-need-for=
-pyqt-at-buildtime.patch
>  create mode 100644 meta-oe/recipes-extended/anki/anki.inc
>  create mode 100644 meta-oe/recipes-extended/anki/anki_1.2.11.bb
>  create mode 100644 meta-oe/recipes-extended/anki/libanki-1.2.11/no-need-=
for-pyqt-at-buildtime.patch
>  create mode 100644 meta-oe/recipes-extended/anki/libanki_1.2.11.bb

Please ignore this one, it has some runtime issues.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hnsKUeImFCk/igEn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAaI6wACgkQN1Ujt2V2gByIeQCfYUF4wT9k3A5MmhL5b1D6AePI
4xsAoI/rpZaCDmBAm8Q6801x3DHP3UnN
=qUMM
-----END PGP SIGNATURE-----

--hnsKUeImFCk/igEn--
