Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7D22760621
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Mar 2016 11:03:22 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id p65so65841982wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2016 03:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DMO6h6yeXG/gE2IAH6Ebb0nFJ5lg78TUI3VOic4fYIU=;
	b=bjuzrJTlh8H7s25P5l7tV1KpRJVk4xusQ2ip6/+3vN3n6ALOTFcAbdOXF7DJpALLDE
	8PJWWqXFLFFBkqNzUBq1fqL1GzruhDEX/b1lhLfxHfBxjUveT2VjYRgQ0eS9ZdwIbH4V
	BBPYfn35zAaWrLssBgX5zLPrjeAxChej57bnGQh1BMxhNX1OARQKzWEMz/3bwFm7BsAu
	RkRAMUllg1b5I+PUINFKlHHU7JlwVsg57JVj48OworEfWHfdkvZE8cmAzMxOdUqje+7P
	iHTTIpAkC6gZN04TII0PmLKHRHT3keByEPzJQZHpJO7ecfg4M57LqxL9w0txoKFPwh34
	qsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DMO6h6yeXG/gE2IAH6Ebb0nFJ5lg78TUI3VOic4fYIU=;
	b=mgatOcZJNF3BEumTef/sI8Nv4oYoheIsWJ3HduVsIp+BwuEYzvouVQFIc4V3cG1hZV
	36REgB2wu248Iffyqnzr3x+yNpbrgn+4gwicg/6VP67l7jMgBqbUuDtjCAXQG7YudCJ1
	8xL+sL9+hfZsp9+/JWrla9CwJNLN8/x81T5xVQY8TgPOCctqkqjfeIO2p5WlWV/ZNWL2
	yOK1bepuqHtbhNIvlXAxuuedn1DhlgABS1czzQzqQOpefc5PIc1mKlvZ4MhF+mh8Ebfi
	RyKNp2lgw5fpHvIZAEY+pH9FrFa10NvkqoLXg9zrqc+14BbYBai3r7xJZCLBhXRtXQdA
	Rmzw==
X-Gm-Message-State: AD7BkJKCfdTVA36ISGQtlnDJ4HSvYkPrSp9C8vKdUC4/yjruSa7NvscnLCW40BeDCztHSA==
X-Received: by 10.194.91.233 with SMTP id ch9mr22369098wjb.121.1457348602581; 
	Mon, 07 Mar 2016 03:03:22 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h7sm4304205wmf.9.2016.03.07.03.03.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Mar 2016 03:03:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 7 Mar 2016 12:05:50 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160307110550.GB2549@jama>
References: <001f01d17834$96b03d60$c410b820$@neuf.fr>
	<005f01d1785e$45a81f80$d0f85e80$@neuf.fr>
MIME-Version: 1.0
In-Reply-To: <005f01d1785e$45a81f80$d0f85e80$@neuf.fr>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH] Add armv7ve in the supported MACHINES for qtwebengine
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
X-List-Received-Date: Mon, 07 Mar 2016 11:03:24 -0000
X-Groupsio-MsgNum: 60361
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline

--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2016 at 11:44:02AM +0100, Herve Jourdain wrote:
> ARM CortexA7 is now defined as armv7ve.

Your e-mail client completely broke the path, please use git send-email.

And there is already patch for this:
http://patchwork.openembedded.org/patch/116967/
with correct format and much better summary.

>=20
> =20
>=20
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr
> <mailto:herve.jourdain@neuf.fr> >
>=20
> ---
>=20
> --- a/recipes-qt/qt5/qtwebengine_git.bb
>=20
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
>=20
> @@ -47,6 +47,7 @@ COMPATIBLE_MACHINE_x86 =3D "(.*)"
>=20
> COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
>=20
> COMPATIBLE_MACHINE_armv6 =3D "(.*)"
>=20
> COMPATIBLE_MACHINE_armv7a =3D "(.*)"
>=20
> +COMPATIBLE_MACHINE_armv7ve =3D "(.*)"
>=20
> =20
>=20
>  inherit qmake5
>=20
> inherit gettext
>=20



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbdYI0ACgkQN1Ujt2V2gBxvAQCgrpokqAIFUEz3aoz2xRTkxZy5
qA4An0mEYxro091cQtyOHnGJxBWPs+Fx
=AGal
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
