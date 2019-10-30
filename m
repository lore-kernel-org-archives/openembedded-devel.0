Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF3B7F96F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 21:18:15 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id e14so5404652qto.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 14:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=J2XI/PnIFsKvkQgBLZef2Bpbp+Rp77OommhxGJRuzJk=;
	b=T7SiZ9wDF0399g9VjpYWUFqPDdOiAbUoG5kgbFNDtCpqC32xmHST8R09BBF3LP6TAR
	Ja4gzJIq73keS0Ro3fGo6eWfzp3cp34mfcdy1Ij8PuPDDDF3+VnR876xYb2487oxiLqv
	TAhF8A3HSOeBfRHQ4rtpT8czc5PXcMCkrIRyZi+Hb914aZZv/Yk/yQoV0gxvANvnZqcb
	pxo98Y04Ek762/+56CQA1cUsRnRWEutAn4EHeCXH0pUxYbF333JXi24S/482jZyqTHfO
	3lzZa8sB5Yhb9Qyh+XNnlh6qAzvhjCcDtfSJd6YC8//atF5QUKKn7st0qOVq6RpdA1+r
	81JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=J2XI/PnIFsKvkQgBLZef2Bpbp+Rp77OommhxGJRuzJk=;
	b=qiDTdJ9DMSeToeBySXUaczdmk64R9iDhhV5O442kzP+fh9GSUQ76GLdrlhMBVwAL8c
	WjuyfCDTWRxBr3YYh2q5ai8lCbiTXFwMdyyVqRCZ5B2M/ecovVb4Batr4Z0r/5+5PnmT
	jDEaYL9BfMF6iO0fqA7S67Aw28ictVDOOV6P5dPgKcCsmYQ2K8jouSQh967lhH6dYxaJ
	0fw0+EvAQeLzTSCONbIVOgjHnxE7MVYdZEU4ZbvhFiPCokB3eDiCjtKM0NwfvH6Hd6v3
	O7JSd29aGZ4IQHrYHK4zCxP4giRNqPiSDWwFa6dhMvgo5vnX2Z+jOgskOiAnanJ40GJE
	kY0A==
X-Gm-Message-State: APjAAAWoxamc0wYbBGZjotL+yu4SfQjJbJkA/AaIPDVdMcqWdAFnKmj1
	6FShVvRACp7pwIIxQF3AYOX+zEmK6Jr4GQ50WIw=
X-Google-Smtp-Source: APXvYqzE99UufXS18tdcfnM/+vlUkPWUL/sncteA71CJJOCBjV1p6zPNeMqntE8VP5StmaVHWm1p4ZL5wvqAIvR6H1M=
X-Received: by 2002:ac8:c86:: with SMTP id n6mr2236310qti.80.1572470295189;
	Wed, 30 Oct 2019 14:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <1572422790-16185-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1572422790-16185-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2019 22:17:47 +0100
Message-ID: <CAMKF1spD-K-14w90zVqbHf17z=6PDj2P460RjhLH_+xOQnT4Sg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [zeus][PATCH] README: updated Maintainers list for Zeus
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
X-List-Received-Date: Wed, 30 Oct 2019 21:18:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Armin

Applied

