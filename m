Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1PPpn3-0001nn-Iy
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 06:08:38 +0100
Received: from [192.168.0.124] (220-136-28-71.dynamic.hinet.net
	[220.136.28.71])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 4F9B91B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Dec 2010 05:12:08 +0000 (UTC)
Message-ID: <4CFDC0FA.8050402@freyther.de>
Date: Tue, 07 Dec 2010 06:07:06 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <00b101cb95c9$2809b100$781d1300$@net>
In-Reply-To: <00b101cb95c9$2809b100$781d1300$@net>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question on Qt4 Embedded
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
X-List-Received-Date: Tue, 07 Dec 2010 05:08:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/07/2010 05:42 AM, N Twerdochlib wrote:
> I am currently working with OE Gumstix and have not been able to change the
> config of qt4 embedded to reduce it size.  As anyone been able to
> successfully alter the config options for qt4 embedded under OE? 

You will need to change the recipe and pass the -qconfig option. What would be
your preferred way of handling this? I can help you with implementing that.

The second question would be why you want to change the size, do you have the
actual need or is it a pseudo requirement?



