Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MOXws-0006NP-R3
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jul 2009 16:16:39 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MOXkY-0004Rj-Ci
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jul 2009 15:03:54 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MOXkV-0006vy-I2
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jul 2009 15:03:51 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1247034015.4669.25.camel@opal>
References: <200907021504.13248.holger+oe@freyther.de>
	<1247034015.4669.25.camel@opal>
Date: Wed, 08 Jul 2009 15:03:50 +0100
Message-Id: <1247061830.23305.25.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: Questions regarding DISTRO = "minimal"
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
X-List-Received-Date: Wed, 08 Jul 2009 14:16:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-07-08 at 08:20 +0200, Michael 'Mickey' Lauer wrote:
> The question now is how do we move from here? We could rename minimal
> back to generic -- in fact that's what it was for right from the start.

Yes, I think that'd be a good idea.  Or "vanilla" :-)

> Whatever we decide on, it's important that we do not rely on one
> distro to rule them all -- this will inevitably lower the metadata
> quality hence the usability of OE.

Agreed, certainly.

p.




