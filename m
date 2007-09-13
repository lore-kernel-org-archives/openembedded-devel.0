Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IVkNr-0000lZ-2t
	for openembedded-devel@openembedded.org; Thu, 13 Sep 2007 10:49:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8D8jwOT015236;
	Thu, 13 Sep 2007 09:45:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14839-10; Thu, 13 Sep 2007 09:45:50 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8D8jm3h015214
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 13 Sep 2007 09:45:48 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46E8ED0F.5000003@student.utwente.nl>
References: <1189638097.6480.132.camel@localhost.localdomain>
	<46E8ED0F.5000003@student.utwente.nl>
Date: Thu, 13 Sep 2007 09:45:47 +0100
Message-Id: <1189673147.6326.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Michael 'Mickey' Lauer <mickey@openmoko.org>
Subject: Re: The ongoing SRCREV saga
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
X-List-Received-Date: Thu, 13 Sep 2007 08:49:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-09-13 at 09:55 +0200, Koen Kooi wrote:
> Richard Purdie schreef:
> > Are there any objections to the above? I'll probably commit this fairly
> > quickly if the openmoko devs are agreeable.
> 
> Mickey OK'ed it on another list, so I added sane-srcrevs.inc to angstrom. (in)sane-srcrevs
> and moko-autorev needs some tweaking, but 90% is there.

Thanks for that, I've completed the change tweaking these files a little
and changing the default SRCREV definition as discussed.

Cheers,

Richard





