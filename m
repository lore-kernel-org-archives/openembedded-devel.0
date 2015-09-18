Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7600776FE2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:08:39 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so29577424wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Km841ev4H/6xBcW0DZRfBIXmcOawdIhoVfamUpao3Gc=;
	b=qH2Iq4kTqXDJMkf9ULzllA3G59PF45cWVhjCkjZ4R1qCDy4D2b5KStoRm2FbLEha4F
	CvhpUQYvzMJUvPJf7C8EYsYHK9OsvS05qiBTzRuR/cxP3VlHbjXVglXGaHQ4WwHfD9E7
	Qis1c5510IeFqIiVTDuHKUm9kbRGTcmnKa6bWG3LBc2hSrASxyV2JCpsnpqryVRjxwid
	F3hP+az15l2C9fEvZvKZ4FCha7VtPqdfz/9cm5hXkLH/2qiNAy+3S5CChX/Az09jfL90
	Txi3aHuJp0g+4EIJYtKqie9zyTGf0Bp+zRm6pYOYsuQqRFDF2dy1bDQCco1rzFl+8Zmv
	v0iQ==
X-Received: by 10.194.22.97 with SMTP id c1mr6944525wjf.72.1442578119957;
	Fri, 18 Sep 2015 05:08:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id m4sm8571824wje.5.2015.09.18.05.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 05:08:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Sep 2015 14:09:00 +0200
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20150918120900.GB11095@jama>
References: <CAP9ODKpdOtyML72GCOjR5LmNn6KZCOwrGchwYSreqCEOzd15Yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpdOtyML72GCOjR5LmNn6KZCOwrGchwYSreqCEOzd15Yg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Fido backports
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
X-List-Received-Date: Fri, 18 Sep 2015 12:08:41 -0000
X-Groupsio-MsgNum: 57455
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline

--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2015 at 03:08:27PM -0300, Otavio Salvador wrote:
> Hello Martin,
> Hello Armin,
>=20
> Please queue following backports for Fido:
>=20
> # Fixes
> 6ea7ac01
> 607b114d
>=20
> If noone has objections I would like to propose the backport of:
>=20
> # Upgrade
> 2c57f950a
>=20
> # New recipe
> 2315f412f6

All 4 pushed to fido-next, but I'm still listening for objections.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX7/tkACgkQN1Ujt2V2gBzXIgCglKpna7kbqBU2Xhl4rF1EQJrB
FisAn3IPw5zTeRfwS0JdXGGw4dSFL2B7
=ZlJg
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
