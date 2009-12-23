Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NNNRx-0008VM-RL
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 10:24:14 +0100
Received: from [85.210.12.93] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NNNQ9-00016z-5F
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 09:22:17 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u5c91ae4mn1qzu@guohr-laptop-ubuntu>
References: <> <1261448680-12334-1-git-send-email-camelguo@gmail.com>
	<1261473949.28755.191.camel@lenovo.internal.reciva.com>
	<op.u5c91ae4mn1qzu@guohr-laptop-ubuntu>
Date: Wed, 23 Dec 2009 09:22:15 +0000
Message-ID: <1261560135.28755.207.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.12.93
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Modify distro/minimal.conf to use glibc and add an eglibc-based minimal distribution
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
X-List-Received-Date: Wed, 23 Dec 2009 09:24:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-12-23 at 09:21 +0800, Guo Hongruan wrote:
> No, it is not a bug. I just want to specify the libc type explicitly in  
> the distribution name.

This isn't what your patch does, though: it changes the "minimal" distro
from eglibc to glibc.  Are you saying that this isn't what you actually
wanted to do?

p.




