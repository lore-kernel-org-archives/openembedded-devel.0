Received: from [64.233.184.227] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <tomcooksey@googlemail.com>) id 1Hv86r-0000M3-PD
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2007 10:40:18 +0200
Received: by wr-out-0506.google.com with SMTP id i20so688392wra
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2007 01:38:09 -0700 (PDT)
Received: by 10.142.254.8 with SMTP id b8mr207037wfi.1180946288746;
	Mon, 04 Jun 2007 01:38:08 -0700 (PDT)
Received: by 10.143.36.19 with HTTP; Mon, 4 Jun 2007 01:38:08 -0700 (PDT)
Message-ID: <eed7f0160706040138y6a777b6ay86b8237c3462373c@mail.gmail.com>
Date: Mon, 4 Jun 2007 09:38:08 +0100
From: "Tom Cooksey" <tomcooksey@googlemail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Jun 2007 11:18:08 +0200
Subject: Gumstix machine support
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
X-List-Received-Date: Mon, 04 Jun 2007 08:40:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Over the last few months I've been looking for an alternative to
buildroot for the gumstix devices (www.gumstix.com). After giving up
on Gentoo, I thought I'd have a go with OpenEmbedded. After reading
through the documentation I realized what I needed to do was create a
gumstix.conf in conf/machine, only to find one already there!

So my question is, how far along is gumstix support in OE and is it
being supported/maintained? I've had a good look through the
gumstix.conf which is there and it all looks right (although I'm an
uber OE newbie at the moment!)

Finally, the bitbake manual seems to neglect to mention the "?="
operator in chapter 2. A kind chap on irc confirmed that ?= assigns a
value to a variable if one has not already been set. I assume this is
a := assignment, otherwise it would get confused if there were more
than two ?= for a single variable?


Cheers,

Tom


