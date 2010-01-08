Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NTFSg-0006xk-L2
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 15:05:13 +0100
Received: from tamarin.localnet (n219076093019.netvigator.com [219.76.93.19])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C9FF81B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2010 14:00:36 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 8 Jan 2010 15:02:46 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <20100108132344.GB2156@jama>
In-Reply-To: <20100108132344.GB2156@jama>
MIME-Version: 1.0
Message-Id: <201001081502.46952.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: update-alternatives broken badly (by me :()
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
X-List-Received-Date: Fri, 08 Jan 2010 14:05:13 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 08 January 2010 14:23:44 Martin Jansa wrote:
> After this change
> http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=9b641bbfed07c
> 075ae5cbe84082a85f1ba703447

thanks for highlighting this. Let me say something regarding the commit 
message. Your commit message is not saying anything regarding "Why", it is not 
indicating a post to the mailinglist, it is not saying what problem is fixed.

Could we all try to have answers to:
	- What
	- How
	- Why

in our commit messages? And maybe ask someone for review before touching basic 
files(*)?

z.


*: This comes from the guy who added a circular dependency last week


