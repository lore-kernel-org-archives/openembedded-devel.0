Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1PgNdY-00025Q-Gd
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 21:31:12 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id 995B99544016
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 21:30:32 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 0SGgwc3P15sY
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 21:30:32 +0100 (CET)
Received: from [192.168.4.106] (e181050127.adsl.alicedsl.de [85.181.50.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 331E79544005
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 21:30:31 +0100 (CET)
Message-ID: <4D39ECE6.4030904@larsmichelsen.com>
Date: Fri, 21 Jan 2011 21:30:30 +0100
From: Lars Michelsen <lm@larsmichelsen.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2.104i Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295138727-6516-1-git-send-email-lm@larsmichelsen.com>
	<1295178455.5847.36.camel@mattotaupa>
In-Reply-To: <1295178455.5847.36.camel@mattotaupa>
Subject: Re: [PATCH] Added Europe/Berlin timezone to tzdata pkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jan 2011 20:31:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Paul,

On 16/01/11 12:47, Paul Menzel wrote:
> Dear Lars,
>
>
> Am Sonntag, den 16.01.2011, 01:45 +0100 schrieb Lars Michelsen:
>> I was missing the Europe/Berlin timezone in the tzdata package. So I
>> added it to the package.
>>
>> Additionally increased the PR. Hope this OK for such a change - must
>> admit that I am very new to OE.
>
> thank you very much for your patch and welcome to OE.
>
> Could you please resend your patch (`[PATCH v2]`) with the following two
> points addressed.
>
> 1. The commit summary is standardized and should start with the package
> name as documented in the commit policy [1].
>
> 	tzdata: package `Europe/Berlin` timezone
>
> 2. Although it probably does not matter, commit messages are normally
> written from a neutral view point(?) and personal comments are added
> after a `---` before the diff which starts also with `---`. When
> applying your patch, these remarks are left out then.

Thanks for the information. I'll do so on my next postings.

But after the post of Koen I am unsure if I should resubmit this patch. 
My intend was to fix my time, setting the TZ to Europe/Paris fixes this 
and is absolutely ok for me. Other thoughts?

Regards,
Lars


