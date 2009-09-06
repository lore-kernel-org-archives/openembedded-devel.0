Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MkKH4-0008Tw-Rn
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 18:07:31 +0200
Received: from tamarin.localnet (unknown [211.48.194.125])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id F1A121B10C10
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2009 15:53:39 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 6 Sep 2009 17:48:14 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.1; i686; ; )
References: <c384c5ea0909051630hb5a9c24jbf10e1854218b1d5@mail.gmail.com>
	<4AA39953.1020607@gmail.com>
In-Reply-To: <4AA39953.1020607@gmail.com>
MIME-Version: 1.0
Message-Id: <200909061748.14135.holger+oe@freyther.de>
Subject: Re: Request for NEWS item: bitbake in GIT
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
X-List-Received-Date: Sun, 06 Sep 2009 16:07:32 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Sunday 06 September 2009 13:13:23 Marco Cavallini wrote:
> Leon Woestenberg ha scritto, Il 06/09/2009 01:30:
> > For users not reading the mailing list, it is mostly unknown that
> > bitbake is now maintained in GIT.
> >
> > I just modified the "Getting Started -> Bitbake
> > (http://wiki.openembedded.net/index.php/BitBake)" to reflect this to
> > some extend.
> >
> > However, all other references to BitBake link to the bitbake project
> > page on berlios which mentions the SVN repo.
> >
> > Maybe adding a News item in the wiki helps; I vaguely remember News is
> > moderated (cbrake?)
> >
> > Thanks,
>
> Would you also suggest to replace the old
> svn co svn://svn.berlios.de/bitbake/branches/bitbake-1.8/ bitbake
> with a newer git clone command in OE related documentation?


Only the Bitbake developer reference should mention git. Users shall be 
pointed to the tarball of the latest release.

thanks
	z.


