Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1LvVfD-0005VI-Qy
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Apr 2009 13:58:23 +0200
Received: (qmail invoked by alias); 19 Apr 2009 11:54:09 -0000
Received: from 198.70.222.87.dynamic.jazztel.es (EHLO [192.168.1.101])
	[87.222.70.198]
	by mail.gmx.net (mp022) with SMTP; 19 Apr 2009 13:54:09 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX195PAd09FJ5SBvd/570NwsIO1QP4wbq6Xpr3olrYg
	lt0Rg3tbGFnorB
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Apr 2009 13:54:07 +0200
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Message-Id: <200904191354.08027.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.68
Subject: adding new kernel defconfig
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
X-List-Received-Date: Sun, 19 Apr 2009 11:58:24 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi there,

I am new with openembedded and I am trying to build a kernel for a new 
machine.

In my machine config file I have these lines:

PREFERRED_PROVIDER_virtual/kernel = "linux"
PREFERRED_VERSION_linux = "2.6.25"

When I build the kernel, bitake downloads a 2.6.25 kernel: OK
But it takes the kernel config from recipes/linux/linux/defconfig

I have added my own defconfig file in 
recipes/linux/linux-2.6.25/mymachine/defconfig but I dont know how to say 
bitbake to use it.

    Regards
  - Eismann -


