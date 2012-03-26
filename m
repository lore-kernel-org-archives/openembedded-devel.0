Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SCBpH-00013J-GP
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Mar 2012 17:27:19 +0200
Received: by obqv19 with SMTP id v19so5625113obq.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2012 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I6AEd39IboAqaSG+jkj78XclENy2HIa+lYazqKmbcTE=;
	b=Cq098SK0N6oaj0w5sRCVlLYvOQiGPEQzyMNmXO5qd4fSWkXfl4EbySXyjiDa968vE7
	h9VLFBE6GUPhUN0UFOWANmR4evy7YOcYqBUThb5xRAFhvx8o7xAWLcC1Yh1RjyX41Ore
	dKU7LEIVElCohSV5VY+G+4oKqbl7uZlo/34qcoBjDKPYthfyRkpP78L6cylYTfRUC4/n
	Us9EQraDRj2Yn1RU/mlMV2actQ9FN4TfQ5vV5YNlWm//iqkDRWITIgN8tcBN3Ka3w3A+
	jldfnbYuvkg46/UmUVq0O1de9PWMMf8CXYzZUplrGOS2J3hTukvTE443WsvMIc/UuKzy
	AfAg==
Received: by 10.182.74.42 with SMTP id q10mr27931550obv.52.1332775099113;
	Mon, 26 Mar 2012 08:18:19 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id v9sm16624112obo.9.2012.03.26.08.18.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 08:18:18 -0700 (PDT)
Date: Mon, 26 Mar 2012 08:18:16 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120326151816.GA21518@bill-the-cat>
References: <cover.1332569901.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cover.1332569901.git.sledz@dresearch-fe.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/1] pull request 20120324
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
X-List-Received-Date: Mon, 26 Mar 2012 15:27:19 -0000
X-Groupsio-MsgNum: 37990
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 24, 2012 at 07:20:23AM +0100, Steffen Sledz wrote:

> Hi Tom,
>=20
> here's the pull request for the libmatthew fetch problem fix.
>=20
> Thx,
> Steffen
>=20
> The following changes since commit 8d2c8f49312f6a0318dc82b6ce85e50bc08dfc=
b2:
>=20
>   ltrace-0.5.3: Update URI to a functioning one (2012-03-14 12:13:19 +010=
0)
>=20
> are available in the git repository at:
>   git://git.openembedded.org/openembedded sledz/pull2
>   http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Dsledz/pull2
>=20
> Steffen Sledz (1):
>   libmatthew-0.7.1: SRC_URI updated
>=20
>  recipes/libmatthew/libmatthew_0.7.1.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

This is now applied, thanks!

--=20
Tom

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk9wiLcACgkQdZngf2G4WwP4HgCeK0XgNO9nnlwCrL3GAx35YbFh
LIAAoJSvNgfXak3LT6Uoh/56w0baSwU9
=8Y+J
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
