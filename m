Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Mc5CJ-0001Yq-Ja
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 00:24:31 +0200
Received: from 79-79-178-204.dynamic.dsl.as9105.com ([79.79.178.204]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Mc4wA-0004gH-VS
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 23:07:51 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090814215138.GB31011@gmail.com>
References: <20090814215138.GB31011@gmail.com>
Date: Fri, 14 Aug 2009 23:07:43 +0100
Message-Id: <1250287663.4215.164.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Fri, 14 Aug 2009 22:24:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-08-14 at 14:51 -0700, Khem Raj wrote:
> I would like to add minimal-eglibc and micro-eglibc distros on same
> lines as -uclibc one's

How different is eglibc's API and ABI from regular glibc?  I wonder if
it really needs a separate DISTRO of its own.

p.




