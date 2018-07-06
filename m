Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11E2878A46
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 08:40:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w668evZZ010093
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Jul 2018 01:40:57 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 6 Jul 2018 01:40:56 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180705081113.45222-1-mingli.yu@windriver.com>
	<CAMKF1srfhZcGmPMvEpJyvfVVt+8vMN73Qw76FMayAbcfcFSx2A@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B3F29EA.9000004@windriver.com>
Date: Fri, 6 Jul 2018 16:35:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srfhZcGmPMvEpJyvfVVt+8vMN73Qw76FMayAbcfcFSx2A@mail.gmail.com>
X-Originating-IP: [128.224.162.173]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mcelog: Upgrade to 159
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
X-List-Received-Date: Fri, 06 Jul 2018 08:40:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年07月06日 00:02, Khem Raj wrote:
> On Thu, Jul 5, 2018 at 1:11 AM <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Update LIC_FILES_CHKSUM as README.md updated

Thanks Khem, will send out V2 to cover the info.

Thanks,

>>
>
> Please provide the information about what changed in README.md
>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../recipes-support/mcelog/{mcelog_1.49.bb => mcelog_159.bb}  | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-support/mcelog/{mcelog_1.49.bb => mcelog_159.bb} (89%)
>>
>> diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.49.bb b/meta-oe/recipes-support/mcelog/mcelog_159.bb
>> similarity index 89%
>> rename from meta-oe/recipes-support/mcelog/mcelog_1.49.bb
>> rename to meta-oe/recipes-support/mcelog/mcelog_159.bb
>> index 84633a76c..236ad7d00 100644
>> --- a/meta-oe/recipes-support/mcelog/mcelog_1.49.bb
>> +++ b/meta-oe/recipes-support/mcelog/mcelog_159.bb
>> @@ -9,10 +9,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;
>>       file://run-ptest \
>>   "
>>
>> -SRCREV = "2cfdf29b2ef98ccd5ed42cdde8bbe437e0d6412f"
>> +SRCREV = "2ed5cc0489d20cbffdc6d2e08b1fe49973f0ee34"
>>
>>   LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://README.md;md5=279840fabb191e6cd9150492d31b0e20"
>> +LIC_FILES_CHKSUM = "file://README.md;md5=74bb47b9a68850cb398665cf78b31de6"
>>
>>   S = "${WORKDIR}/git"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

