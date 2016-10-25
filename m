Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8992B71BDE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:33:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m83so1159063wmc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=10Hs+L8T3KftBekmO4Evu3j30D3Q74fMA3pJQyX5Vlo=;
	b=WkzbmQhXD7FAdQeYX17QmxZ7Jt2QJPmRg+HRn4mxnH3yMfMldxSm3urlasqSlRNOAh
	5gRzREI8f38VEMGiMEm1EpeqnNZfo7aOvmJFFy/QY2dlje1M0xmLvcKfd4B7etosdzsa
	LnIe1eFoUSWILQ5v6Gwhbnm3cuSwqEhLFa2AjOO8pcsMcuVC2sgjQX+2srt8zkKlI+kE
	K7g6Q7am6wlVvt0zmPXtOd4aXc+iZwxZfZMkrRm0uA7tS5mbs6WlvBBEtvQ/nSAe/gO3
	Ip8XiTPav0RS9kI91Jg2j/uGON85vMhsl8REKz1IACCWBHezD8+H8/ytuEHay5wjcI4v
	9e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=10Hs+L8T3KftBekmO4Evu3j30D3Q74fMA3pJQyX5Vlo=;
	b=HD/0oFuMuqSPbutJNXklw+NKLpdpY1uU8D96fMlKY8ZeHNc76FlaR8WCOhuwSzoEhh
	PErliGmi2hbpsakH6cbqaT5iFtpvc/XdOtc3pemZT0qgonuRfO5Jbp8O9U58omykdSVA
	Vpf+pESDqZFAw58CROCgFNLU0YLk+807cFs7B/d+kTAMPMsMr8ezgSzexQApEywxLyBV
	3AMoMCHZq4RqyPmIlYzOzRjAro1coWEVo7TO4Oqt98Q0FsE5xYPzpUEy/DYaUdCpwCf4
	fk1Ry6PHRqdzx/Jema7/Gn9GURGoIJUniR/C7K6wPweATClAvwVTBCwP6q9IA4eM5Qmq
	MJsw==
X-Gm-Message-State: ABUngvcDMVxEptGtqSTD4NWMGVQ8AU44RaPT9RQdGeFYxCUhkP/1YysopLdUDlLXNYqQeg==
X-Received: by 10.28.9.141 with SMTP id 135mr3388628wmj.68.1477402415423;
	Tue, 25 Oct 2016 06:33:35 -0700 (PDT)
Received: from localhost (ip-89-176-50-133.net.upcbroadband.cz.
	[89.176.50.133]) by smtp.gmail.com with ESMTPSA id
	za1sm25231538wjb.8.2016.10.25.06.33.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Oct 2016 06:33:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Oct 2016 15:33:34 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161025133334.GE2911@jama>
References: <1476836925-14631-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1476836925-14631-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: akuster@mvista.com
Subject: Re: [meta-networking][PATCH] wireshark: install missing header files
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
X-List-Received-Date: Tue, 25 Oct 2016 13:33:36 -0000
X-Groupsio-MsgNum: 63598
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dzs2zDY0zgkG72+7"
Content-Disposition: inline

--Dzs2zDY0zgkG72+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 05:28:45PM -0700, Armin Kuster wrote:
> Wireshark does not install header files. add install_append
> Remove ALLOW_EMPTY & INHIBIT_PACKAGE_DEBUG_SPLIT, they are no longer need=
ed

There is also:
wireshark-2.2.1: wireshark rdepends on libssh, but it isn't a build
dependency, missing libssh in DEPENDS or PACKAGECONFIG? [build-deps]

Probably not caused by this change, but one of previous 2 upgrades.


> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-support/wireshark/wireshark_2.2.1.bb   | 22 ++++++++++++++++=
+++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb=
 b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> index a5fb7f6..f7d7927 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
> @@ -43,7 +43,23 @@ PACKAGECONFIG[c-ares] =3D "--with-c-ares=3Dyes, --with=
-c-ares=3Dno, c-ares"
> =20
>  EXTRA_OECONF +=3D "--with-qt=3Dno --enable-tshark --enable-rawshark"
> =20
> -ALLOW_EMPTY_${PN} =3D "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +# Currently wireshark does not install header files
> +do_install_append () {
> =20
> -FILES_${PN} +=3D "${datadir}*"
> +	install -d ${D}/${includedir}/${BPN}
> +	install -d ${D}/${includedir}/${BPN}/epan
> +	install -d ${D}/${includedir}/${BPN}/epan/crypt
> +	install -d ${D}/${includedir}/${BPN}/epan/dfilter
> +	install -d ${D}/${includedir}/${BPN}/epan/dissectors
> +	install -d ${D}/${includedir}/${BPN}/epan/ftypes
> +	install -d ${D}/${includedir}/${BPN}/epan/wmem
> +
> +	install config.h ${D}/${includedir}/${BPN}
> +	install ${S}/register.h ${D}/${includedir}/${BPN}
> +	install -D ${S}/epan/*.h ${D}/${includedir}/${BPN}/epan
> +	install -D ${S}/epan/crypt/*.h ${D}/${includedir}/${BPN}/epan/crypt
> +	install -D ${S}/epan/dfilter/*.h ${D}/${includedir}/${BPN}/epan/dfilter
> +	install -D ${S}/epan/dissectors/*.h ${D}/${includedir}/${BPN}/epan/diss=
ectors
> +	install -D ${S}/epan/ftypes/*.h ${D}/${includedir}/${BPN}/epan/ftypes
> +	install -D ${S}/epan/wmem/*.h ${D}/${includedir}/${BPN}/epan/wmem
> +}
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Dzs2zDY0zgkG72+7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgPXy0ACgkQN1Ujt2V2gBwpEQCfcH1ysRBV3O0fEa2FGTjP0BAe
kyYAnjgFw2u22FuG/x+NQq7vL+kgfHtv
=+Cf6
-----END PGP SIGNATURE-----

--Dzs2zDY0zgkG72+7--
