Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.23067.1628517507469833277
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 547871C000D;
	Mon,  9 Aug 2021 13:58:25 +0000 (UTC)
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
 AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: Re: [oe] [meta-java][PATCH 0/2] Update to new override syntax
To: Richard Leitner <richard.leitner@skidata.com>,
 "aj.bagwell@gmail.com" <aj.bagwell@gmail.com>
References: <20210809130938.12027-1-anthony.bagwell@hivehome.com>
 <YRExsJjpV70+43Ez@ltleri2>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <e45796b1-f0dd-d1bf-54da-8e886810710f@bootlin.com>
Date: Mon, 9 Aug 2021 15:58:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRExsJjpV70+43Ez@ltleri2>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Richard (long time no see!)

On 8/9/21 3:46 PM, Richard Leitner wrote:
> On Mon, Aug 09, 2021 at 02:09:36PM +0100, Anthony Bagwell via lists.openembedded.org wrote:
>> This consists of two commits, the first is the result of running the
>> automatic migration script, the second is cleaning up some places
>> where it was over zealous.
> Thanks for the patch.
>
> For which releases does this new override syntax work? honister only?

No, it will also be supported in the upcoming BitBake updates to
Dunfell, Gatesgarth and Hardknott, if I understood correctly. Those will
support both syntaxes, so they don't break existing layers.

Cheers,
Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

