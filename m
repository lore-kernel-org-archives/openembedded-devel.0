Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8E73B719DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 08:20:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2E8KaWK004705
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Mar 2017 01:20:36 -0700 (PDT)
Received: from [128.224.162.185] (128.224.162.185) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 01:20:35 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170313032921.8669-1-kai.kang@windriver.com>
	<CA+chaQc0uNJ=k8OYDPLapV9ekap2Yv9TFA_25_U3em5ZBQF8gg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <8c5b1e35-2b6a-6cc6-52cd-c51789206505@windriver.com>
Date: Tue, 14 Mar 2017 16:19:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQc0uNJ=k8OYDPLapV9ekap2Yv9TFA_25_U3em5ZBQF8gg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Update SRC_URIs
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
X-List-Received-Date: Tue, 14 Mar 2017 08:20:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年03月13日 15:25, Martin Jansa wrote:
> Github archives can be regenerated from time to time with different 
> checksums, please use git fetcher instead.

OK. Thanks.

--Kai

>
> On Mon, Mar 13, 2017 at 4:29 AM, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     Update SRC_URIs which show qa warnings when do_fetch.
>
>     Kai Kang (5):
>       fuse: update HOMEPAGE and SRC_URI
>       curlpp: update HOMEPAGE and SRC_URI
>       libdnet: update SRC_URI
>       cherokee: update SRC_URI
>       lmsensors: update SRC_URI and S
>
>      meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
>     <http://fuse_2.9.4.bb>   | 6 +++---
>      meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
>     <http://libdnet_1.12.bb> | 8 +++++---
>      meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
>     <http://curlpp_0.7.3.bb>  | 8 ++++----
>      meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
>     <http://lmsensors_3.4.0.bb>     | 6 +++---
>      meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
>     <http://cherokee_1.2.98.bb>  | 2 +-
>      5 files changed, 16 insertions(+), 14 deletions(-)
>
>     --
>     2.10.1
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


-- 
Regards,
Neil | Kai Kang


