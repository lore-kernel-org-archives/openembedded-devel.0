Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1QpMMk-0000XS-76
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 17:31:14 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E0D3A110009C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:18:45 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EF32D1100003
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225074059.adsl.alicedsl.de
	[92.225.74.59]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:18:44 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 68DDC3C155; Fri,  5 Aug 2011 17:17:27 +0200 (CEST)
Date: Fri, 5 Aug 2011 17:17:27 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110805151726.GB15632@rhein.zuhause.netz>
References: <CAFu+nvEwf_hPbB0a21qJFWAHZqdCkb3MPaKaZcLFgD+xc7cGVw@mail.gmail.com>
	<4E15F6DD.2020308@mentor.com> <1312553761.14079.22.camel@jjg-linux>
	<CAFu+nvE3v+VswNB-3ZwF3dFMa42wgeSv6GMBJ4C=bYNpWKKFmw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFu+nvE3v+VswNB-3ZwF3dFMa42wgeSv6GMBJ4C=bYNpWKKFmw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: classpath in 2011.03-maintenance
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
X-List-Received-Date: Fri, 05 Aug 2011 15:31:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

we made some hacks bescause for some java packages javac fails at random and
we just try to recompile it for some rounds and have a higher chance to
get it done. To admit the ecj script is now diffrent from the one I wrote original,
maybee Stefan Schmidt made some more tweaks.

As side note we did not test classpath compiling for target architecture,
we only made sure classpath-native works, so we can compile openjdk
for the target.

Bye Henning


