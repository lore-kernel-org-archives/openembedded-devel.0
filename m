Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF227723B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 14:30:46 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id a197so121899117wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 06:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=X1Rm/iKx2VL8CA0HTvKzY3zek0J/VfYJ6uqnDX0sbxs=;
	b=otj0EvoHDqHQypwbb0XJERQQAjtGwpH4DwIpnrVYTFvBX6H6xO36qMWlBaZ08YsHH0
	C4NC/sy7VGHu/M9CzwRF3n60tcOiLcbkDnjLVTzSLJeD7Pv4ysJX7d4y3zk9m9D3mk4F
	BjOgSFiIDBL32FEDMUp1KDRMghK4hxT707Fhjgwln4zOJV6vOOtIL858U3HDUVV2aAgv
	v3uUrNnAg4c5tjlkbftoZgoKGbT9Y940d8gKi+GOprULA05bVU3eKTqI6TNhJbIqFVzA
	fX85aDD0dMAjM/FXX3Xc9P+F8O+cOl8zJ0EjkHcPljvKK5breHjPZub5VOW1gQJXkph+
	AeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=X1Rm/iKx2VL8CA0HTvKzY3zek0J/VfYJ6uqnDX0sbxs=;
	b=VF6owkCZJJhLmVyBs7y+BKwEQ7PmxGuP9YuYl6H1YHC+MtQxbIGJYIScfSWXJ1z/IJ
	iKQC/XVe47MJ21d9cLwz0XqPruKsumX4u4ZAPJWVUa2PX+IGvREcDD3OM4IVdX343G4r
	zBIh1fge6goxJVpcUV68AhWusdhc13PpIRLH8zGd5Kf5abvA9Mq870eoPKyDlMd90/Gt
	/EcBOBdzHSRNArJB5IQi+VFqtIA37Rue4NNBxzFgttwH6FF5Odrjrfj0nCpN/39g9jf8
	AKKe1UYvdW6iBjyPzLaUJYMKGrv/+lMZZbNgZUYgbYhYFUA9ic46URyaSjqvJYF9VfNI
	8MhQ==
X-Gm-Message-State: AIkVDXI968/5MVVVucL6TJTUo1GuTZ8g0dtnE1opKTFDincOokbUNygkUJKggIFhYFiynA==
X-Received: by 10.28.132.193 with SMTP id g184mr2102148wmd.130.1482244247790; 
	Tue, 20 Dec 2016 06:30:47 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c81sm22313716wmf.22.2016.12.20.06.30.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Dec 2016 06:30:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Dec 2016 15:30:47 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161220143047.GF3275@jama>
References: <1481809716-24451-1-git-send-email-samuli.piippo@qt.io>
	<d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d4453d09-2112-0a1e-2812-0c63c932ca6a@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-qt5][PATCH v4] Upgrade to Qt 5.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2016 14:30:48 -0000
X-Groupsio-MsgNum: 64435
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline

--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2016 at 04:49:55PM +0200, Samuli Piippo wrote:
> Changes from v3 patch:
> - sha1s updated to expected RC content
> - fixed the qt3d assimp build-deps issue
> - the new Qt configuration system taken into use where applicable
>=20
> webengine build problem with x86_64 host and x86 target is still there.

This version seems to fail in qtwayland:

http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemuar=
m.20161218_140914.log//2_max/failed/qtwayland.log

| ERROR: Feature 'xcomposite-glx' was enabled, but the pre-condition
'features.wayland-client && features.opengl && !features.opengles2 &&
libs.xcomposite && libs.glx' failed.

Is the configure more strict in new version or do we need to change the
default config for qtwayland builds?

>=20
> -samuli
>=20
> On 15.12.2016 15:48, Samuli Piippo wrote:
> > The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> > the contents of an environment value when qmake is run instead of when
> > Makefile is processed. All OE_QMAKE_xxx variables need to be exported
> > for qmake to find them. configure's setBootstrapVariable function needs
> > to change $$(..) to normal $(...) operator to work with qmake's Makefil=
e.
> >
> > qt.conf generation for qtbase recipes is not needed, as configure will
> > generate its own version based on configure arguments. Skip running
> > qmake, since configure is now automatically invoked when it's run in
> > qtbase's root folder.
> >
> > Update PACKAGECONFIGs for qtbase to match current configure options.
> >
> > The new Qt configuration system [1] can be used with a new variable
> > EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
> > arguments.
> >
> > Merge the two qtwayland recipes to one that supports all three targets
> > (target, native, nativesdk) without need for additional patch.
> >
> > [1] https://www.mail-archive.com/development@qt-project.org/msg25257.ht=
ml
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFlAlgAKCRA3VSO3ZXaA
HNWTAJ9T37stjMwLPMe563VSkPPV0g80LACePX28U+g05+28ZyuHA6Dv8uR88Cw=
=oNw1
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--
