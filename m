Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GtXET-0008BD-37
	for openembedded-devel@openembedded.org; Sun, 10 Dec 2006 23:33:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBAMVhKh011828
	for <openembedded-devel@openembedded.org>; Sun, 10 Dec 2006 22:31:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11666-04 for <openembedded-devel@openembedded.org>;
	Sun, 10 Dec 2006 22:31:41 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBAMVbjc011813
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 10 Dec 2006 22:31:37 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <444521399.20061208175939@vanille-media.de>
References: <456B0DC2.90300@dominion.kabel.utwente.nl>
	<45780B2E.4020906@dominion.kabel.utwente.nl>
	<1165496944.5601.32.camel@localhost.localdomain>
	<444521399.20061208175939@vanille-media.de>
Date: Sun, 10 Dec 2006 22:31:39 +0000
Message-Id: <1165789899.5604.43.camel@localhost.localdomain>
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
X-List-Received-Date: Sun, 10 Dec 2006 22:33:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-12-08 at 17:59 +0100, Michael 'Mickey' Lauer wrote:
> Richard Purdie wrote:
> >> Package Name:   bluez*2.*
> >> Reason:         Obsolete by, and conflicts with bluez 3.7               
> 
> > Fine with me.
> 
> This can be a problem for Opie, since we used the no-dbus version for
> quite some time to save space.

In that case we can't remove the no-dbus version needed by opie.

Richard



