Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MFl6Y-0002Gm-Mr
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jun 2009 10:30:18 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MFkwm-0004Pm-Pf
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jun 2009 09:20:13 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <64d5b90a0906132251l51316419nb38733dfc1e49004@mail.gmail.com>
References: <64d5b90a0906132251l51316419nb38733dfc1e49004@mail.gmail.com>
Date: Sun, 14 Jun 2009 09:20:11 +0100
Message-Id: <1244967611.29153.21.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: OpenSSL recipe : files not being shipped in any package
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
X-List-Received-Date: Sun, 14 Jun 2009 08:30:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-06-14 at 11:21 +0530, Kirtika Ruchandani wrote:
> NOTE: package openssl-0.9.8j-r2: task do_package: started
> NOTE: the following files were installed but not shipped in any package:
> NOTE:   /usr/lib/ssl/openssl.cnf
> NOTE:   /usr/lib/ssl/misc/CA.sh
> NOTE:   /usr/lib/ssl/misc/CA.pl
> NOTE: package openssl-0.9.8j-r2: task do_package: completed
> 
> Are these files deliberately excluded ?

No, it's probably a bug.  Want to send a patch?

p.




