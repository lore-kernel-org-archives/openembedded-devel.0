Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>)
	id 1MG93q-0006as-AF; Mon, 15 Jun 2009 12:05:06 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1MG8tv-0001ls-ML; Mon, 15 Jun 2009 10:54:51 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>)
	id 1MG8tv-0007JE-Da; Mon, 15 Jun 2009 10:54:51 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1245053324.5971.0.camel@dax.rpnet.com>
References: <1244924378.29153.12.camel@lenovo.internal.reciva.com>
	<1245053324.5971.0.camel@dax.rpnet.com>
Date: Mon, 15 Jun 2009 10:54:50 +0100
Message-Id: <1245059690.21585.156.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Cc: openembedded-devel@openembedded.org,
	Jeremy =?ISO-8859-1?Q?Lain=E9?= <jeremy.laine@m4x.org>
Subject: Re: lib*.so in FILES_${PN}
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
X-List-Received-Date: Mon, 15 Jun 2009 10:05:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-15 at 09:08 +0100, Richard Purdie wrote:
> On Sat, 2009-06-13 at 21:19 +0100, Phil Blundell wrote:
> > I propose to revert the patch in question, and instead just let
> > procps.bb adjust its own local setting of FILES as necessary.
>
> Agreed, that shouldn't be a default.

Thanks to you and Leon for the feedback.  I've reverted that patch now.

p.




