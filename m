Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NXtu8-00071P-Vl
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 11:04:48 +0100
Received: from tamarin.localnet (unknown [211.40.35.125])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C27E21B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 10:01:07 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jan 2010 11:02:11 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
In-Reply-To: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
Message-Id: <201001211102.11252.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 10:04:48 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Thursday 21 January 2010 10:43:44 Paul Menzel wrote:

> 
> So now my question is, is there a temporary reason for this lack of time
> by developers or is that a fundamental problem so a solution is needed?

I don't think this is temporary.

> 
> 1. It looks like nobody of the developers is using Patchwork yet. It
> looks like everybody can register an account and update the statuses. Is
> there a demand for it? Maybe we can find some non-developers (including
> me) volunteering to do this?

I could need a hand keeping it updated. E.g. I was busy the last weeks and 
couldn't remove items from the page and now we are up to three pages of data.


> 
> 2. Is there a way to have a staging branch where all patches are
> committed to, which have not been reviewed for let us say one week, to
> get more testing and before they go into the dev branch? Maybe it is
> easier for people to at least test build such a branch?

Would you be interested in creating such a branch for us? I assume it is 
certainly easier to git cherry-pick a patch than to download the mbox and use 
git am..


