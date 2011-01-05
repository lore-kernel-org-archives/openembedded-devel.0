Received: from mail.reciva.com ([62.7.80.110] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PaVH1-0006f1-9G
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 16:27:39 +0100
Received: from [192.168.106.10] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PaV1O-0008MA-5X
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 15:11:33 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1PaV1N-00006h-VL
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 15:11:30 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1294238916100625500@rkmorris.us>
References: <1294198349769396500@rkmorris.us> <ig1b7c$j8n$1@dough.gmane.org>
	<1294238916100625500@rkmorris.us>
Date: Wed, 05 Jan 2011 15:11:29 +0000
Message-ID: <1294240289.4307.15.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-Broken-Reverse-DNS: no host name found for IP address 192.168.106.10
Subject: Re: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Wed, 05 Jan 2011 15:27:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-01-05 at 08:48 -0600, Russell Morris wrote:
> Just to confirm - have you run these on an armv4t target? Only asking because my build completes fine, but the executables don't seem to run on the target.

What exactly happens when you try to run those executables?  Have you
inspected them to see if they look like the right kind of thing, and/or
compared them to working ones?

p.




