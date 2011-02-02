Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Pkaem-0006yl-3R
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 12:13:55 +0100
Received: (qmail 8001 invoked from network); 2 Feb 2011 12:12:58 +0100
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 2 Feb 2011 12:12:58 +0100
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id wNb-EN5FfoS5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Feb 2011 12:12:55 +0100 (CET)
Received: (Qmail 7987 invoked from network); 2 Feb 2011 12:12:55 +0100
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 2 Feb 2011 11:12:55 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.72 #1
	(Debian)) id 1Pkadr-0003l6-KN
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Feb 2011 12:12:55 +0100
Date: Wed, 2 Feb 2011 12:12:55 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110202111255.GA12375@mi.fu-berlin.de>
References: <4D4929CB.6040009@dresearch.de> <4D492DBF.4020601@freyther.de>
MIME-Version: 1.0
In-Reply-To: <4D492DBF.4020601@freyther.de>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
Subject: Re: profiling howto?
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
X-List-Received-Date: Wed, 02 Feb 2011 11:13:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 02, 2011 at 11:11:11AM +0100, Holger Freyther wrote:
> On 02/02/2011 10:54 AM, Steffen Sledz wrote:
> > Has anybody some instructions/hints how to enable profiling support for selected libs and/or binaries in OE?
> 
> The best information is in the Poky Manual, search for oprofile,
> -fno-frame-pointer and such... I have also handed in a proposal at CELF to
> work on ARM oprofile backtrace support to not rely on framepointers.
> 

So what Holger really means is, that you normaly don't need to use the libc/gcc profiling options anymore.

Bye Henning


