Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NY9Rz-00047g-0C
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 03:40:46 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 4CF761B10C02;
	Fri, 22 Jan 2010 02:37:09 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jan 2010 11:30:04 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
In-Reply-To: <883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
MIME-Version: 1.0
Message-Id: <201001211130.04522.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: "Dr. Michael Lauer" <mickey@vanille-media.de>
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
X-List-Received-Date: Fri, 22 Jan 2010 02:40:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 21 January 2010 11:20:13 Dr. Michael Lauer wrote:
> Am 21.01.2010 um 11:02 schrieb Holger Hans Peter Freyther:
> >> 2. Is there a way to have a staging branch where all patches are
> >> committed to, which have not been reviewed for let us say one week, to
> >> get more testing and before they go into the dev branch? Maybe it is
> >> easier for people to at least test build such a branch?
> >
> > Would you be interested in creating such a branch for us? I assume it is
> > certainly easier to git cherry-pick a patch than to download the mbox and
> > use git am..
> 
> I fully agree. I'm neither using patchwork nor do I find patches on the
>  list a good idea. I'd welcome for-oe-upstream trees that would contain
>  patches that -- if good -- we could just pull from.

I do like patches on the mailinglist. One thing we could try are the merge 
requests on gitorious? This way we can comment on the patches in a webui and 
they get automatically merged if we like it.

z.


