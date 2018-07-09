Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD550746E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 07:04:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6974inh004147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Jul 2018 00:04:44 -0700
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 9 Jul 2018 00:04:43 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Khem Raj
	<raj.khem@gmail.com>
References: <20180705065408.103714-1-mingli.yu@windriver.com>
	<CAMKF1spY_iwTDuGjzD7N6cNq+n6W9KhhYYd=vhJCg=uE=aNQyQ@mail.gmail.com>
	<5B3F34E5.70101@windriver.com>
	<CAMKF1sqa49UG0+Una67_ES6jE-ZphxcqcwHDur80mAcz6oZPUw@mail.gmail.com>
	<5B42C73E.6070009@windriver.com>
	<CAMKF1sp83jHPG+vsPJfRftB3EF0djzNZfM-YZyUUUvbqt_-n5w@mail.gmail.com>
	<8f9048e33461462790467523f3b89fdf@XBOX02.axis.com>
	<5B430283.6060202@windriver.com>
	<df1945d103d444ada773567805d1c763@XBOX02.axis.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B4307D3.9060708@windriver.com>
Date: Mon, 9 Jul 2018 14:59:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <df1945d103d444ada773567805d1c763@XBOX02.axis.com>
X-Originating-IP: [128.224.162.173]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iozone3: Upgrade to 482
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
X-List-Received-Date: Mon, 09 Jul 2018 07:04:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年07月09日 14:58, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Yu, Mingli
>> Sent: den 9 juli 2018 08:37
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Khem Raj
>> <raj.khem@gmail.com>
>> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
>> Subject: Re: [oe] [meta-oe][PATCH] iozone3: Upgrade to 482
>>
>> On 2018年07月09日 14:37, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: openembedded-devel-bounces@lists.openembedded.org
>>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
>> Of
>>>> Khem Raj
>>>> Sent: den 9 juli 2018 06:02
>>>> To: Yu, Mingli <mingli.yu@windriver.com>
>>>> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
>>>> Subject: Re: [oe] [meta-oe][PATCH] iozone3: Upgrade to 482
>>>>
>>>> On Sun, Jul 8, 2018 at 7:29 PM Yu, Mingli <mingli.yu@windriver.com>
>>>> wrote:
>>>>> On 2018年07月06日 23:01, Khem Raj wrote:
>>>>>> On Fri, Jul 6, 2018 at 2:27 AM Yu, Mingli
>> <mingli.yu@windriver.com>
>>>>> wrote:
>>>>>>> On 2018年07月06日 00:00, Khem Raj wrote:
>>>>>>>> On Wed, Jul 4, 2018 at 11:54 PM <mingli.yu@windriver.com> wrote:
>>>>>>>>>
>>>>>>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>>>>>>
>>>>>>>>> Update LIC_FILES_CHKSUM as the file iozone.c
>>>>>>>>> used for LIC_FILES_CHKSUM updated
>>>>>>>>>
>>>>>>>>
>>>>>>>> Please describe what has changed that is causing the checksums
>> to
>>>>>>>> change.
>>>>>>>
>>>>>>> The source file iozone.c changed has causing the checksum change.
>>>>>>> I have already mention it in the commit message.
>>>>>>
>>>>>> Commit message does not say what changed,  We already know
>>>>>> something has changed thats causing the checksum change but here
>> we
>>>>>> usually document what changed specifically, purpose is to let
>> users
>>>>>> know of any change in licensing requirements that they need to be
>>>>>> aware of
>>>>>
>>>>> Thanks Khem!
>>>>>
>>>>> I will try to list the changes in V2 but actually the file iozone.c
>>>>> used for checksum is source file. It has so much code changes
>> unlike
>>>>> some packages use COPYRIGHT file or README.md file for checksum.
>>>>
>>>> Ok that’s probably not ideal then. It would be better to just use
>> the
>>>> needed lines from checksum
>>>
>>> Please note that it is only line 37-48 and 260-266 of iozone.c that
>> are used
>>> to calculate the checksums. However, I guess that that due to the
>> fact there
>>> is source in between line 48 and 260, some lines have been
>> added/removed, so
>>> that the line numbers used in the checksum calculation are now off
>> (or they
>>> were off already before). Looking at the current source, my guess is
>> that
>>> lines 260-266 should be changed to 269-275.
>>
>>>
>>> Someone should really ask upstream to include a LICENSE file....
>>
>> Thanks Peter!
>>
>> It's better to include a LICENSE file.
>>
>> But now, how about just use 37-48 lines to calculate the checksum?
>>
>> Hi Khem,
>> What's your opinion?
>>
>> Thanks,
>
> The problem is that the license information is really at lines 269-275.

Yes, it indeed locates the copyright lines into source file right now. 
Or we just change to the right copyright line accordingly if no 
specified LICENSE file there.

Thanks,

> And at lines 37-48. Which is a mess...
>
>>>>> Thanks,
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>>>
>>>>>>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>>>>>>> ---
>>>>>>>>>      .../iozone3/{iozone3_465.bb => iozone3_482.bb}
>> | 6 +++---
>>>>>>>>>      1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>>>>      rename meta-oe/recipes-benchmark/iozone3/{iozone3_465.bb =>
>> iozone3_482.bb} (95%)
>>>>>>>>>
>>>>>>>>> diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
>> b/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
>>>>>>>>> similarity index 95%
>>>>>>>>> rename from meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
>>>>>>>>> rename to meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
>>>>>>>>> index 191b93425..09306e044 100644
>>>>>>>>> --- a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
>>>>>>>>> +++ b/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
>>>>>>>>> @@ -4,14 +4,14 @@ AUTHOR = "Don Capps <don.capps2@verizon.net>,
>> William D. Norcott <wnorcott@us.or
>>>>>>>>>    SECTION = "console/tests"
>>>>>>>>>    LICENSE = "iozone3"
>>>>>>>>>    LIC_FILES_CHKSUM =
>> "file://iozone.c;beginline=37;endline=48;md5=7331260091868dcad0f9edea73
>> 5b5f4b \
>>>>>>>>> -
>> file://iozone.c;beginline=260;endline=266;md5=77f9ee51e45b57a7e7519c4fa
>> 0b4f00b \
>>>>>>>>> +
>> file://iozone.c;beginline=260;endline=266;md5=0aa488fd139eac078be6eca86
>> e1435e8 \
>>>>>>>>>    "
>>>>>>>>>    SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar
>> \
>>>>>>>>>        file://parallelism.patch \
>>>>>>>>>        file://copyright.txt \
>>>>>>>>>    "
>>>>>>>>> -SRC_URI[md5sum] = "c924e5e46fb1cf8145f420e8e57eb954"
>>>>>>>>> -SRC_URI[sha256sum] =
>> "2e3d72916e7d7340a7c505fc0c3d28553fcc5ff2daf41d811368e55bd4e6a293"
>>>>>>>>> +SRC_URI[md5sum] = "31ca1d3d28bc375c20a2808217cf212c"
>>>>>>>>> +SRC_URI[sha256sum] =
>> "2733feb63c96f77177c68f3d938f2294d5394d8554b2767c45cbe138b2f3ae30"
>>>>>>>>>
>>>>>>>>>    UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> 2.17.1
>>>
>>> //Peter
>
> //Peter
>

