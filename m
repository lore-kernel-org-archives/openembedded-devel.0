Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OUIwI-0002nV-S2
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 14:32:24 +0200
Received: from [123.192.240.117] (unknown [123.192.240.117])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 754581B10C09
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jul 2010 12:29:25 +0000 (UTC)
Message-ID: <4C2C89B7.6040709@freyther.de>
Date: Thu, 01 Jul 2010 20:27:35 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.4) Gecko/20100624 Fedora/3.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C2C5912.80308@jak.nl>
In-Reply-To: <4C2C5912.80308@jak.nl>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: meta-toolchain-qte produces toolchain with missing Qt include dirs
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
X-List-Received-Date: Thu, 01 Jul 2010 12:32:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/01/2010 05:00 PM, Arjan wrote:
> I'm trying to build the sdk as described in de OE manual.
> [http://docs.openembedded.org/usermanual/usermanual.html#id501110]
> I did not modify the qt4-embedded.inc or qt4.inc.
> The final sdk archive misses almost all the includes from de Qt
> framework (it only has qtopia/QtCore and qtopia/phonon) . But it does
> include the libs and binaries.
> 
> Is this expected behaviour or am I doing something wrong?

Well, if the example in the manual to build an application doesn't work,
then it is obviously broken...


