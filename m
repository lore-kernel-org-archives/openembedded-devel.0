Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 50B376E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 03:18:21 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id k134so18369962pga.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 19:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=2yfwNCqorcVZJhbpBy0scLCkawxcmRy3ijPpFrcCEeI=;
	b=Iwok+MeOzRg8/mNMG4Ud38QRj98MRKjiYkl2eJFtcTGqpnVfmJpaoehm7G0o0daZKA
	3p0Txex7ryTN9gmwz9/EhwcVW6lmsGjNIYl379y2xg8Q1g4nOe/qkqqQOQNC3p+SkuXr
	ZmoS5S5m5jdfjSH+mwGnl1peC/v8IYl45leZ6icL48ziwsfXyhKvnVHjYWdHkjzgdeqq
	0C26TSd9tezbgCtp2TJu5mXEZxY+lRVSvCjSrNJqVBPAG8zSz2TFwY05skSzrWXeTSr1
	HJilDqWg+N1GLLerddHsCYUiR+OMIAwyt/4T9KXUIVi5J9/soDtdnHOsvKgzK1YpAvdR
	gr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=2yfwNCqorcVZJhbpBy0scLCkawxcmRy3ijPpFrcCEeI=;
	b=qiVHp377qKYQNPOYC7KnSQ/rD/t4+Ni71vaNm8lr3eK6KNmjBaECjWqCblgLtbi/Ke
	wQ35IrcNLGVt3ecwQ4J49srWddeU1xb8Lwa5+JkeBs0i3cD1v1ragJ+iyoHUSRIDyHT2
	IxpnlLpPKryiNrHVhPkN4bPELOcdAqPCngfjSW3W5VlpP8zfCXIDMmUMF0yC9e7grK9z
	s3/bKiXvG06eW+nfjF6RG9h5cLIc7sSRFcf/l3F2NAEgbVwIRq60IyXmtS6mLVEUxEmm
	m7b2lb5zk1OpH4Lg3OdabeYMsyzzUYnS2NOU/c4AUHkQMEgJf0Vip4oH9knU2VWnK9aj
	9Z8A==
X-Gm-Message-State: AKGB3mJv014FM1cnR6d+L14+KWjvZjFZJ030jAUxZUVepRH7Q6ThSo0y
	05avHJgotqjMym8dQYUpQeOciQ==
X-Google-Smtp-Source: ACJfBoummDoFM8pQvI2St19Irf8zOBLBlZf5E23LkoeCWhyTUVhVh0p/eQsC7Sk7kMjICIUK7IavgA==
X-Received: by 10.99.125.70 with SMTP id m6mr14114574pgn.415.1514344702385;
	Tue, 26 Dec 2017 19:18:22 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:bd87:68dc:7ad5:c07b?
	([2601:202:4000:1184:bd87:68dc:7ad5:c07b])
	by smtp.gmail.com with ESMTPSA id
	s184sm57967323pfb.9.2017.12.26.19.18.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Dec 2017 19:18:21 -0800 (PST)
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1513699918-7720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <53571896-e752-6e16-c51b-bfa9096b4f72@gmail.com>
Date: Tue, 26 Dec 2017 19:18:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1513699918-7720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH] xorgxrdp: new add
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
X-List-Received-Date: Wed, 27 Dec 2017 03:18:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/19/2017 08:11 AM, zhengrq wrote:
> Add a new recipe xorgxrdp_0.2.5.bb.

I am seeing

ERROR: xorgxrdp-0.2.5+gitAUTOINC+c122544f18-r0 do_package_qa: QA Issue: Package xorgxrdp contains Xorg driver (xrdpdev_drv.so) but no xorg-abi- dependencies [xorg-driver-abi]
ERROR: xorgxrdp-0.2.5+gitAUTOINC+c122544f18-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
ERROR: xorgxrdp-0.2.5+gitAUTOINC+c122544f18-r0 do_package_qa: Function failed: do_package_qa

please fix.

- armin

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
>
> diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> new file mode 100644
> index 0000000..b41190d
> --- /dev/null
> +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Xorg drivers for xrdp."
> +
> +LICENSE = "X11"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a2523660329fdca3d954c0a87390e007 \
> +"
> +
> +inherit autotools pkgconfig 
> +
> +DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
> +
> +SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git \
> +           "
> +
> +SRCREV = "c122544f184d4031bbae1ad80fbab554c34a9427"
> +
> +PV = "0.2.5+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +FILES_${PN} += "${libdir}/xorg/modules/*"


