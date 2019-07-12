Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD4BD7F14F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 20:26:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6CKQRjc021418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Jul 2019 13:26:27 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 12 Jul 2019 13:26:26 -0700
To: Hongxu Jia <hongxu.jia@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <1537974727-33976-1-git-send-email-hongxu.jia@windriver.com>
	<576ae4d4-e072-bdcb-ac85-7f3cd14a7352@windriver.com>
	<CAMKF1sqpB=Ymvc1bb=tr+if1+9hkb4fOjNV_1xsHr=SPz6npMg@mail.gmail.com>
	<865340f5-30d3-9110-3799-709babb2cf9b@windriver.com>
	<4f5552c0-730c-46ca-3ea6-88fb2c326cc4@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <bc95a1eb-ae11-784d-aa37-fa496af7dda2@windriver.com>
Date: Fri, 12 Jul 2019 16:26:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4f5552c0-730c-46ca-3ea6-88fb2c326cc4@windriver.com>
X-Originating-IP: [172.25.44.5]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] php5: 5.6.36 -> 5.6.38
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
X-List-Received-Date: Fri, 12 Jul 2019 20:26:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 1/30/19 8:26 PM, Hongxu Jia wrote:
> On 2019/1/31 上午12:43, Randy MacLeod wrote:
>> On 1/30/19 11:33 AM, Khem Raj wrote:
>>> Hi Randy
>>>
>>> It would better to put it on the list of deprecated packages for a
>>> release before removing it.
>>
>> Khem,
>>
>> That works for me.
>> Where is the list of deprecated packages?
>> Neither google nor I could find it.
>>
>> Hongxu,
>> Will you update to 5.6.40 sometime please?
> 
> I am afraid no, the reason why I upgraded it is the compiling failure
> 
> with new openssl 1.1.x, after fix the build failure, I am no longer to
> 
> maintain php5.
> 
> //Hongxu
> 
> 


Hongxu,
    It's time to remove the old version of php.

Khem,
    I didn't find a list of deprecated packages.

-- 
# Randy MacLeod
# Wind River Linux

