Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mo3Gt-0005SK-Fb
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Sep 2009 00:46:46 +0200
Received: from tamarin.localnet (static.233.147.46.78.clients.your-server.de
	[78.46.147.233])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id E9E1E1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2009 22:52:23 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2009 00:45:41 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.1; i686; ; )
References: <20090910184949.GA31155@gmail.com>
In-Reply-To: <20090910184949.GA31155@gmail.com>
MIME-Version: 1.0
Message-Id: <200909170045.41167.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: GCC 4.4.1 test results on minimal-uclibc/ARM
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
X-List-Received-Date: Wed, 16 Sep 2009 22:46:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Thursday 10 September 2009 20:49:49 Khem Raj wrote:
> Hi
>
> Attached are the results of gcc 4.4.1 on thumb/uclibc/minimal
> combination.
>
> One common fail is due to fvisibility. I havent looked at finding
> the cause but otherwise the results are ok.
>
> Should we start using gcc 4.4.1 as default compiler for minimal distro ?


awesome, could you share your dejagnu setup?

z.


