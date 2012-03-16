Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S8dyu-0006Vs-Rb
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Mar 2012 21:42:36 +0100
Received: by lagw12 with SMTP id w12so3729996lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2012 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=S420RecvcFIZzl8BInEGVmLgJ2eDExdkiEuPAhMZK6E=;
	b=cLI94jnJOj8hztsHEk3IpvpEKJzOYXpq0PaAQ4w+1zHtK1A/ht/p4Pwoj8RyhBsPuc
	I284RY33RnmI9NOu9Q8qeK8XQ66erqFK5C2ZK99HA9VdlPowh3p3kKvaTBEl2/VOJz0V
	SJp/6PmsiudUL3auLjSucIxY52U1/WuXgxjmrPRPzgnPfgmnplxFlNvo7Xe7rV5hjOcL
	5cz1zf1Zr7L2btrzZ7X1wcr+Cqan3KpFVcwcRqLEHpanM4i/Q/F4xk1tMZNV5/CHWnIj
	yNsQOhVsPfABmxM5cFk/w3ADUuZSPUZiWZUDJTOVk2ITzZy1SoKdReDHCUL3+5RosePH
	Vp/A==
Received: by 10.112.85.70 with SMTP id f6mr1533414lbz.16.1331930028672; Fri,
	16 Mar 2012 13:33:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.111.73 with HTTP; Fri, 16 Mar 2012 13:33:18 -0700 (PDT)
In-Reply-To: <1331896031-19776-1-git-send-email-b19537@freescale.com>
References: <1331896031-19776-1-git-send-email-b19537@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Mar 2012 13:33:18 -0700
Message-ID: <CAMKF1sr3LEOtn_wskti7GpNyY_z1U4yje+eOeMtDb7iL_z1okg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] strongswan: upgrade to 4.6.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 20:42:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

there are unpackaged files Plese fix those and send a V2

WARNING: For recipe strongswan, the following files/directories were
installed but not shipped in any package:
WARNING:   /lib
WARNING:   /lib/systemd
WARNING:   /lib/systemd/system
WARNING:   /lib/systemd/system/strongswan.service
WARNING:   /usr/lib
WARNING:   /usr/lib/ipsec
WARNING:   /usr/lib/ipsec/libcharon.la
WARNING:   /usr/lib/ipsec/libstrongswan.so
WARNING:   /usr/lib/ipsec/libhydra.so.0.0.0
WARNING:   /usr/lib/ipsec/libhydra.la
WARNING:   /usr/lib/ipsec/libcharon.so.0
WARNING:   /usr/lib/ipsec/libstrongswan.a
WARNING:   /usr/lib/ipsec/libcharon.so.0.0.0
WARNING:   /usr/lib/ipsec/libstrongswan.so.0
WARNING:   /usr/lib/ipsec/libcharon.so
WARNING:   /usr/lib/ipsec/libhydra.so.0
WARNING:   /usr/lib/ipsec/libstrongswan.la
WARNING:   /usr/lib/ipsec/libcharon.a
WARNING:   /usr/lib/ipsec/libhydra.so
WARNING:   /usr/lib/ipsec/libhydra.a
WARNING:   /usr/lib/ipsec/libstrongswan.so.0.0.0
WARNING:   /usr/lib/ipsec/plugins
WARNING:   /usr/lib/ipsec/.debug
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-fips-prf.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pem.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-sha1.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-aes.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pgp.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-openssl.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pkcs1.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-constraints.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-dnskey.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pgp.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-md5.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-xauth.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-xauth.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-updown.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-md5.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-random.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pkcs8.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-sha2.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-gmp.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-socket-raw.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-gmp.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-sha2.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-stroke.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-random.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-attr.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pubkey.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-dnskey.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pkcs8.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-x509.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-kernel-netlink.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-resolve.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-resolve.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pgp.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-hmac.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-aes.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-kernel-netlink.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pubkey.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-stroke.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-xauth.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pem.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-updown.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-des.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-fips-prf.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-resolve.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-xcbc.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-hmac.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-kernel-netlink.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-openssl.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-socket-raw.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-hmac.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-updown.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-openssl.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-sha2.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-xcbc.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-random.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-dnskey.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-xcbc.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-revocation.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-sha1.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-des.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pem.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pubkey.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-des.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-revocation.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pkcs1.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-gmp.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-aes.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-revocation.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pkcs8.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-attr.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-x509.so
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-stroke.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-socket-raw.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-constraints.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-x509.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-attr.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-constraints.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-fips-prf.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-md5.a
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-sha1.la
WARNING:   /usr/lib/ipsec/plugins/libstrongswan-pkcs1.la
WARNING:   /usr/lib/ipsec/plugins/.debug
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-fips-prf.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-openssl.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-constraints.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-dnskey.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-xauth.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-md5.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-random.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-pkcs8.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-gmp.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-stroke.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-resolve.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-pgp.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-kernel-netlink.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-pem.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-hmac.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-socket-raw.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-updown.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-sha2.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-xcbc.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-sha1.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-pubkey.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-des.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-revocation.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-pkcs1.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-aes.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-attr.so
WARNING:   /usr/lib/ipsec/plugins/.debug/libstrongswan-x509.so
WARNING:   /usr/lib/ipsec/.debug/libstrongswan.so
WARNING:   /usr/lib/ipsec/.debug/libhydra.so.0.0.0
WARNING:   /usr/lib/ipsec/.debug/libcharon.so.0
WARNING:   /usr/lib/ipsec/.debug/libcharon.so.0.0.0
WARNING:   /usr/lib/ipsec/.debug/libstrongswan.so.0
WARNING:   /usr/lib/ipsec/.debug/libcharon.so
WARNING:   /usr/lib/ipsec/.debug/libhydra.so.0
WARNING:   /usr/lib/ipsec/.debug/libhydra.so
WARNING:   /usr/lib/ipsec/.debug/libstrongswan.so.0.0.0




