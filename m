Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <EliSko@FastMail.fm>) id 1KsxBF-0006AY-FW
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 12:12:39 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 40568181DA8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2008 06:12:07 -0400 (EDT)
Received: from web6.messagingengine.com ([10.202.2.215])
	by compute1.internal (MEProxy); Thu, 23 Oct 2008 06:12:07 -0400
Received: by web6.messagingengine.com (Postfix, from userid 99)
	id 232AD34AA0; Thu, 23 Oct 2008 06:12:07 -0400 (EDT)
Message-Id: <1224756727.28423.1280823321@webmail.messagingengine.com>
X-Sasl-Enc: LFQcqpmYuaWaWGOxfu7+jQfgPzSocYrrGIxMPvL9CFqc 1224756727
From: "Eliyahu Skoczylas" <EliSko@FastMail.fm>
To: "Developers@OE.net" <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <gdfm8d$apg$1@ger.gmane.org>
	<200810191847.04533.mickey@vanille-media.de>
	<1224438415.4235.266.camel@lenovo.internal.reciva.com>
	<4900464A.9090009@kernelconcepts.de>
In-Reply-To: <4900464A.9090009@kernelconcepts.de>
Date: Thu, 23 Oct 2008 12:12:07 +0200
Subject: Re: busybox recipe isappearances
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
X-List-Received-Date: Thu, 23 Oct 2008 10:12:44 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2008 11:39:22 +0200, "Florian Boor"
<florian.boor@kernelconcepts.de> said:
> Hi,
> 
> Phil Blundell schrieb:
> > It's long been my view that we should just add newer ones and leave the
> > old ones alone.  There's really no reason to delete old recipes and,
> > even if you check for PREFERRED_VERSIONs in the git tree, there is no
> > real way to know who else might be relying on the version you are about
> > to delete. 
> 
> I share this opinion. Since we do not know what people are doing with OE
> there
> is no way to find out if a recipe is used or not. In fact I can imagine a
> lot of
> situations in which you might want to use an older recipe.
> 
> Why do we delete old recipes? We do not do this with old software
> releases.

I think that a simple policy of retaining, say, the latest 3 or 4
recipes for the current version of a package, and the last 2 for the 2
earlier software versions, might make people's lives easier and also not
"clutter up" the directories with dozens of out-of-date / non-working
versions.  It shouldn't be hard to automate a policy like that, either.

-    Eliyahu
--
Eliyahu Skoczylas    +972 (54) 214-1505
If <EliSko@Eli-Sko.com> bounces, please use <EliSko@FastMail.fm>, instead.



