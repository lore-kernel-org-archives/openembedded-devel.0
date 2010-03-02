Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NmR6S-0003aQ-BV
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 13:21:32 +0100
Received: from tamarin.localnet (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 5A8211B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Mar 2010 12:20:40 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 2 Mar 2010 13:18:20 +0100
User-Agent: KMail/1.13.0 (Linux/2.6.33-rc8; KDE/4.4.0; i686; ; )
References: <4B8C53D1.2020000@mlbassoc.com>
In-Reply-To: <4B8C53D1.2020000@mlbassoc.com>
MIME-Version: 1.0
Message-Id: <201003021318.20766.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ICU on mixed endian setup
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
X-List-Received-Date: Tue, 02 Mar 2010 12:21:33 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 02 March 2010 00:54:57 Gary Thomas wrote:
> I'm trying to use ICU on a big endian target, building on a
> little endian host.  The data files don't seem to be generated
> for the target's endian mode.
> 
> Is this correct?
> Does anyone have experience with this?  Should it work?

Probably not. I added ICU and only tested little on little... :}

z.


