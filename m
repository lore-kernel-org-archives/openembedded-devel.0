Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D95A3745D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 08:49:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4O8n0BO031611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 May 2018 01:49:15 -0700
Received: from [128.224.162.165] (128.224.162.165) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 24 May 2018 01:48:48 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <1527147551-32644-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRSBrQT7F0HwgozhZEscYL=BUti7ch+Ox_2qhVPmZx7vsA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <e4fe32ea-c02a-5cdd-57c4-9b05a34f51e8@windriver.com>
Date: Thu, 24 May 2018 16:48:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSBrQT7F0HwgozhZEscYL=BUti7ch+Ox_2qhVPmZx7vsA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] metacity: fix version number typo 3.38.0 -> 3.28.0
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
X-List-Received-Date: Thu, 24 May 2018 08:49:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年05月24日 16:16, Andreas Müller wrote:
> On Thu, May 24, 2018 at 9:39 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../recipes-gnome/metacity/{metacity_3.38.0.bb => metacity_3.28.0.bb}     | 0
>>   1 file changed, 0 insertions(+), 0 deletions(-)
>>   rename meta-gnome/recipes-gnome/metacity/{metacity_3.38.0.bb => metacity_3.28.0.bb} (100%)
>>
>> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
>> similarity index 100%
>> rename from meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb
>> rename to meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
>> --
>> 2.7.4
>>
> This causes version going backwards. How about adding (incrementing) PE?

Agree, here is the introduce

https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-PE

//Hongxu

>
> Andreas



