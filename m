Return-Path: <akuster808@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 554F9788B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:52:25 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id n128so3676242ith.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=PXttfaywrFU8RbOT2p1tpFEzB90RgjQi/tTu9sEwfKY=;
	b=mvWjnvKtJewJDRwpXfB+p0NhyxkqGVNCHHUuL1TQvm2r0DgIKK+DfouyEg0mik3vAK
	VIMrhi/PsDR+zUntO2HzIT/i2qcgg3ofJw0aV4fLMzI1HSUoFF2jECMNXg2/d6cdd4Za
	4r9g5xYLF+262zsvbJlIRcYX3sfPMZcleQ6oPJ20bqST7H1I0mNuAdek/xmc+HZq5SRm
	A1NXtSkbj1w1EN7DbKeJh+R4FR9oPHQ4UynZoCmWG4+NDgoMtwvmaaUgWQavV7dAO0Wu
	Zkn+ConlPN3W3PgLbKPeEynrmdRO4IP4U51Fgsw8zuKtUjdRyyy+qo4sJIVu+ajyokto
	0ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=PXttfaywrFU8RbOT2p1tpFEzB90RgjQi/tTu9sEwfKY=;
	b=W/nKdvEzBHsWqKvrgrnKvAoE8+zYzmjmV1+uodJ/siNCS7ouohpq4vElXz5eRdFM5f
	c8nO/O3hLy/HI/mRwm9k1v41fcD561Pz4ZmnwV3sYBadHLailb/xOwGqy9gvTpFMrlI9
	PE0RqeBqueYEP6TYAppUJo0DFz2jbgat9olSXTand4JJykgQCBrBI62q2t7WvoKT/x00
	NMUhqEztjCpfF/4b4UJajYd6eWO1ElDsv6L7UByX1S/ROAO2YmGnIXDUDDdHkhv7PK1O
	FuDjtB3yxT+3IZ1CjSFKPOvbO/Ovc4OtDvKfkReDYlZOboLoX+UlKWNmD05oqjsSpiP7
	x6jQ==
X-Gm-Message-State: APf1xPCLD3h3N9UsjESmOSjnPsVBfRgwPPGJEiaiMPc4Z54x3T5Lt2cL
	gzQO8v9rvsjJkg1iANGHxAvcgQ==
X-Google-Smtp-Source: AG47ELubMbBLpQSth5rgvjkQvMRJnepcuDjbpTvuLFQfejaK3WahUMoWe5jJW7oWxkZSBcgZtvYg/Q==
X-Received: by 10.36.228.134 with SMTP id o128mr20273107ith.120.1519797147242; 
	Tue, 27 Feb 2018 21:52:27 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:b885:642e:b8e3:aa2c?
	([2601:202:4000:1184:b885:642e:b8e3:aa2c])
	by smtp.gmail.com with ESMTPSA id 27sm646217iog.17.2018.02.27.21.52.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 21:52:26 -0800 (PST)
To: Justin Bronder <jsbronder@cold-front.org>,
	openembedded-devel@lists.openembedded.org
References: <20180226201605.29261-1-jsbronder@cold-front.org>
	<20180226201605.29261-2-jsbronder@cold-front.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <83e67416-d1a0-f53a-2067-e82fa2b319ce@gmail.com>
Date: Tue, 27 Feb 2018 21:52:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180226201605.29261-2-jsbronder@cold-front.org>
Subject: Re: [meta-oe][PATCH 2/2] zeromq: 4.2.3 update
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
X-List-Received-Date: Wed, 28 Feb 2018 05:52:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 02/26/2018 12:16 PM, Justin Bronder wrote:
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
can you provide high-lights of what is in the update?

- armin
> ---
>  .../zeromq/{zeromq_4.1.6.bb => zeromq_4.2.3.bb}                     | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.1.6.bb => zeromq_4.2.3.bb} (78%)
>
> diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
> similarity index 78%
> rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
> rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
> index e126f3239..71d7e7cbf 100644
> --- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.2.3.bb
> @@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
>  PACKAGECONFIG ??= "libsodium"
>  PACKAGECONFIG[libsodium] = "--with-libsodium, --without-libsodium, libsodium"
>  
> -SRC_URI = "http://github.com/zeromq/zeromq4-1/releases/download/v${PV}/zeromq-${PV}.tar.gz \
> +SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
>      file://run-ptest \
>  "
> -SRC_URI[md5sum] = "c89db4dbc0b90c34c9f4983cbff6d321"
> -SRC_URI[sha256sum] = "02ebf60a43011e770799336365bcbce2eb85569e9b5f52aa0d8cc04672438a0a"
> +SRC_URI[md5sum] = "c4e18bd0584ccd34213f152c11f54d6c"
> +SRC_URI[sha256sum] = "8f1e2b2aade4dbfde98d82366d61baef2f62e812530160d2e6d0a5bb24e40bc0"
>  
>  S = "${WORKDIR}/zeromq-${PV}"
>  


