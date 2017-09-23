Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id DDBA177E5D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Sep 2017 14:40:50 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u18so2331942pgo.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Sep 2017 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=Nk+olcw07PJQL95anbQAQ7SnCeoOVCc5q+9KCVIR4jQ=;
	b=bJ5RZbExK4M7Xd+yIq0OpiwifXGX1DFoTbSq8MIj5FP9eGl3t7jGJ3f9KXk0+pvNTZ
	E0ucTK0olNC/cXuBzbo9PqTHqGZ19pcpIXzm7/WtAmJR8kox3gKZHl9fA9zO9Krw5Lmc
	Q1lex/IeiSNklCF3ltod+GD6lsVmygTb5csLFI0Bs4VuJg+9SqlFqW/mDwLPxwF9mSPz
	/hMIS6emsfwwnm/4BFgPVPfvV/FXfIi8Sa7IS6S3PbZ7j+TznXFnANLpvE/iwzVqHnQy
	J7KfjIJdsyvxbwv+5nKxDvKNKX26QCiV5IhPAVN+5ZLb7AlxrBzMrC2USsUYh4HHkssw
	LT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Nk+olcw07PJQL95anbQAQ7SnCeoOVCc5q+9KCVIR4jQ=;
	b=ZXx0NegdkupQgytTpStwqdYgmR0nqN+l1n4GugmF+cLQO/Fgcpf95e8J2vRqsWr53j
	z0d1ICWwLuXOj4VUMLqrU//r/n4B/1IWiMxZqaStyIsUalHPP9Xa8US8I1aaIw7QOQyg
	zsvLt6W652yVtJeeZWh6cN5ZawtkLpjoE4KKySTV36Zn3RvnAd5k6PvvTithyDAD7Woi
	SEnlgIoNnYplrfD5psrtkHJReoumYudNIHPGSFiluA4Xc1eb7nYi0CSe1QNOApX3XUlq
	no+mgw8GB+f9qJ/NlAH9IYvME5qZhLtNEGiHg4ZtEcZ0imLncWBrIQg6tDxo3IPxuU27
	HEjg==
X-Gm-Message-State: AHPjjUgcv3dyUyUGJKOGj61y01WgxFZ1wKd2Ecczdxmf1/oUzF0ykwiT
	Eu2WNLvPc5WRNnLwIs5fKgcDNA==
X-Google-Smtp-Source: AOwi7QAi+QeQ/+0ImL3AIaJfyp8ItCLG+KZ847f6di8BFlcOzzcAEF8M6Maq5yy1oiZYqliegU7QJA==
X-Received: by 10.98.144.142 with SMTP id q14mr2282677pfk.303.1506177651581;
	Sat, 23 Sep 2017 07:40:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d126:a20b:717e:18a0?
	([2601:202:4001:9ea0:d126:a20b:717e:18a0])
	by smtp.gmail.com with ESMTPSA id
	195sm4268345pgg.42.2017.09.23.07.40.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Sep 2017 07:40:50 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>, Armin Kuster <akuster808@gmail.com>
References: <1506135778-13189-1-git-send-email-akuster808@gmail.com>
	<CA+chaQecv6JVKg_+04FiOW0iEW7B0Vdffwf3iAwYxPYAZjNZ-g@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <adbd04b2-8c6e-e6ae-56da-8c02da08efac@gmail.com>
Date: Sat, 23 Sep 2017 07:40:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQecv6JVKg_+04FiOW0iEW7B0Vdffwf3iAwYxPYAZjNZ-g@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sat, 23 Sep 2017 14:40:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 09/23/2017 12:36 AM, Martin Jansa wrote:
> Thanks for quick sign-up :)
np. I could not find the auto-renew button so I did it the old fashion way.

>
> I've noticed:
>
>    URI: git://git.openembedded.org/bitbake
> <http://git.openembedded.org/bitbake>
> -  branch: master
> +  branch: 1.28
>
> in meta-filesystems/README, it should be 1.36.
fixing is v2.

