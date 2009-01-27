Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LRoCt-0006Zo-N4
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 14:42:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id AAB972C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 13:34:29 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rvwya6y1lHjN
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 13:34:25 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id DA5972C792
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 13:34:24 +0000 (UTC)
Message-ID: <497F0D92.4040904@gmail.com>
Date: Tue, 27 Jan 2009 14:35:14 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1233059140.7818.4.camel@ubuntu2>
In-Reply-To: <1233059140.7818.4.camel@ubuntu2>
Subject: Re: Build problems
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
X-List-Received-Date: Tue, 27 Jan 2009 13:42:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Paolo Cremonese ha scritto:
> Hi all.
> I'm new in Openembedded.
> I'm trying to build an image ( bitbake opie-image), and I get errors.
> In the following the output of bitbake:
> 
> Can anyone help me?
> 
> Thanks in advance,
> Paolo
> 
> 
> 
> NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it
> to increase performance.
> NOTE: Handling BitBake files: \ (6411/6411) [100 %]
> NOTE: Parsing finished. 6140 cached, 0 parsed, 271 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: build 200901271107: started
> 
> OE Build Configuration:
> BB_VERSION        = "1.8.13"
> METADATA_BRANCH   = "org.openembedded.dev"
> METADATA_REVISION = "a41bdd6cda499d2629ce2a156348620b7ab7afc4"
> TARGET_ARCH       = "i686"
> TARGET_OS         = "linux"
> MACHINE           = "i686-generic"
> DISTRO            = "minimal"
> DISTRO_VERSION    = ".dev-snapshot-20090127"
> TARGET_FPU        = ""

It might be worth trying with "bitbake minimal-image" to start with,
just to see if basic system works.
I just built an i586-generic angstrom-2008.1 DISTRO with the
org.openembedded.dev branch and it works.

Ciao
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


