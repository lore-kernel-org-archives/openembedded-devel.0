Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NxKaw-0001cv-9N
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 15:38:02 +0200
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 931B21B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Apr 2010 13:39:11 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Apr 2010 15:34:39 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34-rc3-00001-g17459ed; KDE/4.4.2; i686; ; )
References: <20100330122319.f0e46761.ospite@studenti.unina.it>
	<1270127783-21172-1-git-send-email-ospite@studenti.unina.it>
	<20100401132312.GM25489@jama>
In-Reply-To: <20100401132312.GM25489@jama>
MIME-Version: 1.0
Message-Id: <201004011534.39987.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] frameworkd-config-shr: fix a nasty typo
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
X-List-Received-Date: Thu, 01 Apr 2010 13:38:02 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 01 April 2010 15:23:12 Martin Jansa wrote:
> On Thu, Apr 01, 2010 at 03:16:23PM +0200, Antonio Ospite wrote:
> > A misplaced '-' instead of '_' made bitbake conditional appending fail,
> > resulting in fso-abyss being added unconditionally to runtime
> > dependencies.
> 
> Wow, good catch! I'll apply now.

Stupid question... there are not many that have a gta03, who is suffering from 
that (the bug tracker is not loading for me right now).



