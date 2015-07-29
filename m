Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54DDF601F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 06:37:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T6boeB016819
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 23:37:51 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 23:37:33 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1438180112-4185-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55B874C2.9040007@windriver.com>
Date: Wed, 29 Jul 2015 14:37:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1438180112-4185-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][PATCH] dracut: upgrade 38 -> 43
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
X-List-Received-Date: Wed, 29 Jul 2015 06:37:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Xin,

I had sent the patch to upgrade dracut already.

Thanks,
Kai

On 2015年07月29日 22:28, Li xin wrote:
> From: zhangpanpan <zhangpp-fnst@cn.fujitsu.com>
>
> Signed-off-by: Zhang Panpan<zhangpp-fnst@cn.fujitsu.com>
> ---
>   meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> index 77c137c..65a5515 100644
> --- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> @@ -5,10 +5,10 @@ LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
>   PE = "1"
> -PV = "038"
> +PV = "043"
>   
> -# v038 tag
> -SRCREV = "267a109a81715c8957f14659593deb7b6255d40e"
> +# v043 tag
> +SRCREV = "eab03540cd695d940062af5b55c02e8829aaa526"
>   SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
>   
>   S = "${WORKDIR}/git"


-- 
Regards,
Neil | Kai Kang


