Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Oa45w-0007UE-S1
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 11:54:10 +0200
Received: from [192.168.100.100] (unknown [188.46.225.131])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id C742B1B10C09
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 09:56:57 +0000 (UTC)
Message-ID: <4C417DA8.8050101@freyther.de>
Date: Sat, 17 Jul 2010 17:53:44 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.4) Gecko/20100624 Fedora/3.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimwFjLODTbT6WEEhthhjwYMiMQ4nt5RtXniNgZb@mail.gmail.com>
In-Reply-To: <AANLkTimwFjLODTbT6WEEhthhjwYMiMQ4nt5RtXniNgZb@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: spca5xx does not build
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
X-List-Received-Date: Sat, 17 Jul 2010 09:54:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


> | make[1]: Entering directory
> `/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/kernel'
> | scripts/Makefile.build:49: *** CFLAGS was changed in
> "/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/spca5xx-20060501-r81/spca5xx-20060501/Makefile".
> Fix it to use EXTRA_CFLAGS.  Stop.
> 


