Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <dp@xora.org.uk>) id 1HZ7VM-0004pK-UE
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2007 17:34:36 +0200
Received: from gg-desktop.local ([::ffff:87.246.78.27])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,128bits,RC4-MD5)
	by xora.org.uk with esmtp; Wed, 04 Apr 2007 16:34:18 +0100
	id 0000400D.4613C57A.000036F9
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <003901c776cd$5c3c56e0$6e01a8c0@twilight>
References: <151901c775b6$2c86fc10$6e01a8c0@twilight>
	<200704031117.07726.openembedded@hrw.one.pl>
	<003901c776cd$5c3c56e0$6e01a8c0@twilight>
Date: Wed, 04 Apr 2007 16:32:32 +0100
Message-Id: <1175700752.16088.8.camel@gg-desktop.wolfsonmicro.main>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Subject: Re: Busybox 1.5.0 available for testing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Apr 2007 15:34:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

On Wed, 2007-04-04 at 10:24 -0500, Mike (mwester) wrote:
> I very much like Mark's idea (below) -- any comments from other busybox
> projects?
> I can step up to audit the set of patches required for SlugOS.  Anyone else
> interested in such a cleanup?
> 
What about the other side of the coin, what do we plan to do with
busybox?

There are a whole load of initscripts/utility scripts in OE that dont
work with busybox. And due to the fact things like busybox ps are
totally incompatible with other ps implementations its impossible to
sensibly make things work with both. Angstrom pulls in a few real utils
for this reason.

XorA (Graeme)




