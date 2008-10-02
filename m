Received: from [207.172.157.102] (helo=smtp02.lnh.mail.rcn.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmtalpey@rcn.com>) id 1KlClL-0000hv-RW
	for openembedded-devel@openembedded.org; Thu, 02 Oct 2008 03:13:51 +0200
Received: from mr08.lnh.mail.rcn.net ([207.172.157.28])
	by smtp02.lnh.mail.rcn.net with ESMTP; 01 Oct 2008 21:09:42 -0400
Received: from smtp01.lnh.mail.rcn.net (smtp01.lnh.mail.rcn.net [207.172.4.11])
	by mr08.lnh.mail.rcn.net (MOS 3.8.6-GA) with ESMTP id KIE64377;
	Wed, 1 Oct 2008 21:09:41 -0400 (EDT)
Message-Id: <77ts5u$jhlo1v@smtp01.lnh.mail.rcn.net>
Received: from unknown (HELO tmt.rcn.com) ([216.240.30.23])
	by smtp01.lnh.mail.rcn.net with ESMTP; 01 Oct 2008 21:09:42 -0400
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Wed, 01 Oct 2008 21:08:43 -0400
To: openembedded-devel@lists.openembedded.org
From: Tom Talpey <tmtalpey@rcn.com>
In-Reply-To: <gc0eck$64q$1@ger.gmane.org>
References: <48DCF3ED.1060809@gmx.net> <gbjhln$8nr$1@ger.gmane.org>
	<gc0eck$64q$1@ger.gmane.org>
Mime-Version: 1.0
X-Junkmail-Whitelist: YES (by domain whitelist at mr08.lnh.mail.rcn.net)
Subject: Re: Another low-hanging fruit: aisleriot
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
X-List-Received-Date: Thu, 02 Oct 2008 01:13:54 -0000
Content-Type: text/plain; charset="us-ascii"

At 02:09 PM 10/1/2008, Koen Kooi wrote:
>On 26-09-2008 22:45, Koen Kooi wrote:
>> On 26-09-2008 16:38, Robert Schuster wrote:
>>> Hi,
>>> our gnome-games recipe disables aisleriot because of some problems
>>> described here:
>>>
>>> http://bugs.openembedded.net/show_bug.cgi?id=4585
>>
>> I couldn't reproduce the problems anymore, so .dev now has 2.24 with
>> aisleriot enabled :)
>
>It somehow got disabled again, but since there was no bug activity: it's 
>enabled again.

I actually cooked up a recipe that builds the entire gnome-games suite,
along with ggz, successfully. I got it running on my iPaq H1940 recently.
A couple of them don't work well on the qvga (Aisleriot in particular looks
really scrunched), but chess and sudoku are pretty nice. BTW, the full
install plus rdepends, on ARM is about 40MB. :-(

I broke out the individual games as packages, and (I think) have most of
the rdepends down too. How would I send my recipe for comments, just
post it on this list?

Tom.



