Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KqNeO-0007wL-Gi
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Oct 2008 09:52:04 +0200
Received: from 88-111-190-175.dynamic.dsl.as9105.com ([88.111.190.175]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KqNZK-000897-E5
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Oct 2008 08:46:51 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810160043.08202.zecke@selfish.org>
References: <200810151022.38477.zecke@selfish.org>
	<200810152153.52020.zecke@selfish.org> <gd5i1h$frs$1@ger.gmane.org>
	<200810160043.08202.zecke@selfish.org>
Date: Thu, 16 Oct 2008 08:46:49 +0100
Message-Id: <1224143209.4235.129.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Thu, 16 Oct 2008 07:52:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-10-16 at 00:43 +0200, Holger Freyther wrote:
> Wow, I had to read that a couple of times. In Linux terms I would have to add  
> a S-O-B to the commit. If it goes through your hands you add your S-O-B as 
> well, if you just review and like the patch you ack?
> 
> yes, the policy needs update... and I will sleep now

I really don't think that we need to get into "Signed-off-by" and the
like.  That sort of process has some value for the kernel people because
they often have a lengthy chain of merge responsibility between the
originator of a given patch and the person who ultimately commits it
into the master tree.  Also, they are maintaining what is essentially a
single, coherent work for copyright purposes and hence they need to be
at least slightly careful about tracking ownership of IP rights.

Neither of these considerations really applies to the OE metadata
repository in its current form, and it's not clear what would be gained
by using or requiring this kind of signoff procedure.

p.




