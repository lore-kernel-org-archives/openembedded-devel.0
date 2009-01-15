Received: from [66.80.197.243] (helo=looper.buglabs.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ken@buglabs.net>) id 1LNRtR-0008E6-GK
	for openembedded-devel@openembedded.org; Thu, 15 Jan 2009 14:04:19 +0100
Received: from aphid.buglabs.net (aphid.buglabs.net [192.168.20.30])
	by looper.buglabs.net (Postfix) with ESMTP id DBE4834047;
	Thu, 15 Jan 2009 07:58:06 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by aphid.buglabs.net (Postfix) with ESMTP id DF15028E002;
	Thu, 15 Jan 2009 07:58:42 -0500 (EST)
X-Virus-Scanned: amavisd-new at aphid.buglabs.net
Received: from aphid.buglabs.net ([127.0.0.1])
	by localhost (aphid.buglabs.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yllRzkl0XaCt; Thu, 15 Jan 2009 07:58:42 -0500 (EST)
Received: from [10.242.2.10] (firebug.buglabs.net [192.168.0.2])
	by aphid.buglabs.net (Postfix) with ESMTP id 4F84128E001;
	Thu, 15 Jan 2009 07:58:42 -0500 (EST)
From: Ken Gilmer <ken@buglabs.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gkn9vn$mh4$1@ger.gmane.org>
References: <gkn9vn$mh4$1@ger.gmane.org>
Organization: Bug Labs, Inc.
Date: Thu, 15 Jan 2009 07:57:34 -0500
Message-Id: <1232024254.6755.235.camel@t61.buglabs.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Overlay hosting and mirroring on git.oe.net
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
X-List-Received-Date: Thu, 15 Jan 2009 13:04:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


I'm writing some OE tools and there seems to be some variance in
hardware and distro specific overlays that may not be entirely
necessary.  Additionally I have hesitated to submit most of what I work
on upstream due to the amount of effort to test against stock OE-dev
from Poky-Bug.  So, yes, +1 for this if it reduces unnecessary variance
and making it easier to test packages cross-distro and cross-machine.

thx
ken

On Thu, 2009-01-15 at 13:25 +0100, Koen Kooi wrote:
> Hi,
> 
> There are a lot of OE based projects around that use an overlay to 
> manage their tweaks (e.g. gumstix, openpandora, arago), which has pros 
> and cons. A while ago I was talking to John Willis (of open2x and 
> openpandora fame) and he liked the idea of mirroring the pandora overlay 
> on git.oe.net to make it more visible and to make it easier for OE 
> developers to work on making pieces of it upstream safe.
> I think a git mirror of poky would fall in this category as well.
> 
> What do you think of this?
> 
> regards,
> 
> Koen
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



