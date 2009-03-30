Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1LoJHY-0000nQ-9W
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 17:20:12 +0200
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 9C31A547D5; Mon, 30 Mar 2009 17:18:03 +0200 (CEST)
Date: Mon, 30 Mar 2009 17:18:03 +0200
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090330151803.GB12579@fh-wedel.de>
References: <20090330142737.GA12011@fh-wedel.de>
	<200903301651.11651.hs4233@mail.mn-solutions.de>
MIME-Version: 1.0
In-Reply-To: <200903301651.11651.hs4233@mail.mn-solutions.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: sane-toolchain-glibc.inc and old g++ versions
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
X-List-Received-Date: Mon, 30 Mar 2009 15:20:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> CXXFLAGS=${@bb.data.getVar('CXXFLAGS', d, 
> 1).replace(" -fvisibility-inlines-hidden",""))

Yes, that is almost it, seems like I'm slowly learning some
Python now :)

Cheers,

Martin

-- 
----------- / http://herbert.the-little-red-haired-girl.org / -------------
=+= 
while (!asleep)
  ++sheep;


