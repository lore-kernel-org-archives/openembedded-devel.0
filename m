Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C105B73289
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 02:09:11 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i6so6495675pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=qon8jHdu3OPsYxpJ0+PmQEVbsxKVv5T9To+Y4HJPFK4=;
	b=UZcGPFXvM8K6TOnxX1p+8b7yjxh+6mzhTGIB9mZzu5x8DR9UEDDnESus+g1TUbp7NO
	mTd0lL34asj++hrstPQ4PDxPkL9FpdVdRAHD4M61WkzZmUnUmcPZSByqyNlzmkcp88h6
	PAX2HD7JFPlEYwYhcAE64ZCKDeh1+K00r18d9wUY9aqXsNT+20QHQzykxN0znqn+BvcR
	QZ9Ey0F0N+E4GHLMdDoZv7i9SsCJwje7NAGDt+NXbh5J/xl2BkxABhijGepIJsY6fbWC
	lGjkjBJRnvRhGhdaB2hfu9RGNf9g9fSgQJuMKTHtUTE+6Pf9n+X6xXKPuNzs1ANB+QY2
	ff3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=qon8jHdu3OPsYxpJ0+PmQEVbsxKVv5T9To+Y4HJPFK4=;
	b=itmmDgkKKrbtYuv3KRYL8tRNt5AS3WdcG5yOUGwhgGfyafQCdyFXqWLB0FKbVA54DR
	zvQ2FYuIs4KiBAYkse44cJNhYpfh5JlDwvNyyccFXcBOSICIxRVgGLSuLJmOcg9MGpp8
	ee/CXCD0afTX8WNgMvvaGfUJiQerW0NlSA2jGLfHh9TNKYgqoSIu5uGDhtSyhMK1IBco
	igciSQ7hzxJu8uD2apI8qzzZBzDgVa1CsTo+OwNfYq4KUz5aYHFuxA675GTgORGypjhI
	4uTCc8jMBtWQtm4ku82ShhEP4R17t/TNQYPYuIbqUBQERDFPTt5GnIZ0cNT8QayXVJfs
	ej4A==
X-Gm-Message-State: AEkoouuq5QQdCDkftPA3QgvVcqe9CNZttQGGubQ6G1qZN2lTIN2cHyv2RXUwcIeCZNWT4Q==
X-Received: by 10.98.105.135 with SMTP id e129mr69782780pfc.59.1471399751767; 
	Tue, 16 Aug 2016 19:09:11 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:7934:66f:2860:bf87?
	([2601:646:8882:b8c:7934:66f:2860:bf87])
	by smtp.gmail.com with ESMTPSA id
	x126sm42324712pfx.61.2016.08.16.19.09.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 19:09:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471399586-685-1-git-send-email-yi.zhao@windriver.com>
Date: Tue, 16 Aug 2016 19:09:05 -0700
Message-Id: <EBA0587A-DC61-44EA-B7D9-E3C2C26F8B77@gmail.com>
References: <1471399586-685-1-git-send-email-yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.0.5
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
X-List-Received-Date: Wed, 17 Aug 2016 02:09:11 -0000
X-Groupsio-MsgNum: 62676
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5F8FC185-BFFB-4B82-AE01-53F36E68280B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5F8FC185-BFFB-4B82-AE01-53F36E68280B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 16, 2016, at 7:06 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
>=20
> The following vulnerabilities have been fixed:
>    * [1]wnpa-sec-2016-39
>      CORBA IDL dissector crash on 64-bit Windows. ([2]Bug 12495)
>    * [3]wnpa-sec-2016-41
>      PacketBB crash. ([4]Bug 12577)
>    * [5]wnpa-sec-2016-42
>      WSP infinite loop. ([6]Bug 12594)
>    * [7]wnpa-sec-2016-44
>      RLC long loop. ([8]Bug 12660)
>    * [9]wnpa-sec-2016-45
>      LDSS dissector crash. ([10]Bug 12662)
>    * [11]wnpa-sec-2016-46
>      RLC dissector crash. ([12]Bug 12664)
>    * [13]wnpa-sec-2016-47
>      OpenFlow long loop. ([14]Bug 12659)
>    * [15]wnpa-sec-2016-48
>      MMSE, WAP, WBXML, and WSP infinite loop. ([16]Bug 12661)
>    * [17]wnpa-sec-2016-49
>      WBXML crash. ([18]Bug 12663)
>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
> .../recipes-support/wireshark/wireshark_2.0.4.bb   | 60 =
----------------------
> .../recipes-support/wireshark/wireshark_2.0.5.bb   | 60 =
++++++++++++++++++++++

