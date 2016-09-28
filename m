Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA7AA60102
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 12:35:23 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so5749298wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=u49txK+QUsseRc7jJJXWecHCaB9KXy5YOcBjUoCDBwA=;
	b=PDe/Nv7Mu/8u7xJAsKOpS3KkjG17lydKo1iAQPjhhKodAEcLFMndfhCfBRSVE81mD+
	cjv0v1Dum3wPeF1n3yk3ujppDSrFF0st3NHCJKFoX5FRaVGrtmqkG6pSkCHwafxW9LDI
	pPMuYHpUUW12uW8w2Wycat6VI9QUwRdBDw0vnuT0lGaEB288vSDI5NJM+2B48Yvi6Afm
	fSjVQbwWjXVgZ7KbMdktk9uL8D6natRHUFXnsEHRYlhHPJiGL+nZa+CKByEYF9C9vuki
	wOiFgR6zfDiMrSXYyRhH9/pHOIxtCSQiZon1Rk3OFymlGJDLI1PqPklbnJhlEFFrJrrZ
	wJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=u49txK+QUsseRc7jJJXWecHCaB9KXy5YOcBjUoCDBwA=;
	b=SzvaXZmbVhllcGRFjnq9TNtsqQuSg6JJS6R8RBa2PXe7eb+yK/wdI/LoZYUlszeF9Z
	s6mAnep9wFLORzsY+iMBTNW0/6EenR99+N70BdpUA9xKID43UjHhj6n4nntrkRcLKoHp
	ECWaFKN3cuYChlHKLjPxoTb3mBHeEKY/84vsAzVbbq0cGFNMGvXnPw6yyH4AshjJ4GfB
	/YjptSVUH12+VPo6WTvUpvCvyvU1lhF0lj240FLWydaMQeltgpLMOCCwy1KbgGB42q8S
	/rHvR+21e5S4byacuBNbj1CtoNDyT7PhFnYRq8yyk+ks6LWotRUGfL64tX6zzV6DzY9u
	ZOZA==
X-Gm-Message-State: AA6/9Rn+y6xP2w3asFUBmU/tlKzHnZNhYPpaFL8ksex1NSjpNJFHnVmPYbE7N3otQfnW/w==
X-Received: by 10.28.16.148 with SMTP id 142mr7601296wmq.5.1475066124661;
	Wed, 28 Sep 2016 05:35:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	zz9sm5646202wjb.36.2016.09.28.05.35.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Sep 2016 05:35:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 28 Sep 2016 14:35:23 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160928123523.GA2653@jama>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
	<1474955733-30185-10-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1474955733-30185-10-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [PATCH 9/9] physfs: move to sources found at github/supertux
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
X-List-Received-Date: Wed, 28 Sep 2016 12:35:27 -0000
X-Groupsio-MsgNum: 63336
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2016 at 07:55:33AM +0200, Andreas M=FCller wrote:
> It seems that physfs is still maintained there and has the functionality
> required by latest supertux.
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../physfs/files/0001-fix-build-with-gcc-6.patch   | 52 ++++++++++++++++=
++++++
>  .../physfs/{physfs_2.0.3.bb =3D> physfs_git.bb}      | 10 +++--
>  2 files changed, 59 insertions(+), 3 deletions(-)
>  create mode 100644 meta-filesystems/recipes-support/physfs/files/0001-fi=
x-build-with-gcc-6.patch
>  rename meta-filesystems/recipes-support/physfs/{physfs_2.0.3.bb =3D> phy=
sfs_git.bb} (55%)
>=20
> diff --git a/meta-filesystems/recipes-support/physfs/files/0001-fix-build=
-with-gcc-6.patch b/meta-filesystems/recipes-support/physfs/files/0001-fix-=
build-with-gcc-6.patch
> new file mode 100644
> index 0000000..805c4a1
> --- /dev/null
> +++ b/meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-g=
cc-6.patch
> @@ -0,0 +1,52 @@
> +From 06fe4c205094e0b65d3e5d1244f52089ed5bdafb Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Sun, 25 Sep 2016 23:50:22 +0200
> +Subject: [PATCH] fix build with gcc-6
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + src/archiver_zip.c | 1 -
> + src/physfs_miniz.h | 3 +++
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/archiver_zip.c b/src/archiver_zip.c
> +index 5c4996d..3b436db 100644
> +--- a/src/archiver_zip.c
> ++++ b/src/archiver_zip.c
> +@@ -845,7 +845,6 @@ static ZIPentry *zip_hash_ancestors(ZIPinfo *info, c=
har *name)
> +     if (sep)
> +     {
> +         const size_t namelen =3D (sep - name) + 1;
> +-        ZIPentry *parent;
> +=20
> +         *sep =3D '\0';  /* chop off last piece. */
> +         retval =3D zip_find_entry(info, name);
> +diff --git a/src/physfs_miniz.h b/src/physfs_miniz.h
> +index 619cb71..fd877c0 100644
> +--- a/src/physfs_miniz.h
> ++++ b/src/physfs_miniz.h
> +@@ -194,6 +194,8 @@ struct tinfl_decompressor_tag
> +     code_len =3D TINFL_FAST_LOOKUP_BITS; do { temp =3D (pHuff)->m_tree[=
~temp + ((bit_buf >> code_len++) & 1)]; } while (temp < 0); \
> +   } sym =3D temp; bit_buf >>=3D code_len; num_bits -=3D code_len; } MZ_=
MACRO_END
> +=20
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wmisleading-indentation"
> + static tinfl_status tinfl_decompress(tinfl_decompressor *r, const mz_ui=
nt8 *pIn_buf_next, size_t *pIn_buf_size, mz_uint8 *pOut_buf_start, mz_uint8=
 *pOut_buf_next, size_t *pOut_buf_size, const mz_uint32 decomp_flags)
