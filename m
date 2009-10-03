Received: from [76.96.30.40] (helo=QMTA04.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1Mu9wJ-00086N-Jh
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Oct 2009 21:06:46 +0200
Received: from OMTA15.emeryville.ca.mail.comcast.net ([76.96.30.71])
	by QMTA04.emeryville.ca.mail.comcast.net with comcast
	id oJh31c0011Y3wxoA4K5zkH; Sat, 03 Oct 2009 19:05:59 +0000
Received: from [192.168.1.101] ([67.188.141.116])
	by OMTA15.emeryville.ca.mail.comcast.net with comcast
	id oK0y1c00A2WszPn8bK0yms; Sat, 03 Oct 2009 19:00:59 +0000
From: ed <enelson1000@comcast.net>
To: Openembedded-devel@lists.openembedded.org
Date: Sat, 03 Oct 2009 12:00:56 -0700
Message-Id: <1254596456.4074.5.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 76.96.30.40
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: DirectFB problem
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
X-List-Received-Date: Sat, 03 Oct 2009 19:06:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I am building mini2440 using OE from Buserror
http://bliterness.blogspot.com/

I am building the mini2440-image and the build completes without any
errors.

When I run the command #dbinfo it crashes almost immediately.


root@mini2440:~# dfbinfo

   ~~~~~~~~~~~~~~~~~~~~~~~~~~| DirectFB 1.2.7 |
~~~~~~~~~~~~~~~~~~~~~~~~~~
        (c) 2001-2008  The world wide DirectFB Open Source Community
        (c) 2000-2004  Convergence (integrated media) GmbH
      ----------------------------------------------------------------

(*) DirectFB/Core: Single Application Core. (2009-10-03 18:31) [ DEBUG ]
(*) Direct/Thread: Started 'VT Switcher' (2128) [CRITICAL OTHER/OTHER
0/0] <8388608>...
(!) [ 2125:    0.000] --> Caught signal 11 (at 0x4187f3a4, invalid
address) <--
Aborted
root@mini2440:~# 


Does anyone have any ideas on were I should begin to troubleshooting the
problem.

Thanks




