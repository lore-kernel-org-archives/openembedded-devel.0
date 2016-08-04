Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B12656E667
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 08:33:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h186so17075911pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2016 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=bpg3DRB4SI2kmZkUDAjSIj/WEsox4+uAZfePHbEIzuQ=;
	b=HorIfa2FQUbvFBv9YJf/KCXU0pPI3FvoVA9HFr6qV4lqETXCO45Zy/Nj8GYCtNMs61
	ZyIGhiyIU1t6yx6H/rsNRTMSEnHhJFc60eK1TTRHOnb/jIOLAaeEM0LyoFoNy+GViTNx
	jghW3I3RR3ghb5qKQ62YnGjkgT5Cj5zZRT2+5QwcCF3dfdKHvmhX/8E3rjkS2945PsaP
	NmJhQmzQ4QEJXlf4qJrg6lsfguMIgfCJxAyP/2iF9ubQ2BG38MBVGvFn7OzFtmteL3Ad
	Rjne/8hAhCxb8vWp/CA9NJ0+MLdts/J2X2VJHx1ewq46lr8pJC/GDd3eKhkJhDIv57Mf
	C3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=bpg3DRB4SI2kmZkUDAjSIj/WEsox4+uAZfePHbEIzuQ=;
	b=ljPdHffn4+RC0n+KrIAMk1jpokZQyBWrOWx4CIWmutwlPYBOp3ho5uJOA/UL9sOUnn
	zKJjUTfx/aQtOeKsPPzk19sDFmdxxQLkZiTJGQhrLoX16gCbLTibSWSEiTbH/dHMb59h
	Y9WxYb9LAu/4Z/h8QKyX+bzdCihVGGLGrcqpP0x/mveYZuwp1+95dsJo7SpLqgN8zcZ8
	SFPj7HK3MeC6GwXig46tbnSUgxxq5M8If49NugU4w7CAfi/AyEArKGnCfHBZCw8EGTVj
	sZpNYiexpKo782Uit7qiucaTt5g6BMv4T7TfdTCzYXYe7bUWY3ay4S7guA5r9+FokGdT
	683A==
X-Gm-Message-State: AEkoouteYGnMP9bI2tX8ZNALgT5c/2/KBmhcj9y2WWf0M0XPIqPT/pRlwdSXswHr63+Rpw==
X-Received: by 10.98.68.1 with SMTP id r1mr106997665pfa.161.1470299612865;
	Thu, 04 Aug 2016 01:33:32 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:2d9e:8184:5aba:a421?
	([2601:646:8882:b8c:2d9e:8184:5aba:a421])
	by smtp.gmail.com with ESMTPSA id
	p14sm18218567par.32.2016.08.04.01.33.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Aug 2016 01:33:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470162087-5919-1-git-send-email-derek@asterius.io>
Date: Thu, 4 Aug 2016 01:33:36 -0700
Message-Id: <39CCB7BB-6A06-4616-858E-381AB781321B@gmail.com>
References: <1470162087-5919-1-git-send-email-derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH] libgit2: add a recipe for libgit2 version 0.24.1
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
X-List-Received-Date: Thu, 04 Aug 2016 08:33:33 -0000
X-Groupsio-MsgNum: 62428
Content-Type: multipart/signed;
	boundary="Apple-Mail=_20EB94DC-3888-4557-AC7F-97034302C026";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_20EB94DC-3888-4557-AC7F-97034302C026
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 2, 2016, at 11:21 AM, Derek Straka <derek@asterius.io> wrote:
>=20
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
> meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb | 24 =
+++++++++++++++++++++++
> 1 file changed, 24 insertions(+)
> create mode 100644 meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
>=20
> diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb =
b/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
> new file mode 100644
> index 0000000..e580308
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "the Git linkable library"
> +HOMEPAGE =3D "http://libgit2.github.com/"
> +LICENSE =3D "GPL-2.0-with-GCC-exception"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D34197a479f637beb9e09e56893f48bc2"
> +
> +DEPENDS =3D "openssl zlib"
> +
> +SRC_URI =3D "git://github.com/libgit2/libgit2.git;branch=3Dmaint/v0.24"=

> +SRCREV =3D "211e117a0590583a720c53172406f34186c543bd"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE =3D "\
> +	-DTHREADSAFE=3DON \
> +	-DBUILD_CLAR=3DOFF \
> +	-DSHA1_TYPE=3D"builtin" \
> +	-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
> +	-DBUILD_SHARED_LIBS=3DOFF \

I think we should not disable shared objects unconditionally here.

> +	-DBUILD_EXAMPLES=3DOFF \
> +"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_20EB94DC-3888-4557-AC7F-97034302C026
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlei/egACgkQuwUzVZGdMxStyQCfUN9JESJF7BsetOSwljVLCwgt
UOwAn3iKg8Jjsk/DXIAw/cYrFMoVvGD1
=ao/V
-----END PGP SIGNATURE-----

--Apple-Mail=_20EB94DC-3888-4557-AC7F-97034302C026--
