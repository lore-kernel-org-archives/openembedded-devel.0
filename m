Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N8WZN-0003GY-LF for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 11:06:28 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 607DA89
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 10:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id KA5deIT3fvzY
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 11:05:06 +0100 (CET)
Received: from [150.254.31.31] (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 1A7DB88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 11:05:06 +0100 (CET)
Message-ID: <4AFBDDD2.7010602@cs.put.poznan.pl>
Date: Thu, 12 Nov 2009 11:05:06 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
Organization: Poznan University of Technology
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1257427464-316-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>	<20091105140617.GA27537@mi.fu-berlin.de>	<4AF2EAF3.5020808@cs.put.poznan.pl>
	<alpine.LFD.2.00.0911051014270.7161@localhost>
In-Reply-To: <alpine.LFD.2.00.0911051014270.7161@localhost>
X-Enigmail-Version: 0.96.0
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
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
X-List-Received-Date: Thu, 12 Nov 2009 10:06:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Robert P. J. Day wrote:
> On Thu, 5 Nov 2009, Przemyslaw Wesolek wrote:
> 
>> Henning Heinold wrote:
>>> thanks for the patch, but I wonder who is using this older
>>> version. Mainly 1.3.36 is used.
>> Did you mean 1.36?
>>
>> I agree, the older versions look like unmaintained for a long time.
> 
>   if you go to boost's home page, they don't even *list* versions
> earlier than 1.36:
> 
>   http://www.boost.org/users/news/
> 

They do, but as 1.33 is not news anymore ;) it appears on history page:

  http://www.boost.org/users/history/

Przemek



