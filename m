Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NlsG0-0003PG-MN
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 00:09:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 801CBA5014
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 23:06:16 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id vcKu7TaxOSH2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 23:06:11 +0000 (GMT)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id C4E7EA5010
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 23:06:11 +0000 (GMT)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 0C6312453E; Sun, 28 Feb 2010 23:06:03 +0000 (GMT)
Date: Sun, 28 Feb 2010 23:06:03 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100228230603.GH30145@xora-desktop.xora.org.uk>
References: <E1NlqMw-0004yw-KS@melo.openembedded.org>
	<1267396888.9295.30.camel@trini-m4400>
MIME-Version: 1.0
In-Reply-To: <1267396888.9295.30.camel@trini-m4400>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Graeme Gregory : firefox_3.6.bb : add new version, convert to new staging
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
X-List-Received-Date: Sun, 28 Feb 2010 23:09:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 28, 2010 at 03:41:28PM -0700, Tom Rini wrote:
> On Sun, 2010-02-28 at 21:08 +0000, git version control wrote:
> > Module: openembedded.git
> > Branch: org.openembedded.dev
> > Commit: 0ca0394c94028b941603b2d6f7264d3eaaed5a98
> > URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=0ca0394c94028b941603b2d6f7264d3eaaed5a98
> > 
> > Author: Graeme Gregory <dp@xora.org.uk>
> > Date:   Sun Feb 28 21:07:28 2010 +0000
> > 
> > firefox_3.6.bb : add new version, convert to new staging
> 
> Do we still honestly need PARALLEL_MAKE = "" ?
> 
I have no idea and dont really have a way to reliably test these
things.

Graeme



