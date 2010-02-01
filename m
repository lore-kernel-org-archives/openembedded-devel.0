Received: from mail.emacinc.com ([63.245.244.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tstratman@emacinc.com>) id 1Nc3EW-0007dE-3z
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 21:50:59 +0100
Received: from [63.245.244.67] (helo=emac081.emacinc.com)
	by mail.emacinc.com with esmtp (Exim 4.50) id 1Nc3Bw-0008FE-O8
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 14:48:24 -0600
From: Travis Stratman <tstratman@emacinc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 01 Feb 2010 14:48:15 -0600
Message-Id: <1265057295.4267.170.camel@cheeto.emacinc.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-SA-Exim-Connect-IP: 63.245.244.68
X-SA-Exim-Mail-From: tstratman@emacinc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Qt4 embedded not populating staging
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
X-List-Received-Date: Mon, 01 Feb 2010 20:51:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

I recently built version 4.6.0 of Qt embedded and noticed that it does
not populate the host staging directory. Comparing the newest qt4.inc
from the dev branch with the version that I was previously using, I
notice that the do_stage() has been removed. Does anyone know what the
reason for this was?

Note that I'm using the stable branch but I pulled the Qt4 scripts from
the dev branch into my local bb recipes and made some minor changes so
that I could build 4.6.0, so its possible that I introduced the issue
during this process.

Thanks,

TAS



