Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYzta-0004jc-02
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 11:40:45 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 56EDB1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 10:37:18 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2010 11:38:01 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <n> <20100122222101.GC2074@gmail.com>
	<1264242681.10526.2.camel@becca>
In-Reply-To: <1264242681.10526.2.camel@becca>
MIME-Version: 1.0
Message-Id: <201001241138.01795.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] gpsd: Prepare recipe and inc for version bump
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
X-List-Received-Date: Sun, 24 Jan 2010 10:40:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 23 January 2010 11:31:21 Michael Lippautz wrote:

> -SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz \
> +SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=gpsd
> \

Hi,
your mailer has wrapped this line making it impossible to to apply the patch. 
It would be nice if you could send a final patch without line wrapping.

thanks a lot
	zecke


