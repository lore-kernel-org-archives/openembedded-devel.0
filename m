Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8E360107
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 03:04:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4734lKX005503
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 May 2019 20:04:47 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 6 May 2019 20:04:46 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1557195066-32670-1-git-send-email-Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <1e87dcc6-57b4-14c2-31e9-3c8b3c28105c@windriver.com>
Date: Tue, 7 May 2019 11:15:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1557195066-32670-1-git-send-email-Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [meta-networking][PATCH 1/2] netkit-rsh: add tag to CVE patch
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
X-List-Received-Date: Tue, 07 May 2019 03:04:46 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, please ignore this patch. The CVE ID is wrong. V2 is coming.

Best Regards,
Chen Qi

On 05/07/2019 10:11 AM, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch         | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
> index 4381f5b..dc71141 100644
> --- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
> +++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
> @@ -10,6 +10,8 @@ Origin: https://github.com/openssh/openssh-portable/commit/6010c0303a422a9c5fa88
>   Upstream-Status: Backport [Debian]
>   [https://sources.debian.org/src/netkit-rsh/0.17-20/debian/patches/fix-CVE-2018-20685-and-CVE-2019-6111.patch]
>   
> +CVE: CVE-2018-7282 CVE-2018-7283
> +
>   Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   ---
>    rcp/rcp.c | 5 +++++



