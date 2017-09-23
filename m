Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 16A3A78370
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Sep 2017 07:36:47 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i131so2968605wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Sep 2017 00:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AxJlLglxoXdfbr9EbUQL5GsriPNcWJwlpBYpkN9PySg=;
	b=sWIeK1djbKLCbZZKAmZlPvJ0BmrU7SuyRq+kFFxVR+9pwOyKBssn72rFts6x0gaS0U
	8I+fJupz9QjSJbnXXpWCkGzVIPkxKM3GLP6SQCSqnqzHntXqgdd+SDIXh4wXiM3Y33wV
	NzqcvcM5CWwQ8egVZ+O/SaNl7EL8VBjA/kXkUKdF+XaQY5AY2fDPx1jQCfinXIq/am9/
	RlvHKLkqVHmc2mKhBg7LzWs1opdhAygZDbbiArt9VUWcfscGSI9A7/VkKlahiqS09Nie
	CnZCpNiR1ZTRK15H3fCaSTOeQ/Z/6uaGt+hU/UWyvzMXOo2GJrM8MohDUco3D2DbhFrN
	xWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AxJlLglxoXdfbr9EbUQL5GsriPNcWJwlpBYpkN9PySg=;
	b=jWVCvxfQxvDi/JEDOvr6wNhP54meWoWHzD6BaUY2iFTEGBgaqcqgkbYUPdMJjQxqhW
	ZSJwe1tqUWpUnDsCNvAfGq32PBsoJ1E0vuZWkywLOfE1xyzp8D1yjUmabDNM6DFJDaK5
	96sOa17Z5czaMBmb0BUbZnOFp8ZPsydsiF4g7FG/n9f7smWK1RuafSGeTzA2MopZ9ORt
	h2P7XUMD/iphAcG4J3KTkXLA2WyN3b1/7VnJf6cIko4e4JX/SEW58ueniuegslX92m9/
	oPM29WhQPJDML+b59ysJyNZpLYUAb+e00/I5lgkaK1NfvdzSGW8H4++2iH06dhXhLJaS
	wLiQ==
X-Gm-Message-State: AHPjjUhrCLZEnxYiRM3bCBoHzxfZNcCPnJ2L7VY7A2BPQbRuTGRXl1K/
	r/1Qhmfu7j0tfSmSPEb4tDajlB9N/JpJw2mXtZ4=
X-Google-Smtp-Source: AOwi7QAIIcIfwmU86OvhA8LTN80mnQaJ6tFtWVVikGCJsjgoBiGgCTsmrFrCibE1BfaqFT6gt+TW7CjZHXFmspScpWU=
X-Received: by 10.28.73.134 with SMTP id w128mr5357380wma.141.1506152208363;
	Sat, 23 Sep 2017 00:36:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Sat, 23 Sep 2017 00:36:47 -0700 (PDT)
In-Reply-To: <1506135778-13189-1-git-send-email-akuster808@gmail.com>
References: <1506135778-13189-1-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 23 Sep 2017 09:36:47 +0200
Message-ID: <CA+chaQecv6JVKg_+04FiOW0iEW7B0Vdffwf3iAwYxPYAZjNZ-g@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "akuster@mvista" <akuster@mvista.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [rocko][PATCH][Maintainership] README: update maintainers list for rocko
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
X-List-Received-Date: Sat, 23 Sep 2017 07:36:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for quick sign-up :)

I've noticed:

   URI: git://git.openembedded.org/bitbake
-  branch: master
+  branch: 1.28

in meta-filesystems/README, it should be 1.36.

