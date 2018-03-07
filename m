Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 870B4600B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:42:35 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a16so1354754pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=s5sk+9aKd38f15NfU8ndAH4K+Xqzpfq2tQAkp23C3Vk=;
	b=lw/qABxj+BOPFlh+a8jgJcSMmrpNX3+sCzFaHhuxWfwKGR1pfcUFUSryrqYJBaJmI5
	bJ6Pz6VawfwHjFoemGZtxxotKudh7ATSlLiiFzifAha722grvLwBqlesZmr1FqgVt+P+
	5ZAl1X9rMkMTCh6K90zFi8qbeqCfCMZ4ELz8Asuk3/jgaoUhRFF4brpSrf6B4tqSHnOP
	rFtbvjWcwasJ+Vf6pVDIERKAQmmwsphm7+vtSYEHHSMAnj4T0AGBxQ/UmXddUZCIiLEh
	UO+jD/AxkPWPMSGn1ULLgnjiMkQnaIxMh25gMm1DtiXz0MYsitsnGYxc/lKKOYA6zgBZ
	gYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=s5sk+9aKd38f15NfU8ndAH4K+Xqzpfq2tQAkp23C3Vk=;
	b=kFh8dqp8mDdrxAmtNpmgQYjVts4D4dzRLssOL3PmASpEGPwZVEDNHq3MUAqJyId4eb
	+P3E5WkRCa0orFsaFYLZuHbZOvXyE411JIzRTWrJDf2R8r1mgY3tzxqlZfwewitQ3nI2
	/cTnof31IBuEyoUiLyz98bBlT6+6kKmdvrq0XqAQZNnaz0o6PVeZJ/ddsek1RfB6ZFk6
	gPMZfTFVXGs2Ks1wP17UpxHY8nMAQewQqPVIVUjJ6Y3CRkZBjdP6ME4A+Fsx2J+3Bk1B
	42DhhmqWnVmbkqGhn2v7COjErxoB/x77K0vbSTi8vJf5QXqXnmYm1flk91FCpZvs+/yT
	GtXg==
X-Gm-Message-State: APf1xPBRZCryXDFOlcKku/9z95NIfG3HGLmd7r1FZYrjQUtZGyn3aN11
	U3pdhTI0oRfdu6/Obw5coP10NQ==
X-Google-Smtp-Source: AG47ELt4zH6cGRW7FW24fCW7Ffx4rEltnu47cvJ3C87yyKTXF1NMoS8RCmjCbPuHSThiVRDLDDdQ0Q==
X-Received: by 10.98.139.145 with SMTP id e17mr23669718pfl.53.1520451756009;
	Wed, 07 Mar 2018 11:42:36 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:6d76:b853:98d2:431c?
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	g77sm41212131pfk.135.2018.03.07.11.42.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Mar 2018 11:42:35 -0800 (PST)
To: Derek Straka <derek@asterius.io>, openembedded-devel@lists.openembedded.org
References: <1520091651-25420-1-git-send-email-derek@asterius.io>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1284db2a-8cff-7f97-dc7b-dc17370167c6@gmail.com>
Date: Wed, 7 Mar 2018 11:42:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520091651-25420-1-git-send-email-derek@asterius.io>
Subject: Re: [meta-python][PATCHv3] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Wed, 07 Mar 2018 19:42:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/03/2018 07:40 AM, Derek Straka wrote:
> License-Update: Update the license checksum for copyright year and verify the terms remain the same
>
> diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
> --- SQLAlchemy-1.1.15/LICENSE	2017-11-03 16:47:01.000000000 -0400
> +++ SQLAlchemy-1.1.17/LICENSE	2018-02-22 16:08:41.000000000 -0500
> @@ -1,6 +1,6 @@
>  This is the MIT license: http://www.opensource.org/licenses/mit-license.php
>
> -Copyright (c) 2005-2017 the SQLAlchemy authors and contributors <see AUTHORS file>.
> +Copyright (c) 2005-2018 the SQLAlchemy authors and contributors <see AUTHORS file>.
>  SQLAlchemy is a trademark of Michael Bayer.
>
>  Permission is hereby granted, free of charge, to any person obtaining a copy of this
The above is confusing pw.sh as it thinks it a patch to be applied.

- armin
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-sqlalchemy.inc           | 6 +++---
>  .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
>  .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> index 2683a6a..0c191ae 100644
> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
>  application developers the full power and flexibility of SQL"
>  HOMEPAGE = "http://www.sqlalchemy.org/"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
>  
>  PYPI_PACKAGE = "SQLAlchemy"
>  inherit pypi
>  
> -SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
> -SRC_URI[sha256sum] = "8b79a5ed91cdcb5abe97b0045664c55c140aec09e5dd5c01303e23de5fe7a95a"
> +SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
> +SRC_URI[sha256sum] = "6b55ec379c11ad696f9371ce8e0de93c7f21134323f56a56a1b0d8fbef17013c"
>  
>  RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-json \
> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
> rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb


