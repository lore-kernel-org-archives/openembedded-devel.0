Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Oe96Y-0003Gt-1p
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 18:03:49 +0200
Received: from [192.168.2.139] (dsl-62-220-14-162.berlikomm.net
	[62.220.14.162])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 291D31B10C09
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 16:07:19 +0000 (UTC)
Message-ID: <4C5054C7.4080602@freyther.de>
Date: Thu, 29 Jul 2010 00:03:19 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.126.1280326040.17151.openembedded-devel@lists.openembedded.org>
	<4C504C00.8080207@tycoelectronics.com>
In-Reply-To: <4C504C00.8080207@tycoelectronics.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Qt4 recipe fix; fixes configure so compiler is detected properly, and QXMLPatterns gets built
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
X-List-Received-Date: Wed, 28 Jul 2010 16:03:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/28/2010 11:25 PM, Jay Snyder wrote:
> Please see this link for two files, a patch for the recipe, and also a new file:

> 
> http://home.comcast.net/~jay.snyder/Qt4-recipe-compiler-fix/Qt4-recipe-compiler-fix.patch

this patch removes the patch you want to add. Is that correct? Could you add
the "More Info" to the top of the patch as well? Could you also include the
failure you are seeing?

thanks


