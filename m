Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89EA76D409
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 21:15:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2TLFKU3004072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 14:15:31 -0700
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 29 Mar 2019 14:15:10 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20190329204710.22747-1-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fc7da65f-74b3-5f54-36ca-16b8c86958a6@windriver.com>
Date: Fri, 29 Mar 2019 17:15:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190329204710.22747-1-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.10]
Subject: Re: [PATCH] wolfssl: update to 3.15.8 and use github SRC_URI
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
X-List-Received-Date: Fri, 29 Mar 2019 21:15:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 3/29/19 4:47 PM, Randy MacLeod wrote:
> The previous SRC_URI did not work for the new version and
> when looking at the site, users are required to navigate
> through a click-through license agreement.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   .../wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb}         | 5 +++--

4.0 is available but I suspect that's best delayed until
the 2.8 cycle starts.

https://www.wolfssl.com/docs/wolfssl-changelog/

-- 
# Randy MacLeod
# Wind River Linux

