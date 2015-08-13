Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF75072A78
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 00:08:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7D08S5Q027770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Aug 2015 17:08:28 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 12 Aug 2015 17:08:28 -0700
Message-ID: <55CBDFFA.6060305@windriver.com>
Date: Thu, 13 Aug 2015 08:08:26 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1436171379-32162-1-git-send-email-rongqing.li@windriver.com>
	<mqcpsd$esk$1@ger.gmane.org> <55CA9F60.4020602@windriver.com>
	<27160670.K3UU4rQsOm@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <27160670.K3UU4rQsOm@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ypbind-yocto.init: add status command
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
X-List-Received-Date: Thu, 13 Aug 2015 00:08:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年08月12日 19:10, Paul Eggleton wrote:
> Hi Roy,
>
> On Wednesday 12 August 2015 09:20:32 Rongqing Li wrote:
>> On 2015年08月11日 20:30, Koen Kooi wrote:
>>> While you're there, can you please fix the name of this file? Either
>>> change it to 'yoctoproject' or rename it to something sensible, but the
>>> current situation is just wrong.
>>
>> I will change the title of this patch, and not rename
>> ypbind-yocto.init, since ypbind-yocto.init will be rename
>> to ypbind when it is installed into system
>
> Yes, that's clear - it's just not the right name in the metadata either. Would
> you mind simply renaming it to ypbind.init to be at least similar to other
> recipes?
>


Ok

-Roy

> Thanks,
> Paul
>

-- 
Best Reagrds,
Roy | RongQing Li

