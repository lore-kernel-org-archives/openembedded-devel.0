Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KStMo-0003rZ-6t
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Aug 2008 14:52:50 +0200
Received: from andromeda.vanille.de (e180157096.adsl.alicedsl.de
	[85.180.157.96])
	by drlauer-research.com (Postfix) with ESMTP id F2F10584C2A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2008 14:59:48 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2008 14:52:17 +0200
User-Agent: KMail/1.9.9
References: <g7rt8e$ek9$1@ger.gmane.org>
	<200808121422.10430.mickey@vanille-media.de>
	<g7s07o$o5g$1@ger.gmane.org>
In-Reply-To: <g7s07o$o5g$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200808121452.18203.mickey@vanille-media.de>
Subject: Re: openembedded.net status?
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
X-List-Received-Date: Tue, 12 Aug 2008 12:52:50 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Dienstag 12 August 2008 14:38:16 schrieb Koen Kooi:
> Michael 'Mickey' Lauer wrote:
> > Am Dienstag 12 August 2008 13:47:26 schrieb Koen Kooi:
> >> if so, why is it taking so *$($*(@$*(@ long?
> >
> > No idea. That's the drawback of using donated services. The one in charge
> > of colocation is not in germany right now, according to him he notified
> > the computing centre, but i have yet to get an update from them. Since I
> > don't even have an account at the computing centre, it's a bit tough for
> > me to put pressure on those guys.
>
> Thanks, that clears things up a bit. All I knew that is was down and
> that there were no messages what happened and what steps are being taken
> to fix it.
>
> Isn't there a remote powerswitch that can get flipped like strato has?

There is probably, but I don't have an account there. Once Harald is back, 
I'll do the necessary things to prepare a better response time if that may 
happen again.

Then again, the traceroute indicates it's not the machine that's not 
responding (80.81.242.146), but rather some router craashed within the 
computing centre. So even a powerswitch would not help in that case.

> Can we point DNS back to ltg in the meantime? Having a page saying we're
> down is way better than having all website timeout.

I just pointed it back, but ltg needs to claim oe.net in apache2 and redirect 
to oe.ltg.org, otherwise we only get the main page.

-- 
:M:


