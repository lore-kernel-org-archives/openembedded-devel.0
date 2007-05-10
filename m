Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HmHiq-00034M-B6
	for openembedded-devel@openembedded.org; Fri, 11 May 2007 01:06:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4AN6CCE011487;
	Fri, 11 May 2007 00:06:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11296-03; Fri, 11 May 2007 00:06:09 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4AN65qa011479
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 11 May 2007 00:06:05 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <31583224.20070510180054@gmail.com>
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
	<20070418090235.GA21841@twibble.org>
	<46262A0F.1050805@dominion.kabel.utwente.nl>
	<20070419014949.GA6540@twibble.org> <31583224.20070510180054@gmail.com>
Date: Fri, 11 May 2007 00:06:11 +0100
Message-Id: <1178838371.20362.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Making /var/lib persistent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2007 23:07:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-05-10 at 18:00 +0300, Paul Sokolovsky wrote:
> Hello Jamie,
> 
> Thursday, April 19, 2007, 4:49:50 AM, you wrote:
> 
> > On Wed, Apr 18, 2007 at 07:24:15AM -0700, Koen Kooi wrote:
> > [...]
> >> Sound like a good idea, do you have a patch for this?
> 
> > Try this out:
> 
> >   http://twibble.org/dist/oe/var-volatiles-1.patch
> 
> > I've tested it locally both with and without tmpfs mounted on
> > /var/volatile and all seems to work as expected.
> 
>         Any news on this? I've been running with this patch soon since
> its original post and don't see any issues. One small nuisance is that
> ls -l /var/log doesn't show what you want, but hardly something can be
> done about that, plus shell completion uses /var/log/ immediately.
> 
>         I suggest committing this patch.

The idea sounded sane to me when I read about it so if its working, I
say go for it...

Cheers,

Richard



