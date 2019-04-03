Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB1107D2D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 08:34:55 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u12so13338789iop.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 01:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=D9YUFAYrv6AVYEqh6KovTeX92GkVzlQnlhUbcvt5hu0=;
	b=SVkfyzeJTY4blUZKnbS7wh9N5Rd2bI1i94ehgt+70nS6aSTaThc78O8c3RvkJ2t7Xq
	NPvm3HZyeYNL7Psf4L0wenYGuxFwMsKH9WNysUv5VOTCzc8WN7/B3ICEh/0Gcj7IU4QY
	1e6wwbgG/rYEu/4M0wAU6TCIhy8ByjE8z8pAB9gHjqh8t+KjCms6x3CLAhXW2LEq22JM
	4CErv9CTg2hHTf2lD1tyAcMl+bmJL28TpqFSgUoC2cj0+/Sysig5rJjO0aqZ/8+qF/yX
	0JdpzfJWfTIO6ccBxQRlJXKDXAQZZcPJjMwTz38RiMJC42a3uHHLAM199t3oZyCJ8KsF
	rCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=D9YUFAYrv6AVYEqh6KovTeX92GkVzlQnlhUbcvt5hu0=;
	b=U+sn67uB6YzFZO5LI13SmsT+sCRP4oTcQObMkjXOpDQAdH8YHaPQ72OafhWtPhvjWn
	uPO4Ew+AeSO/OcXD9D0NhNhxJL9o7Z4ocAcBFORBEYjgnRYfMJIjcemUysvDcXn5VgtH
	4q1eFZqV7192aTI38W9CJhmXhW2wKbgcjjcAuMP6Hich3CgQVsp/GE94u2Qa0lATE6Lj
	zQ2cG2Pum2HJ75sAYr6Jwb7LXmguuTVM5sRBoV9QevcfQB/akTGQerXps3JNTHdXws7h
	z4b6yklbtEp2AWRtTOdkawIvh7KbRuD5F2OUkypLnxWRI3kPjy29gRuD8xYf9w3RjMdc
	xiBw==
X-Gm-Message-State: APjAAAVPkj+j/vpSvnZcB/Izgc0bIpWyM7RNHvpXrmnMKyc4U0Kw+RKk
	7Id6Viw4ozdKt4k5SXDE0F6+Fp8bUsqLjCLWOmmXtnJOuJ0=
X-Google-Smtp-Source: APXvYqzHqY2WyH6j6ptZy6JkHmALih8JkE4Tk6TXmPam+2UAFeMDsjOmvKU4tFj/bZXYjYu1t90ALcO24PgomGBleWI=
X-Received: by 2002:a6b:c3c3:: with SMTP id t186mr51279227iof.19.1554280496529;
	Wed, 03 Apr 2019 01:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-3-git-send-email-vincent.prince.fr@gmail.com>
In-Reply-To: <1554280123-19112-3-git-send-email-vincent.prince.fr@gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 3 Apr 2019 10:34:45 +0200
Message-ID: <CAB2nKc-uJ+M0pHkXo0vwBkUmy6CVhB-TLKNDFZpY3JmH=U0Dtg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 3/3] czmq: bump version 4.1.1 => 4.2.0
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
X-List-Received-Date: Wed, 03 Apr 2019 08:34:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I forgot to remove 0001-Problem-out-of-date-with-zproject.patch file, it
will fixed in v2.

Le mer. 3 avr. 2019 =C3=A0 10:29, Vincent Prince <vincent.prince.fr@gmail.c=
om> a
=C3=A9crit :

> Also, add curl and systemd to PACKAGECONFIG
>
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> ---
>  .../zeromq/{czmq_4.1.1.bb =3D> czmq_4.2.0.bb}            | 18
> +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-connectivity/zeromq/{czmq_4.1.1.bb =3D>
> czmq_4.2.0.bb} (56%)
>
> diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
> b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
> similarity index 56%
> rename from meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
> rename to meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
> index f2db004..4ec1c04 100644
> --- a/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.0.bb
> @@ -1,15 +1,13 @@
> -DESCRIPTION =3D "C bindings for ZeroMQ"
> -HOMEPAGE =3D "http://www.zeromq.org"
> +DESCRIPTION =3D "High-level C binding for 0MQ"
> +HOMEPAGE =3D "http://czmq.zeromq.org/"
>  LICENSE =3D "MPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9741c346eef56131163e13b9db124=
1b3"
>  DEPENDS =3D "zeromq"
>
> -SRC_URI =3D "
> https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz
> \
> -    file://0001-Problem-out-of-date-with-zproject.patch \
> -"
> +SRC_URI =3D "
> https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz=
"
>
> -SRC_URI[md5sum] =3D "6d3a6fdd25c2bb29897c53670dce97bf"
> -SRC_URI[sha256sum] =3D
> "f00ff419881dc2a05d0686c8467cd89b4882677fc56f31c0e2cc81c134cbb0c0"
> +SRC_URI[md5sum] =3D "7e09997db6ac3b25e8ed104053040722"
> +SRC_URI[sha256sum] =3D
> "cfab29c2b3cc8a845749758a51e1dd5f5160c1ef57e2a41ea96e4c2dcc8feceb"
>
>  inherit cmake
>
> @@ -17,14 +15,16 @@ PACKAGES =3D "lib${BPN} lib${BPN}-dev
> lib${BPN}-staticdev ${PN} ${PN}-dbg"
>
>  FILES_${PN} =3D "${bindir}/*"
>  FILES_lib${BPN} =3D "${libdir}/*.so.*"
> -FILES_lib${BPN}-dev =3D "${libdir}/*.so ${libdir}/pkgconfig ${includedir=
}"
> +FILES_lib${BPN}-dev =3D "${libdir}/*.so ${libdir}/pkgconfig ${includedir=
}
> ${datadir}/cmake"
>  FILES_lib${BPN}-staticdev =3D "${libdir}/lib*.a"
>
>  RDEPENDS_lib${BPN}-dev =3D "zeromq-dev"
>
> -PACKAGECONFIG ??=3D "lz4 uuid"
> +PACKAGECONFIG ??=3D "lz4 uuid curl ${@bb.utils.filter('DISTRO_FEATURES',
> 'systemd', d)}"
>  PACKAGECONFIG[lz4] =3D ",-DCMAKE_DISABLE_FIND_PACKAGE_lz4=3DTRUE,lz4"
>  PACKAGECONFIG[uuid] =3D ",-DCMAKE_DISABLE_FIND_PACKAGE_uuid=3DTRUE,util-=
linux"
> +PACKAGECONFIG[curl] =3D ",-DCMAKE_DISABLE_FIND_PACKAGE_libcurl=3DTRUE,cu=
rl"
> +PACKAGECONFIG[systemd] =3D
> ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=3DTRUE,systemd"
>
>  BBCLASSEXTEND =3D "nativesdk"
>
> --
> 2.7.4
>
>

