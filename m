Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Oa46V-0007tR-MR
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 11:55:21 +0200
Received: from [192.168.100.100] (unknown [188.46.225.131])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 4F2D11B10C09
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 09:57:42 +0000 (UTC)
Message-ID: <4C417DD7.2050500@freyther.de>
Date: Sat, 17 Jul 2010 17:54:31 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.4) Gecko/20100624 Fedora/3.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikz0uYCp5hmrW1tT2AoQE0iwzfHFd33O0Y9zSF1@mail.gmail.com>
In-Reply-To: <AANLkTikz0uYCp5hmrW1tT2AoQE0iwzfHFd33O0Y9zSF1@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Udev not creating mtdblock**
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
X-List-Received-Date: Sat, 17 Jul 2010 09:55:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/17/2010 01:14 AM, John Tobias wrote:
> Hi,
> 
> The udev is not working correctly on my beagleboard, it doesn't create
> a device node for mtdblock and loop. Is there any quick fix on these
> problem?.

Is your kernel detecting the mtdblock at all? Do you have loop in loaded
as well?


