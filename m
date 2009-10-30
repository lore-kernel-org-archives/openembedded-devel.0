Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N3zOH-0002o1-AV
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 22:52:16 +0100
Received: by bwz9 with SMTP id 9so4034734bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2009 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=4GDD4KlbqMF4zbI1/r/pODMHvi7FydG6KH/yNaCWAyw=;
	b=Dns/E+H6DAHwKvg3EcWwRRroa2pR4VEZzaj8dFO+UtqrFgf+csHveCaFBOdbrY/koW
	MNhNIa0aTDqzVxPDodszyVvq73M78ow0n29TvpoE2D2cVGTrv8HI6RmquogdZCwjrshQ
	0+l8qBRR/GEmTavVZT0tY7BwBZwPW6V1Wcv34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=aVzwCiCEHMQ+XpcoaSTfxmioePGfxRhv8oT5C1DDbx+DboPH2ZxXw+2ckDqqBJOOVl
	6401ZMT6p+nuB3kC9ank3QVW/e93U0yCLRMxelhvsKhqPIf34Y1La+AUrhmkeXuhr6b2
	5YRqJuT9o+qpQzKmDcN549GBpZeX5ij7py6m0=
MIME-Version: 1.0
Received: by 10.239.179.80 with SMTP id c16mr197674hbg.155.1256939462754; Fri, 
	30 Oct 2009 14:51:02 -0700 (PDT)
In-Reply-To: <20091030204733.GZ22376@pengutronix.de>
References: <20091030204733.GZ22376@pengutronix.de>
Date: Fri, 30 Oct 2009 22:51:02 +0100
Message-ID: <c384c5ea0910301451w42249307w508aa4ca661cbdc8@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Robert Schwebel <r.schwebel@pengutronix.de>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Patch policy
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
X-List-Received-Date: Fri, 30 Oct 2009 21:52:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Robert and crews,

On Fri, Oct 30, 2009 at 9:47 PM, Robert Schwebel
<r.schwebel@pengutronix.de> wrote:
> Hi Marcin, Richard & OE crew,
>
> At ELC-E, we discussed how we could improve the collaboration between
> the cross build systems out there. Although there are big differences
> in what kind of tools people use, there is one thing that all cross
> build systems have in common: patches for upstream packets.
>
> - patches have to be in the canonical patch format, as known from linux
> - proper Signed-off-by: lines
> ...
> What do you think? Should we try to create a new patch stack which
> follows these rules, in order to lower the ammount of duplicate work? At
> least for us, this would be very interesting.
>

- Standard naming of the patch (numbered series etc).
- A shared (possibly distributed) patch server with patches against the package?

Regards,
-- 
Leon


