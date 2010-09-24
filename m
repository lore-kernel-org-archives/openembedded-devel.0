Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OzFoR-00008V-Mb
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 23:28:14 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id CD88F1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 21:30:56 +0000 (UTC)
Message-ID: <4C9D17E4.2010301@freyther.de>
Date: Sat, 25 Sep 2010 05:28:04 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100908 Fedora/3.1.3-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C9D1136.2070507@freyther.de>
	<AANLkTikuhnp4XgiTR8F_FhsZ5Q=naANKRdk8OdX6vQUR@mail.gmail.com>
In-Reply-To: <AANLkTikuhnp4XgiTR8F_FhsZ5Q=naANKRdk8OdX6vQUR@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Qt and detecting iWMMXT
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
X-List-Received-Date: Fri, 24 Sep 2010 21:28:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/25/2010 05:06 AM, Frans Meulenbroeks wrote:

> 
> Is this something which is xscale specific
> or is it armv5te specific ?

It is a Co-Processor from Intel, it is only available in the Marvel SoC
(PXA270, PXA3x... maybe the 168 series as well).


