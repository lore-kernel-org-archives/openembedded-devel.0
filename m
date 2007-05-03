Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HjbAq-00010Y-OH
	for openembedded-devel@openembedded.org; Thu, 03 May 2007 15:16:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l43D7CPW015383;
	Thu, 3 May 2007 14:07:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14936-10; Thu,  3 May 2007 14:07:09 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l43D781a015376
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 3 May 2007 14:07:08 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <35653307.20070503154732@gmail.com>
References: <35653307.20070503154732@gmail.com>
Date: Thu, 03 May 2007 14:07:08 +0100
Message-Id: <1178197628.6312.22.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [ALERT] Security vulnerability with recent OE bitbake.conf	changes
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
X-List-Received-Date: Thu, 03 May 2007 13:16:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2007-05-03 at 15:47 +0300, Paul Sokolovsky wrote:
> If going with choice 2, I proposed also to do the following: 1) add
> depends on xine, mplayer, totem, few other video players; 2) add depends
> on mesa and show nice 3d rotating menu to select player of user choice;
> 3) use selected player to show video during the build - after all,
> if user deserves comfort of using superfluous GUI tools for conflict
> resolution, why one should be bored during normal build process?

Paul,

Is there really any need for this?

It doesn't encourage me to give a sensible reply, does it...

Richard



