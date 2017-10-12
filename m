Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6FACA6010B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 02:22:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r68so3138359wmr.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 19:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/8EajzSh48K5wW5jV9CqpRMtheIqxhyJzSarbCUNTg8=;
	b=PSvqZo9iLDwaODdCT+PwxlTARhFLPT20IdytCzLs6/0WeweYqGZZfxMOmEbq2Vw8H3
	czeDRE5kpTie1dy2avyj42CBfp+nUFwkV8dQ6TlAS39hixOoUe2FLHTO1zWGlfEZVeys
	+g8/mEKsIMN2Bzh5GNsHGogK8LCYu874rd/3WpZfDZZw//ElY0lIGZMXD3rmpK05SLx1
	ie+Y897Bi42KqLu5KNS+gm6rBCtlHh5p5apRMPLZ/KUMobc3l14QP3+PP1Ya+nOj/o0D
	yQZ7kY87skyvXVMzNcX9jVpPXz+oalbp7B3wo0OJewdWFB19tbiJKobpP68kIN1sOd80
	GL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/8EajzSh48K5wW5jV9CqpRMtheIqxhyJzSarbCUNTg8=;
	b=nrqEe+ODISmvfMpg2WU4nq8o7K8Jho4QZsKDyO8YKTnfg7wnuqG+FwDATmYxMjIl/J
	nv2L8Y5L2IYrL59J5cs9b66nyWVgy4sXQaf65wX2Xy8+9hJJL2CBdFj+j0xF7+OPzF9b
	piMV/7smm/I/rSTyELpKVOgGQeHYk1OHS1TtdBecw8sJ8cBC6g5VOEX3SYvpn+G1CrO9
	VoxMClgyPjr/70yN+SOijZ3EkKJJ86ZPK8BEdJuPLfeDGwkjbHUbgmToN+PfGoIYfp08
	31NK6XyGodl/Hg8osHwMZ3Hwv9lOfmLA1iQTKsn1sOdp4m9RCuMKYREAwofgBCWPh3nS
	ulBQ==
X-Gm-Message-State: AMCzsaVOKT/zduHdjF9TZkilD59xcg/R1joyk/o+F34yB7FCmNnjBI+M
	173JTc7uDS2lPX6RlONUJIZRrOOwXMUFDTD/rWg=
X-Google-Smtp-Source: AOwi7QA5+nXUS/pgGKPb283AP5W+vvSBjjFBnf0xSi47GKIBda/rQ1oDyc3b4BGzU+kZbGSVSSneesQBafiCjaH53zw=
X-Received: by 10.223.143.56 with SMTP id p53mr598961wrb.179.1507774966117;
	Wed, 11 Oct 2017 19:22:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Wed, 11 Oct 2017 19:22:45 -0700 (PDT)
In-Reply-To: <CACrLJgCiTiQyCjtfzSkhHzMtBTtxF6j2=cdjxQ2byb0Cihg1uQ@mail.gmail.com>
References: <CACrLJgCiTiQyCjtfzSkhHzMtBTtxF6j2=cdjxQ2byb0Cihg1uQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 12 Oct 2017 04:22:45 +0200
Message-ID: <CA+chaQe38aKLQakMfZVjyZvvi0eqANwHBYZaJadLFCutRe1wwg@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Stephen Lawrence <stephen.lawrence@renesas.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5] Keep Qt 5.6.x
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
X-List-Received-Date: Thu, 12 Oct 2017 02:22:45 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Changhyeok,

do we have a volunteer to maintain it?

As you know, it's possible to use meta-qt5/krogoth (with 5.6 Qt) together
with newer Yocto releases, currently it doesn't even need any difficult
work arounds to make it compatible.

If there is someone volunteering to maintain some meta-qt5/master-5.6
branch, I would accept the patches. But I don't want to maintain 2 sets of
.patch files for many qt* recipes in the same branch (and also some qt*
projects are available in only one of these versions). I was maintaining
multiple versions in the same branch before and it was quite painful, it's
quite a mess even with one version and I would prefer to spend my free time
on something else.

Regards,

On Thu, Oct 12, 2017 at 3:03 AM, Changhyeok Bae <changhyeok.bae@gmail.com>
wrote:

> Hi maintainers
>
> Qt 5.6 is LTS version and not GPL3 license.
> So why don't you keep v5.6.x in master branch?
> Many companies, opensource projects and developers would like to use Qt
> v5.6 in master branch to use it with latest yocto release.
>
> Thanks
> Changhyeok
>

