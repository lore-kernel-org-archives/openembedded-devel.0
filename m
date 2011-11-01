Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1RLBrk-0008N1-VX
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 11:46:49 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RLBlt-0007C1-8L>; Tue, 01 Nov 2011 11:40:45 +0100
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RLBlt-0006n1-2c>; Tue, 01 Nov 2011 11:40:45 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by mail.imp.fu-berlin.de with esmtps (Exim 4.72) id 1RLBl9-0001gg-NE
	(envelope-from <heinold@mi.fu-berlin.de>)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 11:40:15 +0100
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1RLBl4-0002t5-Jg
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 11:39:54 +0100
Date: Tue, 1 Nov 2011 11:39:54 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111101103954.GA424@mi.fu-berlin.de>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<20111027115643.GA13369@mi.fu-berlin.de>
	<20111027122735.GC12609@jama.jama.net> <4EAF3F89.6000204@telia.com>
	<20111101010055.GU15391@denix.org> <4EAF9C0E.9030702@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4EAF9C0E.9030702@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Remote-IP: 160.45.42.84
X-Spam_Score: -4.1
X-exim-Spam_Score_Int: -40
X-exim-Spam_Bar: ----
X-Spam_Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.2 RP_MATCHES_RCVD Envelope sender domain matches handover relay
	domain * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Originating-IP: 160.45.117.149
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Tue, 01 Nov 2011 10:46:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 01, 2011 at 08:13:18AM +0100, Jaap de Jong wrote:
> On 11/01/2011 02:00 AM, Denys Dmytriyenko wrote:
> >On Tue, Nov 01, 2011 at 01:38:33AM +0100, Ulf Samuelsson wrote:
> >>2011-10-27 14:27, Martin Jansa skrev:
> >>>On Thu, Oct 27, 2011 at 01:56:43PM +0200, Henning Heinold wrote:
> >>>>On Thu, Oct 27, 2011 at 10:53:13AM +0000, Mats K?rrman wrote:
> >>>>>Hi,
> >>>>>
> >>>>>Are there any plans for new releases and/or maintenance branches of OE
> >>>>>classic?
> >>>>>
> >>>>>BR / Mats
> >>>>Hi,
> >>>>
> >>>>http://cgit.openembedded.org/openembedded/log/?h=org.openembedded.dev
> >>>>
> >>>>and
> >>>>
> >>>>http://cgit.openembedded.org/openembedded/log/?h=2011.03-maintenance
> >>>>
> >>>>Bye Henning
> >>>Are you showing that maintenance ibranch is not so old and that only few
> >>>things changed in old OE-classic since then? :)
> >>>
> >>>Afaik: nobody plans to do another release from OE-classic and
> >>>oe-core/meta-oe/BSP's/... are veryclose to first release
> >>What repository is used for the BSP's ?
> >Each BSP in own repository - http://www.openembedded.org/wiki/LayerIndex
> >
> Does anybody know where the atmel boards are? (at91sam9263ek)

I guess Ulf has to do create it first.

Bye Henning


