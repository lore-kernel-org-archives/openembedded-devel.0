Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0BF27DAFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 07:35:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA67ZSLA007802
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 23:35:28 -0800 (PST)
Received: from [128.224.158.136] (128.224.158.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 5 Nov 2019 23:35:27 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191106065433.3609-1-schnitzeltony@gmail.com>
	<20191106065433.3609-3-schnitzeltony@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <40369b3e-0318-73aa-9644-29929ac80887@windriver.com>
Date: Wed, 6 Nov 2019 15:35:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106065433.3609-3-schnitzeltony@gmail.com>
Subject: Re: [meta-xfce][PATCH 3/3] xfce4-whiskermenu-plugin: upgrade 2.3.3 -> 2.3.4
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
X-List-Received-Date: Wed, 06 Nov 2019 07:35:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/11/6 下午2:54, Andreas Müller wrote:
> Release notes for 2.3.4
> =======================
> - Fix building against xfce4-panel 4.15.0
> - Translation updates: Dutch, Galician, Georgian.
>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   ...menu-plugin_2.3.3.bb => xfce4-whiskermenu-plugin_2.3.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.3.3.bb => xfce4-whiskermenu-plugin_2.3.4.bb} (66%)
>
> diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.3.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.4.bb
> similarity index 66%
> rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.3.bb
> rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.4.bb
> index a05f0dc6f..595e3c815 100644
> --- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.3.bb
> +++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.4.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
>   inherit xfce-panel-plugin cmake
>   
> -SRC_URI[md5sum] = "21f1e1d8d4a030f23d358d6c5ac50f2a"
> -SRC_URI[sha256sum] = "e0c6cc4fc1e685bc9601ec217a803d5489ca3276f4008bf056600471c6ac1848"
> +SRC_URI[md5sum] = "ee9e378fae78b230a23b241cf727c84b"
> +SRC_URI[sha256sum] = "84d3de35695a023aab181f7a9b75f59029eb3b07c3e47a5e11e8bd79db62570e"
>   
>   RRECOMMENDS_${PN} += "menulibre"


Acked-by: Kai Kang <kai.kang@windriver.com>

Regards,

-- 
Kai Kang


