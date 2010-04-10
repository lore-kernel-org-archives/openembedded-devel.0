Received: from smtp-out116.alice.it ([85.37.17.116])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1O0aMo-0002ZK-TE
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Apr 2010 15:04:55 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out116.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 10 Apr 2010 15:01:28 +0200
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 10 Apr 2010 15:01:17 +0200
Received: from [192.168.1.116] ([79.54.158.137]) by FBCMCL01B01.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 10 Apr 2010 15:01:19 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <n2ue96fffc41004082246g4269c2d2nd6aa9f3e7260db27@mail.gmail.com>
References: <n2ue96fffc41004082246g4269c2d2nd6aa9f3e7260db27@mail.gmail.com>
Date: Sat, 10 Apr 2010 15:01:16 +0200
Message-ID: <1270904476.2579.0.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 10 Apr 2010 13:01:19.0709 (UTC)
	FILETIME=[E9CF28D0:01CAD8AD]
X-SA-Exim-Connect-IP: 85.37.17.116
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Initial work on an Android SDK via openembedded
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
X-List-Received-Date: Sat, 10 Apr 2010 13:04:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-04-09 at 15:46 +1000, Angus Lees wrote:
> Just an FYI:
> 
> I put together an alternative Android NDK using Openembedded:
>  git://github.com/anguslees/openembedded-android.git
> 
> It currently uses the prebuilt Android libc (bionic) and various tools
> from the Google Android NDK/SDK, but builds gcc, etc from Openembedded
> source.  I expect to expand it to build the other pieces from source
> eventually.  I had to patch the gcc and other recipies a little, which
> is why it's a git branch rather than a self-contained bitbake
> collection.
> 
> This is my first-ever look at bitbake or openembedded, so apologies if
> any of the recipies are atrocious ;)
> 
> (Totally unsupported by Google.  I work for Google but don't work on
> anything to do with Android - I just happen to have an Android handset
> and a desire to write native apps for it in my free time)
> 
WOW!!! great!!!

Denis.