> + {
> +   static const int s_length_base[31] =3D { 3,4,5,6,7,8,9,10,11,13, 15,1=
7,19,23,27,31,35,43,51,59, 67,83,99,115,131,163,195,227,258,0,0 };
> +@@ -465,6 +467,7 @@ common_exit:
> +   }
> +   return status;
> + }
> ++#pragma GCC diagnostic pop
> +=20
> + /* Flush values. For typical usage you only need MZ_NO_FLUSH and MZ_FIN=
ISH. The other stuff is for advanced use. */
> + enum { MZ_NO_FLUSH =3D 0, MZ_PARTIAL_FLUSH =3D 1, MZ_SYNC_FLUSH =3D 2, =
MZ_FULL_FLUSH =3D 3, MZ_FINISH =3D 4, MZ_BLOCK =3D 5 };
> +--=20
> +2.5.5
> +
> diff --git a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb b/me=
ta-filesystems/recipes-support/physfs/physfs_git.bb
> similarity index 55%
> rename from meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
> rename to meta-filesystems/recipes-support/physfs/physfs_git.bb
> index 5618f28..3f1c156 100644
> --- a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
> +++ b/meta-filesystems/recipes-support/physfs/physfs_git.bb
> @@ -6,6 +6,10 @@ DEPENDS =3D "readline zlib"
> =20
>  inherit cmake
> =20
> -SRC_URI =3D "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
> -SRC_URI[md5sum] =3D "c2c727a8a8deb623b521b52d0080f613"
> -SRC_URI[sha256sum] =3D "ca862097c0fb451f2cacd286194d071289342c107b6fe690=
79c079883ff66b69"
> +SRC_URI =3D " \
> +    git://github.com/SuperTux/physfs.git \
> +    file://0001-fix-build-with-gcc-6.patch \
> +"
> +SRCREV =3D "f3b45a94d0b7c0a85469b1e60fefd8383b6719ba"

ERROR: physfs-2.0.3+gitAUTOINC+f3b45a94d0-r0 do_populate_lic: QA Issue: phy=
sfs: The LIC_FILES_CHKSUM does not match for file://LICENSE.txt;md5=3D5d94e=
3eaaa10b00ca803ba35a3e87cde
physfs: The new md5 checksum is 4424d2cfb8a288df2843c4467b5d719a
physfs: Check if the license information has changed in /home/jenkins/oe/wo=
rld/shr-core/tmp-glibc/work/i586-oe-linux/physfs/2.0.3+gitAUTOINC+f3b45a94d=
0-r0/git/LICENSE.txt to verify that the LICENSE value "Zlib" remains valid =
[license-checksum]
ERROR: physfs-2.0.3+gitAUTOINC+f3b45a94d0-r0 do_populate_lic: Fatal QA erro=
rs found, failing task.
ERROR: physfs-2.0.3+gitAUTOINC+f3b45a94d0-r0 do_populate_lic: Function fail=
ed: populate_lic_qa_checksum

> +S =3D "${WORKDIR}/git"
> +PV =3D "2.0.3+git${SRCPV}"
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfruPcACgkQN1Ujt2V2gBzRNQCfQwJv+dMxCzpg+Pz4pIogCb4h
380AoKLjnZ66rpuMmGGctQV97sioOEj6
=MVJ5
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
