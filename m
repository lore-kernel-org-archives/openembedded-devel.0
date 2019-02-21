Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8997CB34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 01:25:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1L1ORwq021035
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Feb 2019 17:24:38 -0800
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Wed, 20 Feb 2019 17:24:17 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
	<1550652980-292761-3-git-send-email-changqing.li@windriver.com>
	<a0949d10ee244ac0b2a67399875c3fde@XBOX04.axis.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <f2227545-4e0f-ba91-747b-a977a7b40284@windriver.com>
Date: Thu, 21 Feb 2019 09:24:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a0949d10ee244ac0b2a67399875c3fde@XBOX04.axis.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH 2/5] syslog-ng: upgrade 3.26.1 -> 3.19.1
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
X-List-Received-Date: Thu, 21 Feb 2019 01:25:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 2/20/19 10:47 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
>> devel-bounces@lists.openembedded.org> On Behalf Of
>> changqing.li@windriver.com
>> Sent: den 20 februari 2019 09:56
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [PATCH 2/5] syslog-ng: upgrade 3.26.1 -> 3.19.1
> That should obviously be:
>
> Subject: [oe] [PATCH 2/5] syslog-ng: upgrade 3.16.1 -> 3.19.1
Thanks.  I will send a v2.
>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../syslog-ng/{syslog-ng_3.16.1.bb => syslog-ng_3.19.1.bb} | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.16.1.bb => syslog-ng_3.19.1.bb} (81%)
>>
>> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
>> similarity index 81%
>> rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
>> rename to meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
>> index b5f42cf..4eecf6b 100644
>> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
>> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.19.1.bb
>> @@ -12,5 +12,5 @@ SRC_URI = "https://github.com/balabit/syslog-
>> ng/releases/download/${BP}/${BP}.ta
>>              file://0001-syslog-ng-fix-segment-fault-during-service-
>> start.patch \
>>              "
>>
>> -SRC_URI[md5sum] = "72d44ad02c2e9ba0748b3ecd3f15a7ff"
>> -SRC_URI[sha256sum] = "c7ee6f1d5e98d86f191964e580111bfa71081ecbb3275cea035bbba177b73a29"
>> +SRC_URI[md5sum] = "aa79bc13d9fd925aa5fb9516e87aacd3"
>> +SRC_URI[sha256sum] = "5cf931a9d7bead0e6d9a2c65eee8f6005a005878f59aa280f3c4294257ed5178"
>> --
>> 2.7.4
> //Peter
>
>
-- 
BRs

Sandy(Li Changqing)


