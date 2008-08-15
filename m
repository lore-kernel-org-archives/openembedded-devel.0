Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1KTuAO-0002z0-IL; Fri, 15 Aug 2008 09:56:12 +0200
Received: from 88-111-45-211.dynamic.dsl.as9105.com ([88.111.45.211]
	helo=[192.168.2.156])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1KTu9g-0004TU-El; Fri, 15 Aug 2008 08:55:28 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90808150041s52abeb55m4bad75bcb03abd75@mail.gmail.com>
References: <19c1b8a90808150041s52abeb55m4bad75bcb03abd75@mail.gmail.com>
Date: Fri, 15 Aug 2008 08:56:13 +0100
Message-Id: <1218786973.10360.43.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 
Cc: openembedded-devel@openembedded.org
Subject: Re: Disable objc for arm uclibc
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
X-List-Received-Date: Fri, 15 Aug 2008 07:56:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-08-15 at 00:41 -0700, Khem Raj wrote:
> Hi
> 
> I am hitting a build issue while building gcc 4.2.4 for arm uclibc.
> This patch disables objc selectively only for arm uclibc and avr
> change is also merged in.

What's the issue?  I can't think of any fundamental reason why ObjC
shouldn't be able to work with uclibc.  It would be nice to fix it
rather than just turning it off.

p.