- armin
>
> I'll leave this change on patchwork, ML for a while, for now rocko and
> master are identical, until there is first 2.5 specific change I'll
> keep it that way (we'll fix all pending build failures until then
> hopefully).
>
> On Sat, Sep 23, 2017 at 5:02 AM, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      meta-filesystems/README     | 12 +++++++-----
>      meta-gnome/README           | 11 ++++++-----
>      meta-initramfs/README       | 10 +++++-----
>      meta-multimedia/README      | 15 +++++++--------
>      meta-networking/MAINTAINERS |  7 +++++--
>      meta-oe/README              | 10 +++++-----
>      meta-perl/README            |  9 +++++----
>      meta-python/README          |  4 ++--
>      meta-webserver/README       |  4 ++--
>      meta-xfce/README            | 11 ++++++-----
>      10 files changed, 50 insertions(+), 43 deletions(-)
>
>     diff --git a/meta-filesystems/README b/meta-filesystems/README
>     index d2716f8..9ddd09e 100644
>     --- a/meta-filesystems/README
>     +++ b/meta-filesystems/README
>     @@ -10,22 +10,22 @@ Dependencies
>      This layer depends on:
>
>        URI: git://git.openembedded.org/bitbake
>     <http://git.openembedded.org/bitbake>
>     -  branch: master
>     +  branch: 1.28
>
>        URI: git://git.openembedded.org/openembedded-core
>     <http://git.openembedded.org/openembedded-core>
>        layers: meta
>     -  branch: master
>     +  branch: rocko
>
>        URI: git://git.openembedded.org/meta-openembedded
>     <http://git.openembedded.org/meta-openembedded>
>        layers: meta-oe
>     -  branch: master
>     +  branch: rocko
>
>      Patches
>      =======
>
>      Please submit any patches against the filesystems layer to the
>      OpenEmbedded development mailing list
>     (openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>)
>     -with '[meta-filesystems]' in the subject.
>     +with '[meta-filesystems][rocko]' in the subject.
>
>      Maintainers List:
>        physfs      Andreas Müller <schnitzeltony@googlemail.com
>     <mailto:schnitzeltony@googlemail.com>>
>     @@ -66,8 +66,10 @@ When sending single patches, please use
>     something like:
>
>         git send-email -1 -M \
>              --to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> \
>     -        --subject-prefix=meta-filesystems][PATCH
>     +        --subject-prefix=meta-filesystems][rocko][PATCH
>
>     +rocko Branch Maintainer:
>     +Armin Kuster <akuster808@gmail.com <mailto:akuster808@gmail.com>>
>
>      Table of Contents
>      =================
>     diff --git a/meta-gnome/README b/meta-gnome/README
>     index 0c4fbd2..25ef85d 100644
>     --- a/meta-gnome/README
>     +++ b/meta-gnome/README
>     @@ -1,16 +1,17 @@
>      This layer depends on:
>
>      URI: git://github.com/openembedded/oe-core.git
>     <http://github.com/openembedded/oe-core.git>
>     -branch: master
>     +branch: rocko
>      revision: HEAD
>
>      URI: git://github.com/openembedded/meta-oe.git
>     <http://github.com/openembedded/meta-oe.git>
>     -branch: master
>     +branch: rocko
>      revision: HEAD
>
>     -Send pull requests to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with
>     '[meta-gnome]' in the subject'
>     +Send pull requests to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with
>     '[meta-gnome][rocko]' in the subject'
>
>      When sending single patches, please using something like:
>     -'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-gnome][PATCH'
>     +'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-gnome][rocko][PATCH'
>
>     -Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>     +rocko Branch Maintainer:
>     +Armin Kuster <akuster808@gmail.com <mailto:akuster808@gmail.com>>
>     diff --git a/meta-initramfs/README b/meta-initramfs/README
>     index e24acf9..b7dbfef 100644
>     --- a/meta-initramfs/README
>     +++ b/meta-initramfs/README
>     @@ -12,7 +12,7 @@ Dependencies
>      This layer depends on:
>
>      URI: git://github.com/openembedded/oe-core.git
>     <http://github.com/openembedded/oe-core.git>
>     -branch: master
>     +branch: rocko
>      revision: HEAD
>
>
>     @@ -20,13 +20,13 @@ Maintenance
>      -----------
>
>      Send patches / pull requests to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     -with '[meta-initramfs]' in the subject.
>     +with '[meta-initramfs][rocko]' in the subject.
>
>      When sending single patches, please using something like:
>     -'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-initramfs][PATCH'
>     +'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-initramfs][rocko][PATCH'
>
>     -Layer maintainers: Andrea Adami <andrea.adami@gmail.com
>     <mailto:andrea.adami@gmail.com>>
>     -                   Paul Eggleton <paul.eggleton@linux.intel.com
>     <mailto:paul.eggleton@linux.intel.com>>
>     +rocko Branch Maintainer:
>     +Armin Kuster <akuster808@gmail.com <mailto:akuster808@gmail.com>>
>
>
>      License
>     diff --git a/meta-multimedia/README b/meta-multimedia/README
>     index cbdc1b5..b59dfe0 100644
>     --- a/meta-multimedia/README
>     +++ b/meta-multimedia/README
>     @@ -1,21 +1,20 @@
>      This layer depends on:
>
>      URI: git://github.com/openembedded/oe-core.git
>     <http://github.com/openembedded/oe-core.git>
>     -branch: master
>     +branch: rocko
>      revision: HEAD
>
>      URI: git://github.com/openembedded/meta-oe.git
>     <http://github.com/openembedded/meta-oe.git>
>     -layers: meta-oe, meta-ruby
>     -branch: master
>     +layers: meta-oe
>     +branch: rocko
>      revision: HEAD
>
>     -Send pull requests to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with
>     '[meta-multimedia]' in the subject'
>     +Send pull requests to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with
>     '[meta-multimedia][rocko]' in the subject'
>
>      When sending single patches, please use something like:
>     -'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-multimedia][PATCH
>     +'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-multimedia][rocko][PATCH
>
>      You are encouraged to fork the mirror on github
>     https://github.com/openembedded/meta-oe/
>     <https://github.com/openembedded/meta-oe/> to share your patches,
>     this is preferred for patch sets consisting of more than one
>     patch. Other services like gitorious, repo.or.cz
>     <http://repo.or.cz> or self hosted setups are of course accepted
>     as well, 'git fetch <remote>' works the same on all of them. We
>     recommend github because it is free, easy to use, has been proven
>     to be reliable and has a really good web GUI.
>
>     -Main layer maintainers: Koen Kooi <koen@dominion.thruhere.net
>     <mailto:koen@dominion.thruhere.net>>
>     -                        Martin Jansa <martin.jansa@gmail.com
>     <mailto:martin.jansa@gmail.com>>
>     -
>     +rocko Branch Maintainer:
>     +Armin Kuster <akuster808@gmail.com <mailto:akuster808@gmail.com>>
>     diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
>     index bbb2d1b..771c73c 100644
>     --- a/meta-networking/MAINTAINERS
>     +++ b/meta-networking/MAINTAINERS
>     @@ -2,13 +2,16 @@ This file contains a list of maintainers for the
>     meta-networking layer.
>
>      Please submit any patches against meta-networking to the OpenEmbedded
>      development mailing list
>     (openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>) with
>     -'[meta-networking]' in the subject.
>     +'[meta-networking][rocko]' in the subject.
>
>      When sending single patches, please use something like:
>
>         git send-email -1 -M \
>              --to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> \
>     -        --subject-prefix=meta-networking][PATCH
>     +        --subject-prefix=meta-networking][rocko][PATCH
>     +
>     +rocko Branch Maintainer:
>     +Armin Kuster <akuster808@gmail.com <mailto:akuster808@gmail.com>>
>
>      You may also contact the maintainers directly.
>
>     diff --git a/meta-oe/README b/meta-oe/README
>     index 6ad87c5..dabed2f 100644
>     --- a/meta-oe/README
>     +++ b/meta-oe/README
>     @@ -1,15 +1,15 @@
>      This layer depends on:
>
>      URI: git://github.com/openembedded/oe-core.git
>     <http://github.com/openembedded/oe-core.git>
>     -branch: master
>     +branch: rocko
>      revision: HEAD
>
>     -Send pull requests to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with
>     '[meta-oe]' in the subject'
>     +Send pull requests to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with
>     '[meta-oe][rocko]' in the subject'
>
>      When sending single patches, please use something like:
>     -'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-oe][PATCH'
>     +'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-oe][rocko][PATCH'
>
>      You are encouraged to fork the mirror on github
>     https://github.com/openembedded/meta-oe/
>     <https://github.com/openembedded/meta-oe/> to share your patches,
>     this is preferred for patch sets consisting of more than one
>     patch. Other services like gitorious, repo.or.cz
>     <http://repo.or.cz> or self hosted setups are of course accepted
>     as well, 'git fetch <remote>' works the same on all of them. We
>     recommend github because it is free, easy to use, has been proven
>     to be reliable and has a really good web GUI.
>
>     -Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net
>     <mailto:koen@dominion.thruhere.net>>
>     -                       Martin Jansa <martin.jansa@gmail.com
>     <mailto:martin.jansa@gmail.com>>
>     +rocko Branch Maintainer:
>     +Armin Kuster <akuster808@gmail.com <mailto:akuster808@gmail.com>>
>     diff --git a/meta-perl/README b/meta-perl/README
>     index 68160a6..cc965af 100644
>     --- a/meta-perl/README
>     +++ b/meta-perl/README
>     @@ -52,7 +52,7 @@ Dependencies
>      This layer depends on:
>
>        URI: git://git.openembedded.org/openembedded-core
>     <http://git.openembedded.org/openembedded-core>
>     -  branch: master
>     +  branch: rocko
>        revision: HEAD
>        prio: default
>
>     @@ -75,12 +75,13 @@ Maintenance
>      -----------
>
>      Send patches / pull requests to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with
>     -'[meta-perl]' in the subject.
>     +'[meta-perl][rocko]' in the subject.
>
>      When sending single patches, please using something like:
>     -'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-perl][PATCH'
>     +'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-perl][rocko][PATCH'
>
>     -Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +rocko Branch Maintainer:
>     +Armin Kuster <akuster808@gmail.com <mailto:akuster808@gmail.com>>
>
>      License
>      -------
>     diff --git a/meta-python/README b/meta-python/README
>     index 905d5ee..43740f6 100644
>     --- a/meta-python/README
>     +++ b/meta-python/README
>     @@ -17,12 +17,12 @@ The meta-python layer depends on:
>
>             URI: git://git.openembedded.org/openembedded-core
>     <http://git.openembedded.org/openembedded-core>
>             layers: meta
>     -       branch: master
>     +       branch: rocko
>             revision: HEAD
>
>             URI: git://git.openembedded.org/meta-openembedded
>     <http://git.openembedded.org/meta-openembedded>
>             layers: meta-oe
>     -       branch: master
>     +       branch:  rocko
>             revision: HEAD
>
>      Please follow the recommended setup procedures of your OE
>     distribution.
>     diff --git a/meta-webserver/README b/meta-webserver/README
>     index 7b60630..f2928ab 100644
>     --- a/meta-webserver/README
>     +++ b/meta-webserver/README
>     @@ -13,14 +13,14 @@ This layer depends on:
>
>      URI: git://github.com/openembedded/oe-core.git
>     <http://github.com/openembedded/oe-core.git>
>      subdirectory: meta
>     -branch: master
>     +branch: rocko
>      revision: HEAD
>
>      For some recipes, the meta-oe layer is required:
>
>      URI: git://github.com/openembedded/meta-oe.git
>     <http://github.com/openembedded/meta-oe.git>
>      subdirectory: meta-oe
>     -branch: master
>     +branch: rocko
>      revision: HEAD
>
>
>     diff --git a/meta-xfce/README b/meta-xfce/README
>     index 33ef509..3367797 100644
>     --- a/meta-xfce/README
>     +++ b/meta-xfce/README
>     @@ -1,11 +1,11 @@
>      This layer depends on:
>
>      URI: git://github.com/openembedded/oe-core.git
>     <http://github.com/openembedded/oe-core.git>
>     -branch: master
>     +branch: rocko
>      revision: HEAD
>
>      URI: git://github.com/openembedded/meta-oe.git
>     <http://github.com/openembedded/meta-oe.git>
>     -branch: master
>     +branch: rocko
>      revision: HEAD
>      meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in
>     this repository.
>
>     @@ -14,9 +14,10 @@ this to local.conf:
>
>      BBMASK = "meta-xfce/recipes-multimedia"
>
>     -Send pull requests to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with
>     '[meta-xfce]' in the subject'
>     +Send pull requests to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with
>     '[meta-xfce][rocko]' in the subject'
>
>      When sending single patches, please using something like:
>     -'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-xfce][PATCH'
>     +'git send-email -M -1 --to
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     --subject-prefix=meta-xfce][rocko][PATCH'
>
>     -Interim layer maintainer: Andreas Müller
>     <schnitzeltony@googlemail.com <mailto:schnitzeltony@googlemail.com>>
>     +rocko Branch Maintainer:
>     +Armin Kuster <akuster808@gmail.com <mailto:akuster808@gmail.com>>
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


