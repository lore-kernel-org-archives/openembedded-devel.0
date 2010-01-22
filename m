Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYEMu-0006gH-Jt
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 08:55:51 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 37E5B1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 07:52:16 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 08:53:13 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<hjan00$419$1@ger.gmane.org> <1264119214.7697.73.camel@utx.utx.cz>
In-Reply-To: <1264119214.7697.73.camel@utx.utx.cz>
MIME-Version: 1.0
Message-Id: <201001220853.13287.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Fri, 22 Jan 2010 07:55:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 22 January 2010 01:13:34 Stanislav Brabec wrote:

> Well, and OE probably has vulnerable software.
> 
> For example CVE-2008-1372 was present in bzip2 for more than a year:
> Full disclosure date: 10/17/2008
> Fixed in OE: 01/10/2010

Yupp... that was something that bothered me at Openmoko. I tried to talk 
Julian into writing a script to go through the debian security uploads and 
compare that with versions we have in OE...

yet another topic to take care of.
	z.


