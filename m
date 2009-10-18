Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MzZ26-0001N1-S9
	for openembedded-devel@openembedded.org; Sun, 18 Oct 2009 18:55:06 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n9IGocs2029603; Sun, 18 Oct 2009 17:50:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ttdKfDKyx0BH; Sun, 18 Oct 2009 17:50:38 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n9IGoYvS029582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 18 Oct 2009 17:50:36 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Holger Hans Peter Freyther <holger+oe@freyther.de>
In-Reply-To: <200910181616.27482.holger+oe@freyther.de>
References: <1255874909.28889.20.camel@dax.rpnet.com>
	<200910181616.27482.holger+oe@freyther.de>
Date: Sun, 18 Oct 2009 17:49:25 +0100
Message-Id: <1255884565.28889.39.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev@lists.berlios.de
Subject: Re: [Bitbake-dev] Bitbake Roadmap
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
X-List-Received-Date: Sun, 18 Oct 2009 16:55:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-10-18 at 16:16 +0200, Holger Hans Peter Freyther wrote:
> On Sunday 18 October 2009 16:08:29 Richard Purdie wrote:
> 
> > Shout now if you disagree with any of this or have a better plan! :)
> 
> 
> I like it because this way I can get my parser changes into 1.10. 

Right, I failed to mention that but that was also something I had in
mind.

> One question is how do we proceed on bitbake-2.0? Do you have a set of
> specific of issues that need to be addressed for client/server? does
> it make sense to create that list?

It makes sense and the things I'd like to see addressed are:

* Debugging made easier (deadlocks, exceptions and so on)
* Performance loss due to xmlrpc mitigated as much as practicable
* Improved message handling and user interaction
* Real world testing - I'm not sure that code has had this yet

Cheers,

Richard








