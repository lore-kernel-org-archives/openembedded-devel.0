Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1RWbiH-0001VQ-Pd
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 23:36:13 +0100
Received: from trisquel.localnet (80.116.58.40) by smtp202.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 4ECA5CC2006017EA; Fri, 2 Dec 2011 23:24:10 +0100
From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 2 Dec 2011 23:24:08 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-12-generic; KDE/4.6.5; x86_64; ; )
References: <4ED8307F.2060306@googlemail.com>
	<20111202145256.GD3770@jama.jama.net>
	<4ED92FC0.2050502@googlemail.com>
In-Reply-To: <4ED92FC0.2050502@googlemail.com>
MIME-Version: 1.0
Message-Id: <201112022324.09104.GNUtoo@no-log.org>
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 22:36:14 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

>When I boot up the console-image things are almost exactly the same - 
If you don't need Xorg,Try recompiling the kernel with the framebuffer console 
built in.

Denis.


