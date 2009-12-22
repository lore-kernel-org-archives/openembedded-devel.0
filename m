Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NN16f-0006rQ-9w
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 10:32:44 +0100
Received: from [85.210.12.93] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NN14r-0001oE-8U
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 09:30:49 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1261448680-12334-1-git-send-email-camelguo@gmail.com>
References: <>  <1261448680-12334-1-git-send-email-camelguo@gmail.com>
Date: Tue, 22 Dec 2009 09:25:49 +0000
Message-ID: <1261473949.28755.191.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Tue, 22 Dec 2009 09:32:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2009-12-22 at 10:24 +0800, Guo Hongruan wrote:
> 1. conf/distro/minimal-eglibc.conf: add minimal distribution based on eglibc.
> 2. conf/distro/minimal.conf: use glibc instead of eglibc

What's the reason for this change?  If eglibc is deficient in some way
then I would prefer to either see it fixed, or just switch minimal back
to using glibc generically.  I am not sure that adding another distro
variant for this is a good idea.

p.




