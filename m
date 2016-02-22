Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 66817601A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 10:44:32 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 8F76968A01B; Mon, 22 Feb 2016 10:44:32 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id E3EB468A01B;
	Mon, 22 Feb 2016 10:44:31 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 9726C67400EE;
	Mon, 22 Feb 2016 11:44:31 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <56CAE338.7040002@mlbassoc.com>
	<CA+chaQfxh9R_EN8XSsrPGCv4OsQ31jSTV+EYsFHqJ=thipjAKQ@mail.gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56CAE68F.4000102@mlbassoc.com>
Date: Mon, 22 Feb 2016 11:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfxh9R_EN8XSsrPGCv4OsQ31jSTV+EYsFHqJ=thipjAKQ@mail.gmail.com>
Subject: Re: [meta-browser] ARM support in Chromium
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
X-List-Received-Date: Mon, 22 Feb 2016 10:44:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-22 11:32, Martin Jansa wrote:
> Yes it can, because cortex-a7 is armv7a.

My build failed listing the board as not compatible
   ERROR: Nothing PROVIDES 'chromium'
   ERROR: chromium was skipped: incompatible with machine teton-p0381 (not in COMPATIBLE_MACHINE)

> On Mon, Feb 22, 2016 at 11:30 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>
>> A recent change to the chromium recipe restricts it to only
>> armv6 and armv7a.  I've built (and successfully run) previous
>> versions of chromium on my LS102x board which is cortexa7hf.
>> It's not clear to me what arm revision that works out to be
>> (where does one look for this info?) but I'd like to see if
>> chromium can still be used on my board?
>>
>> Thanks for any pointers

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