On Wed, Oct 30, 2019 at 9:06 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  README                      |  2 +-
>  meta-filesystems/README     | 10 +++++-----
>  meta-gnome/README           | 10 +++++-----
>  meta-initramfs/README       |  8 ++++----
>  meta-multimedia/README      | 10 +++++-----
>  meta-networking/MAINTAINERS | 32 +++-----------------------------
>  meta-networking/README      |  6 +++---
>  meta-oe/README              |  8 ++++----
>  meta-perl/README            | 10 ++++------
>  meta-python/README          | 12 +++++-------
>  meta-webserver/README       |  8 ++++----
>  meta-xfce/README            | 10 +++++-----
>  12 files changed, 48 insertions(+), 78 deletions(-)
>
> diff --git a/README b/README
> index 7318f09..d0b5b91 100644
> --- a/README
> +++ b/README
> @@ -1,6 +1,6 @@
>  Collection of layers for the OE-core universe
>
> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> +zeus maintainer: Armin Kuster  <akuster808@gmail.com>
>
>  This repository is a collection of layers to suppliment OE-Core
>  with additional packages, Each layer have designated maintainer
> diff --git a/meta-filesystems/README b/meta-filesystems/README
> index edcf8bf..7d1945c 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -11,26 +11,26 @@ This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
>    layers: meta
> -  branch: master
> +  branch: zeus
>
>    URI: git://git.openembedded.org/meta-openembedded
>    layers: meta-oe
> -  branch: master
> +  branch: zeus
>
>  Patches
>  =3D=3D=3D=3D=3D=3D=3D
>
>  Please submit any patches against the filesystems layer to the
>  OpenEmbedded development mailing list (openembedded-devel@lists.openembe=
dded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][zeus]' in the subject.
>
> -Layer maintainer: Khem Raj <raj.khem@gmail.com>
> +zeus maintainer: Armin Kuster <akuster808@gmail.com>
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3Dmeta-filesystems][PATCH
> +        --subject-prefix=3Dmeta-filesystems][zeus][PATCH
>
>
>  Table of Contents
> diff --git a/meta-gnome/README b/meta-gnome/README
> index 3c5b4c5..cffd93a 100644
> --- a/meta-gnome/README
> +++ b/meta-gnome/README
> @@ -3,16 +3,16 @@ Dependencies
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: zeus
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: zeus
>  revision: HEAD
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gnome][zeus]' in the subject'
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-gnome][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-gnome][zeus][PATCH'
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +zeus maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index 79244d4..f786d22 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -12,7 +12,7 @@ Dependencies
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: zeus
>  revision: HEAD
>
>
> @@ -20,12 +20,12 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][zeus]' in the subject.
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-initramfs][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-initramfs][zeus][PATCH'
>
> -Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
> +zeus maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-multimedia/README b/meta-multimedia/README
> index 20f4fb8..968079f 100644
> --- a/meta-multimedia/README
> +++ b/meta-multimedia/README
> @@ -1,19 +1,19 @@
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: zeus
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-oe.git
>  layers: meta-oe
> -branch: master
> +branch: zeus
>  revision: HEAD
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia][zeus]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-multimedia][PATCH
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-multimedia][zeus][PATCH
>
>  You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets co=
nsisting of more than one patch. Other services like gitorious, repo.or.cz =
or self hosted setups are of course accepted as well, 'git fetch <remote>' =
works the same on all of them. We recommend github because it is free, easy=
 to use, has been proven to be reliable and has a really good web GUI.
>
> -Layer maintainer: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +zeus maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
> index 5c4c4ce..1fcb636 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -2,38 +2,12 @@ This file contains a list of maintainers for the meta-n=
etworking layer.
>
>  Please submit any patches against meta-networking to the OpenEmbedded
>  development mailing list (openembedded-devel@lists.openembedded.org) wit=
h
> -'[meta-networking]' in the subject.
> +'[meta-networking][zeus]' in the subject.
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3Dmeta-networking][PATCH
> +        --subject-prefix=3Dmeta-networking][zeus][PATCH
>
> -You may also contact the maintainers directly.
> -
> -Descriptions of section entries:
> -
> -        M: Mail patches to: FullName <address@domain>
> -        F: Files and directories with wildcard patterns.
> -           A trailing slash includes all files and subdirectory files.
> -           F: recipes-devtools/    all files in and below recipes-devtoo=
ls
> -           F: recipes-selinux/*    all files in recipes-selinux, but not=
 below
> -           One pattern per line.  Multiple F: lines acceptable.
> -
> -Please keep this list in alphabetical order.
> -
> -Maintainers List (try to look for most precise areas first)
> -
> -COMMON
> -M:      Khem Raj <raj.khem@gmail.com>
> -M:      "Joe MacDonald (backup)" <joe@deserted.net>
> -L:      openembedded-devel@lists.openembedded.org
> -Q:      https://patchwork.openembedded.org/project/oe/
> -S:      Maintained
> -F:      conf
> -F:      recipes-*
> -
> -NETKIT
> -M:      Armin Kuster <akuster808@gmail.com>
> -F:      recipes-netkit
> +zeus Maintainer:      Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-networking/README b/meta-networking/README
> index e1ba27d..41217dd 100644
> --- a/meta-networking/README
> +++ b/meta-networking/README
> @@ -18,19 +18,19 @@ Dependencies
>  This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: zeus
>  revision: HEAD
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://github.com/openembedded/meta-openembedded.git
>  subdirectory: meta-oe
> -branch: master
> +branch: zeus
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-openembedded.git
>  subdirectory: meta-python
> -branch: master
> +branch: zeus
>  revision: HEAD
>
>  Maintenance
> diff --git a/meta-oe/README b/meta-oe/README
> index 347816b..623056e 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -4,7 +4,7 @@ meta-oe
>  This layer depends on:
>
>  URI: git://github.com/openembedded/openembedded-core.git
> -branch: master
> +branch: zeus
>  revision: HEAD
>
>  luajit recipe requires host compiler to be able to generate 32bit code w=
hen target is 32bit
> @@ -14,10 +14,10 @@ e.g. on archlinux based distributions install prerequ=
isites like below
>
>  pacman -S lib32-gcc-libs lib32-glibc
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][zeus]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-oe][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-oe][zeus][PATCH'
>
>  You are encouraged to fork the mirror on GitHub https://github.com/opene=
mbedded/openembedded-core
>  to share your patches, this is preferred for patch sets consisting of mo=
re than one patch.
> @@ -26,4 +26,4 @@ Other services like gitorious, repo.or.cz or self-hoste=
d setups are of course ac
>  'git fetch <remote>' works the same on all of them. We recommend GitHub =
because it is free, easy
>  to use, has been proven to be reliable and has a really good web GUI.
>
> -layer maintainer: Khem Raj <raj.khem@gmail.com>
> +zeus maintainer: Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-perl/README b/meta-perl/README
> index 67f2910..6f18466 100644
> --- a/meta-perl/README
> +++ b/meta-perl/README
> @@ -52,7 +52,7 @@ Dependencies
>  This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: zeus
>    revision: HEAD
>    prio: default
>
> @@ -75,14 +75,12 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g with
> -'[meta-perl]' in the subject.
> +'[meta-perl][zeus]' in the subject.
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-perl][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-perl][zeus][PATCH'
>
> -Layer maintainers:
> -    Hongxu Jia <hongxu.jia@windriver.com>
> -    Tim "moto-timo" Orling <ticotimo@gmail.com>
> +zeus maintainers: Armin kuster <akuster808@gmail.com>
>
>  License
>  -------
> diff --git a/meta-python/README b/meta-python/README
> index 705b035..bd79192 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -13,12 +13,12 @@ The meta-python layer depends on:
>
>         URI: git://git.openembedded.org/openembedded-core
>         layers: meta
> -       branch: master
> +       branch: zeus
>         revision: HEAD
>
>         URI: git://git.openembedded.org/meta-openembedded
>         layers: meta-oe
> -       branch: master
> +       branch: zeus
>         revision: HEAD
>
>  Please follow the recommended setup procedures of your OE distribution.
> @@ -35,15 +35,13 @@ comments and patch review. It is subscriber only, so =
please register
>  before posting.
>
>  Send pull requests to openembedded-devel@lists.openembedded.org with
> -'[meta-python]' in the subject.
> +'[meta-python][zeus]' in the subject.
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org -=
-subject-prefix=3Dmeta-python][PATCH'
> +'git send-email -M -1 --to=3Dopenembedded-devel@lists.openembedded.org -=
-subject-prefix=3Dmeta-python][zeus][PATCH'
>
>  Maintenance
>  -------------------------
>
> -Layer Maintainers:
> -        Tim "moto-timo" Orling <TicoTimo@gmail.com>
> -        Derek Straka <derek@asterius.io>
> +zeus Maintainers: Armin Kuster <akuster808@gmail.com>
>
> diff --git a/meta-webserver/README b/meta-webserver/README
> index 7b60630..b39cd23 100644
> --- a/meta-webserver/README
> +++ b/meta-webserver/README
> @@ -13,14 +13,14 @@ This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
>  subdirectory: meta
> -branch: master
> +branch: zeus
>  revision: HEAD
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://github.com/openembedded/meta-oe.git
>  subdirectory: meta-oe
> -branch: master
> +branch: zeus
>  revision: HEAD
>
>
> @@ -52,9 +52,9 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-webserver]' in the subject.
> +with '[meta-webserver][zeus]' in the subject.
>
> -Layer maintainer: Derek Straka <derek@asterius.io>
> +zeus Maintainer: Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-xfce/README b/meta-xfce/README
> index 70ad47a..b250307 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -1,11 +1,11 @@
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: zeus
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: zeus
>  revision: HEAD
>  meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this rep=
ository.
>
> @@ -14,9 +14,9 @@ this to local.conf:
>
>  BBMASK =3D "meta-xfce/recipes-multimedia"
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-xfce]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-xfce][zeus]' in the subject'
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-xfce][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --s=
ubject-prefix=3Dmeta-xfce][zeus][PATCH'
>
> -Layer maintainer: Kai Kang <kai.kang@windriver.com>
> +zeus Maintainer: Armin Kuster <akuster808@gmail.com>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

