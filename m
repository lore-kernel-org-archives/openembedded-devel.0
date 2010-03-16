Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NrL2h-0006CQ-1y
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 01:53:55 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 9F6CE1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 00:53:57 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 01:50:11 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <201003081300.19058.holger+oe@freyther.de>
	<201003151658.08401.holger+oe@freyther.de>
	<ac9c93b11003151120w7b467a07m8916030fe51b107c@mail.gmail.com>
In-Reply-To: <ac9c93b11003151120w7b467a07m8916030fe51b107c@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003160150.11858.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Tue, 16 Mar 2010 00:53:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 March 2010 19:20:33 Frans Meulenbroeks wrote:
> 2010/3/15 Holger Hans Peter Freyther <holger+oe@freyther.de>:

> > You are mixing two things again. One is warranty and of course our MIT
> > license says that the stuff comes "as is" without warranty and such. The
> > other is what do we want to try. I think we should folllow CVEs and have
> > no known security issues in our default set (bitbake -s).
> 
> Be my guest :-)
> Given the hostile attitude of some people here, I'm becoming less and
> less interested to contribute.
> Guess some will be happy about that :-(

Well,
innovation comes by changing the status-quo, which implies a degree of 
breakage and no one likes to wake up and do a build and find his/her stuff is 
broken. Of course we do want to have progress and you do have supporters as 
well. E.g. after the autoconf change Graeme, me and probably others kicked on 
a fresh build to see where stuff is breaking and fix it (in the meta-toolchain-
qte case I didn't need anything).


