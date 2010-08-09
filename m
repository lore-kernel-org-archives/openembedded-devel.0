Received: from hxhsvr03.internetintuitive.net ([80.254.228.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OiYhq-0002gV-25
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 22:14:00 +0200
Received: from durham.keylevel.com ([109.224.134.115]:9703 helo=[192.168.1.98])
	by hxhsvr03.internetintuitive.net with esmtpa (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OiYhh-0006Vt-Un
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 21:12:14 +0100
Message-Id: <FDA0423D-F572-4F4D-9330-24890469FD70@keylevel.com>
From: Chris Tapp <dokuwiki@keylevel.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v936)
Date: Mon, 9 Aug 2010 21:12:11 +0100
X-Mailer: Apple Mail (2.936)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - hxhsvr03.internetintuitive.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - keylevel.com
X-SA-Exim-Connect-IP: 80.254.228.43
X-SA-Exim-Mail-From: dokuwiki@keylevel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: How do I build and SDK?
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
X-List-Received-Date: Mon, 09 Aug 2010 20:14:17 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

I've had a look at the OE manual to try and understand what's needed  
to build an SDK, but I'm still not sure what I need to do.

I can 'bitbake my-image', giving me a system that boots ok on my target.

What I want to do now is produce an SDK that allows binaries to be  
built under an x86 hosted linux distro (e.g. ubuntu).

I'm not sure why there is a host and target to configure - I was  
expecting just to configure something for the platform that will run  
the SDK - I was thinking that the current OE local.conf should give  
the information needed to do this.

Is there an easy way to take a system configured to build 'my-image'  
and produce an SDK from that? I'm running OE under Ubuntu, if that  
makes things easier.

Failing that, are there any examples I can look at that would give me  
a more information that what's in the documentation?

Thanks !

Chris



