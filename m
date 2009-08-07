Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MZZ1G-0005pE-HI
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Aug 2009 01:38:42 +0200
Received: from tamarin.localnet (unknown [211.40.35.79])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 6AF051B10C06
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2009 23:25:40 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 8 Aug 2009 01:22:23 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1249645320-4423-1-git-send-email-ihar.hrachyshka@gmail.com>
	<200908080103.19400.holger+oe@freyther.de>
In-Reply-To: <200908080103.19400.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200908080122.23740.holger+oe@freyther.de>
Subject: Re: [PATCH] Added rcc (resource compiler) utility setup for QTE toolchain environment.
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
X-List-Received-Date: Fri, 07 Aug 2009 23:38:42 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 08 August 2009 01:03:19 Holger Hans Peter Freyther wrote:

> Hey,
>
> while you are at it the following is still missing:
> 	export OE_QMAKE_UIC3=
> 	export OE_QMAKE_QDBUSCPP2XML=
> 	export OE_QMAKE_QDBUSXML2CPP=
>

and while we are at it. Is the QMAKESPEC setup correctly too? E.g. is the 
linux-gnueabi-g++ installed qt4-tools-sdk?


