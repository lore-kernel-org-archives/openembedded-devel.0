Received: from gnukia.org ([85.214.67.64] helo=cbs.gnukia.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tilman@baumann.name>) id 1TBMbh-0005ZX-Fn
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 11:18:09 +0200
Received: from cbs.gnukia.org (cbs.gnukia.org [127.0.0.1])
	by localhost (Postfix) with ESMTP id 3154BEC4003
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 10:59:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on cbs.gnukia.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=8.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.0.21] (mail.grandeye.com [82.16.22.188])
	by cbs.gnukia.org (Postfix) with ESMTPSA id F2533EC4002
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 10:59:26 +0200 (CEST)
Date: Tue, 11 Sep 2012 10:05:37 +0100
From: Tilman Baumann <tilman@baumann.name>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <504E1F94.9000606@baumann.name>
	<20120911044922.GD2980@sakrah.homelinux.org>
In-Reply-To: <20120911044922.GD2980@sakrah.homelinux.org>
X-Filtered: By ProxSMTP
Message-ID: <504EFEE1.3040000@baumann.name>
X-Anti-Virus: Kaspersky Anti-Virus for Linux Mail Server 5.6.42/RELEASE,
	bases: 20111108 #5646748, check: 20120911 clean
Subject: Re: minimal template layer for new machine support
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
X-List-Received-Date: Tue, 11 Sep 2012 09:18:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/12 05:49, Khem Raj wrote:
> On (10/09/12 18:12), Tilman Baumann wrote:
>> Hi,
>>
>> I'm working on a TI DM812x support overlay.
>> I guess what it comes down to is a new kernel recipe (based on TI's
>> sources) and this funny two stage u-boot.
>> I think I can write the recipes. But what I don't quite see is how I
>> would add a new supported machine in the first place?
>> I was trying to orient myself on a few existing machine support
>> layers. But I think I'm still missing the point.
>> What are the minimal basics to implement? Where should I start?
> check meta-ti
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/
>
> may be there is a BSP already or something similar you can start off.
>
>
Oh, great. I think I can work with that.
I only knew the Arago project, but that is not based on oe-core.

Thanks


