Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF9672D75
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 16:40:34 +0000 (UTC)
Received: by wevl61 with SMTP id l61so34537789wev.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 08:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fYInr0Kf5Qd10LB2LR43Nw6I85sWroix3oPZSo4kN/E=;
	b=Q6MR1m9wl3rjqxaHLtOAofkUEjK/xdIlyFOfPEKpv8avEmafBtadxFZ181hqxWKMUX
	1FZRl0V8fAv1bzNVKuqej/Oj6wi5MLBkN4jJPP91+Sx90Vq090UcZxy4ljgicg4tm+Ok
	21b2dSEcg8IdzE5CGpnLiwwPmqRvfHa8rEVzI+MVEEF5TALHzxYsxhTHkx2DhGYNwlUl
	NKg3XEsnDTW0Rj8dWnl1G9FF5nutfYgF++xgpZtPe2R95rHN80fXXlPAsFhvT6/XRiVA
	bSmsvVnnzY+IQl8t4fKwJryroUQS/jsm2T7sYuMyoXg+ZlzCvZWURqDK1ZKr9Njs/vLa
	Q13w==
X-Received: by 10.180.206.144 with SMTP id lo16mr15866473wic.28.1425314435079; 
	Mon, 02 Mar 2015 08:40:35 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h11sm16751792wic.14.2015.03.02.08.40.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 08:40:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Mar 2015 17:40:57 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150302164057.GD2309@jama>
References: <1425310228-14311-1-git-send-email-andy.nichols@theqtcompany.com>
MIME-Version: 1.0
In-Reply-To: <1425310228-14311-1-git-send-email-andy.nichols@theqtcompany.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] qtwebengine: change license to LGPL-3.0
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
X-List-Received-Date: Mon, 02 Mar 2015 16:40:41 -0000
X-Groupsio-MsgNum: 54589
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="27KoNqt0fmcl1zj/"
Content-Disposition: inline

--27KoNqt0fmcl1zj/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2015 at 04:30:28PM +0100, Andy Nichols wrote:
> The opensource license for qtwebegine as of Qt 5.4.0-beta
> has been changed to only be available under LGPL-3.0. The
> checksum for this license is already for the LGPL-3.0 version
> so no need to update.

Thanks, I'll add LICENSE.LGPLv3 to LIC_FILES_CHKSUM so that we catch
this next time.

file://LICENSE.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02

>=20
> Signed-off-by: Andy Nichols <andy.nichols@theqtcompany.com>
> ---
>  recipes-qt/qt5/qtwebengine.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.=
inc
> index a9c7005..29c31ef 100644
> --- a/recipes-qt/qt5/qtwebengine.inc
> +++ b/recipes-qt/qt5/qtwebengine.inc
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "QtWebEngine combines the power of Chromium and Qt"
> -LICENSE =3D "LGPL-2.1 & BSD"
> +LICENSE =3D "LGPL-3.0 & BSD"
>  LIC_FILES_CHKSUM =3D " \
>    file://src/core/browser_context_qt.cpp;md5=3D91895ac1852e1b07202d97161=
94e8dd8;beginline=3D1;endline=3D35 \
>    file://src/3rdparty/chromium/LICENSE;md5=3D537e0b52077bf0a616d0a0c8a79=
bc9d5 \
> --=20
> 2.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--27KoNqt0fmcl1zj/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT0kpkACgkQN1Ujt2V2gBwPHQCfYltno+sWIloVqnaPxxZOhqyI
/8UAn3whXv3DjCugxh8q/ikA730oW7z6
=WNol
-----END PGP SIGNATURE-----

--27KoNqt0fmcl1zj/--
