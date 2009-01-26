Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1LRP9V-0003c7-C7
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 11:57:13 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1LRP2B-0005wS-Qj
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 10:49:39 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1LRP2A-00037i-D3
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 10:49:38 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <497D7E2A.8050302@gmail.com>
References: <497D7E2A.8050302@gmail.com>
Date: Mon, 26 Jan 2009 10:49:37 +0000
Message-Id: <1232966977.23807.3.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Building for i486 based non-FPU device
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
X-List-Received-Date: Mon, 26 Jan 2009 10:57:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-01-26 at 10:11 +0100, Marco Cavallini wrote:
> DISTRO = "angstrom-2008.1"

It might be worth trying with "minimal" to start with, just to eliminate
any angstrom-related uncertainties.

> i486-generic uses TARGET_ARCH = "i486" : build broken
> 
> No one of the previous tested build give a useful result,
> what could I change to get a running system?

It's hard to say what you need to change without knowing what exactly is
going wrong.  Can you give more details of the breakage that you
encountered?  What image were you trying to build, what package(s)
failed, and what were the errors?

p.




