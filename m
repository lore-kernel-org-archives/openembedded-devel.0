Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Uc0wX-00022v-Ck
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 00:10:05 +0200
Received: by mail-ea0-f174.google.com with SMTP id z7so2860607eaf.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2013 14:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=pdQRtkv3NnyQeU3vIKc9H8y2wcDNxhE4GrAGMWkWxG4=;
	b=e65GKNLRrDRx/pYUy3V6VbCNcyPIUpNRasuTBgom80IM7ECoIfmbF/fRPAgz6Ug4w4
	ylvsaXDlaPPyd/EKuegVPdQ3pRWsD+Plfqcc1oIaJM3yOvGBgVXRD1KRiWJtI4WUG2/m
	zp6CkZ1lVSD5SZn00DSs27T6foFmI7tizMgdQZbGi5kyBsPPABqTHrcPjux2WWeNXsk6
	o1VAhK+43Dzp+Emq7iRSbiiagR0XmmJCgVrwUAPWW90H6xI3WWd/KfE+YRwHg1w680YB
	hUtmKjE2B6SyVaCaB5I81P0SytUfrI32f0WFxQFD67dWaN9e/oYomxIToy2GzGWu7pnK
	Hm4g==
X-Received: by 10.14.216.201 with SMTP id g49mr53210246eep.42.1368481915341;
	Mon, 13 May 2013 14:51:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y10sm25657847eev.3.2013.05.13.14.51.54 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 13 May 2013 14:51:54 -0700 (PDT)
Date: Mon, 13 May 2013 23:52:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130513215201.GF3187@jama>
References: <1368481622-5465-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1368481622-5465-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe PATCH] bigbuckbunny: Add 480p, 720p and 1080p movies
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
X-List-Received-Date: Mon, 13 May 2013 22:10:05 -0000
X-Groupsio-MsgNum: 44690
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline

--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2013 at 06:47:02PM -0300, Otavio Salvador wrote:
> This provides a recipe to install the movies in the rootfs; these
> allow for people to make demo images which carry the movies for show.
>=20
> These recipes are based on Angstrom ones. Thanks by their base work.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-support/bigbuckbunny/bigbuckbunny-1080p.bb   | 16 ++++++++++=
++++++
>  .../recipes-support/bigbuckbunny/bigbuckbunny-480p.bb    | 16 ++++++++++=
++++++
>  .../recipes-support/bigbuckbunny/bigbuckbunny-720p.bb    | 16 ++++++++++=
++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 meta-oe/recipes-support/bigbuckbunny/bigbuckbunny-108=
0p.bb
>  create mode 100644 meta-oe/recipes-support/bigbuckbunny/bigbuckbunny-480=
p.bb
>  create mode 100644 meta-oe/recipes-support/bigbuckbunny/bigbuckbunny-720=
p.bb

meta-multimedia?
=20

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGRYIEACgkQN1Ujt2V2gBzc6QCfdNtzpF6MYhc+6efkQNvGJuM0
GogAoJIxo9h48zOcPcyYvOPnB2Ht6g+v
=fic6
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--
