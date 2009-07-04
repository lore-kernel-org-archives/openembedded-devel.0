Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MMzcZ-00055P-CD
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Jul 2009 09:25:15 +0200
Received: from 79-71-239-25.dynamic.dsl.as9105.com ([79.71.239.25]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MMzQj-0008Mm-JY
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Jul 2009 08:13:02 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <64d5b90a0907032223t749b13ffy95305639fcf3e654@mail.gmail.com>
References: <64d5b90a0907032223t749b13ffy95305639fcf3e654@mail.gmail.com>
Date: Sat, 04 Jul 2009 08:12:50 +0100
Message-Id: <1246691571.16040.20.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: (Possibly grave) error with Busybox recipe ?
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
X-List-Received-Date: Sat, 04 Jul 2009 07:25:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-07-04 at 10:53 +0530, Kirtika Ruchandani wrote:
> Hello,
> I was building an image for the beagleboard and happened to notice that the
> busybox recipe doesn't ship a whole lot of files under
> /busybox/bin,/busybox/sbin in any package.
> Details here: http://pastebin.com/f35154815
> 
> Am I mistaken somewhere, or is it a bug?

It's intentional that busybox doesn't ship most of those files.  Was
there a particular one that was causing you a problem?

p.




