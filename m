Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9272171BA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:19:16 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 196so22066840wmm.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 04:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8Qo2i0oXEhuJbOyJDBFrXg0ZOzwHNRp01y9DJn5O9Tk=;
	b=ngh+jaPFmx9Zom7gsh99f/3lC1P58rxNLyIyZ1NH5ElAMX6/BvGCajKUEUexZr04FC
	qsp6PvPth913AY6qwFfo1/4W2cFQNYtZ1n0yrvMFpHTNOYuz0Ly3E61Si5HW5BeEvsq1
	hU7dfnVt9Twu2nJ693JlkEw4Fi9H4PUls4YKurwbD2lA91iG7CahzL242PoIIUno+fNx
	it4+c+P+/Ih+qKY5FjDPV4z2tWTXSGIOQcNSsnWnaLOqVP4DsvjIK72HU2NF++PA5GhG
	QCOyB6WyEz02I2afVMKUn07rDAJmyEP6KllXn+1LYDrAEzdW2MMz2FH7wUUPXKmRrM4e
	gMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8Qo2i0oXEhuJbOyJDBFrXg0ZOzwHNRp01y9DJn5O9Tk=;
	b=L/XtDssXKw7p239uJ2K9FTsZyldoMvBW51ylQlCUumL6KHlGxXx2ZgY6iaWmXGNfIA
	JNG8+l9JbDH0Gnrqw48TzSvW0ikDX7jQnywM/6cPbCteXp+zcFQoN/Ui1k5Ody5+qOkb
	8sAeOFMRC/kREaMGVqoQjL5l06T+dP+rWWgqOu1mqYHR9/0DNXIv73KaHYO9J4JbEhr6
	7QiadV+3meK0K/T3mn1KVBZzeiLXA6Ftddx6XVtmkB4zvMEVXQc+LjjZH2st7LPWGjga
	kS428DOrK2R+Ay4u/aacp1gB82OF8tqAkV0JJblpP8Gorv77nPU6n/PxPRzSbYPWv4cS
	pdPw==
X-Gm-Message-State: AMke39nZch7l5jAexdBCAb2jkQEESxT53y6yIevWURwDKPQzm+3OA0/4PhSwvQy0l5BVZQ==
X-Received: by 10.28.172.68 with SMTP id v65mr10813717wme.49.1487593156100;
	Mon, 20 Feb 2017 04:19:16 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z10sm13229594wmg.31.2017.02.20.04.19.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Feb 2017 04:19:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Feb 2017 13:19:15 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170220121915.GC3266@jama>
References: <alpine.LFD.2.20.1702200641270.22953@localhost.localdomain>
	<alpine.LFD.2.20.1702200709170.28884@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1702200709170.28884@localhost.localdomain>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: "Can't install krb5-dev-1.13.6-r0@ppc7400: no package provides krb5 = 1.13.6-r0"
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
X-List-Received-Date: Mon, 20 Feb 2017 12:19:16 -0000
X-Groupsio-MsgNum: 65339
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline

--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 07:10:56AM -0500, Robert P. J. Day wrote:
> On Mon, 20 Feb 2017, Robert P. J. Day wrote:
>=20
> >   ok, i hope this issue is not trivially simple. i'm building
> > core-image-minimal for qemuppc, and tossing in a bunch of other
> > recipes, everything builds until:
> >
> > ///// start /////
> > ERROR: core-image-minimal-1.0-r0 do_rootfs: Unable to install
> > packages. Command
> > '/home/rpjday/oe/builds/qemuppc_oe_small/tmp/work/qemuppc-poky-linux/co=
re-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/smart
> > --log-level=3Dinfo
> > --data-dir=3D/home/rpjday/oe/builds/qemuppc_oe_small/tmp/work/qemuppc-p=
oky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/smart
> > install -y packagegroup-core-boot@qemuppc rpm@ppc7400
> > packagegroup-wrl-regular-recipes@all smartpm@ppc7400
> > run-postinsts@all' returned 1:
> > Loading cache...
> > Updating cache...
> > ######################################## [100%]
> >
> > Computing transaction...error: Can't install
> > krb5-dev-1.13.6-r0@ppc7400: no package provides krb5 =3D 1.13.6-r0
> >
> >
> > ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> > ERROR: Logfile of failure stored in:
> > /home/rpjday/oe/builds/qemuppc_oe_small/tmp/work/qemuppc-poky-linux/cor=
e-image-minimal/1.0-r0/temp/log.do_rootfs.22573
> > ERROR: Task
> > (/home/rpjday/oe/dist/layers/poky/meta/recipes-core/images/core-image-m=
inimal.bb:do_rootfs)
> > failed with exit code '1'
> > ///// end /////
>=20
>   a simple solution was to add the line:
>=20
> ALLOW_EMPTY_krb5 =3D "1"
>=20
> to my local.conf. is that really the proper fix?

Removing the runtime dependency on krb5 from krb5-dev is usually
preferred, search ML it was discussed few times.

>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKrewgAKCRA3VSO3ZXaA
HIrrAJ92Ds4qRHIt9Umco/wSp9SLpOymmgCfVW51dTbfh5lT6RCTPoXvo34BCAY=
=E9n2
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
