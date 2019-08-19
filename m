Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 266AA7E502
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 01:39:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7J1cpLJ014710
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Aug 2019 18:39:01 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 18 Aug 2019 18:38:40 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
	<20190818223316.19772-3-schnitzeltony@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <e0c19d2b-7902-d11d-16f8-1906907dccdf@windriver.com>
Date: Mon, 19 Aug 2019 09:38:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190818223316.19772-3-schnitzeltony@gmail.com>
Subject: Re: [meta-xfce][PATCH 02/10] xfce4-battery-plugin: 1.1.2 -> 1.1.3
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
X-List-Received-Date: Mon, 19 Aug 2019 01:39:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/19 上午6:33, Andreas Müller wrote:
> Minor bugfixe & translation update release

Typo here. Other is fine with me.

Regards,
Kai


>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   ...attery-plugin_1.1.2.bb => xfce4-battery-plugin_1.1.3.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-xfce/recipes-panel-plugins/battery/{xfce4-battery-plugin_1.1.2.bb => xfce4-battery-plugin_1.1.3.bb} (47%)
>
> diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.2.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
> similarity index 47%
> rename from meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.2.bb
> rename to meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
> index 5de1ce5e0..ecbdc265e 100644
> --- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.2.bb
> +++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
> @@ -1,9 +1,9 @@
>   SUMMARY = "A battery monitor panel plugin for Xfce4, compatible with APM and ACP"
> -HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
> +HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>   
>   inherit xfce-panel-plugin
>   
> -SRC_URI[md5sum] = "ba1cfe619046373f9af5b903c77d1858"
> -SRC_URI[sha256sum] = "d601349fa9a979dae99ace39b24d99b97f62b80f42ac5dea5a99e5af3e88d7db"
> +SRC_URI[md5sum] = "9f82c7e77de0a417716d68d33367973b"
> +SRC_URI[sha256sum] = "12be0a44d16bd1e1618513ee64f946814925872db7d1c1188ab1454b00d040a3"


-- 
Kai Kang


