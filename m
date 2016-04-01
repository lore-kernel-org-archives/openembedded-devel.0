Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E08773204
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 11:26:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 139so3829738wmn.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 04:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LZ2hY535Pl8b3n9CNRBO/TeUux321ZAa2x/VDi7UH78=;
	b=SWR+3HjUJx285jKcy30ZEMIZw4drpbI2HNWDaE/sA5uW1MNcOrpvGOBUwLtSv61awf
	Pdsa4gapB4urOZiftp+mbuJ6X6/wyGedkyFHxkWisIEm9kT25EhcWeX6CkUjI6g1pGv9
	iHdnCy3zhx0VUO7+Q0ozoJFy7ZfHng0SUkZ/dsZkAyMgGQUm07Domaf5zh+rUQVGvprs
	1WyE/GHPcjEK+UpUNvFRE26g5PtsGv5q7vtHmd+FSP/u42Cj9ZU1pLmwb6lfvhS+CvDo
	6XZkG6lnhbpNo6key4k1w+KwdKCYlVKtGcvZhT5+U7H2/qHGddJlQRVK8eiebKA/irlF
	f6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LZ2hY535Pl8b3n9CNRBO/TeUux321ZAa2x/VDi7UH78=;
	b=Ucv46cE5jvKxv8Oqn6/5hEW72a31PbhCCku8R8WPR4zMvIjpPbnNfLAF8ruxTIBxMI
	5wy2HU7XTrufurxMtiEYZPWiS+7jAryLsQj0A+18NxBHybrykaLEc0oY5nPkRuc/GW1C
	Mnvbd5lpR/CDApHPJ4bi1g/XQc5H+anVVBNDGvLpw75tR6hcJYZZQhYwZhhToL+yl2wy
	MlnpZ95JhWC+tYdV72fDikWMrhKJCAHZVQaHvviI8lMkr7wnGmhitG+6EvTQiZZHJqQJ
	oxwMDbrh50HNe8ZdZA/UBAQ2yMEzJVAie3jY4XntUJEix6Wm0fKS+ezqlLR2Fh1p76TJ
	2ZQQ==
X-Gm-Message-State: AD7BkJIj0WMhB+rtlb72Eow/oAp40TVmg9GJLOM9fBO5DVeL9aekdSKP95J9ix3bHVQILA==
X-Received: by 10.28.57.214 with SMTP id g205mr1330287wma.24.1459510011000;
	Fri, 01 Apr 2016 04:26:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	138sm14365957wmf.13.2016.04.01.04.26.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Apr 2016 04:26:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Apr 2016 13:27:04 +0200
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160401112704.GC2567@jama>
References: <1459171173-1527-1-git-send-email-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <1459171173-1527-1-git-send-email-adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] openconnect: add recipe
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
X-List-Received-Date: Fri, 01 Apr 2016 11:26:51 -0000
X-Groupsio-MsgNum: 60775
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline

--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2016 at 04:19:33PM +0300, Ioan-Adrian Ratiu wrote:
> openconnect is a FOSS VPN client designed to work with Cisco AnyConnect
> and Pulse Connect Secure (Juniper SSL).
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../recipes-connectivity/openconnect/openconnect_git.bb  | 16 ++++++++++=
++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/openconnect/open=
connect_git.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect=
_git.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_git.=
bb
> new file mode 100644
> index 0000000..241de30
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Open client for Cisco AnyConnect VPN"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LGPL;md5=3D243b725d71bb5df4a1e5920b=
344b86ad"
> +
> +DEPENDS =3D "vpnc libxml2 gnutls"

It is trying to check vpnc-script on host:

| configure: Applying feature macros for GNU build
| configure: error: /etc/vpnc/vpnc-script does not seem to be executable.
|  OpenConnect will not function correctly without a vpnc-script.
|  See http://www.infradead.org/openconnect/vpnc-script.html for more detai=
ls.
|=20
|  If you are building a distribution package, please ensure that your
|  packaging is correct, and that a vpnc-script will be installed when the
|  user installs your package. You should provide a --with-vpnc-script=3D
|  argument to this configure script, giving the full path where the script
|  will be installed.
|=20
|  The standard location is /etc/vpnc/vpnc-script. To bypass this error and
|  build OpenConnect to use the script from this location, even though it is
|  not present at the time you are building OpenConnect, pass the argument
|  "--with-vpnc-script=3D/etc/vpnc/vpnc-script"
| NOTE: The following config.log files may provide further information.
| WARNING: exit code 1 from a shell command.
| NOTE: /home/jenkins/anaconda/build-webos-wearable-master/build/BUILD/work=
/qemux86-webos-linux/openconnect/7.06-r0/build/config.log

> +
> +PV =3D "7.06"
> +
> +SRCREV =3D "35542d52202672b8c12ecc63867432128244013a"
> +SRC_URI =3D "git://git.infradead.org/users/dwmw2/openconnect.git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF +=3D "--disable-static"
> --=20
> 2.7.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb+WwcACgkQN1Ujt2V2gBw9uwCfeTw4vupMs863ya8B2gJZzBjP
g4MAn2/6gggHGhIgR7JI+cofquZQyw+b
=gnw0
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
