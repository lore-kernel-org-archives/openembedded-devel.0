Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N8OLi-0005g8-6v
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 02:19:49 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id E33EF1B10C04;
	Thu, 12 Nov 2009 01:29:16 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 02:17:46 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <hdfdoe$kj7$1@ger.gmane.org>
In-Reply-To: <hdfdoe$kj7$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200911120217.46744.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: Blackfin toolchain question
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
X-List-Received-Date: Thu, 12 Nov 2009 01:19:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 11 November 2009 23:27:26 Dmitry Eremin-Solenikov wrote:
> Hello,
> 
> I'm currently trying to restore/update blackfin toolchain. One of the major
>  problems I've stumbled upon are versioned scripts/export symbols.
>  Basically there are lot's of software starting from g++ itself that have
>  symbol versioning scripts. The problem is that blackfin arch prepends all
>  symbols with underscore, thus breaking all that scripts.


Do you have a link to the ABI? Isn't this underscore thingie defined by SystemV 
ABI?

z.


