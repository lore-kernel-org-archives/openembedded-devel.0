Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IGbUi-0005VR-H3
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 16:17:40 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id E1448146C364
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2007 16:15:38 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B1E063.7010407@dominion.kabel.utwente.nl>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>
	<1186061255.5972.243.camel@hammer.suse.cz>
	<46B1E063.7010407@dominion.kabel.utwente.nl>
Date: Thu, 02 Aug 2007 16:15:38 +0200
Message-Id: <1186064138.5972.259.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
Subject: Re: Gstreamer and rpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2007 14:17:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> > I see no problem here: For cross compilation OE compiles its own
> > compiler, which already supports --sysroot,
> 
> No. We have a gcc-cross_3.3.3.bb and 3.3.4

But Angstrom uses 4.1.2 as default, isn't it? And it compiles everything
correctly (except qemu).

oe:~> /OE/build/tmp/cross/arm-angstrom-linux-gnueabi/bin/gcc --version
gcc (GCC) 4.1.2

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



