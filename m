Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75D696E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 08:52:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8F8qWpM025491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Sep 2015 01:52:32 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 01:52:32 -0700
To: Joe MacDonald <Joe_MacDonald@mentor.com>
References: <1441863496-7668-1-git-send-email-kai.kang@windriver.com>
	<20150914193728.GA8885@mentor.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55F7DC58.1050001@windriver.com>
Date: Tue, 15 Sep 2015 16:52:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150914193728.GA8885@mentor.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4
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
X-List-Received-Date: Tue, 15 Sep 2015 08:52:35 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年09月15日 03:37, Joe MacDonald wrote:
> [[oe] [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4] On 15.09.10 (Thu 13:38) kai.kang@windriver.com wrote:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> * update md5sum of license file
> http://comments.gmane.org/gmane.comp.handhelds.openembedded/70213
>
> Please try to provide some context any time a license file changes.

Got it.

For for iftop, it just update licensing text.

----------------------------
revision 1.3
date: 2014/01/01 14:50:05;  author: pdw;  state: Exp;  lines: +7 -8
Update to licensing text.  Patch by Robert Scheck <robert@fedoraproject.org>
----------------------------


--Kai

>
> -J.
>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../recipes-support/iftop/{iftop_1.0pre2.bb => iftop_1.0pre4.bb}    | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta-networking/recipes-support/iftop/{iftop_1.0pre2.bb => iftop_1.0pre4.bb} (57%)
>>
>> diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
>> similarity index 57%
>> rename from meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
>> rename to meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
>> index e60fc8a..0c8e494 100644
>> --- a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
>> +++ b/meta-networking/recipes-support/iftop/iftop_1.0pre4.bb
>> @@ -4,11 +4,11 @@ SECTION = "net"
>>   DEPENDS = "libpcap ncurses"
>>   
>>   LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=76498170798db0f4f0fb685a225f702f"
>>   
>>   SRC_URI = "http://www.ex-parrot.com/pdw/iftop/download/iftop-${PV}.tar.gz"
>> -SRC_URI[md5sum] = "fef521a49ec0122458d02c64212af3c5"
>> -SRC_URI[sha256sum] = "1b193037bb3019afae88cd94c87468aac4b045d81ab816ed8d2f489716b14027"
>> +SRC_URI[md5sum] = "7e6decb4958e8a4890cccac335239f24"
>> +SRC_URI[sha256sum] = "f733eeea371a7577f8fe353d86dd88d16f5b2a2e702bd96f5ffb2c197d9b4f97"
>>   
>>   inherit autotools-brokensep
>>   
>> -- 
>> 1.9.1
>>


-- 
Regards,
Neil | Kai Kang


