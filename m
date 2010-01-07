Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NSiGo-0002bP-IH
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 03:38:45 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2645D1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2010 02:34:07 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 Jan 2010 03:36:30 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <201001060507.31754.holger+oe@freyther.de>
	<hi31m7$hc3$1@ger.gmane.org> <4B451571.70305@balister.org>
In-Reply-To: <4B451571.70305@balister.org>
MIME-Version: 1.0
Message-Id: <201001070336.31081.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Thu, 07 Jan 2010 02:38:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 06 January 2010 23:57:53 Philip Balister wrote:
> On 01/06/2010 05:09 PM, Rolf Leggewie wrote:
> > Holger Hans Peter Freyther wrote:
> >> 	*) Does bitbake world work? If not it would be cool if someone could
> >> take a look?
> >
> > I was hoping for bitbake world to work as a QA tool.  But my efforts on
> > the world target didn't really receive a warm welcome.  By now world is
> > so utterly broken that bitbake won't even ever start to execute any
> > tasks (I killed bitbake after two days when it still did nothing the
> > last time I tried).
> 
> Can someone explain what bitbake world does?
> 
> I would be happier working toward a set of images building for a set of
> distributions.

It should try to build all providers...




