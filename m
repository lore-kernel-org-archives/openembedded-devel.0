Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NrCfj-00040U-RI
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 16:57:45 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id F2ACE1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 15:57:40 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 16:53:55 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <201003081300.19058.holger+oe@freyther.de>
	<201003151538.10288.holger+oe@freyther.de>
	<ac9c93b11003150758m4c3a4c77gfa84a47ced1c86c3@mail.gmail.com>
In-Reply-To: <ac9c93b11003150758m4c3a4c77gfa84a47ced1c86c3@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003151653.56095.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 15:57:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 March 2010 15:58:17 Frans Meulenbroeks wrote:

> > See. This is not the point of liking or not liking a given recipe. I
> > don't like the fact that this recipe is not maintained for years and has
> > the possibility of damaging the reputation of distros built with OE. I
> > assume even users of SlugOS do not like if their device gets owned via
> > known and circulating exploits?
> 
> I think the chances are small that anyone would put a slug on the open
> internet.

Well, at least here in Taiwan people get a pool of public IP addresses and 
everything behind the main switch of a flat has a public address.


> Note that this might go a lot further than you think.
> It also means keeping things like php, python and perl up to date as
> people could exploit bugs in php code or cgi scripts.

Yes, I upgraded php5, python didn't need an upgrade, perl is going to be 
upgraded...  It is not like that I'm asking to create a security team and do 
code audits... All I ask for is to go to here[1] and update software in time. 
It is not like we need to update stuff every day... if we as a community can't 
do something as simple as that people should use stuff from people that can do 
that.

[1] http://www.vuxml.org/freebsd/index.html


