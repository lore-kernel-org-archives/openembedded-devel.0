Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0B35778464
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 14:43:34 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 16 Jun 2017 07:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="115288731"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 16 Jun 2017 07:43:34 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>
References: <20170616123014.2958-1-alexander.kanavin@linux.intel.com>
	<CA+chaQcdyHhKcoVu2_+Ei2bxfoL49c9ip7wxTegs2e8GKeopag@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0ec7000d-a9fd-6eb2-a237-5d7b9895c885@linux.intel.com>
Date: Fri, 16 Jun 2017 17:43:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcdyHhKcoVu2_+Ei2bxfoL49c9ip7wxTegs2e8GKeopag@mail.gmail.com>
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
X-List-Received-Date: Fri, 16 Jun 2017 14:43:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2017 05:41 PM, Martin Jansa wrote:
> Why should we take this to meta-oe? Please explain in commit message.
>
> Is it just because of zile? +Randy who upgraded zile.

Yes, it's because of that. I checked latest upstream of zile, and it 
still seems to require it.

Do you want me to resend the patch?


Alex

