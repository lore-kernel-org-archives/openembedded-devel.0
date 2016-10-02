Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 500546FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Oct 2016 23:13:59 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t25so2471218pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Oct 2016 16:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=QkUffcafHF85fO7/2gefGk7g57LgUnD+jf7uyyu9pfw=;
	b=y1KFWHplW3izD8zfw9HbPaUqO+tuXxfihCQjN6wGo/hj3kwrg2WcoOfGGYeKEST17M
	yj/NaQo1N3UyzT25q4Tz8aI3mkl0utx1ILbF3e2mJroJx88HbkNbQL5tl5XyUMQHOZrp
	Gm5ncf2/x40hGpTsca2FD87xHf8qwvIRXTpUBYRpJZykivWZXZ58qFJC5U9AsiB8M7WO
	Z77Hp7Zmamhm/xCtWL0YnJ5XDAmhUI5IBQ9HE3gEfqEQMKYYQ9jbD/elRtn/dZef2hFd
	Om3UCldvsJwbflW3yLnqjmp+UyWHeLNxhOaWnNxix2G05DPtECI0q/dG9W3CxnzC1egW
	TRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QkUffcafHF85fO7/2gefGk7g57LgUnD+jf7uyyu9pfw=;
	b=S7fGQIE4t0I7A5gK71WH7eHmq1ui2mN+bDNbqUVDirkcs9M7R/X8VduV4bhhncVvfy
	NHPjtEjU3tBZ+h1j4Iy/0sXq/jmCT+tt+1BF4u5OEM5ktwp4aBdEMB/511Fek0IObML7
	KnYgn/2LVCVN2d31wc+PwZGtF3NdUoravTwPEZiK1ciJ8IQysvH3c5OBduqmuCQG3/yD
	Wcqkxq4FpL+oFy4GuLu23QFtKbvNSyAiNhFTm/rZdu1e9IcHtE6ZG5AZLTtlJZtC6idK
	ask5+atxx0x7OtGC5ufJX2JclHZ5LQ04tb98uZr4nzN+4dcIPQ4alvYGr1atkFncty0C
	D3hA==
X-Gm-Message-State: AA6/9RneEDc2RRdoUnJIpfq4bvyyvpWu9+ue18KfJvbQA/FVIg7d1o41pfBzHKOxIPv0pw==
X-Received: by 10.98.10.93 with SMTP id s90mr3689546pfi.43.1475450041371;
	Sun, 02 Oct 2016 16:14:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:4b8:204d:45de:e844?
	([2601:646:8882:b8c:4b8:204d:45de:e844])
	by smtp.gmail.com with ESMTPSA id
	sl9sm42324290pab.22.2016.10.02.16.14.00
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 16:14:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1473387111-23110-1-git-send-email-akuster808@gmail.com>
Date: Sun, 2 Oct 2016 16:13:56 -0700
Message-Id: <B8D42A36-5D39-4F04-9A13-7A9507505170@gmail.com>
References: <1473387111-23110-1-git-send-email-akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: akuster@mvista.com
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.2
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
X-List-Received-Date: Sun, 02 Oct 2016 23:14:02 -0000
X-Groupsio-MsgNum: 63367
Content-Type: multipart/signed;
	boundary="Apple-Mail=_595B16F1-27E6-4BE2-A28C-6F96151C675E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_595B16F1-27E6-4BE2-A28C-6F96151C675E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 8, 2016, at 7:11 PM, Armin Kuster <akuster808@gmail.com> wrote:
>=20
> remove unused config params.
> Drop PE

Thats going to cause problem for feeds

