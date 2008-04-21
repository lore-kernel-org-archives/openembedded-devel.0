Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1JntOb-0007yC-Rn
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Apr 2008 12:37:13 +0200
Received: by nf-out-0910.google.com with SMTP id h3so1323942nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2008 03:37:02 -0700 (PDT)
Received: by 10.78.138.6 with SMTP id l6mr5912177hud.71.1208774221916;
	Mon, 21 Apr 2008 03:37:01 -0700 (PDT)
Received: by 10.78.161.14 with HTTP; Mon, 21 Apr 2008 03:37:01 -0700 (PDT)
Message-ID: <35a670560804210337x73d63394t3e6b4feb0ee5118e@mail.gmail.com>
Date: Mon, 21 Apr 2008 12:37:01 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <480596E2.7030906@gmx.net>
MIME-Version: 1.0
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>
	<47FE2530.2@gmx.net>
	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
	<4800DC3B.9080007@gmx.net>
	<35a670560804140932s53231dcj1adfa6bc21e0353e@mail.gmail.com>
	<35a670560804150810k603d1986t4e02eefa7f411728@mail.gmail.com>
	<480596E2.7030906@gmx.net>
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
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
X-List-Received-Date: Mon, 21 Apr 2008 10:37:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Bad luck: my GCC/GCJ build seems flawless, but the filesystem I
generated with it fails to run a Java Hello World :(
It fails with a "terminate called without an active exception" before
doing anything.

I'll try to debug this, but I fear that I'll have to get this test
based on GCC 4.3 before I can get any real support from the gcc-java
mailing list...

Regards,
Matthijs


