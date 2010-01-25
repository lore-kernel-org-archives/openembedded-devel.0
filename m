Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NZLp7-0006Uj-0K
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 11:05:36 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 37A8D1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 10:02:12 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jan 2010 11:02:50 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <4B56384B.10402@irobot.com>
	<19c1b8a91001211447w4892750et4414587220a70e4b@mail.gmail.com>
	<4B5A333D.2090400@irobot.com>
In-Reply-To: <4B5A333D.2090400@irobot.com>
MIME-Version: 1.0
Message-Id: <201001251102.50572.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] added new recipe for olsrd_0.5.6-r8
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
X-List-Received-Date: Mon, 25 Jan 2010 10:05:36 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Saturday 23 January 2010 00:22:37 Adam Wozniak wrote:
> Sorry, I've tried and tried, but I can't get send-email to work (network
> config settings which are completely out of my control).  Please try
> this attachment.
> 

The upstream version number of "olsrd_0.5.6-r8" is a bit unfortunate. Is that 
revision or release candidate 8? This also means that the generated OE package 
will be something like olsrd-0.5.6-r8-rX".

In case it is the release version it is probably fine but just a little bit 
awkward, in case of rc we would have a small problem.


