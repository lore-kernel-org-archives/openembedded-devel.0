Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N8eou-0002Rm-O2
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 19:55:04 +0100
Received: (qmail 26514 invoked by uid 1003); 12 Nov 2009 18:53:41 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 12 Nov 2009 18:53:40 -0000
Message-ID: <4AFC59B3.8030803@balister.org>
Date: Thu, 12 Nov 2009 13:53:39 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1257427464-316-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>	<20091105140617.GA27537@mi.fu-berlin.de>	<4AF2EAF3.5020808@cs.put.poznan.pl>
	<alpine.LFD.2.00.0911051014270.7161@localhost>
In-Reply-To: <alpine.LFD.2.00.0911051014270.7161@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] boost-1.33.1: Corrected GNU_HASH error.
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
X-List-Received-Date: Thu, 12 Nov 2009 18:55:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/05/2009 10:17 AM, Robert P. J. Day wrote:
> On Thu, 5 Nov 2009, Przemyslaw Wesolek wrote:
>
>> Henning Heinold wrote:
>>> thanks for the patch, but I wonder who is using this older
>>> version. Mainly 1.3.36 is used.
>>
>> Did you mean 1.36?
>>
>> I agree, the older versions look like unmaintained for a long time.
>
>    if you go to boost's home page, they don't even *list* versions
> earlier than 1.36:
>
>    http://www.boost.org/users/news/
>
> that's generally a good indication that it's time to start
> deprecating.  and there's already a beta version of 1.41.

unfortunately the boost api is not very stable, so upgrading is not 
painless ....

Philip

>
> rday
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


