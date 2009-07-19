Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MSMrS-00051h-4s
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jul 2009 05:14:50 +0200
Received: from tamarin.localnet (123-192-186-20.dynamic.kbronet.com.tw
	[123.192.186.20])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id D509E1B10C08;
	Sun, 19 Jul 2009 03:02:17 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: bitbake-dev@lists.berlios.de
Date: Sun, 19 Jul 2009 05:00:20 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc2; KDE/4.2.96; i686; ; )
MIME-Version: 1.0
Message-Id: <200907190500.20796.holger+oe@freyther.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: [RFC] Bitbake 1.8 parser rework
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
X-List-Received-Date: Sun, 19 Jul 2009 03:14:50 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey,

I posted this patchset a bit earlier and still would be interested in 
feedback.I have put the version of Bitbake into a git repository so it might 
be easier to try than to apply the ~20 patches to it.

You can get the source from: git clone git://gitorious.org/bitbake/bitbake.git
and they are in the bitbake-1.8-parser-rework branch.

feedback welcome
	z.


