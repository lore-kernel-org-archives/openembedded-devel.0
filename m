Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KjayZ-0008Ra-Hb
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Sep 2008 16:40:51 +0200
Received: from 79-71-201-221.dynamic.dsl.as9105.com ([79.71.201.221]
	helo=[192.168.2.153])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Kjaum-0008In-Fa
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Sep 2008 15:36:57 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48DE3D09.4090608@linuxdevelopment.de>
References: <48DE3D09.4090608@linuxdevelopment.de>
Date: Sat, 27 Sep 2008 15:36:54 +0100
Message-Id: <1222526214.8743.10.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: x86_64 host -- never ending story
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
X-List-Received-Date: Sat, 27 Sep 2008 14:40:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 2008-09-27 at 16:02 +0200, Robert W=C3=B6rle wrote:
> Can one give a quick and brief explanation why using oe on a x86_64 host=20
> is sooo difficult.
> I am having always a hard time to setup oe and build on that ... many=20
> architectures break on glibc-native or such stuff lile avr32.=20
> i686-generic or even arm sometimes ?

What exactly are the problems you've been seeing?  All the build hosts
that I use for OE nowadays are x86-64 and I haven't experienced any
breakage of the kind that you hint at.  I don't think I've ever tried to
build for an avr32 target but I do compile regularly for i586 and
various kinds of arm.

p.




