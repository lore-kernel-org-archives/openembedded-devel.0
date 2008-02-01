Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JL0Ar-00063k-EY
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Feb 2008 18:59:37 +0100
Received: by ug-out-1314.google.com with SMTP id i24so797947ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Feb 2008 09:59:46 -0800 (PST)
Received: by 10.67.30.6 with SMTP id h6mr5756113ugj.6.1201888783498;
	Fri, 01 Feb 2008 09:59:43 -0800 (PST)
Received: from widy.localdomain ( [88.231.86.1])
	by mx.google.com with ESMTPS id k1sm12055172ugf.29.2008.02.01.09.59.41
	(version=SSLv3 cipher=OTHER); Fri, 01 Feb 2008 09:59:42 -0800 (PST)
Date: Fri, 1 Feb 2008 20:12:12 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20080201201212.2e08a5c2@widy.localdomain>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev gcc-native-3.4.4: Add PROVIDES gcc-native3
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
X-List-Received-Date: Fri, 01 Feb 2008 17:59:37 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

> On Thu, 2008-01-31 at 14:17 +0200, Paul Sokolovsky wrote:
> > On Tue, 29 Jan 2008 12:07:32 +0000
> > Richard Purdie <rpurdie at rpsys.net> wrote:
> > 
> > []
> > > 
> > > To be honest I'm more worried about getting the functionality
> > > right and getting rid of the gcc 3.x barrier to entry once and
> > > for all.
> > > 
> > > If you want to do a s/gcc-native3/gcc3-native/, please feel free.
> > 
> > Done. Just if we want to clean up OE, worth paying attention even to
> > such small things in new stuff going in.
> 
> You didn't change all the references though, hence breaking the user
> experience :(
> 
> I'll fix it...

Sorry, I intended to run grep -r on the entire tree, but apparently
missed that. Thanks for fixing that.

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


