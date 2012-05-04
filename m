Received: from mail-gh0-f175.google.com ([209.85.160.175]
	helo=mail-gy0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SQOjO-0007B4-Jm
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 May 2012 22:03:58 +0200
Received: by ghbz2 with SMTP id z2so3254697ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 May 2012 12:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=/PXQRRwI23hnfbwdAfuOwkw0R9BTPS96D9wbLe8KP9o=;
	b=IW8Rwix3MJSY6YeOxLd/AXBtn4aJaiVq/pDvU0eFsiWfR1jP5VLK/TflrBqP3FDjYo
	YhUhz/N0vMW8tjMDjZC7a6AamNdwnlZxV8ZjKfFue6PHsegXpGqrS2dDkxqWCB83+kFh
	7n1B2WcNgerGnv5hIJqm75ic9SZ7xYPp3tyfVqkvzjO3Ab7YOtVwnrxGzUAnstJqBLtZ
	53Wz4WWgauEDDclvnJVsA/JWa7sbOluE4sKzKDnkVPtjNRhXSicrBoHtOvycKNXHYjvE
	xKYaLo4pufEqVV6DzDFMhnppvx8XoqZunw4hspz1mTVcZ+QiJpBEtsFw+9d/SYGh5LBv
	WLQQ==
Received: by 10.60.0.201 with SMTP id 9mr10111457oeg.59.1336161251163;
	Fri, 04 May 2012 12:54:11 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id j10sm9987188oba.4.2012.05.04.12.54.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 12:54:09 -0700 (PDT)
Date: Fri, 4 May 2012 12:54:13 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120504195413.GA13779@bill-the-cat>
References: <cover.1336052839.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cover.1336052839.git.sledz@dresearch-fe.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/1] pull request 20120503
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
X-List-Received-Date: Fri, 04 May 2012 20:03:58 -0000
X-Groupsio-MsgNum: 38575
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2012 at 03:51:38PM +0200, Steffen Sledz wrote:
> Hi Tom,
>=20
> please pull this commit into 2011.03-maintenance branch.
> It fixes a build problem with icedtea6-native and newer glibc versions.
> The fix is well tested in our own environment.
>=20
> Thx,
> Steffen
>=20
> The following changes since commit 21613e405cad072feef779c8e9b374a2f09841=
58:
>=20
>   docbook-utils-native: fix syntax problem in jw.in (2012-04-04 12:06:08 =
+0200)
>=20
> are available in the git repository at:
>   git://github.com/sledz/oe pull-request-1
>   https://github.com/sledz/oe/tree/pull-request-1
>=20
> Steffen Sledz (1):
>   icedtea6-native-1.7.10: backport S7103224

Applied, thanks!

--=20
Tom

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk+kM+UACgkQdZngf2G4WwP2HwCfajwrFZsm8DngY+C1QxsoiCNZ
jsIAnRy62mC93Om4TUduxHTqrthLxpYm
=7Uen
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