for better reviews, please send patches where renames can be detected.
you can add

[diff]
        renames =3D copies

to your ~/.gitconfig

> 2 files changed, 60 insertions(+), 60 deletions(-)
> delete mode 100644 =
meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
> create mode 100644 =
meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
>=20
> diff --git =
a/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb =
b/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
> deleted file mode 100644
> index d36c3f3..0000000
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -DESCRIPTION =3D "wireshark - a popular network protocol analyzer"
> -HOMEPAGE =3D "http://www.wireshark.org"
> -SECTION =3D "net"
> -LICENSE =3D "GPL-2.0"
> -LIC_FILES_CHKSUM =3D =
"file://README.linux;md5=3D631e077455b7972172eb149195e065b0"
> -
> -DEPENDS =3D "pcre expat glib-2.0 sbc"
> -
> -SRC_URI =3D =
"https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
> -
> -SRC_URI[md5sum] =3D "622928dc6cb31c227c672ec3ec697f28"
> -SRC_URI[sha256sum] =3D =
"9ea9c82da9942194ebc8fc5c951a02e6d179afa7472cb6d96ca76154510de1a5"
> -
> -PE =3D "1"
> -
> -inherit autotools pkgconfig perlnative
> -
> -ARM_INSTRUCTION_SET =3D "arm"
> -
> -# Works with either gtk+ or gtk3.
> -WHICH_GTK =3D "gtk+"
> -
> -PACKAGECONFIG ?=3D "libpcap gnutls libnl libcap"
> -PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "x11", =
"gtk2 graphics", "", d)}"
> -PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", =
"ipv6", "", d)}"
> -#PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", =
"opengl", "gtk3", "", d)}"
> -
> -PACKAGECONFIG[libcap] =3D "--with-libcap=3D${STAGING_LIBDIR}, =
--with-libcap=3Dno --enable-pcap-ng-default , libcap"
> -PACKAGECONFIG[libpcap] =3D "--with-pcap=3D${STAGING_LIBDIR} =
--with-pcap-remote, --with-pcap=3Dno --enable-pcap-ng-default  , =
libpcap"
> -PACKAGECONFIG[libsmi] =3D "--with-libsmi=3Dyes, --with-libsmi=3Dno, =
libsmi"
> -PACKAGECONFIG[libnl] =3D "--with-libnl=3Dyes, --with-libnl=3Dno, =
libnl"
> -PACKAGECONFIG[portaudio] =3D "--with-portaudio=3Dyes, =
--with-portaudio=3Dno, portaudio-v19"
> -PACKAGECONFIG[gtk2] =3D "--with-gtk2=3Dyes, --with-gtk2=3Dno, gtk+"
> -PACKAGECONFIG[gtk3] =3D "--with-gtk3=3Dyes, --with-gtk3=3Dno, gtk+3"
> -PACKAGECONFIG[graphics] =3D "--enable-wireshark, =
--disable-wireshark,"
> -PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
> -PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes, --with-gnutls=3Dno, =
gnutls"
> -PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes, --with-gcrypt=3Dno, =
libgcrypt"
> -PACKAGECONFIG[ssl] =3D "--with-ssl=3Dyes, --with-ssl=3Dno, openssl"
> -PACKAGECONFIG[krb5] =3D "--with-krb5=3Dyes, --with-krb5=3Dno, krb5"
> -PACKAGECONFIG[lua] =3D "--with-lua=3Dyes, --with-lua=3Dno, lua"
> -PACKAGECONFIG[zlib] =3D "--with-zlib=3Dyes, --with-zlib=3Dno, zlib"
> -PACKAGECONFIG[geoip] =3D "--with-geoip=3Dyes, --with-geoip=3Dno, =
geoip"
> -PACKAGECONFIG[plugins] =3D "--with-plugins=3Dyes, --with-plugins=3Dno"
> -
> -# these next two options require addional layers
> -PACKAGECONFIG[adns] =3D "--with-adns=3Dyes, --with-adns=3Dno, adns"
> -PACKAGECONFIG[c-ares] =3D "--with-c-ares=3Dyes, --with-c-ares=3Dno, =
c-ares"
> -
> -EXTRA_OECONF +=3D "--with-qt=3Dno --enable-usr-local=3Dno =
--enable-tshark --enable-rawshark"
> -
> -do_configure_prepend() {
> -    # force to use fallback
> -    sed -i -e '/^glib_prefix/s/=3D.*$/=3D""/' ${S}/aclocal-flags
> -}
> -
> -ALLOW_EMPTY_${PN} =3D "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> -
> -FILES_${PN} +=3D "${datadir}*"
> diff --git =
a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb =
b/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
> new file mode 100644
> index 0000000..31ca4d2
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
> @@ -0,0 +1,60 @@
> +DESCRIPTION =3D "wireshark - a popular network protocol analyzer"
> +HOMEPAGE =3D "http://www.wireshark.org"
> +SECTION =3D "net"
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D =
"file://README.linux;md5=3D631e077455b7972172eb149195e065b0"
> +
> +DEPENDS =3D "pcre expat glib-2.0 sbc"
> +
> +SRC_URI =3D =
"https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "627b5fc6cf0aeca196c75debd5e69b14"
> +SRC_URI[sha256sum] =3D =
"0ce0241330828973f5b4efee422a3760cab8ce0b41e7721c4b9fd185be1bb10b"
> +
> +PE =3D "1"
> +
> +inherit autotools pkgconfig perlnative
> +
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +# Works with either gtk+ or gtk3.
> +WHICH_GTK =3D "gtk+"
> +
> +PACKAGECONFIG ?=3D "libpcap gnutls libnl libcap"
> +PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "x11", =
"gtk2 graphics", "", d)}"
> +PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", =
"ipv6", "", d)}"
> +#PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", =
"opengl", "gtk3", "", d)}"
> +
> +PACKAGECONFIG[libcap] =3D "--with-libcap=3D${STAGING_LIBDIR}, =
--with-libcap=3Dno --enable-pcap-ng-default , libcap"
> +PACKAGECONFIG[libpcap] =3D "--with-pcap=3D${STAGING_LIBDIR} =
--with-pcap-remote, --with-pcap=3Dno --enable-pcap-ng-default  , =
libpcap"
> +PACKAGECONFIG[libsmi] =3D "--with-libsmi=3Dyes, --with-libsmi=3Dno, =
libsmi"
> +PACKAGECONFIG[libnl] =3D "--with-libnl=3Dyes, --with-libnl=3Dno, =
libnl"
> +PACKAGECONFIG[portaudio] =3D "--with-portaudio=3Dyes, =
--with-portaudio=3Dno, portaudio-v19"
> +PACKAGECONFIG[gtk2] =3D "--with-gtk2=3Dyes, --with-gtk2=3Dno, gtk+"
> +PACKAGECONFIG[gtk3] =3D "--with-gtk3=3Dyes, --with-gtk3=3Dno, gtk+3"
> +PACKAGECONFIG[graphics] =3D "--enable-wireshark, =
--disable-wireshark,"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
> +PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes, --with-gnutls=3Dno, =
gnutls"
> +PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes, --with-gcrypt=3Dno, =
libgcrypt"
> +PACKAGECONFIG[ssl] =3D "--with-ssl=3Dyes, --with-ssl=3Dno, openssl"
> +PACKAGECONFIG[krb5] =3D "--with-krb5=3Dyes, --with-krb5=3Dno, krb5"
> +PACKAGECONFIG[lua] =3D "--with-lua=3Dyes, --with-lua=3Dno, lua"
> +PACKAGECONFIG[zlib] =3D "--with-zlib=3Dyes, --with-zlib=3Dno, zlib"
> +PACKAGECONFIG[geoip] =3D "--with-geoip=3Dyes, --with-geoip=3Dno, =
geoip"
> +PACKAGECONFIG[plugins] =3D "--with-plugins=3Dyes, --with-plugins=3Dno"
> +
> +# these next two options require addional layers
> +PACKAGECONFIG[adns] =3D "--with-adns=3Dyes, --with-adns=3Dno, adns"
> +PACKAGECONFIG[c-ares] =3D "--with-c-ares=3Dyes, --with-c-ares=3Dno, =
c-ares"
> +
> +EXTRA_OECONF +=3D "--with-qt=3Dno --enable-usr-local=3Dno =
--enable-tshark --enable-rawshark"
> +
> +do_configure_prepend() {
> +    # force to use fallback
> +    sed -i -e '/^glib_prefix/s/=3D.*$/=3D""/' ${S}/aclocal-flags
> +}
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +FILES_${PN} +=3D "${datadir}*"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_5F8FC185-BFFB-4B82-AE01-53F36E68280B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlezx0UACgkQuwUzVZGdMxQyxwCfYCswWvwQxLPRBUzCbHanqDBL
HkEAoI+Y/J5+IFUUVXK4pzOoTWOIeYIt
=q5er
-----END PGP SIGNATURE-----

--Apple-Mail=_5F8FC185-BFFB-4B82-AE01-53F36E68280B--
