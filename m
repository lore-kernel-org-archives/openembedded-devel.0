Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6854F73695
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 12:20:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v143so1789712wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2016 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=pfQhdPoJ3s8c3CY+h5wh/nMH5zgR6udUj+Yhx0SBKFs=;
	b=W6+FSILgBPZPVd+VVcS9FZ4QGSczX7PcVF0+DyAKSYgAUY2m+kWlkJy44s5nADf4em
	0+PpWP5HUCZQ0my33RLDUxAx8fddFKoLKhGsh9bGXFjw++2f/2KmUHMtLNzQPIbdBRmc
	sd1Fo37W2svqBDgs6c43L4txKyVDMKKMs9pkPjVbiet6b1XzYvno6ep7EOleEOXWTlnO
	BUGLZfOa7b6u/mikAzg14cnWuYsrNBKdp8IhnIuunfqmp9He/S6UlPLHPa9RuP37ZtGG
	VuJvgf02wRn9uinBxeiCKOSNu/qOLh+UxhW4BzGWa7nXi7ZYcFzQHi3iYZMlu6YGo7z6
	gIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=pfQhdPoJ3s8c3CY+h5wh/nMH5zgR6udUj+Yhx0SBKFs=;
	b=hMSy4nHZsBrjEsbT2ejIpWD3oPu3WCawEhgxy1vvawP1ben5m6gqf+XQrooDhoDnNP
	Kft6RYwH3fd00UvtkxAq6Z/Ttnvr5GI0e4hRfcBMSJWg72+2MYlWm+inOFr7hq/RXaB7
	lOl0eYXqF0n+2wXJ+iYAmK+sR3AVByGtokV500ryTdLzs4UDstU6/Pxxzc/7g6bB3Jcb
	Z91xvWpb12XHfbjne2mRmlUY7xqeD5i12O+grRknsNYb4ECAck1hiypLrpAgScHEshaX
	xOpfck87JGrf9rG0lgSurMEBxVpFS6KLI17g3TO0P3Fz0Vz/hn8vEL50Wu5Rx6IiooEM
	LVoQ==
X-Gm-Message-State: AE9vXwM64Y3rp4T+WQmWpD6HQMNfAIUATC+g1kEOHfC4nrDhIhQQArgfpGM39Zz2J5Xh8w==
X-Received: by 10.194.118.132 with SMTP id km4mr14066723wjb.158.1472732445126; 
	Thu, 01 Sep 2016 05:20:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a21sm14122873wma.10.2016.09.01.05.20.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Sep 2016 05:20:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 1 Sep 2016 14:20:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160901122045.gpuxub43upiiniyt@jama>
References: <1471921830-2919-1-git-send-email-Zhixiong.Chi@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1471921830-2919-1-git-send-email-Zhixiong.Chi@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] mariadb: add libdbi-perl to the depends of mariadb-server
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
X-List-Received-Date: Thu, 01 Sep 2016 12:20:45 -0000
X-Groupsio-MsgNum: 62943
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g5pepnjoryv7hbxy"
Content-Disposition: inline

--g5pepnjoryv7hbxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 11:10:30AM +0800, Zhixiong Chi wrote:
> The commands(mysql_convert_table_format and mysql_setpermission) need
> to the supported API provided by the libdbi-perl package.
> So add the libdbi-perl to the variable RDEPENDS of mariabdb-server.

This isn't possible, libdbi-perl is in meta-perl and mariadb is in
meta-oe.

meta-oe doesn't depend (and cannot) on meta-perl.

> Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
> ---
>  meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-=
support/mysql/mariadb.inc
> index 73905b6..c2d2ecf 100644
> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> @@ -169,7 +169,7 @@ RDEPENDS_${PN}-client =3D "perl perl-module-getopt-lo=
ng perl-module-file-temp \
>  RDEPENDS_${PN}-server =3D "perl perl-module-getopt-long perl-module-data=
-dumper \
>      perl-module-file-basename perl-module-file-path perl-module-sys-host=
name \
>      perl-module-file-copy perl-module-file-temp perl-module-posix \
> -    ${PN}-client"
> +    ${PN}-client libdbi-perl"
>  RDEPENDS_${PN}-leftovers =3D "perl perl-module-cwd perl-module-benchmark=
 perl-module-getopt-long \
>      perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-m=
odule-threads \
>      perl-module-threads-shared perl-module-io-socket perl-module-sys-hos=
tname perl-module-file-copy \
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g5pepnjoryv7hbxy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfIGysACgkQN1Ujt2V2gBy4PgCffBop10DVGnwErAJKBnd69KEC
bkEAn2vE5uhMDWoyuS0SHI06bENtuY0+
=im4g
-----END PGP SIGNATURE-----

--g5pepnjoryv7hbxy--
