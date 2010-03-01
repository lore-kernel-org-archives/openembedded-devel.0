Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NmDdW-0002Ly-L1
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:58:46 +0100
Received: from tamarin.localnet (static.233.147.46.78.clients.your-server.de
	[78.46.147.233])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2B5A21B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Mar 2010 21:57:52 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 1 Mar 2010 22:55:35 +0100
User-Agent: KMail/1.13.0 (Linux/2.6.33-rc8; KDE/4.4.0; i686; ; )
References: <E1Nm0HI-0004Qt-Pn@melo.openembedded.org>
	<d1b08f941003011337i15e21dcx340cef502c2ea151@mail.gmail.com>
In-Reply-To: <d1b08f941003011337i15e21dcx340cef502c2ea151@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003012255.35738.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Koen Kooi : angstrom: sync pango and pango-native versions
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
X-List-Received-Date: Mon, 01 Mar 2010 21:58:47 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 01 March 2010 22:37:23 Andrea Adami wrote:
> Thx, but after this patch I see
> 
> NOTE: preferred version 1.24.4 of pango-native not available (for item
> pango-module-basic-x)
> NOTE: preferred version 1.24.4 of pango-native not available (for item
> pango-module-basic-fc)
> NOTE: preferred version 1.24.4 of pango-native not available (for item
> pango-native)

mea culpa, I asked koen to bump it.. and he blindly did. The fix should be to 
add a pango-native of that version.

z.


