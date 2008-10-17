Received: from [217.150.241.29] (helo=smtp1.nine.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mailinglist@miromico.ch>) id 1Kqi8k-0006RL-So
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 07:44:47 +0200
Received: from [192.168.1.190] (77-58-151-240.dclient.hispeed.ch
	[77.58.151.240]) by smtp1.nine.ch (Postfix) with ESMTP id 23EDB9681B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2008 07:44:42 +0200 (CEST)
Message-ID: <48F825DE.90104@miromico.ch>
Date: Fri, 17 Oct 2008 07:42:54 +0200
From: Alex Raimondi <mailinglist@miromico.ch>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Adding support for our
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
X-List-Received-Date: Fri, 17 Oct 2008 05:44:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, 

We have a new AVR32 based embedded linux board (www.miromico.com/hammerhead), which is available now. 
We would like to use OpenEmbedded as our major build system to allow our customers to build their u-boot, 
kernel and rootfs. 
Of course we would like to contribute to oe, as well. 

Is there such a thing as a board maintainer in oe? If yes, how can we become one?

We allready adapted a few bb files to get oe building our u-boot and kernel. Should we push out these changes? 
How?

We have two developers working at this project. Our board is AVR32 based. So, if oe is our major build system we would have to take care that avr32 allway builds. This means testing, fixing, extending support. I hope this would be benefit enough to endure our newbie questions while we are getting known with the build system.

Alex


