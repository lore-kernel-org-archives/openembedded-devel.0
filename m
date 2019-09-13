Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFB77E53A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 00:31:25 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id u9so5886770qtq.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gEzgsgk+OKxCbowdCKHb4GN39cGI6vdUTY8WYZHjwgM=;
	b=MpyvUbS5S8t9Rn1kNyt9UyCmVKoiOusW21v499U7t3dWwvPV6cBaKBqTzJUwmgsR7y
	yj9xFUV1GkPrXoPHvE9pjQMgeWgdiqKB3en1ZIe8GejksNAPJHjx1FS0X+hy7g9p39Lu
	kawS4J+I0pNkc9dCdcLJqpCzFqmYvcLqAnDA9QD+cmh8LPXjBI/17ydKWlRyHBX2saza
	EiBD+eVzihrDNnErQQ87Zogtf8vW8+n0aCKDUIJuK0x/MP7QGf4jcqK/Ii4j4t6FuF7s
	yT3Rp/OVrPMnXnRtifCwk04rtW0hcDpziD4q4r9HsWHOvdGS7cMai3a5PToaXyxKxSXo
	9m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gEzgsgk+OKxCbowdCKHb4GN39cGI6vdUTY8WYZHjwgM=;
	b=QGwkWghacss6uIqbs5e0vGGY8EJzXGA+aFTURDjE9jCOtUufo6ghqV0VgfyloyKInk
	MHVoTRL4DfPgFsHMYt0YEhV62ZEaSTt55RjyyVmHEj4S+sXMC0EaAg9wJQbro4acjDZ5
	ywd6XkRIQGOgdKF7DM1WDWJEM3Wsqza2w4pIVR4xjI7e17elKRcgOuHDF+QA8AHaPN5a
	bmxu7zUUvhJ84+67Sx1CvVNRp8OqpzDzRSDiJSzqffD1gphOqjywoBrtGH/liM6xpQm/
	1/F7FKCbFkAyuJ6fQmqppQD1n/TkN16VoZPZfe4t8umGUvdPRonmTAoZCewhTQ/6QgAU
	N64A==
X-Gm-Message-State: APjAAAUX2IshPayXZZOiCp+kA7t78/Cxe7zZOORmznqF07b6d8D1Mkmf
	zGmgIy4Uunbb/pqs2+L8TsYgFSLbAGWltZzRt5a8K8+GCLQ=
X-Google-Smtp-Source: APXvYqzDGhhRvIeBeP4WCJGGTiLHy+Pf6MHD91licLQsEDx+thngZk419f5X8Cd4tg6S+Qzvt5oIZjg/Z/rqmZzMUds=
X-Received: by 2002:a0c:f091:: with SMTP id g17mr29279266qvk.181.1568334686623;
	Thu, 12 Sep 2019 17:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190912200031.32245-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190912200031.32245-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Sep 2019 17:31:00 -0700
Message-ID: <CAMKF1srosgdr6BvU5cN2f7Ug6qDNZA_SpQoDykuwW_eTSGUShg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] avro-c: update to 1.9.1
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
X-List-Received-Date: Fri, 13 Sep 2019 00:31:26 -0000
Content-Type: text/plain; charset="UTF-8"

https://errors.yoctoproject.org/Errors/Details/270130/

On Thu, Sep 12, 2019 at 1:00 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Removed patch was upstreamed.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...avro-c-Fix-build-with-clang-compiler.patch | 37 -------------------
>  .../avro/{avro-c_1.8.1.bb => avro-c_1.9.1.bb} |  6 +--
>  2 files changed, 2 insertions(+), 41 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
>  rename meta-oe/recipes-support/avro/{avro-c_1.8.1.bb => avro-c_1.9.1.bb} (64%)
>
> diff --git a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch b/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
> deleted file mode 100644
> index 01235d8ef..000000000
> --- a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 518bb8ccfb3f3fc143fbd571782f3e40573d01b5 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 10 Apr 2017 09:15:04 -0700
> -Subject: [PATCH] avro-c: Fix build with clang compiler
> -
> -Clang advertizes itself to be compatible with gcc 4.2.1
> -while that was true several years ago, it now supports
> -a lot more newer features, the test to just check gcc
> -version should be supplanted with clang check as well
> -so atomic support in clang can be asserted as well
> -
> -Fixes
> -
> -lang/c/src/avro/refcount.h:301:2: error: "No atomic implementation!"
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - lang/c/src/avro/refcount.h | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/lang/c/src/avro/refcount.h b/lang/c/src/avro/refcount.h
> -index 69afa4fc..d76ba057 100644
> ---- a/lang/c/src/avro/refcount.h
> -+++ b/lang/c/src/avro/refcount.h
> -@@ -118,7 +118,8 @@ avro_refcount_dec(volatile int *refcount)
> -  * GCC intrinsics
> -  */
> -
> --#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500
> -+#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500 \
> -+|| defined(__clang__)
> -
> - static inline void
> - avro_refcount_set(volatile int *refcount, int value)
> ---
> -2.12.2
> -
> diff --git a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb b/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
> similarity index 64%
> rename from meta-oe/recipes-support/avro/avro-c_1.8.1.bb
> rename to meta-oe/recipes-support/avro/avro-c_1.9.1.bb
> index 276fe2b5a..709b9d5f7 100644
> --- a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
> +++ b/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
> @@ -8,10 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=73bdf70f268f0b3b9c5a83dd7a6f3324"
>  DEPENDS = "jansson zlib xz"
>  PV .= "+git${SRCPV}"
>
> -SRCREV = "4b3677c32b879e0e7f717eb95f9135ac654da760"
> -SRC_URI = "git://github.com/apache/avro \
> -           file://0001-avro-c-Fix-build-with-clang-compiler.patch;patchdir=../../ \
> -"
> +SRCREV = "89218262cde62e98fcb3778b86cd3f03056c54f3"
> +SRC_URI = "git://github.com/apache/avro;branch=branch-1.9"
>
>  S = "${WORKDIR}/git/lang/c"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

