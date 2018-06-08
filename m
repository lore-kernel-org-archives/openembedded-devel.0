Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3265475279
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jun 2018 22:53:08 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w10-v6so14781143wrk.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 15:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ZWZqxzC5ZV5zmsKdvqRwsi2fgxXu+UJr1xktuI1DP8k=;
	b=XIo1GYWbI7144w1Tvi63oVSGiF7w9zEVe1reWuyKK7WCWthM862AO5hUebx07WdFdc
	QCMyd1VHkD3TzAkTmJeBs++xf7QIXruDtGjbHEsOzdj6mxwZuwwxsK1VWVufby8zYx90
	qPyUTWnoODT2zocnOYyg7Y2jcm9+p6ckoZpgl4vPcxWuLqdV/kLtX8bgq6TUKAhR1KSq
	3JSbOx10jKkerAZRIVLgl5enoeASMOP+fuDruDFvpcpjH6ic/6FnrgA4yTLrBSeerHxc
	c6v2Gb+vN/QDn2LJ5WbLCT8lH3wFEpPCr5brr3VpsUrPCtRRTjdYJuPCXKHn0lYZWFGP
	ZUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ZWZqxzC5ZV5zmsKdvqRwsi2fgxXu+UJr1xktuI1DP8k=;
	b=RvaGpztvDcj3fU6FROUiPoUjb59HBNndEfUeySdFWKE7BeQzazuaD0QfFeUTMtAaPj
	ae0vDdCf+ZLoikcC7KLIv7B2y1A9M4D+QGhEwfnM+ByxoRga5LlDgqivsRnTJ0WXmqYd
	ub3P5xceeAQX/q0RwgJnzYfUOFvvLMLwwJNBhfdZHTCAeEioV+82xUlAGgugjaO/i8Ak
	Msdrzh8uUUk1KQ8blO0JgpA0Pj3BBbKSBaFkO6e8wA69O+l8Qe4nK1gL22cJEq6cmqcD
	Rgsxgi1VUELH2/B+G5OEx07V01qcsVUfjPcN4p53Rl6AgVzcVcrWYYLYAL5TQnsxDNul
	l3Mw==
X-Gm-Message-State: APt69E0lwasJ3+GaxAMIFJg7aUAF9PIJqseNLBugW7HtxnMU8mVOfKRV
	9IDo1Wohtn9g+Smflx3pBIzAUkx6FaXaAL1263X/gw==
X-Google-Smtp-Source: ADUXVKJghphJJ8RU7wvvbu3+ERw8+jdmv5bIc4G9/h30uR+CpvANKiUhfLVK3mCkrp6HYaMzVfGsaUvjQKF8eBlrNpQ=
X-Received: by 2002:adf:c7c3:: with SMTP id
	y3-v6mr6399202wrg.230.1528498388875; 
	Fri, 08 Jun 2018 15:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20180608225036.GF31886@vctlabs.com>
In-Reply-To: <20180608225036.GF31886@vctlabs.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 9 Jun 2018 00:52:57 +0200
Message-ID: <CA+chaQccz9f-D+V3vbYLoEen-ZRA_-0MZZRFAj2Rg4rmghe7pw@mail.gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [sumo][meta-qt5][PATCH] qt: upstream git branch 5.10.1 disappeared
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
X-List-Received-Date: Fri, 08 Jun 2018 22:53:08 -0000
Content-Type: text/plain; charset="UTF-8"

It would be much nicer if they exist at least on 5.10 branch instead of
5.11 :/.

Pruning origin
URL: git://code.qt.io/qt/qtbase.git
 * [pruned] origin/5.10.1
 * [pruned] origin/5.9.0
 * [pruned] origin/5.9.4
 * [pruned] origin/5.9.5

I still don't understand why they delete the branches, the commits are
still there, having them reachable from multiple branches doesn't add any
significant overhead.

On Sat, Jun 9, 2018 at 12:46 AM S. Lockwood-Childs <sjl@vctlabs.com> wrote:

> The branch called 5.10.1 no longer exists at code.qt.io repos.
>
> The corresponding v5.10.1 qt tags still exist (at least on those repos
> that originally got tagged during the release), and they are available
> on the 5.11 branch. Thus we can keep Qt source at 5.10.1 commits, but
> use 5.11 branch to check out those specific commits.
>
> This could be a bit confusing, making it look like 5.11 is the current
> default version for recipes, so for now there is a comment in qt5-git.inc
> trying to clarify the situation.
>
> A couple of repos that already were lacking 5.10.1 branch no longer
> need to override QT_MODULE_BRANCH, since their chosen commits are
> also available on 5.11 branch.
>
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>  recipes-qt/qt5/qt5-git.inc   | 3 ++-
>  recipes-qt/qt5/qtknx_git.bb  | 2 --
>  recipes-qt/qt5/qtmqtt_git.bb | 2 --
>  3 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index beba913..ae50871 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -2,7 +2,8 @@
>  # Copyright (C) 2013-2018 Martin Jansa <martin.jansa@gmail.com>
>
>  QT_MODULE ?= "${BPN}"
> -QT_MODULE_BRANCH ?= "5.10.1"
> +# branch named 5.10.1 got deleted upstream, but v5.10.1 tag still exists
> on 5.11 branch
> +QT_MODULE_BRANCH ?= "5.11"
>  QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
>
>  # each module needs to define valid SRCREV
> diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
> index fa981ab..5e01e3c 100644
> --- a/recipes-qt/qt5/qtknx_git.bb
> +++ b/recipes-qt/qt5/qtknx_git.bb
> @@ -9,6 +9,4 @@ LIC_FILES_CHKSUM = " \
>
>  DEPENDS += "qtbase"
>
> -QT_MODULE_BRANCH = "5.10"
> -
>  SRCREV = "29c34e8f072afd01002ed3847d752b4e065f977e"
> diff --git a/recipes-qt/qt5/qtmqtt_git.bb b/recipes-qt/qt5/qtmqtt_git.bb
> index 90c255d..b705f7c 100644
> --- a/recipes-qt/qt5/qtmqtt_git.bb
> +++ b/recipes-qt/qt5/qtmqtt_git.bb
> @@ -9,6 +9,4 @@ LIC_FILES_CHKSUM = " \
>
>  DEPENDS += "qtbase"
>
> -QT_MODULE_BRANCH = "5.10"
> -
>  SRCREV = "2c3c2a41c55a179332ec2a076856990f36dd5ef9"
> --
> 1.9.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

