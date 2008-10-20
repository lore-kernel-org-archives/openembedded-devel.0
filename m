Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Ks1pK-0006Dt-U9
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 22:58:11 +0200
Received: from 88-111-190-175.dynamic.dsl.as9105.com ([88.111.190.175]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Ks1os-0006QM-He
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 21:57:45 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48FCDCCD.4040704@dls.net>
References: <48FCDCCD.4040704@dls.net>
Date: Mon, 20 Oct 2008 21:57:27 +0100
Message-Id: <1224536247.4235.282.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: git-native?
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
X-List-Received-Date: Mon, 20 Oct 2008 20:58:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-10-20 at 14:32 -0500, Mike (mwester) wrote:
> Er, just a thought... but now that we've switched to git, should OE just
> globally ASSUME_PROVIDED for git-native?

I'm not sure what that would really buy you.  It would be a pain for
downstream OE users who might be getting the metadata through some other
means (rather than checking it out directly from the OE git tree), and
it doesn't really seem like it would bring any great benefit.
Individual users can obviously set ASSUME_PROVIDED for git-native if
they want and I guess they should continue to do that.

p.




