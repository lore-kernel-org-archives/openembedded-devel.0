Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE7137402E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 08:34:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4C8YDtC005119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 May 2015 01:34:13 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 May 2015 01:34:13 -0700
Message-ID: <5551BB03.1070204@windriver.com>
Date: Tue, 12 May 2015 16:34:11 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
References: <1429778709-4188-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1429778709-4188-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][meta-networking] strongswan: upgrade to 5.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 08:34:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

Thanks

-Roy

在 2015年04月23日 16:45, rongqing.li@windriver.com 写道:
> From: Roy Li <rongqing.li@windriver.com>
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../strongswan/{strongswan_5.2.1.bb => strongswan_5.3.0.bb}           | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-networking/recipes-support/strongswan/{strongswan_5.2.1.bb => strongswan_5.3.0.bb} (92%)
>
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
> similarity index 92%
> rename from meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> rename to meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
> index 6b91319..0b45ab6 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.2.1.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.3.0.bb
> @@ -11,8 +11,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
>           file://fix-funtion-parameter.patch \
>   "
>
> -SRC_URI[md5sum] = "dd3717c0aa59ab4591ca1812941ebb82"
> -SRC_URI[sha256sum] = "ea51ab33b5bb39fecaf10668833a9936583b42145948ae9da1ab98f74e939215"
> +SRC_URI[md5sum] = "c52d4228231c2025d9c320d0e9990327"
> +SRC_URI[sha256sum] = "824da31a1ff89ac2500d56705e6f9ce06fe5260f9caaeb1da35ea13a8691d284"
>
>   EXTRA_OECONF = "--enable-gmp \
>           --enable-openssl \
>

-- 
Best Reagrds,
Roy | RongQing Li