I'll leave this change on patchwork, ML for a while, for now rocko and
master are identical, until there is first 2.5 specific change I'll keep it
that way (we'll fix all pending build failures until then hopefully).

On Sat, Sep 23, 2017 at 5:02 AM, Armin Kuster <akuster808@gmail.com> wrote:

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-filesystems/README     | 12 +++++++-----
>  meta-gnome/README           | 11 ++++++-----
>  meta-initramfs/README       | 10 +++++-----
>  meta-multimedia/README      | 15 +++++++--------
>  meta-networking/MAINTAINERS |  7 +++++--
>  meta-oe/README              | 10 +++++-----
>  meta-perl/README            |  9 +++++----
>  meta-python/README          |  4 ++--
>  meta-webserver/README       |  4 ++--
>  meta-xfce/README            | 11 ++++++-----
>  10 files changed, 50 insertions(+), 43 deletions(-)
>
> diff --git a/meta-filesystems/README b/meta-filesystems/README
> index d2716f8..9ddd09e 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -10,22 +10,22 @@ Dependencies
>  This layer depends on:
>
>    URI: git://git.openembedded.org/bitbake
> -  branch: master
> +  branch: 1.28
>
>    URI: git://git.openembedded.org/openembedded-core
>    layers: meta
> -  branch: master
> +  branch: rocko
>
>    URI: git://git.openembedded.org/meta-openembedded
>    layers: meta-oe
> -  branch: master
> +  branch: rocko
>
>  Patches
>  =3D=3D=3D=3D=3D=3D=3D
>
>  Please submit any patches against the filesystems layer to the
>  OpenEmbedded development mailing list (openembedded-devel@lists.
> openembedded.org)
> -with '[meta-filesystems]' in the subject.
> +with '[meta-filesystems][rocko]' in the subject.
>
>  Maintainers List:
>    physfs      Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> @@ -66,8 +66,10 @@ When sending single patches, please use something like=
:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3Dmeta-filesystems][PATCH
> +        --subject-prefix=3Dmeta-filesystems][rocko][PATCH
>
> +rocko Branch Maintainer:
> +Armin Kuster <akuster808@gmail.com>
>
>  Table of Contents
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/meta-gnome/README b/meta-gnome/README
> index 0c4fbd2..25ef85d 100644
> --- a/meta-gnome/README
> +++ b/meta-gnome/README
> @@ -1,16 +1,17 @@
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: rocko
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: rocko
>  revision: HEAD
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-gnome]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-gnome][rocko]' in the subject'
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-gnome][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-gnome][rocko][PATCH'
>
> -Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
> +rocko Branch Maintainer:
> +Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index e24acf9..b7dbfef 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -12,7 +12,7 @@ Dependencies
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: rocko
>  revision: HEAD
>
>
> @@ -20,13 +20,13 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> -with '[meta-initramfs]' in the subject.
> +with '[meta-initramfs][rocko]' in the subject.
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-initramfs][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-initramfs][rocko][PATCH'
>
> -Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
> -                   Paul Eggleton <paul.eggleton@linux.intel.com>
> +rocko Branch Maintainer:
> +Armin Kuster <akuster808@gmail.com>
>
>
>  License
> diff --git a/meta-multimedia/README b/meta-multimedia/README
> index cbdc1b5..b59dfe0 100644
> --- a/meta-multimedia/README
> +++ b/meta-multimedia/README
> @@ -1,21 +1,20 @@
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: rocko
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-oe.git
> -layers: meta-oe, meta-ruby
> -branch: master
> +layers: meta-oe
> +branch: rocko
>  revision: HEAD
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-multimedia]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-multimedia][rocko]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-multimedia][PATCH
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-multimedia][rocko][PATCH
>
>  You are encouraged to fork the mirror on github https://github.com/
> openembedded/meta-oe/ to share your patches, this is preferred for patch
> sets consisting of more than one patch. Other services like gitorious,
> repo.or.cz or self hosted setups are of course accepted as well, 'git
> fetch <remote>' works the same on all of them. We recommend github becaus=
e
> it is free, easy to use, has been proven to be reliable and has a really
> good web GUI.
>
> -Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
> -                        Martin Jansa <martin.jansa@gmail.com>
> -
> +rocko Branch Maintainer:
> +Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
> index bbb2d1b..771c73c 100644
> --- a/meta-networking/MAINTAINERS
> +++ b/meta-networking/MAINTAINERS
> @@ -2,13 +2,16 @@ This file contains a list of maintainers for the
> meta-networking layer.
>
>  Please submit any patches against meta-networking to the OpenEmbedded
>  development mailing list (openembedded-devel@lists.openembedded.org) wit=
h
> -'[meta-networking]' in the subject.
> +'[meta-networking][rocko]' in the subject.
>
>  When sending single patches, please use something like:
>
>     git send-email -1 -M \
>          --to openembedded-devel@lists.openembedded.org \
> -        --subject-prefix=3Dmeta-networking][PATCH
> +        --subject-prefix=3Dmeta-networking][rocko][PATCH
> +
> +rocko Branch Maintainer:
> +Armin Kuster <akuster808@gmail.com>
>
>  You may also contact the maintainers directly.
>
> diff --git a/meta-oe/README b/meta-oe/README
> index 6ad87c5..dabed2f 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -1,15 +1,15 @@
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: rocko
>  revision: HEAD
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-oe]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-oe][rocko]' in the subject'
>
>  When sending single patches, please use something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-oe][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-oe][rocko][PATCH'
>
>  You are encouraged to fork the mirror on github https://github.com/
> openembedded/meta-oe/ to share your patches, this is preferred for patch
> sets consisting of more than one patch. Other services like gitorious,
> repo.or.cz or self hosted setups are of course accepted as well, 'git
> fetch <remote>' works the same on all of them. We recommend github becaus=
e
> it is free, easy to use, has been proven to be reliable and has a really
> good web GUI.
>
> -Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
> -                       Martin Jansa <martin.jansa@gmail.com>
> +rocko Branch Maintainer:
> +Armin Kuster <akuster808@gmail.com>
> diff --git a/meta-perl/README b/meta-perl/README
> index 68160a6..cc965af 100644
> --- a/meta-perl/README
> +++ b/meta-perl/README
> @@ -52,7 +52,7 @@ Dependencies
>  This layer depends on:
>
>    URI: git://git.openembedded.org/openembedded-core
> -  branch: master
> +  branch: rocko
>    revision: HEAD
>    prio: default
>
> @@ -75,12 +75,13 @@ Maintenance
>  -----------
>
>  Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
> with
> -'[meta-perl]' in the subject.
> +'[meta-perl][rocko]' in the subject.
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-perl][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-perl][rocko][PATCH'
>
> -Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
> +rocko Branch Maintainer:
> +Armin Kuster <akuster808@gmail.com>
>
>  License
>  -------
> diff --git a/meta-python/README b/meta-python/README
> index 905d5ee..43740f6 100644
> --- a/meta-python/README
> +++ b/meta-python/README
> @@ -17,12 +17,12 @@ The meta-python layer depends on:
>
>         URI: git://git.openembedded.org/openembedded-core
>         layers: meta
> -       branch: master
> +       branch: rocko
>         revision: HEAD
>
>         URI: git://git.openembedded.org/meta-openembedded
>         layers: meta-oe
> -       branch: master
> +       branch:  rocko
>         revision: HEAD
>
>  Please follow the recommended setup procedures of your OE distribution.
> diff --git a/meta-webserver/README b/meta-webserver/README
> index 7b60630..f2928ab 100644
> --- a/meta-webserver/README
> +++ b/meta-webserver/README
> @@ -13,14 +13,14 @@ This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
>  subdirectory: meta
> -branch: master
> +branch: rocko
>  revision: HEAD
>
>  For some recipes, the meta-oe layer is required:
>
>  URI: git://github.com/openembedded/meta-oe.git
>  subdirectory: meta-oe
> -branch: master
> +branch: rocko
>  revision: HEAD
>
>
> diff --git a/meta-xfce/README b/meta-xfce/README
> index 33ef509..3367797 100644
> --- a/meta-xfce/README
> +++ b/meta-xfce/README
> @@ -1,11 +1,11 @@
>  This layer depends on:
>
>  URI: git://github.com/openembedded/oe-core.git
> -branch: master
> +branch: rocko
>  revision: HEAD
>
>  URI: git://github.com/openembedded/meta-oe.git
> -branch: master
> +branch: rocko
>  revision: HEAD
>  meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this
> repository.
>
> @@ -14,9 +14,10 @@ this to local.conf:
>
>  BBMASK =3D "meta-xfce/recipes-multimedia"
>
> -Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-xfce]' in the subject'
> +Send pull requests to openembedded-devel@lists.openembedded.org with
> '[meta-xfce][rocko]' in the subject'
>
>  When sending single patches, please using something like:
> -'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-xfce][PATCH'
> +'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-xfce][rocko][PATCH'
>
> -Interim layer maintainer: Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
> +rocko Branch Maintainer:
> +Armin Kuster <akuster808@gmail.com>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

