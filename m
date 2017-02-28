Return-Path: <nicolas.ferre@atmel.com>
Received: from email.microchip.com (smtpout.microchip.com [198.175.253.82])
	by mail.openembedded.org (Postfix) with ESMTP id 42AED72F7E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:59:56 +0000 (UTC)
Received: from [10.159.245.112] (10.10.76.4) by chn-sv-exch06.mchp-main.com
	(10.10.76.107) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 28 Feb 2017 07:59:56 -0700
To: akuster808 <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20170127142639.24159-1-nicolas.ferre@atmel.com>
	<e4c57405-7efd-8b06-634e-4a17615ad659@gmail.com>
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
Message-ID: <4cec83a3-b145-3bb2-9f32-5eea07e793ab@atmel.com>
Date: Tue, 28 Feb 2017 16:00:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <e4c57405-7efd-8b06-634e-4a17615ad659@gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAC+NgFjrCKsWRWlGSWpSXmKPExsXCxeXDopszYWuEwaHNG7ayWez9tIjRouPaYiaLi4eXMjswezzZdJHRY+esu+we5zauYAxgjmLNzEvKr0hgzVh9bzZbwQq+ivWf/rI0MH7g7mLk4hASWMEo8bDpD1MXIyeHsICbxJ6FpxlBbBGBIImp//8zg9hCAvkSd9/9A4szC9hINK5dCVbPJqArcXbCE7YuRg4OfgFhiTNT40HCvEAl+05/AStnEVCV2PbzJFi5qECExPynq5ggagQlTs58wgJicwrYSvyZN4cdYryBxJFFc1ghbHmJ5q2zoU5Qkeh73w9WIyEQKNF44RaU7STxf+VMKNtO4vD0i1C2g8T9+zPYYGoObn0OZWtLbH+1jxXC1pHYdrCfBcK2ldgzYyIThO0u8eDRcijbV2LWwwaomiiJU/2fWScwSs1C8sIsJGfPQnL2AkbmVYzSzh5+usFhuq4Rzh4GZnq5yRkFurmJmXl6yfm5mxgh8Zm9g/HI/IhDjJIcTEqivFnJWyOE+JLyUyozEosz4otKc1KLDzHKcHAoSfA+7gPKCRalpqdWpGXmABMFTJqJg/MQowQHj5II7xKQGt7igsTc4sx0iPwpRkkpcV5zkIQASCKjNA+u9xKjqJQwb007UI6nILUoN7MEIn6LUYzjIRPHYyYhlrz8vFQpoFMZgMCA8RWjOAejkjAvcz9IS2ZeCdyaV0AXMAFd8EIF7IKSRISUVAOj/RtzL6mODebXbXdtzjZj9s+OWiFY3rOa7ajlw+74SsaNdbe9vvj7m0UvKj208fqM3fzHPFdOaDX7XTfjh9+9t9s7Wi5wlQk8T7qfI9AwrVPR1G2es3io+TWWLdpvRM5eNnP7U/ONM7w458PMUhcvuytdep/sla2fVXDuaTE6smtF9q3FtUZKLMUZiYZazEXFiQB6RSXWVwMAAA==
Subject: Re: [meta-oe][morty][PATCH] nbench-byte: fix project URL
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
X-List-Received-Date: Tue, 28 Feb 2017 14:59:56 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

Le 30/01/2017 à 17:56, akuster808 a écrit :
> 
> 
> On 01/27/2017 06:26 AM, Nicolas Ferre wrote:
>> www.tux.org/~mayer/linux/ location can't be found anymore. It seems that the
>> www.math.utah.edu website gives an alternative to reach nbench-byte tool: use
>> this one to fix the issue.

Hi,

> In my morty-next

I don't see this patch in morty or morty-next on openembedded git tree:
is there something in addition to do?

Moreover, I would like to see it also on "master" branch: isn't it
propagated on it?

Regards,


>> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>> ---
>>   meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
>> index 56272d9852ce..4ec1c63751be 100644
>> --- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
>> +++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
>> @@ -1,12 +1,12 @@
>>   DESCRIPTION = "BYTE Magazine's native benchmarks (also called BYTEmark) \
>>   designed to expose the capabilities of a system's CPU, FPU, \
>>   and memory system."
>> -HOMEPAGE = "http://www.tux.org/~mayer/linux/"
>> +HOMEPAGE = "http://www.math.utah.edu/~mayer/linux/"
>>   LICENSE = "nbench-byte"
>>   LIC_FILES_CHKSUM = "file://README;beginline=57;endline=66;md5=020ef579f8fa5746b7e307a54707834f"
>>   SECTION = "console/utils"
>>   
>> -SRC_URI = "http://www.tux.org/~mayer/linux/${BP}.tar.gz \
>> +SRC_URI = "http://www.math.utah.edu/~mayer/linux/${BP}.tar.gz \
>>              file://nbench_32bits.patch \
>>              file://Makefile-add-more-dependencies-to-pointer.h.patch"
>>   
> 
> 


-- 
Nicolas Ferre

