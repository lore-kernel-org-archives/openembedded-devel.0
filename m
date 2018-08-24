Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 025B979564
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 20:38:57 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z96-v6so8447028wrb.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 13:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OOAJTdR1OuoARXwXi1r/YSEfWMUYL+3+JcscfBrbpYQ=;
	b=cE19wCkc+TMccreUgV5yfrcHKDOcq4qrFJ09+8HmaLFQ8o6u5bonu7FJ5BHn3INLGh
	1sZjdZ6XcRNSe7oVYYu9W8q8J6hWITkP+RAjRZvkdNdqhy3FH/Fe+HaD/QA1f0lTxo1a
	HrWs1+96bd9AngbPBUZnzQJovG7euvODtroeA1fHdrHE1Iyr9ZJpvavHZhZ5O0t2BBy1
	ur8FsoJfDKEiHTmUVHi2nalrycf+VLYtw898mvE2lOZl2ogaNnwBiwZUZsTNubrwOwwZ
	1xXkORaYVlxXdVT3/Whdp/tC9TDlNoc9ykHyoOAjekiZM6rbczC92ItlQBGHhKoesOG+
	Io/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OOAJTdR1OuoARXwXi1r/YSEfWMUYL+3+JcscfBrbpYQ=;
	b=r1i2DsOsu0TCutGQPAHRC1SWTzqgKGbvMqOwwZ1LlHgLnkFB4q9mbTuKwql01wkwaA
	MnY08Ll8x34uUWDrTmBAtp0nVn1aCGnmuy+fBnUwj6xgKQiG6ke5Cn1xkFl5JsL4vBFE
	qK6nsjyXa5LdnsaUnexd4226NaVg42QyxL2BHFEMrOAJocl2nQ/5rrsod2ziyEX+ed3I
	Mye9rpDccfaksLku+UtRL1Y8xwIJAVN3tT1QbkZCoojsWFsvC+o7tO667nn6/AY57N5f
	PLrrqzakHKSs7lYZZ5CELJ/uVyiJobQ/L0VIuOvrCoVwyaM2N5nR74nRbOU/8R4Y3OLr
	Q/BA==
X-Gm-Message-State: APzg51AgkqtcnTA2Aynac6aAx8NCfMXesjwKpXVKBMx90M5AqX47p4J2
	k3nIECPI3yWH1YHHRx6mElYr6zKI0CKYU+/2+IU=
X-Google-Smtp-Source: ANB0VdZUrwtJM5LLzlc25Yo2Koqzdlk8bGozPUQj/C+/FBzMgVRupT3BO0rTPThG/HGhiRmQzxI2reu9HI83sFD0fNE=
X-Received: by 2002:adf:f28c:: with SMTP id
	k12-v6mr2225690wro.263.1535143138593; 
	Fri, 24 Aug 2018 13:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20180824203504.699-1-raj.khem@gmail.com>
In-Reply-To: <20180824203504.699-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Aug 2018 22:38:48 +0200
Message-ID: <CA+chaQcW5D+NbEPNU9CLmEp5nWctpCsHGKyRMNX_bO9C+d8iWw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Update maintainers
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
X-List-Received-Date: Fri, 24 Aug 2018 20:38:58 -0000
Content-Type: text/plain; charset="UTF-8"

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

On Fri, Aug 24, 2018 at 10:35 PM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  README                  | 5 ++++-
>  meta-filesystems/README | 2 +-
>  meta-initramfs/README   | 2 +-
>  meta-oe/README          | 2 +-
>  4 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/README b/README
> index 204966ac8d..7318f09cdb 100644
> --- a/README
> +++ b/README
> @@ -1,4 +1,7 @@
>  Collection of layers for the OE-core universe
>
> -Please see the respective READMEs in the layer subdirectories
> +Main layer maintainer: Khem Raj <raj.khem@gmail.com>
>
> +This repository is a collection of layers to suppliment OE-Core
> +with additional packages, Each layer have designated maintainer
> +Please see the respective READMEs in the layer subdirectories
> diff --git a/meta-filesystems/README b/meta-filesystems/README
> index 97d0e94bfe..87cb685b4a 100644
> --- a/meta-filesystems/README
> +++ b/meta-filesystems/README
> @@ -27,7 +27,7 @@ Please submit any patches against the filesystems layer
> to the
>  OpenEmbedded development mailing list (
> openembedded-devel@lists.openembedded.org)
>  with '[meta-filesystems]' in the subject.
>
> -Layer maintainer: Armin Kuster <akuster808@gmail.com>
> +Layer maintainer: Khem Raj <raj.khem@gmail.com>
>
>  When sending single patches, please use something like:
>
> diff --git a/meta-initramfs/README b/meta-initramfs/README
> index 7185383123..79244d43f0 100644
> --- a/meta-initramfs/README
> +++ b/meta-initramfs/README
> @@ -25,7 +25,7 @@ with '[meta-initramfs]' in the subject.
>  When sending single patches, please using something like:
>  'git send-email -M -1 --to openembedded-devel@lists.openembedded.org
> --subject-prefix=meta-initramfs][PATCH'
>
> -Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
> +Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
>
>
>  License
> diff --git a/meta-oe/README b/meta-oe/README
> index db5697dd90..0e9f8423bd 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -19,4 +19,4 @@ Other services like gitorious, repo.or.cz or
> self-hosted setups are of course ac
>  'git fetch <remote>' works the same on all of them. We recommend GitHub
> because it is free, easy
>  to use, has been proven to be reliable and has a really good web GUI.
>
> -Main layer maintainer: Armin Kuster <akuster808@gmail.com>
> +layer maintainer: Khem Raj <raj.khem@gmail.com>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

