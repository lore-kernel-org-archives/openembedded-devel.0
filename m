Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 346D8606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 17:52:30 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id q128so222154493wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 10:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Vv57MCtokDibxglIf7GTaQc8edFC11WvHtGz/rnZLeI=;
	b=EwqfBzXUkDuRHrXcri6oEVkWxRzjJtsa1VDPOyY+gcKcFUj1vc5/aJt0nan+uV0rZ1
	DQVS/jDeCE70gK9YJkvoif1Q0V5JsZSoBtA9nET0VQE+PGilSwcS6CKQoBULIn9WpOeI
	3/99oSIEaya2qvXl9z+nLPfohjftQyEjos6vtrhfGP5UIIHFP7mTcEcA2fynTWG4pPkf
	+UntgNrZdE6XddatRApB58s1fWAjCmH9hqGvzWwcR738VTFIX/KicRHVefndgTCuElb+
	ERRFZVxPXa5GcB9FNlakAAyyYQ9a/Gtkxa68cN+XBlwVQg9RtywI5qVVHp8NQsOEj/oX
	hPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Vv57MCtokDibxglIf7GTaQc8edFC11WvHtGz/rnZLeI=;
	b=f8Xtn0Y/orjbr331+UY2qIN+/2fQwOZYYHzQeO/Grp99rcKDZ6+nUW6qYPPVHlOixk
	6/IDBwjzqlmHmRmVCvZjhrQ1bkbBKAbdXvu05yO9BNPckno9tRddJG6VTJlEUZwzbbwL
	bYtPVaFm1Nq8Wt2ZSCmfsf6SKGB2BnWad3FQ3Kr7KIIB7C3fiVnmQhx1RmvUlio6Oyng
	wtXkAPEV77oZsjfcwoBAAeM89NYDGvtVUiycZY7Xq1a3NtZJg5u1no35OL3UASqyKcQf
	l5EZz1NAZINRPekPo5hKWG0JdJKwYRW/0G39b4UQL1C28JQUr4PR8moP3iOrWasSqEMu
	2YMQ==
X-Gm-Message-State: ALyK8tIbR5eoF+NukkFTw2mAclC5fCl42sg+nlJRIj4UOJXCB0TuspaCNSidqrYkY937DA==
X-Received: by 10.28.48.202 with SMTP id w193mr43959289wmw.54.1469641951041;
	Wed, 27 Jul 2016 10:52:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id e65sm8277979wmg.3.2016.07.27.10.52.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jul 2016 10:52:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jul 2016 19:52:33 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160727175233.ievi7td4hzal5pgv@jama>
References: <20160727154953.13918-1-Martin.Jansa@gmail.com>
	<3f91bfa8-d87d-9e79-c38d-e4b10a74c1ae@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3f91bfa8-d87d-9e79-c38d-e4b10a74c1ae@gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-qt5][WIP][PATCH] qt5: upgrade to latest revisions in 5.7 branch
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
X-List-Received-Date: Wed, 27 Jul 2016 17:52:31 -0000
X-Groupsio-MsgNum: 62370
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lhyqnqyuipc2ldyp"
Content-Disposition: inline

--lhyqnqyuipc2ldyp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 08:33:58PM +0300, Vesa J=E4=E4skel=E4inen wrote:
> Hi,
>=20
> ...snip...
>=20
> I did not see the license change from GPLv2/LGPLv2.1 -> GPLv3/LGPLv3.=20
> Was this some previous change or just forgotten one? With quick look I=20
> did not spot GPLv3 mentions in meta-qt5 in github.

It was done in first upgrade to 5.7 revisions, see:
https://github.com/meta-qt5/meta-qt5/commit/bf2cafa909a27250f853a823e9d7101=
307337e7a

> Because of this dramatic license change I would recommend keeping old=20
> 5.6 available so if one blacklists GPLv3 & LGPLv3 then old one gets=20
> picked up.

5.6 version is still maintained in krogoth branch, we had multiple qt5
versions in meta-qt5 before and it was causing more maintenance
overhead, I won't do it again

> I suppose right way to handle this special licensing case is to define=20
> license as being by default GPLv3 | LGPLv3 and then if company purchases=
=20
> license for Qt5.7 then override recipes license with something like=20
> LICENSE_pn_qt5 =3D "commercial" in local.conf or own layer with matching=
=20
> .bbappend?
>=20
> Another related question is that what is recommended method to select=20
> license? As some software is under multiple licenses and then we would=20
> select one of those licenses and then only want that license to be=20
> collected for image.
>=20
> I suppose this would need similar method as what PACKAGECONFIG[...] but=
=20
> with LIC_FILES_CHKSUM[foo] and then you select one with LICENSE=3D"foo"?

LICENSE and LIC_FILES_CHKSUM don't influence how the recipes are built
or which packages get installed in image. It's responsibility of the
integrator to disable e.g. PACKAGECONFIG options which include sources
with incompatible license - yes it could be improved - patches welcome.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lhyqnqyuipc2ldyp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleY9OAACgkQN1Ujt2V2gBwAUQCgjY5F3N2e3hQpNYxX4DKFqHjk
lE4AmwekUFZkkkq190A+1Pg/cWAAUkny
=55kV
-----END PGP SIGNATURE-----

--lhyqnqyuipc2ldyp--
