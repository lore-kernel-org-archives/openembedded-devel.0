Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HeJ0M-0003j0-Qa
	for openembedded-devel@openembedded.org; Thu, 19 Apr 2007 00:52:05 +0200
Received: from dominion.dominion.void (dominion.kabel.utwente.nl
	[130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3IMptox027333; Thu, 19 Apr 2007 00:51:56 +0200
Received: from www-data by dominion.dominion.void with local (Exim 4.60)
	(envelope-from <k.kooi@student.utwente.nl>)
	id 1HeJ0C-0005WW-5R; Thu, 19 Apr 2007 00:51:52 +0200
Received: from 64-172-16-227.ded.pacbell.net (64-172-16-227.ded.pacbell.net
	[64.172.16.227]) by dominion.kabel.utwente.nl (IMP) with HTTP 
	for <koen@localhost>; Thu, 19 Apr 2007 00:51:51 +0200
Message-ID: <1176936711.4626a107df54b@dominion.kabel.utwente.nl>
Date: Thu, 19 Apr 2007 00:51:51 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>, 
	Leon Woestenberg <leon.woestenberg@gmail.com>
References: <46209B2D.4060902@dominion.kabel.utwente.nl>
	<c384c5ea0704150831o1a39752cu2813beb58cc9e659@mail.gmail.com>
In-Reply-To: <c384c5ea0704150831o1a39752cu2813beb58cc9e659@mail.gmail.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.6
X-Originating-IP: 64.172.16.227
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Cairo 1.4.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2007 22:52:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Quoting Leon Woestenberg <leon.woestenberg@gmail.com>:

> Koen,
>
> On 4/14/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Cairo 1.4.4 was just released containing a ton of bugfixes, but I urge you
> not to add it
>
> Thanks for the heads-up.

I added 1.4.4 with the workqueue patch[1], which seems to even faster as the
surface cache patch. A brief test didn't reveal problems for me, but please
give a shout if you experience problems with it.

regards,

Koen

[1] http://lists.freedesktop.org/archives/cairo/2007-April/010381.html

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


