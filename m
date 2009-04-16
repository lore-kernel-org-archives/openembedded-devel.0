Received: from [128.2.201.117] (helo=chokecherry.srv.cs.cmu.edu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LuYlf-0006jf-DT
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 23:05:12 +0200
Received: from [128.2.222.132] (LIMA-2.SPEECH.CS.CMU.EDU [128.2.222.132])
	by chokecherry.srv.cs.cmu.edu (8.13.6/8.13.6) with ESMTP id
	n3GL1AsH002270; Thu, 16 Apr 2009 17:01:10 -0400 (EDT)
Message-ID: <49E79C96.5000307@cs.cmu.edu>
Date: Thu, 16 Apr 2009 17:01:10 -0400
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: Tom Rini <trini@kernel.crashing.org>
References: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
	<20090416205928.GM17629@smtp.west.cox.net>
In-Reply-To: <20090416205928.GM17629@smtp.west.cox.net>
X-Scanned-By: mimedefang-cmuscs on 128.2.201.117
X-SA-Exim-Connect-IP: 128.2.201.117
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] update canadian-sdk to match meta-toolchain
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
X-List-Received-Date: Thu, 16 Apr 2009 21:05:12 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
>
> I _think_ this is OK.  I'm iffy at best on if opkg will actually work in
> Windows, but otherwise, yeah.  I'm going to go kick a build or two prior
> to both of these patches then put 'em in and see what happens.
>   
Yeah, actually I have my doubts about it too. I haven't tried.

Of course this doesn't preclude a Canadian SDK for some other host 
machine where it would work...


