Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MW4Pq-0001iD-1v
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2009 10:21:38 +0200
Received: from 79-79-178-204.dynamic.dsl.as9105.com ([79.79.178.204]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MW3ay-0005vy-Bb
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2009 08:29:04 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90907290002i1a80a99fqfbb42128472f3299@mail.gmail.com>
References: <20090728072202.GA5422@gmail.com>
	<200907290614.40124.holger+oe@freyther.de>
	<19c1b8a90907290002i1a80a99fqfbb42128472f3299@mail.gmail.com>
Date: Wed, 29 Jul 2009 08:29:02 +0100
Message-Id: <1248852543.4187.40.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC] Adding TLS selection choice to metadata
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
X-List-Received-Date: Wed, 29 Jul 2009 08:21:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-07-29 at 00:02 -0700, Khem Raj wrote:
> I did however nptl/uclibc builds we need TLS support to be enabled
> and there is no way to differentiate the triplets for a NPTL uclibc
> toolchain from non NPTL toolchain. In future not all arches will get
> NPTL support
> on uclibc at once so we wil have few arches where NPTL will be there and
> that will require TLS whereas others will use Linux Threads and will
> have to disable TLS.

Is it so hard to add the missing tls bits to uclibc's linuxthreads?
That sounds like the best way to solve that problem.

p.




