Received: from [213.207.90.162] (helo=daffy.sipo.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lists@t3i.nl>) id 1JlVDq-0001Uw-E9
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 22:24:14 +0200
Received: from nobody by daffy.sipo.nl with local (Exim 4.63)
	(envelope-from <lists@t3i.nl>) id 1JlVDo-0001Q4-Vo
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 22:24:13 +0200
To: openembedded-devel@lists.openembedded.org
From: "RvP" <lists@t3i.nl>
Mime-Version: 1.0
X-Mailer: Mr.Mail 0.6alpha
X-Originating-IP: 83.83.2.224
X-MsgID: php4803bd6c2253d
Message-Id: <E1JlVDo-0001Q4-Vo@daffy.sipo.nl>
Date: Mon, 14 Apr 2008 22:24:12 +0200
Subject: Re: union fs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Apr 2008 20:24:14 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

From: "Mike (mwester)" <mwester@dls.net>
> RvP wrote:
> > Hi,
> > 
> > Support for unionfs-modules with recent kernels is broken in oe, see
> > http://bugs.openembedded.org/show_bug.cgi?id=1189.
> > 
> > Are there plans to fix this?
> 
> The unionfs modules are part of the 2.6 kernel now. 

Are they? I read on the unionfs site that they are part of the -mm tree as of
Jan. 2007, but, you're probably right. OpenWRT does use unionfs per default
with a 2.6.24 kernel.

> Do you really need them?

Not anymore, I was looking for a way to install extra pakages for SlugOS on
an external drive. I found in the docs that a copy of the complete rootfs can
be installed on an external drive using 'turnup' (NSLU2 specific tool). I'll
go that way.

Thanks,

Richard.



