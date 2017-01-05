Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7240471AEF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 18:11:41 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t79so494662096wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=8gYstNcd1s2670IGRHj/ZHPtoQl8uDslg7cLgeFhOcM=;
	b=DWXOWjXime2pg+TXaS9rsEboWN1WAmh878w0gficNM3LoQRmgBDT2iGOb+2VgGrzeu
	8tLI2AFWX+rn3tqnD2+h2TiY/mHoGYcdF61hiObh82IWQUbUJY/absluSy6WJrksOyme
	tgKsSdJ0jpOrM4mgbfqc4+iJySODz5xeyRcepDoHrd+5jBV5bBlnazSFryd0sdCFnDjt
	P5RRH/qaRN+i2ADp4NI9J6a8jUsverpD03549rliQ2LR2npSGmUh3HSs7Pg1RT4AOLIl
	9npkBDsRzmxRA2do+7x0SeroEyrpizYz8DNPGU0FXBUY7YIO7AiFVfaQ61YWcBZ3SRBQ
	h8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=8gYstNcd1s2670IGRHj/ZHPtoQl8uDslg7cLgeFhOcM=;
	b=QiMF09Jv6O4tDlqzmwKINj5tICzpO0lqLMB8ei5sWacyqumSsVcF3+ykYhpjVJNUCR
	/N3ruqhqH00+kvhuFwBzZDNPY6eXaSvT2gwci1T0PzV2g23q1vOMIgAMrPFU/d/Z7XcG
	D9E3Jdk9aIqQDZGuNoy5uf5i/PzYfPuxl3I912o7ImyWnzLprxHQlQC+KQhcMARf2p6h
	bWebK93AmabtCXx1IWxCSkH0q5Yj0Ikym6dKXrh/rbWjwtSIMm/IHbGP16/FsnFVb665
	Afpl/SfCh1BbVJHuxw6JNkg1qg1seGAIL7qI6NlCQXOrrO3Uf9bslMwg0X1v8wjLeAIY
	EodA==
X-Gm-Message-State: AIkVDXIKMhi+AN4vt9v2ukRkjjaV0TzhK+UUrG0JR6OF6zIpcOO3eNlRlY/EnCfJULrU1YJzDMNAXunuFDx8jg==
X-Received: by 10.28.18.194 with SMTP id 185mr61149262wms.124.1483639901708;
	Thu, 05 Jan 2017 10:11:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 5 Jan 2017 10:11:41 -0800 (PST)
In-Reply-To: <1483082223-18646-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
References: <1483082223-18646-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Jan 2017 19:11:41 +0100
Message-ID: <CA+chaQf9vRvzagN=OsKYHj4U7+ZvqZCfGJeQ8mXLL9f26QovkA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] lftp: update to 4.7.4
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
X-List-Received-Date: Thu, 05 Jan 2017 18:11:43 -0000
Content-Type: text/plain; charset=UTF-8

Resolving fossies.org (fossies.org)... 138.201.17.217
Connecting to fossies.org (fossies.org)|138.201.17.217|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://fossies.org/linux/misc/lftp-4.7.4.tar.bz2 [following]
--2017-01-05 11:21:20--  https://fossies.org/linux/misc/lftp-4.7.4.tar.bz2
Connecting to fossies.org (fossies.org)|138.201.17.217|:443... connected.
HTTP request sent, awaiting response... 410 Gone
2017-01-05 11:21:20 ERROR 410: Gone.



On Fri, Dec 30, 2016 at 8:17 AM, Oleksandr Kravchuk <
oleksandr.kravchuk@pelagicore.com> wrote:

> Upgraded package to v4.7.4 and changed source code archive format from
> tar.gz to tar.bz2 which is significantly smaller in size.
>
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  .../recipes-connectivity/lftp/{lftp_4.7.3.bb => lftp_4.7.4.bb}      | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-connectivity/lftp/{lftp_4.7.3.bb =>
> lftp_4.7.4.bb} (85%)
>
> diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> b/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
> similarity index 85%
> rename from meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> rename to meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
> index b0cd399..36fee56 100644
> --- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
> +++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
> @@ -6,11 +6,11 @@ SECTION = "console/network"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
> +SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.bz2 \
>             file://fix-gcc-6-conflicts-signbit.patch \
>            "
> -SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
> -SRC_URI[sha256sum] = "ce6519831603c19c2cf2e3c10b41d6
> ddc87a16049b99383e7b9b77fbc7707214"
> +SRC_URI[md5sum] = "7b54407ab24c1e78b45fe445d83eb5fd"
> +SRC_URI[sha256sum] = "95e7acfd9d0a2addeded1f00794aee
> ac43952ebc4924043965a5e1619df29128"
>
>  inherit autotools gettext pkgconfig
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

