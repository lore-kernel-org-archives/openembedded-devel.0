Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Nsk6a-0007Wz-0f
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 22:51:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id B54C62C9BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 21:48:39 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id x483hteU1C6x
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 21:48:39 +0000 (GMT)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 277E12C99A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 21:48:39 +0000 (GMT)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 2F83627B0F; Fri, 19 Mar 2010 21:49:07 +0000 (GMT)
Date: Fri, 19 Mar 2010 21:49:07 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100319214907.GN2425@xora-desktop.xora.org.uk>
References: <1239889359-13953-1-git-send-email-khimov@altell.ru>
	<1268769038-30979-1-git-send-email-khimov@altell.ru>
	<201003192355.52441.roman@khimov.ru>
	<bd4a003f1003191434t57c3f126gdc0f53790ef75aed@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <bd4a003f1003191434t57c3f126gdc0f53790ef75aed@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cmake.bbclass: force CMAKE_INSTALL_SO_NO_EXE to be 0
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
X-List-Received-Date: Fri, 19 Mar 2010 21:51:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 19, 2010 at 02:34:56PM -0700, Ash Charles wrote:
> On Fri, Mar 19, 2010 at 1:55 PM, Roman I Khimov <roman@khimov.ru> wrote:
> > So, I've rebased that to current, it looks like an obvious one and still no
> > one cares. As per policy, I need two ack's on this one. Should I break that
> > and push it or just wait another year till someone else interested in cmake
> > will ack it?
> 
> Hi Roman,
> 
> I'm not in a position to ack this as I'm new to this mailing list. I
> use OpenEmbedded+Cmake for several projects though and this looks like
> a sensible fix.
> 
Ash, if you can verify the change then please Ack, we arent as strict
as other projects.

Graeme



