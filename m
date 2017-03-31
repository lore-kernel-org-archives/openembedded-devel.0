Return-Path: <akuster808@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0F95377DAE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 13:38:34 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id f84so5914687ioj.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 06:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=UVpXXHPWMKKmASWt4/j8AbZjt4nFi2AXKdNB7datI/A=;
	b=DlpsZ3JEBiSAL0fkrm85h4mx8EASOF+LW9yMAeb04VtPiJ5WDufDGRXhufLwk6cGDh
	WDtPAJnuYeXssRfV3wZo6iSQeyIOHTnOWwLcRo15/6pA5qHkJTwWv9ECpPVC5g0RxAia
	2DUtqcNJseN7bQQMXCBt9/r51RB4bq+Fy1Y0gKdNale8Ctw/TC3AxSR8gmGdee/zc3aK
	rnbu/gLeC5Lk87JmbrxNCD85UAbAOEeair+CHPfCeV0ufdEhwsBP0kiQ2eePaDIBXxtf
	rHbUSwRJo/OH46AXsFMH93uQJVH2s9issW98nLJsOWqJ0eJcyf+NBMb5NfY0bzEYRJLd
	GoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=UVpXXHPWMKKmASWt4/j8AbZjt4nFi2AXKdNB7datI/A=;
	b=DxOalTAyhh0+a77X5U1S2NUob4pkwMhmaicoCiUatBmboWJEx4m7imu9iRcOIHvyri
	PAzFptmpxlRXX+njzpg7lM1VciCTtlyjiX1KfRhu4sBbkh6jxOs8RQvyMCpM6/mhUXh5
	BZ3DMdLtRvj4cjQ+UzPzNmDV/oMa7/9LxuLIBBFiI4U+DJDL9GPF7xY/q1g316HWjZhw
	Kh2+fqKAtDtA3C/yv8XDun4nwEgY5wioygOZthAkDoBUPO2sYyPfJrrAOtqLvbmnxJzk
	d+6sMpN4KXteWH2r+jH8eTVSYZVjVBiZeWmJZ4szrtHZf/Sf4lypf/CpT+iSmKVRK6YO
	GKBg==
X-Gm-Message-State: AFeK/H1sFRME1lGJSQaejlmQY6F8TY7glAJBAIOchllxGDPxWoNC/D83YA5fwSVKeBd4eg==
X-Received: by 10.107.46.24 with SMTP id i24mr3492235ioo.84.1490967515751;
	Fri, 31 Mar 2017 06:38:35 -0700 (PDT)
Received: from [172.30.15.4] ([67.133.97.100])
	by smtp.gmail.com with ESMTPSA id
	i189sm1257669ita.23.2017.03.31.06.38.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 06:38:35 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20170331113803.31535-1-Martin.Jansa@gmail.com>
	<20170331113803.31535-7-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <08e06b45-d100-7d0f-4380-345aeb3fd59b@gmail.com>
Date: Fri, 31 Mar 2017 06:38:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170331113803.31535-7-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][meta-oe][morty 7/7] alsa-equal: Update SRC_URI to something valid
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
X-List-Received-Date: Fri, 31 Mar 2017 13:38:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

not in master

- armin


On 03/31/2017 04:38 AM, Martin Jansa wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> www.thedigitalmachine.net has disappeared
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
> index 637d029ba..3bed70e1a 100644
> --- a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
> +++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
> @@ -1,12 +1,12 @@
>   DESCRIPTION = "A real-time adjustable equalizer plugin for ALSA"
> -HOMEPAGE = "http://www.thedigitalmachine.net/alsaequal.html"
> +HOMEPAGE = "https://web.archive.org/web/20161105202833/http://thedigitalmachine.net/alsaequal.html"
>   LICENSE = "LGPL-2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
>   
>   DEPENDS = "alsa-lib"
>   
>   SRC_URI = " \
> -    http://www.thedigitalmachine.net/tools/alsaequal-${PV}.tar.bz2 \
> +    https://launchpad.net/ubuntu/+archive/primary/+files/alsaequal_${PV}.orig.tar.bz2 \
>       file://0001-Fix-asneeded.patch \
>       file://0002-Fix-Eq-CAPS-plugin-name.patch \
>       file://0003-Fix-mixer.patch \


