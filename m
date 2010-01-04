Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NRn3W-000515-SK
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 14:33:13 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 916351B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2010 13:28:19 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 Jan 2010 14:30:48 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200912190854.11510.holger+oe@freyther.de>
	<201001041125.50618.holger+oe@freyther.de>
	<hhsg9u$fd3$1@ger.gmane.org>
In-Reply-To: <hhsg9u$fd3$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <201001041430.48305.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt4 GLES (once again)
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
X-List-Received-Date: Mon, 04 Jan 2010 13:33:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 04 January 2010 11:35:43 Koen Kooi wrote:
> On 04-01-10 11:25, Holger Hans Peter Freyther wrote:
> > For X11 we already have a PREFERRED_PROVIDER setting in place and don't
> > need to update.
> 
> Thats not quite true, only qt4x11 is defined, but we need qt4-x11-free.

Good point. Should we keep both? What about replacing all occurences of qt4-
x11-free with qt4x11? Or do you think it makes sense to make all of them 
provide qt4x11 and qt4-x11-free?

z

PS: Could you test the Embedded variant for now?


