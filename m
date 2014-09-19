Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8D770A0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 03:01:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8J31PfT023100
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 20:01:25 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 18 Sep 2014 20:01:25 -0700
Message-ID: <541B9C89.3050508@windriver.com>
Date: Fri, 19 Sep 2014 11:01:29 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <53F40A50.4030509@windriver.com>
	<2290847.YcZyNWaetr@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2290847.YcZyNWaetr@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Should we set the LICENSE_FLAGS = "commercial" in meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
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
X-List-Received-Date: Fri, 19 Sep 2014 03:01:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/17/2014 06:26 PM, Paul Eggleton wrote:
> Hi Roy,
>
> On Wednesday 20 August 2014 10:39:12 Rongqing Li wrote:
>>       I see the recipes is using the binary file,
>> http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.1
>> 1-regulatory.bin Should we set the LICENSE_FLAGS = "commercial" in ]
>> meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
>
> It depends on what the terms of distribution are for that binary. I could be
> wrong, but it looks to me as if this is a binary version of the wireless-regdb
> database [1], which is ISC licensed. If that is the case then LICENSE_FLAGS =
> "commercial" wouldn't be needed.
>
> Cheers,
> Paul

I see, thanks for your reply.

-Roy

>
> [1] http://wireless.kernel.org/en/developers/Regulatory/wireless-regdb
>

-- 
Best Reagrds,
Roy | RongQing Li

