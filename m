Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KW66C-0004FH-3i; Thu, 21 Aug 2008 11:04:56 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KW653-0001ky-Mv; Thu, 21 Aug 2008 10:03:46 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1KW653-000881-IU; Thu, 21 Aug 2008 10:03:45 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90808200142y33c5baa3uee2398d7f87b4cc6@mail.gmail.com>
References: <19c1b8a90808200142y33c5baa3uee2398d7f87b4cc6@mail.gmail.com>
Date: Thu, 21 Aug 2008 10:03:45 +0100
Message-Id: <1219309425.21890.1.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: uclibc and uclibc-locale support in gcc 4.3.1
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
X-List-Received-Date: Thu, 21 Aug 2008 09:04:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-08-20 at 01:42 -0700, Khem Raj wrote:
> 4. Disable libobjc for arm uclibc. If someone really needs some
> packages on uclibc which need objc support then you better fix gcc
> first :)

Actually you seem to be disabling both libobjc and the Objective-C
compiler itself for all uclibc systems, not just ARM.  Is that what you
wanted?

p.




