Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IGjSm-0001AX-WD
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2007 00:48:13 +0200
Received: from pd9538c5f.dip0.t-ipconnect.de ([217.83.140.95]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IGjQm-0006kl-BW
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2007 00:46:08 +0200
Message-ID: <46B25E0A.7050103@klever.net>
Date: Fri, 03 Aug 2007 00:43:22 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.5 (X11/20070731)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>	<46B1E063.7010407@dominion.kabel.utwente.nl>	<1186064138.5972.259.camel@hammer.suse.cz>	<46B1E812.8020706@dominion.kabel.utwente.nl>	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>	<46B1FC60.6030908@dominion.kabel.utwente.nl>	<46B1FDD8.8000404@klever.net>	<46B20D9F.70704@dominion.kabel.utwente.nl>
	<1186093013.6626.57.camel@localhost.localdomain>
In-Reply-To: <1186093013.6626.57.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.1
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Thu, 02 Aug 2007 22:48:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> 
> I'm actually semi against forcing staging to look like an image. The
> fact gcc requires this for its sysroot option is a sign that they
> haven't got this right yet.
> 

Why?

> With packaged staging we need to decide which way we go, separate
> staging packages or use the same ones as we use for images.
> 
> My personal gut feeling is that separate ones will work better. They

So is mine, but...

> also mean we can handle the extra staging files like pkgmaps and perhaps
> handle multi machine easier.
> 
> I think if we try to make image packages fit, we'll end up having to
> make hack after hack and end up with something less maintainable.

why?

Sorry for these vague questions, but it's absolutely unclear to me. I
don't want you to waste your time on elaborating too much on these, but
can you give a hint or two?

Love,
H


