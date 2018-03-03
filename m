Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0300D789C0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 16:42:16 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id k8-v6so7400917pli.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2018 08:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ye+d/EPPS+Op+b+7MXL1c7fHn0fTwCIQPn7L8RagI2k=;
	b=pIXySbjGEsYQW/3XlGH4hIGNL0WWrhNMhzmWYwQD4tjMczFfUmxjwVOHkZo9+gRAmE
	XYGn2g49Pmri2amqIlm3lUhBBsE+XEogPopUPKREYh7eiJYKOqbBSf2+5bHDbthRmg7D
	vCsyQ30ZEiPe0oAu5PEbwBgse4p6GQSVcER7a7G7OU6O/RCrWsGCha3B/DoZdq+9W/Tl
	s7oynjfKQW1WtlF9RLWZzEpB4SsfDYcyM01DFlUI691R8d4reAW4DdSwTSfE6ew3LZgw
	7JlVt1ujrRj+xhxkuZX9vfX9TSo7ZtGn2yu/MPkXJT6Jfu/kgYtEQriN0wPRfRmzVzwH
	hN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ye+d/EPPS+Op+b+7MXL1c7fHn0fTwCIQPn7L8RagI2k=;
	b=R86macpsqfPb0fVE8GkirmYaT+ujFXlWJn8u4UH7sTm0UOJy4Oa+LN6Px4oFKixKk1
	dS4V7AmnShWClexY26Eaq5KwyLmDBiplMj+/ww+Q90OSftJgLp42lA5nWU1pvt9+Ix2c
	bDXtvVAc8UYfRLTqS68XcTfh48D6pTmufuANWCP2v+NK4jlv2KCFgXakofUZCMflRVIz
	9IW1jI1tKSnItG5VemzYXd2+WtdBgjEmvBbC+TRcIyMguEgHpwLdDVX94nQzQn3PoQxt
	wv2cJXWl0FnJ2ta4Vz9FB7ZGqWg7MIcPOjUlEt4/pjMWCQOLi0grLoAPPQcEo3Fgbxny
	3oWw==
X-Gm-Message-State: APf1xPAgfdOg6FLCVKqj8Ihvz23b9guTh1Ygmk66mE855hwJV+AP04BV
	MAq+PK0n0ahoB1/EQP7ozuRanh9M
X-Google-Smtp-Source: AG47ELvj4AG04uPgV3OgnR6lMmV4J31VAXFk9dEyDI1pECisnzchcV+8r/JkpK32A0e2/MUVy1WDyg==
X-Received: by 2002:a17:902:d204:: with SMTP id
	t4-v6mr8588041ply.377.1520095337969; 
	Sat, 03 Mar 2018 08:42:17 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:7529:c02c:43de:27ec])
	by smtp.gmail.com with ESMTPSA id
	l12sm19472351pfb.35.2018.03.03.08.42.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 08:42:17 -0800 (PST)
To: Derek Straka <derek@asterius.io>, openembedded-devel@lists.openembedded.org
References: <1520089170-25302-1-git-send-email-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4ef80f7b-18fa-2615-3b08-bfe25ad169da@gmail.com>
Date: Sat, 3 Mar 2018 08:42:16 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <1520089170-25302-1-git-send-email-derek@asterius.io>
Subject: Re: [meta-python][PATCHv2] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sat, 03 Mar 2018 16:42:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/3/18 6:59 AM, Derek Straka wrote:
> Update the license checksum for copyright year and verify the terms remain the same
> 
> diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
> --- SQLAlchemy-1.1.15/LICENSE	2017-11-03 16:47:01.000000000 -0400
> +++ SQLAlchemy-1.1.17/LICENSE	2018-02-22 16:08:41.000000000 -0500
> @@ -1,6 +1,6 @@
>   This is the MIT license: http://www.opensource.org/licenses/mit-license.php
> 
> -Copyright (c) 2005-2017 the SQLAlchemy authors and contributors <see AUTHORS file>.
> +Copyright (c) 2005-2018 the SQLAlchemy authors and contributors <see AUTHORS file>.

Thanks for follow up. This looks good.

>   SQLAlchemy is a trademark of Michael Bayer.
> 
>   Permission is hereby granted, free of charge, to any person obtaining a copy of this
> 
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   meta-python/recipes-devtools/python/python-sqlalchemy.inc           | 6 +++---
>   .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
>   .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
>   3 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb} (100%)
>   rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb} (100%)
> 
> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> index 2683a6a..0c191ae 100644
> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
>   application developers the full power and flexibility of SQL"
>   HOMEPAGE = "http://www.sqlalchemy.org/"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
>   
>   PYPI_PACKAGE = "SQLAlchemy"
>   inherit pypi
>   
> -SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
> -SRC_URI[sha256sum] = "8b79a5ed91cdcb5abe97b0045664c55c140aec09e5dd5c01303e23de5fe7a95a"
> +SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
> +SRC_URI[sha256sum] = "6b55ec379c11ad696f9371ce8e0de93c7f21134323f56a56a1b0d8fbef17013c"
>   
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-json \
> diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
> rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
> 

