Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <loudawgucr@gmail.com>) id 1K3xVH-0004Bg-8f
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jun 2008 20:14:39 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080604180953.JCNG6602.fed1rmmtao104.cox.net@fed1rmimpo01.cox.net>;
	Wed, 4 Jun 2008 14:09:53 -0400
Received: from veronica.jetheaddev.com ([70.164.99.62])
	by fed1rmimpo01.cox.net with bizsmtp
	id Zu9u1Z0061Llurq03u9vas; Wed, 04 Jun 2008 14:09:55 -0400
Received: from veronica.jetheaddev.com ([192.168.13.7]
	helo=veronica.jetheaddev.com)
	by mail.jetheaddev.com; 4 Jun 2008 11:09:54 -0700
Received: from lou-jethead.jetheaddev.com ([192.168.13.87]) by
	veronica.jetheaddev.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 4 Jun 2008 11:03:14 -0700
From: Louie Ilievski <loudawgucr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 4 Jun 2008 11:03:48 -0700
User-Agent: KMail/1.9.9
References: <200805271420.02174.loudawgucr@gmail.com>
	<4842CB25.5000305@kernelconcepts.de>
In-Reply-To: <4842CB25.5000305@kernelconcepts.de>
MIME-Version: 1.0
Message-Id: <200806041103.48229.loudawgucr@gmail.com>
X-OriginalArrivalTime: 04 Jun 2008 18:03:14.0239 (UTC)
	FILETIME=[4213D4F0:01C8C66D]
Subject: Re: Kernel not booting
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 04 Jun 2008 18:14:45 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Florian,

Thanks for the input.  I've been trying different kernel versions like the one 
you recommended and so far when I have set the PREFERRED_VERSION to anything 
other than the default, I have had build problems. LoL.  Just my luck, eh?  
So I'll try to work those out and see if I can get a working build 
someday  :-P

Thanks,

~Lou

On Sunday 01 June 2008 09:15:33 am Florian Boor wrote:
> Hi,
>
> Louie Ilievski wrote:
> > When trying to boot this with Haret, the last message I see is "Jumping
> > to kernel" and then it sits there until I reset the device.  I don't know
> > where to go from here to find out what is wrong with the kernel.
>
> I have seen the same effect with the HTC Universal which uses the same
> kernel (2.6.21-hh20). So it seems to be broken for other devices as well.
> Kernel 2.6.20-hh10 works for the Universal.
>
> Greetings
>
> Florian



