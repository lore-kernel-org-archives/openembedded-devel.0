Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90F0E784D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:34:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5GGYu1c000554
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Jun 2017 09:34:56 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Jun 2017 09:34:56 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
References: <20170616123014.2958-1-alexander.kanavin@linux.intel.com>
	<CA+chaQcdyHhKcoVu2_+Ei2bxfoL49c9ip7wxTegs2e8GKeopag@mail.gmail.com>
	<0ec7000d-a9fd-6eb2-a237-5d7b9895c885@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <7b85a271-c47f-d31b-c3af-34fedd988974@windriver.com>
Date: Fri, 16 Jun 2017 12:34:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <0ec7000d-a9fd-6eb2-a237-5d7b9895c885@linux.intel.com>
X-Originating-IP: [172.25.44.7]
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] bdwgc: add a recipe from oe-core
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
X-List-Received-Date: Fri, 16 Jun 2017 16:34:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-06-16 10:43 AM, Alexander Kanavin wrote:
> On 06/16/2017 05:41 PM, Martin Jansa wrote:
>> Why should we take this to meta-oe? Please explain in commit message.
>>
>> Is it just because of zile? +Randy who upgraded zile.
> 
> Yes, it's because of that. I checked latest upstream of zile, and it 
> still seems to require it.
> 
> Do you want me to resend the patch?

Given that Martin said:
   "Please explain in commit message."
yes, you should send a V2 patch.

../Randy
> 
> 
> Alex


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

