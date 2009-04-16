Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LuZLC-0004WC-FN
	for openembedded-devel@openembedded.org; Thu, 16 Apr 2009 23:41:52 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090416213752.NREO16134.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>;
	Thu, 16 Apr 2009 17:37:52 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id gMds1b0064dMFYL04MdsDu; Thu, 16 Apr 2009 17:37:52 -0400
X-Authority-Analysis: v=1.0 c=1 a=jPlMlblrO3oA:10 a=ywbLZgbN88kA:10
	a=ErWU23JnqNEAOLzs2TIA:9 a=j1Hd4GMVbwqh3JlrSbcA:7
	a=h_s6l14gB-VVk_SgbCPos9VyvpwA:4
X-CM-Score: 0.00
Date: Thu, 16 Apr 2009 14:37:52 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: David Huggins-Daines <dhuggins@cs.cmu.edu>
Message-ID: <20090416213751.GO17629@smtp.west.cox.net>
References: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
	<20090416205928.GM17629@smtp.west.cox.net>
	<49E79C96.5000307@cs.cmu.edu>
MIME-Version: 1.0
In-Reply-To: <49E79C96.5000307@cs.cmu.edu>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.42
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
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
X-List-Received-Date: Thu, 16 Apr 2009 21:41:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2009 at 05:01:10PM -0400, David Huggins-Daines wrote:
> Tom Rini wrote:
>>
>> I _think_ this is OK.  I'm iffy at best on if opkg will actually work in
>> Windows, but otherwise, yeah.  I'm going to go kick a build or two prior
>> to both of these patches then put 'em in and see what happens.
>>   
> Yeah, actually I have my doubts about it too. I haven't tried.
>
> Of course this doesn't preclude a Canadian SDK for some other host  
> machine where it would work...

True.  Still looking for someone to give that a shot :)

-- 
Tom Rini


