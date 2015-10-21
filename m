Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0628D7702A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 23:18:31 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so67715320pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 16:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=WEFeWNKh2B5d5Vg4vK9ZSc5cMePPGiVc3heCLA1bJEw=;
	b=RdOOiN4sJr7LSAr+7iUE1JFBBAJJfTcPwQLr5Ytj/Uh5An1lV9NADYLPGO9rTcyes7
	G5JaS7rLBHYqtirmhw6tCKnIlzW4IaImSnQ6vHtn4ttJRfSlTi6uI0UknDFlCvhZOAYO
	TPC2AMKqabBv73zZjKy6PmBBLpJzrCExbykP1mtJwz4xrC5ZsxFvPxkPcYbnHFFbMPgx
	zLujtYB7SmEnCjnHwIUlJrRLSxAxCbdOEPQVTe3Jyu8LxlwZdPqVNIyxS6+OMPoQqLVB
	1yIa44S2Wh6lih2qxkXiSaTa7XCjMTZ7kPWNcaB+RR9rcZc+yGlYnxHDnbkSLE4oR0qc
	ha2g==
X-Received: by 10.69.17.1 with SMTP id ga1mr13318200pbd.163.1445469512458;
	Wed, 21 Oct 2015 16:18:32 -0700 (PDT)
Received: from [192.168.0.4] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	mk5sm11071906pab.44.2015.10.21.16.18.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Oct 2015 16:18:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
Date: Wed, 21 Oct 2015 16:18:23 -0700
Message-Id: <5F39FDC1-A484-40B8-BC4D-617612700F34@gmail.com>
References: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3096.4)
Subject: Re: [meta-browser] Recipes draft for Chromium V45 and V47
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Oct 2015 23:18:34 -0000
X-Groupsio-MsgNum: 57960
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6BE0A426-14FA-4E1E-ABFF-2D25DC871197";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6BE0A426-14FA-4E1E-ABFF-2D25DC871197
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 9, 2015, at 4:31 AM, Zoltan Kuscsik <zoltan.kuscsik@linaro.org> =
wrote:
>=20
> Hi,
>=20
> I'm working on updating the Chromium recipes to version 45.
>=20
> So far it is tested on Wayland builds (ARM 32bit and ARM 64bit):
>=20
> https://github.com/linaro-home/meta-browser
>=20
> It still needs some cleanup before upstream, comments are welcome.
> Br,

when are you going to post a pull request for these.

>=20
> Zoltan
>=20
> --
> Zoltan Kuscsik
>=20
> Senior Software Developer, Linaro Digital Home Group
> email: zoltan.kuscsik@linaro.org
> IRC: zoli_ on irc.linaro.org
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_6BE0A426-14FA-4E1E-ABFF-2D25DC871197
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYoHUYACgkQuwUzVZGdMxQf4gCfXa5eZCvEQj5XLE6W6O81iRHe
7Q8An0ErlwbgKGoQ/lLNmWVZknTGgFgr
=hhaY
-----END PGP SIGNATURE-----

--Apple-Mail=_6BE0A426-14FA-4E1E-ABFF-2D25DC871197--
