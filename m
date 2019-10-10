Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39D507C274
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 05:40:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9A5e4nX003892
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Oct 2019 22:40:04 -0700 (PDT)
Received: from [128.224.158.229] (128.224.158.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 9 Oct 2019 22:40:04 -0700
To: Khem Raj <raj.khem@gmail.com>, =?UTF-8?Q?Andreas_M=c3=bcller?=
	<schnitzeltony@gmail.com>
References: <20190926223206.26850-1-schnitzeltony@gmail.com>
	<20190926223206.26850-2-schnitzeltony@gmail.com>
	<CALbNGRTwfXEP0skCASQRq86R78ugkZw5NJGMFTgKhtL_Ohu0hw@mail.gmail.com>
	<CAMKF1sqYP5bee9=mcwLpiRU8rcbMWEdGz21y8iENkBtJm+a6nQ@mail.gmail.com>
	<CALbNGRRUSkp0scHNSewoXh2WTBcy4wNZK+nhY2AhLekMPRDHoQ@mail.gmail.com>
	<CAMKF1spVBBW9vEW1U5ZtDaVXdu4DDip_4Wj3vzceAmcBF5TD8w@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <92362e02-d9d5-4575-4fb9-97ab5a6b7630@windriver.com>
Date: Thu, 10 Oct 2019 13:39:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spVBBW9vEW1U5ZtDaVXdu4DDip_4Wj3vzceAmcBF5TD8w@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH v2 2/2] xfce4-panel: upgrade 4.14.0 -> 4.14.1
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
X-List-Received-Date: Thu, 10 Oct 2019 05:40:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/10/9 下午9:29, Khem Raj wrote:
> On Wed, Oct 9, 2019 at 2:10 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
>> On Fri, Oct 4, 2019 at 10:35 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Fri, Oct 4, 2019 at 1:31 PM Andreas Müller <schnitzeltony@gmail.com> wrote:
>>>> On Fri, Sep 27, 2019 at 12:32 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
>>>>> * important bugfix release: systray draws icons properly when compositing is
>>>>>    disabled
>>>>> * while at it renumber patches
>>>>>
>>>>> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>>>> If xfce-patches require review these days: Kai can you take a look?
>>>> If not: Ping
>>> Since they have been pending for a while
>>> I still wanted to give them a go for a build and see if all is okay. Still waiting on Kai to review them
>>>>
>> Sorry to come back to this - did not find it in master(-next) anymore:
>> It contains a bugfix annoying me for very very long time [1]
>>
> I was hoping that Kai would be able to review it but that has not happened yet.

Sorry, missed the emails that we have the National Holiday last week.

The patches are fine with me.

Acked-by: Kai Kang <kai.kang@windriver.com>


Regards,
Kai


>
>> Or did I miss something
>>
>> [1] https://bugzilla.xfce.org/show_bug.cgi?id=14577
>>
>> Andreas


-- 
Kai Kang


