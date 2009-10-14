Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1My1AK-0004p1-Kl
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 12:33:11 +0200
Received: from 88-109-185-146.dynamic.dsl.as9105.com ([88.109.185.146]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1My19S-0008PR-Up
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 11:32:15 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AD59AF2.50003@dresearch.de>
References: <4AD59AF2.50003@dresearch.de>
Date: Wed, 14 Oct 2009 11:32:11 +0100
Message-Id: <1255516331.9214.327.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Wed, 14 Oct 2009 10:33:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-10-14 at 11:33 +0200, Steffen Sledz wrote:
> Since a few days a clean build of glibc_2.9 failed for hipox machine
> (armv5te) with this error (details see attached logfile):
> 
> | ../ports/sysdeps/arm/eabi/setjmp.S: Assembler messages:
> | ../ports/sysdeps/arm/eabi/setjmp.S:45: Error: internal_relocation
> (type: OFFSET_IMM) not fixed up
> 
> Sorry, but i've no idea what the problem is and which commit is
> responsible for it. Any ideas?

What does the offending line of code look like?

p.




