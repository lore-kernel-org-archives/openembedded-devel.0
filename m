Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mk2kN-0004RI-7V
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 23:24:35 +0200
Received: by qw-out-1920.google.com with SMTP id 4so408916qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Sep 2009 14:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gE7xQdOmTgI0O1/LDHDHENc+GQmHm7bz1KJniCgchgE=;
	b=xaIKNka1iSQgtgU7A4D6SI7kpCyBGPCHkUf6WMD5LealEKoRs1uhmZYPnOEnG9aR4t
	HwEk4MoqMJZE+WrrqrXsl+k4dwrDFVryT/Z8+4tlHKHNTHPdivsdUT44Lw8qtgwh9oEt
	i/5BDAZ9qzccdPiptvtVSBObOtdKIglG0MZLc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=L2+zmDjrYGhaV5YdkY1xUpCEwVukpw9rV8GoIWdd7Ndr8nlUrBuXIznVpNkiH981md
	Y4j7qwM1OMktTvx89cCiewaoePg70NDfOT4Ckh8oq2DAeGdREdjFplYZg+EMgiWSi1ER
	NVQ1eJe73JEkhBApuxWcwXoKPNw4a7zXCYTBw=
MIME-Version: 1.0
Received: by 10.229.129.133 with SMTP id o5mr3602242qcs.45.1252184728004; Sat, 
	05 Sep 2009 14:05:28 -0700 (PDT)
In-Reply-To: <1252183810-18263-1-git-send-email-betheg@bitcloner.org>
References: <1252183810-18263-1-git-send-email-betheg@bitcloner.org>
Date: Sat, 5 Sep 2009 14:05:27 -0700
Message-ID: <19c1b8a90909051405u66dffc20yac0767b757508276@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libconfig: updated to version 1.3.2
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
X-List-Received-Date: Sat, 05 Sep 2009 21:24:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2009 at 1:50 PM, Michael Kurz<betheg@bitcloner.org> wrote:
> ---
> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +++---
> =C2=A0recipes/libconfig/libconfig_1.3.1.bb | =C2=A0 19 ------------------=
-
> =C2=A0recipes/libconfig/libconfig_1.3.2.bb | =C2=A0 19 ++++++++++++++++++=
+
> =C2=A03 files changed, 22 insertions(+), 22 deletions(-)
> =C2=A0delete mode 100644 recipes/libconfig/libconfig_1.3.1.bb
> =C2=A0create mode 100644 recipes/libconfig/libconfig_1.3.2.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 053a2ad..61d7732 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -13294,9 +13294,9 @@ sha256=3D74def55ba6a61e966e0873a4081fd3dd65089b94=
b837810d3bc056221d7e41c7
> =C2=A0md5=3D68ac3177685c577aadf8d2e9f47b1878
> =C2=A0sha256=3Dc3540df46bd9716c6a6f521806c70ae548822a5e62d245900cc28b5fa9=
fc3eb3
>
> -[http://www.hyperrealm.com/libconfig/libconfig-1.3.1.tar.gz]
> -md5=3Df02bfa27a21b3040089026975b9dc0b8
> -sha256=3D5677f32eff184883d7ca402234f92142f35bea7d04d503becdd104ae8343cb1=
c
> +[http://www.hyperrealm.com/libconfig/libconfig-1.3.2.tar.gz]
> +md5=3D094a82afd382aa2305c6cc3c06025c2d
> +sha256=3D2a680bb33e290c3c799e3a90cf2c0fb9f5482dd930ad93d9f83ce39923258c0=
a
>
> =C2=A0[http://repository.maemo.org/pool/maemo4.0/free/source/libc/libconi=
c/libconic_0.13-0.8.tar.gz]
> =C2=A0md5=3Db4078390c459ae4df3acdabca36f53da
> diff --git a/recipes/libconfig/libconfig_1.3.1.bb b/recipes/libconfig/lib=
config_1.3.1.bb
> deleted file mode 100644
> index 0856afb..0000000
> --- a/recipes/libconfig/libconfig_1.3.1.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION =3D "Library for manipulating structured configuration files=
"
> -AUTHOR =3D "Mark Lindner"
> -HOMEPAGE =3D "http://www.hyperrealm.com/libconfig/"
> -SECTION =3D "libs"
> -PRIORITY =3D "optional"
> -LICENSE =3D "LGPLv2"
> -DEPENDS =3D ""
> -PV =3D "1.3.1"
> -PR =3D "r0"
> -
> -SRC_URI =3D "http://www.hyperrealm.com/libconfig/libconfig-${PV}.tar.gz"
> -
> -S =3D "${WORKDIR}/libconfig-${PV}"
> -
> -inherit autotools
> -
> -do_stage() {
> - =C2=A0 =C2=A0 =C2=A0 autotools_stage_all
> -}
> diff --git a/recipes/libconfig/libconfig_1.3.2.bb b/recipes/libconfig/lib=
config_1.3.2.bb
> new file mode 100644
> index 0000000..263aafc
> --- /dev/null
> +++ b/recipes/libconfig/libconfig_1.3.2.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Library for manipulating structured configuration files=
"
> +AUTHOR =3D "Mark Lindner"
> +HOMEPAGE =3D "http://www.hyperrealm.com/libconfig/"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +LICENSE =3D "LGPLv2"
> +DEPENDS =3D ""
> +PV =3D "1.3.2"
> +PR =3D "r0"

probably you can get rid of PR here if it is 0

> +
> +SRC_URI =3D "http://www.hyperrealm.com/libconfig/libconfig-${PV}.tar.gz"
> +
> +S =3D "${WORKDIR}/libconfig-${PV}"
> +


you could just inherit autotools_stage

and remove the below hunk fully

> +inherit autotools
> +
> +do_stage() {
> + =C2=A0 =C2=A0 =C2=A0 autotools_stage_all
> +}
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


