Received: from [216.239.58.191] (helo=gv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J0kfJ-0000em-Tb
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Dec 2007 22:23:21 +0100
Received: by gv-out-0910.google.com with SMTP id k18so7222gve
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2007 13:19:30 -0800 (PST)
Received: by 10.78.168.1 with SMTP id q1mr4278023hue.1197062369750;
	Fri, 07 Dec 2007 13:19:29 -0800 (PST)
Received: from ?10.0.0.6? ( [81.213.99.201])
	by mx.google.com with ESMTPS id g12sm1185115nfb.2007.12.07.13.19.28
	(version=SSLv3 cipher=OTHER); Fri, 07 Dec 2007 13:19:28 -0800 (PST)
Date: Fri, 7 Dec 2007 23:21:47 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <841689643.20071207232147@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <47594E40.2090201@student.utwente.nl>
References: <47594E40.2090201@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: [Angstrom-devel] RFC: ipv6 support in angstrom
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
X-List-Received-Date: Fri, 07 Dec 2007 21:23:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Friday, December 7, 2007, 3:44:32 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> The following RFC was accepted by all angstrom developers, so moving it
> to OE now:


> I want to propose the following:

> * enabling the ipv6 kernel module on all network capable devices
> angstrom wants to support.
> * enabling the mip6 kernel module on capable kernels (afaik vanilla
> 2.6.23 or patches 2.6.x)
> * have ipv6 support enabled in the c library and busybox

> Some machines already do all this, but afaik we don't have a policy for
> it yet.

  Just one note - ipv6 is set for autoload in kernel.bbclass, not sure
this is good idea for such circumstances.


[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



