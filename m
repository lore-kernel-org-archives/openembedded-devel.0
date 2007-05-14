Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HnZtO-0005C7-H6
	for openembedded-devel@openembedded.org; Mon, 14 May 2007 14:43:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4ECgfB9031603;
	Mon, 14 May 2007 13:42:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31033-06; Mon, 14 May 2007 13:42:34 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4ECgWkW031585
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 14 May 2007 13:42:33 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1178928474.4954.18.camel@localhost.localdomain>
References: <4644ABCB.6080202@openhardware.net>
	<4644B0D2.8020409@dominion.kabel.utwente.nl>
	<1178928474.4954.18.camel@localhost.localdomain>
Date: Mon, 14 May 2007 13:42:32 +0100
Message-Id: <1179146552.5877.1.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: do_rootfs fails
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
X-List-Received-Date: Mon, 14 May 2007 12:43:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2007-05-12 at 02:07 +0200, Matthias Hentges wrote:
> Am Freitag, den 11.05.2007, 20:07 +0200 schrieb Koen Kooi:
> 
> > All: Are we still going to wait 1.5 months with requiring 1.8.x? I've seen enough proof
> > that 1.6.x is broken with current .dev, with no effort to fix it. "Giving people time to
> > prepare the upgrade" has now turned into "Stabbing user in the eye" :(
> > 
> > regards,
> > 
> > Koen
> 
> 1.8.x has a show-stopper freeze-bug for some users ( including myself )
> which has not been fixed or even looked into yet.

Nobody has reported this properly although I keep hearing mention of it.

Could you send me the output from stty in your usual development
environment please?

Thanks,

Richard





