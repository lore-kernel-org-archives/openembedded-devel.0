Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1STaoI-0002Mq-Pm
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 May 2012 17:34:14 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0B64B22325AD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2012 17:24:19 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7789022325AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2012 17:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g230116017.adsl.alicedsl.de
	[92.230.116.17]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2012 17:24:18 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id DCC813C4E9; Sun, 13 May 2012 17:24:11 +0200 (CEST)
Date: Sun, 13 May 2012 17:24:11 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120513152411.GA23800@rhein.zuhause.netz>
References: <CAC+thW2MuHaF_TG-zC1ed=k+LMtieowigBVh_cefdW90eEEpXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC+thW2MuHaF_TG-zC1ed=k+LMtieowigBVh_cefdW90eEEpXQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: meta-java: adding support for gradle build tool and gradle based recipes
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
X-List-Received-Date: Sun, 13 May 2012 15:34:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 12, 2012 at 05:13:42PM +0200, Andrea Galbusera wrote:
> Hello,
> 
> 3. Could it be a reasonable approach to temporarily use a host build
> of gradle as a jump start for building final libs and tools? If so,
> what will be the required setup to instruct other recipes for using
> the host version of gradle. I know this is evil, but I expect more
> trouble in building gradle than gradle based recipes. Of course, this
> might be a completely wrong perception! ;-)
> 

I never used gradle so I can not help on the build system.

If there is no other way try to use binaries wrapped in tar or what
ever and just unpack them to staging.


Bye Henning


