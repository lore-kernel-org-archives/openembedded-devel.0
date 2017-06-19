Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA1578210
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 11:52:55 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jun 2017 04:52:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,361,1493708400"; d="scan'208";a="99368894"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 19 Jun 2017 04:52:56 -0700
To: Randy MacLeod <randy.macleod@windriver.com>,
	Martin Jansa <martin.jansa@gmail.com>
References: <20170616123014.2958-1-alexander.kanavin@linux.intel.com>
	<CA+chaQcdyHhKcoVu2_+Ei2bxfoL49c9ip7wxTegs2e8GKeopag@mail.gmail.com>
	<0ec7000d-a9fd-6eb2-a237-5d7b9895c885@linux.intel.com>
	<7b85a271-c47f-d31b-c3af-34fedd988974@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <21a26e8d-f5d4-21d9-7a50-01933937842d@linux.intel.com>
Date: Mon, 19 Jun 2017 14:53:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <7b85a271-c47f-d31b-c3af-34fedd988974@windriver.com>
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
X-List-Received-Date: Mon, 19 Jun 2017 11:52:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2017 07:34 PM, Randy MacLeod wrote:

>>> Is it just because of zile? +Randy who upgraded zile.
>>
>> Yes, it's because of that. I checked latest upstream of zile, and it
>> still seems to require it.
>>
>> Do you want me to resend the patch?
>
> Given that Martin said:
>   "Please explain in commit message."
> yes, you should send a V2 patch.

I'm already seeing the patch in master-next though. So still not sure - 
would really prefer to get a first hand answer.


Alex


