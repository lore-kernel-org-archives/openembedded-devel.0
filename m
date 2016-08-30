Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD3E5605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 14:12:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7UECSCt004384
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 07:12:28 -0700
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 30 Aug 2016 07:12:27 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1472063392-11490-1-git-send-email-raj.khem@gmail.com>
	<e6c87ae1-ca1d-895c-adb3-6c2b75abaaa9@embed.me.uk>
	<CAMKF1spmR94=-VGMJD0LGTLASWeOyq-wt-KM4p0Ut-vowzYcDA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <22beaaca-b392-3971-3125-1f579b79e186@windriver.com>
Date: Tue, 30 Aug 2016 10:12:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spmR94=-VGMJD0LGTLASWeOyq-wt-KM4p0Ut-vowzYcDA@mail.gmail.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [meta-oe][PATCH] imagemagick: Upgrade 7.0.3 release to patch level 9
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
X-List-Received-Date: Tue, 30 Aug 2016 14:12:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-25 08:51 AM, Khem Raj wrote:
> On Aug 25, 2016 2:04 AM, "Jack Mitchell" <ml@embed.me.uk> wrote:
>>
>> On 24/08/16 19:29, Khem Raj wrote:
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>   meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>>
>> 7.0.3?
>
> Its a typo thanks

patchlevel 9 is gone, replaced by 10! Whee!

I've asked about keeping a few patchlevel tarballs around:
 
https://www.imagemagick.org/discourse-server/viewtopic.php?f=1&t=26962&p=137186#p137176

If the maintainers don't want to do that could we use
the github mirror since it doesn't destroy history...

../Randy


