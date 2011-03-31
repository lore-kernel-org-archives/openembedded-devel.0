Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5Ols-0007R5-8y
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:47:12 +0200
Received: by fxm19 with SMTP id 19so2466060fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 13:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=kAMXhtdurg9ks9CUvsdxiHmzgrcr663IVpM8b6UB+Ow=;
	b=k8pqHMAMNJNPy4riHvIlQDKk4i/iK/vaZn+elzA+8heVneny67Z50IQKbDgGWqNan0
	GGYQS5KF7ISfXoltbE3LhRLCuYhv3oWj8ONA8aI8+mzwur+lOXyTEmOPfyy+Yo/rHRpc
	izXrSla3AM4xFFEfrXzQrM2o4JbZ6nwbiTlvk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=HvTIyN/La6KiXP7QVMuVaH4+GXqRrKg1LiRTw/3+fwUq0xDv29d9VvoLMx9EHtY0Qs
	4P+Ppu/9MqXkNb3jo8FV321HARWYo0p8aWjDCeSz6a+o35pet3LwUUBZs69Mjrmg+Hr2
	P3zrI0v5O5obWSba8rUt05DVVE9Y1Ib3RUPbo=
Received: by 10.223.95.135 with SMTP id d7mr1305240fan.65.1301604312072; Thu,
	31 Mar 2011 13:45:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 13:44:42 -0700 (PDT)
In-Reply-To: <44ead8d4c9a5a985a0b878d4b166dc552f5896b8.1301562689.git.Martin.Jansa@gmail.com>
References: <cover.1301562689.git.Martin.Jansa@gmail.com>
	<44ead8d4c9a5a985a0b878d4b166dc552f5896b8.1301562689.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 13:44:42 -0700
Message-ID: <AANLkTin6q3OcMJ88_B8q+zHvMyO0dDVZ-hzBGeKOVnrM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 2/2] ttf-sazanami: fix LICENSE and add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 20:47:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 2:13 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../ttf-fonts/ttf-sazanami_20040629.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A03 ++-
> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb =
b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> index 1b9a01b..1ee1c9c 100644
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
> @@ -5,7 +5,8 @@ DESCRIPTION_ttf-sazanami-gothic =3D "Sazanami Gothic Japa=
nese TrueType font"
> =C2=A0DESCRIPTION_ttf-sazanami-mincho =3D "Sazanami Mincho Japanese TrueT=
ype font"
> =C2=A0AUTHOR =3D "Electronic Font Open Laboratory (/efont/)"
> =C2=A0HOMEPAGE =3D "http://sourceforge.jp/projects/efont/"
> -LICENSE =3D "${PN}"
> +LICENSE =3D "Public domain"
> +LIC_FILES_CHKSUM =3D "file://README;md5=3D97d739900be6e852830f55aa3c07d4=
a0"
> =C2=A0SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
> =C2=A0RPROVIDES_${PN} =3D "virtual-japanese-font"
> =C2=A0PR =3D "r5"
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


