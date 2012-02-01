Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RsZsn-0002Kz-8R
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 14:05:53 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7B7AE22325A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2012 13:58:00 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BA7F222325A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2012 13:57:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225005177.adsl.alicedsl.de
	[92.225.5.177]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Feb 2012 13:57:59 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 568733C4B3; Wed,  1 Feb 2012 13:57:58 +0100 (CET)
Date: Wed, 1 Feb 2012 13:57:58 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120201125758.GA21529@mail.familie-heinold.de>
References: <CADZ6=asn5Tq6adpuysW229BYXDu3ExUVNDWEZtzpjyAUv9PHgQ@mail.gmail.com>
	<CADZ6=avk8ekCLnXv=wbYwhcYzHpyN9mR2mctUNW4hxFfGJZ5Ug@mail.gmail.com>
	<20120131170206.GA27750@mi.fu-berlin.de>
	<CADZ6=avTDaSvO4-aMwgJ4OyYtAKt_Ru2eVEbae_LtW6re6uyxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADZ6=avTDaSvO4-aMwgJ4OyYtAKt_Ru2eVEbae_LtW6re6uyxQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java][PATCH] llvm-config: Work around shebang max length issue
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
X-List-Received-Date: Wed, 01 Feb 2012 13:05:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 01, 2012 at 09:26:23AM +0100, Thilo Fromm wrote:
> Hello Henning,
> 
> >> > This patch works around a max shebang length issue
> >> > in llvm's llvm-config.
> >>
> >> Some feedback on the patch would be great.
> >>
> >
> > I am a bit short of time at the moment. So I can not test or apply your patch.
> > For the longer term llvm should go to core.
> >
> 
> Okay. We'll maintain this patch in our HidaV layer (which is
> https://github.com/DFE/HidaV) for the time being.
> 
> Regards,
> Thilo

btw. you can make a pull request.

Bye Henning