> Drop do_configure_prepend
> update PACKAGECONFIG's for graphics
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
> .../{wireshark_2.0.5.bb =3D> wireshark_2.2.0.bb}     | 24 =
++++++----------------
> 1 file changed, 6 insertions(+), 18 deletions(-)
> rename meta-networking/recipes-support/wireshark/{wireshark_2.0.5.bb =
=3D> wireshark_2.2.0.bb} (69%)
>=20
> diff --git =
a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb =
b/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> similarity index 69%
> rename from =
meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> index 31ca4d2..dca3be6 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
> @@ -8,21 +8,16 @@ DEPENDS =3D "pcre expat glib-2.0 sbc"
>=20
> SRC_URI =3D =
"https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
>=20
> -SRC_URI[md5sum] =3D "627b5fc6cf0aeca196c75debd5e69b14"
> -SRC_URI[sha256sum] =3D =
"0ce0241330828973f5b4efee422a3760cab8ce0b41e7721c4b9fd185be1bb10b"
> -
> -PE =3D "1"
> +SRC_URI[md5sum] =3D "c7de0997f74934f25b456846cf75cb81"
> +SRC_URI[sha256sum] =3D =
"a6847e741efcba6cb9d92d464d4219917bee3ad0b8f5b0f80d4388ad2f3f1104"
>=20
> inherit autotools pkgconfig perlnative
>=20
> ARM_INSTRUCTION_SET =3D "arm"
>=20
> -# Works with either gtk+ or gtk3.
> -WHICH_GTK =3D "gtk+"
>=20
> PACKAGECONFIG ?=3D "libpcap gnutls libnl libcap"
> PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "x11", =
"gtk2 graphics", "", d)}"
> -PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", =
"ipv6", "", d)}"
> #PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", =
"opengl", "gtk3", "", d)}"
>=20
> PACKAGECONFIG[libcap] =3D "--with-libcap=3D${STAGING_LIBDIR}, =
--with-libcap=3Dno --enable-pcap-ng-default , libcap"
> @@ -30,10 +25,9 @@ PACKAGECONFIG[libpcap] =3D =
"--with-pcap=3D${STAGING_LIBDIR} --with-pcap-remote, --wi
> PACKAGECONFIG[libsmi] =3D "--with-libsmi=3Dyes, --with-libsmi=3Dno, =
libsmi"
> PACKAGECONFIG[libnl] =3D "--with-libnl=3Dyes, --with-libnl=3Dno, =
libnl"
> PACKAGECONFIG[portaudio] =3D "--with-portaudio=3Dyes, =
--with-portaudio=3Dno, portaudio-v19"
> -PACKAGECONFIG[gtk2] =3D "--with-gtk2=3Dyes, --with-gtk2=3Dno, gtk+"
> -PACKAGECONFIG[gtk3] =3D "--with-gtk3=3Dyes, --with-gtk3=3Dno, gtk+3"
> -PACKAGECONFIG[graphics] =3D "--enable-wireshark, =
--disable-wireshark,"
> -PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
> +PACKAGECONFIG[gtk2] =3D "--with-gtk=3D2, , gtk+"
> +PACKAGECONFIG[gtk3] =3D "--with-gtk=3D3, , gtk+3"
> +PACKAGECONFIG[graphics] =3D "--enable-wireshark, --with-gtk=3Dno =
--disable-wireshark,"
> PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes, --with-gnutls=3Dno, =
gnutls"
> PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes, --with-gcrypt=3Dno, =
libgcrypt"
> PACKAGECONFIG[ssl] =3D "--with-ssl=3Dyes, --with-ssl=3Dno, openssl"
> @@ -44,15 +38,9 @@ PACKAGECONFIG[geoip] =3D "--with-geoip=3Dyes, =
--with-geoip=3Dno, geoip"
> PACKAGECONFIG[plugins] =3D "--with-plugins=3Dyes, --with-plugins=3Dno"
>=20
> # these next two options require addional layers
> -PACKAGECONFIG[adns] =3D "--with-adns=3Dyes, --with-adns=3Dno, adns"
> PACKAGECONFIG[c-ares] =3D "--with-c-ares=3Dyes, --with-c-ares=3Dno, =
c-ares"
>=20
> -EXTRA_OECONF +=3D "--with-qt=3Dno --enable-usr-local=3Dno =
--enable-tshark --enable-rawshark"
> -
> -do_configure_prepend() {
> -    # force to use fallback
> -    sed -i -e '/^glib_prefix/s/=3D.*$/=3D""/' ${S}/aclocal-flags
> -}
> +EXTRA_OECONF +=3D "--with-qt=3Dno --enable-tshark --enable-rawshark"
>=20
> ALLOW_EMPTY_${PN} =3D "1"
> INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_595B16F1-27E6-4BE2-A28C-6F96151C675E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfxlLgACgkQuwUzVZGdMxScBQCbBkChEOw8Hj0fG5FfpRYeQd+F
GKcAnA0HTGUx4XL9ASqUFn/dgxl4OxVt
=Eq07
-----END PGP SIGNATURE-----

--Apple-Mail=_595B16F1-27E6-4BE2-A28C-6F96151C675E--
