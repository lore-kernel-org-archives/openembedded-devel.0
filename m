Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nr85j-0005sT-7x
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 12:04:11 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 6E8681B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 11:04:11 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 12:00:28 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <201003150605.03085.holger+oe@freyther.de>
	<hnl2sg$ar6$1@dough.gmane.org>
In-Reply-To: <hnl2sg$ar6$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201003151200.28221.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for help to address known security issues
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
X-List-Received-Date: Mon, 15 Mar 2010 11:04:11 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 March 2010 11:41:20 Koen Kooi wrote:
> On 15-03-10 06:05, Holger Hans Peter Freyther wrote:
> > Hi all,
> > 
> > the following OE packages seem to be vulnerable to known security issues
> > and I would like to get some help in updating these....
> > 
> > wget 1.9.1: http://www.FreeBSD.org/ports/portaudit/06f142ff-4df3-11d9-
> > a9e7-0001020eed82.html
> 
> Wget 1.11.x is in OE already, should be schedule 1.9.x for deletion?

yes, but we default to 1.9.x. If you could make angstrom use 1.11 or remove 
the default preference of -1 from the wget recipe that would be awesome.


