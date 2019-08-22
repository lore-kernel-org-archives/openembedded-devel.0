Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22CFD7E6B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 02:07:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7M2773p017551
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Aug 2019 19:07:07 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 21 Aug 2019 19:07:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>
References: <20190822020240.2334.69764@do>
	<1566439571-17354-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <934fb08c-95ea-8ab4-90b0-6bf3bb3c4226@windriver.com>
Date: Thu, 22 Aug 2019 10:06:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566439571-17354-1-git-send-email-hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V2 1/3] distcc: upgrade 3.3.2 -> 3.3.3
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
X-List-Received-Date: Thu, 22 Aug 2019 02:07:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Sorry for the wrong list, please ignore it

//Hongxu

On 8/22/19 10:06 AM, Hongxu Jia wrote:
> ---
>   meta/recipes-devtools/distcc/{distcc_3.3.2.bb => distcc_3.3.3.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-devtools/distcc/{distcc_3.3.2.bb => distcc_3.3.3.bb} (98%)
>
> diff --git a/meta/recipes-devtools/distcc/distcc_3.3.2.bb b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
> similarity index 98%
> rename from meta/recipes-devtools/distcc/distcc_3.3.2.bb
> rename to meta/recipes-devtools/distcc/distcc_3.3.3.bb
> index a93604b..7942deb 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.3.2.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
> @@ -20,7 +20,7 @@ SRC_URI = "git://github.com/distcc/distcc.git \
>              file://distccmon-gnome.desktop \
>              file://distcc \
>              file://distcc.service"
> -SRCREV = "8600f0857dac55ea393dc11a860948692d215fc8"
> +SRCREV = "4cde9bcfbda589abd842e3bbc652ce369085eaae"
>   S = "${WORKDIR}/git"
>   
>   inherit autotools pkgconfig update-rc.d useradd systemd



