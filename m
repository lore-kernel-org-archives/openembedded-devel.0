Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KuS8C-0005vU-16
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Oct 2008 14:27:40 +0100
Received: from andromeda.vanille.de (e180160026.adsl.alicedsl.de
	[85.180.160.26])
	by drlauer-research.com (Postfix) with ESMTP id A58C4584BCD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2008 14:40:43 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Oct 2008 14:26:50 +0100
User-Agent: KMail/1.9.10
References: <gdfm8d$apg$1@ger.gmane.org>
	<1224438415.4235.266.camel@lenovo.internal.reciva.com>
	<4900464A.9090009@kernelconcepts.de>
In-Reply-To: <4900464A.9090009@kernelconcepts.de>
MIME-Version: 1.0
Message-Id: <200810271426.50371.mickey@vanille-media.de>
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
X-List-Received-Date: Mon, 27 Oct 2008 13:27:40 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Thursday 23 October 2008 11:39:22 schrieb Florian Boor:
> Phil Blundell schrieb:
> > It's long been my view that we should just add newer ones and leave the
> > old ones alone.  There's really no reason to delete old recipes and,
> > even if you check for PREFERRED_VERSIONs in the git tree, there is no
> > real way to know who else might be relying on the version you are about
> > to delete.
>
> I share this opinion. Since we do not know what people are doing with OE
> there is no way to find out if a recipe is used or not. In fact I can
> imagine a lot of situations in which you might want to use an older recipe.
>
> Why do we delete old recipes? We do not do this with old software releases.

I think it's really messy and confusing to keep all version of recipes we ever 
had. I'd rather keep only major releases. I know, most of that is taste.

-- 
:M:


