Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA0577CC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 03:04:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7I34adq024656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 20:04:36 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 17 Aug 2017 20:04:35 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1503024945-85605-1-git-send-email-dengke.du@windriver.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <e8635672-527d-df10-5f25-a288b636f01d@windriver.com>
Date: Fri, 18 Aug 2017 11:04:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503024945-85605-1-git-send-email-dengke.du@windriver.com>
X-Originating-IP: [128.224.162.194]
Subject: Re: [PATCH] libvpx: upgrade to 1.6.0
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
X-List-Received-Date: Fri, 18 Aug 2017 03:04:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Sorry,  Please ignore this.

the upstream have already to 1.6.1, I will send it again.


On 2017年08月18日 10:55, Dengke Du wrote:
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   meta-oe/recipes-multimedia/webm/{libvpx_1.5.0.bb => libvpx_1.6.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-multimedia/webm/{libvpx_1.5.0.bb => libvpx_1.6.0.bb} (90%)
>
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.6.0.bb
> similarity index 90%
> rename from meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> rename to meta-oe/recipes-multimedia/webm/libvpx_1.6.0.bb
> index 648818e..b5a8cff 100644
> --- a/meta-oe/recipes-multimedia/webm/libvpx_1.5.0.bb
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.6.0.bb
> @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
>   SRC_URI += "http://storage.googleapis.com/downloads.webmproject.org/releases/webm/${BP}.tar.bz2 \
>               file://libvpx-configure-support-blank-prefix.patch \
>              "
> -SRC_URI[md5sum] = "49e59dd184caa255886683facea56fca"
> -SRC_URI[sha256sum] = "306d67908625675f8e188d37a81fbfafdf5068b09d9aa52702b6fbe601c76797"
> +SRC_URI[md5sum] = "f95a176768a0e1bb4fe42742e27a41af"
> +SRC_URI[sha256sum] = "d0afbb5eb1ecae68f8d578abace160a97e2e8a230e3028cf4db115d59a695aad"
>   
>   # ffmpeg links with this and fails
>   # sysroots/armv4t-oe-linux-gnueabi/usr/lib/libvpx.a(vpx_encoder.c.o)(.text+0xc4): unresolvable R_ARM_THM_CALL relocation against symbol `memcpy@@GLIBC_2.4'


