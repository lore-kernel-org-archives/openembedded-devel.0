Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N9zoN-0002G0-Mo
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 12:32:03 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N9zn4-00088q-Ng for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 06:30:38 -0500
Date: Mon, 16 Nov 2009 06:30:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B01352A.6070808@kernelconcepts.de>
Message-ID: <alpine.LFD.2.00.0911160627480.16206@localhost>
References: <alpine.LFD.2.00.0911141154040.29809@localhost>
	<4B01352A.6070808@kernelconcepts.de>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] i2c-tools: Remove superseded i2c-tools 3.0.1.
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
X-List-Received-Date: Mon, 16 Nov 2009 11:32:03 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 16 Nov 2009, Florian Boor wrote:

> Hi,
>
> Robert P. J. Day schrieb:
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> I do not agree on this. There is no way to make sure people are not
> using it. Even if it is unlikely the new release might break for
> some of our users or just rely on something that is not available
> for everyone. Apart from this I do not see much of a reason for
> removing it at all.

  based on a couple earlier comments, i'll agree.  so what's the
proper protocol for adding a newer version?  just submit a patch that
*adds* the appropriate content while leaving the current version info
in place?  i can easily submit a patch for that.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


