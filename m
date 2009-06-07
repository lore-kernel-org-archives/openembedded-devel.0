Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MDG9w-00070y-If
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 13:03:28 +0200
Received: from 212-139-89-247.dynamic.dsl.as9105.com ([212.139.89.247]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MDG0s-0008KM-KW
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 11:54:06 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090606234437.GO26065@smtp.west.cox.net>
References: <921557650906061408x129a09c6j53d0e0a971a5eac8@mail.gmail.com>
	<20090606212856.GM26065@smtp.west.cox.net>
	<921557650906061610l26165cb7odab17b271ce7ee13@mail.gmail.com>
	<20090606234437.GO26065@smtp.west.cox.net>
Date: Sun, 07 Jun 2009 11:54:05 +0100
Message-Id: <1244372045.4151.19.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] netvista 8363/N2200 machine support
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
X-List-Received-Date: Sun, 07 Jun 2009 11:03:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-06-06 at 16:44 -0700, Tom Rini wrote:
> I'd think do_install_machinename will override, but it's been a while
> since I've tried something like that.

Yes, exactly that.  Functions are just variables and you can manipulate
them with OVERRIDES in the same way as anything else. 

p.



