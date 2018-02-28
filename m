Return-Path: <akuster808@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 727F778425
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:51:25 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id v194so2081039itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=F74DF3q5mONjoN78msE5RvKvW4cDwReJfWvbzBXamGk=;
	b=sBEU7yBfQGPaKW3JUSVgW2Ux++MOQISAGpFk2meDxaKQhTzEUMFfVbgJwDGq8gnT6K
	mMSVN3N22AbnZ8JAZqqGfvUS54Eyb8XIpmmfcCs78rRKyypwadTm0ckZVtb8E5vdtOFG
	Z4vJ5Zu22sbriLBOPZdxMBLDVg21S1sgLudjIqtcvkmKvAF7GAjYme41JWX7sWMgZtWW
	DMflDHtDt1nzUREtNXhYNVZQAyzglpsvjpeKw53RsmkMr8KP/yRNyyBT4xhpoaWEnDMz
	MLhZahA+840H2E6ozPWWoO41GsS57pdYcmpDC+txC37EGzelyO9M855P1fDeyuKYfx/8
	eZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=F74DF3q5mONjoN78msE5RvKvW4cDwReJfWvbzBXamGk=;
	b=Nln7v5jMvugQGBlNTVQnWVQp1MHFxIrBgFhYpbUca9pAoPqByxZIs46lFTqqoLxRrL
	C955ujvA4zHSRTiS7Qz3dKT8pDaeOFwg5tMGjS3BgQGtGuUVmmcDFDo24UZqTIJoHq/N
	xIL8C09gZZ3dFqyjYjmiWh7gtW2KEV15PR4w0KF1AQkpnitoB0Txp1nVnMmAITlIPVTY
	G6Nee3SB3LpDOzZSn1x4D1ikeAysG4F8jBL6H1mE1Kp6FDuM5x0Av4sfjXiUUK4HOA0o
	bn/qGNeQq6VzNNLFfiWNmxK54dpRNbWXaiOBNkSyUwF0Br0jfeVeKnGJcYHRu/6P2wRp
	sWdg==
X-Gm-Message-State: APf1xPCt3plUDuySuRuCEmj6bNhjwLPNfgqrUub9uZWcEeZ6H5igo7dG
	ObVU6/VX3TSVnoCMchjig0VFbg==
X-Google-Smtp-Source: AG47ELtxgvSy/HRnGcTBetAPhUoB63D+GHevhwjoL3y5wemj8tinTldSPiuVIc/ckWbJyB0JqSFtVw==
X-Received: by 10.36.94.65 with SMTP id h62mr20226059itb.144.1519797086379;
	Tue, 27 Feb 2018 21:51:26 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:b885:642e:b8e3:aa2c?
	([2601:202:4000:1184:b885:642e:b8e3:aa2c])
	by smtp.gmail.com with ESMTPSA id l5sm583118ioa.42.2018.02.27.21.51.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 21:51:25 -0800 (PST)
To: Justin Bronder <jsbronder@cold-front.org>,
	openembedded-devel@lists.openembedded.org
References: <20180226201605.29261-1-jsbronder@cold-front.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <806bddf2-7986-14b0-3470-23a47731ef60@gmail.com>
Date: Tue, 27 Feb 2018 21:51:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180226201605.29261-1-jsbronder@cold-front.org>
Subject: Re: [meta-oe][PATCH 1/2] cppzmq: 4.2.3 update
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
X-List-Received-Date: Wed, 28 Feb 2018 05:51:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 02/26/2018 12:16 PM, Justin Bronder wrote:
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> index a64745c94..9e8ad5151 100644
> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
>  DEPENDS = "zeromq"
>  
> -SRCREV = "68a7b09cfce01c4c279fba2cf91686fcfc566848"
> -PV = "4.1.5+git${SRCPV}"
> +PV = "4.2.3"
If the recipe is renamed to cppzmq_4.2.3.bb, will that work too?

- armin
> +SRCREV = "v${PV}"
>  
>  SRC_URI = "git://github.com/zeromq/cppzmq.git"
>  