On Fri, Mar 16, 2012 at 4:07 AM,  <b19537@freescale.com> wrote:
> From: Zhenhua Luo <b19537@freescale.com>
>
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
> =C2=A0.../recipes-support/strongswan/strongswan_4.5.1.bb | =C2=A0 21 ----=
----------------
> =C2=A0.../recipes-support/strongswan/strongswan_4.6.2.bb | =C2=A0 21 ++++=
++++++++++++++++
> =C2=A02 files changed, 21 insertions(+), 21 deletions(-)
> =C2=A0delete mode 100644 meta-oe/recipes-support/strongswan/strongswan_4.=
5.1.bb
> =C2=A0create mode 100644 meta-oe/recipes-support/strongswan/strongswan_4.=
6.2.bb
>
> diff --git a/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb b/met=
a-oe/recipes-support/strongswan/strongswan_4.5.1.bb
> deleted file mode 100644
> index 3276fdd..0000000
> --- a/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION =3D "strongSwan is an OpenSource IPsec implementation for th=
e \
> -Linux operating system."
> -HOMEPAGE =3D "http://www.strongswan.org"
> -SECTION =3D "console/network"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> -DEPENDS =3D "gmp openssl flex-native flex bison-native"
> -
> -SRC_URI =3D "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "81a4a699c4a1a49b74061dfa47b5a033"
> -SRC_URI[sha256sum] =3D "252d7369d94aa2d79e6fad078853b07ca897ea811ab1e1a2=
b008bcec0d1e758a"
> -
> -EXTRA_OECONF =3D "--disable-curl --disable-soup --disable-ldap \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-gmp --disable=
-mysql --disable-sqlite \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-openssl"
> -
> -inherit autotools
> -
> -RRECOMMENDS_${PN} =3D "kernel-module-ipsec"
> -
> -FILES_${PN}-dbg +=3D "${libexecdir}/ipsec/.debug ${libexecdir}/ipsec/plu=
gins/.debug"
> diff --git a/meta-oe/recipes-support/strongswan/strongswan_4.6.2.bb b/met=
a-oe/recipes-support/strongswan/strongswan_4.6.2.bb
> new file mode 100644
> index 0000000..3816e57
> --- /dev/null
> +++ b/meta-oe/recipes-support/strongswan/strongswan_4.6.2.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION =3D "strongSwan is an OpenSource IPsec implementation for th=
e \
> +Linux operating system."
> +HOMEPAGE =3D "http://www.strongswan.org"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +DEPENDS =3D "gmp openssl flex-native flex bison-native"
> +
> +SRC_URI =3D "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "ed64e6746011930a70f3a271dc0e3c9e"
> +SRC_URI[sha256sum] =3D "a5ecb3fc60a94ded9197532c7ebf42e8e321223311e4a483=
4ea15219aa1625e4"
> +
> +EXTRA_OECONF =3D "--disable-curl --disable-soup --disable-ldap \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-gmp --disable=
-mysql --disable-sqlite \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-openssl"
> +
> +inherit autotools
> +
> +RRECOMMENDS_${PN} =3D "kernel-module-ipsec"
> +
> +FILES_${PN}-dbg +=3D "${libexecdir}/ipsec/.debug ${libexecdir}/ipsec/plu=
gins/.debug"
> --
> 1.7.0.4
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


