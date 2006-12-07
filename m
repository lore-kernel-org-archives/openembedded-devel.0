Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GsJ0y-0004s3-OP
	for openembedded-devel@openembedded.org; Thu, 07 Dec 2006 14:10:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kB7D9Atr028636
	for <openembedded-devel@openembedded.org>; Thu, 7 Dec 2006 13:09:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28468-01 for <openembedded-devel@openembedded.org>;
	Thu,  7 Dec 2006 13:09:08 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kB7D93r2028610
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 7 Dec 2006 13:09:03 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45780B2E.4020906@dominion.kabel.utwente.nl>
References: <456B0DC2.90300@dominion.kabel.utwente.nl>
	<45780B2E.4020906@dominion.kabel.utwente.nl>
Date: Thu, 07 Dec 2006 13:09:03 +0000
Message-Id: <1165496944.5601.32.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: To be removed recipes
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
X-List-Received-Date: Thu, 07 Dec 2006 13:10:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2006-12-07 at 13:38 +0100, Koen Kooi wrote:
> > In case people didn't notice,
> > http://www.openembedded.org/repo/org.openembedded.dev/removal.txt has a few entries now,
> > which will be removed on the specified dates.
> 
> Only 5 days left till the first batch gets removed.

> Package Name:   Maemo
> Reason:         Unfetchable, obsoleted by IT2006 release.

I don't know what we should do with these for the best. The end result
will be maemo being near enough totally removed from OE which sends out
the wrong message. I would ultimately like to see maemo in OE...

Maybe a contender for moving to non-working?

> Package Name:   task-bootstrap*
> Reason:         Obsoleted by task-base

Have we anyone still using this? I'm nervous removing this just yet...

> Package Name:   bluez*2.*
> Reason:         Obsolete by, and conflicts with bluez 3.7               

Fine with me.

> Package Name:   mono
> Reason:         Obsolete version - 1.2 is current, 1.0 is not fetchable

non-working - ultimately we probably want mono
 
> Package Name:   zeecookbook
> Reason:         Not maintained upstream, not fetchable

Fine with me.

> Package Name:   qpe-vexed
> Reason:         Not fetchable, all search results points to OE related infos

Fine with me.

> Package Name:   ipac-ng
> Reason:         Depends on libgd-perl which is not in metada

> Package Name:   
? (there are two of these)
 
> Package Name:   nsqld
> Reason:		Never used

Fine with me.

> Package Name:   gpe-mileage
> Reason:         Unfinished, no development progress

Fine with me.



