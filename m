Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1Louy6-00075z-7a
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 09:34:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 6888A2C823
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2009 07:30:57 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wVVmQT4Nj+KE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2009 07:30:55 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id AD6F42C7FD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2009 07:30:54 +0000 (UTC)
Message-ID: <49D3187D.2030803@gmail.com>
Date: Wed, 01 Apr 2009 09:32:13 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200903311837.28324.marcin@juszkiewicz.com.pl>
In-Reply-To: <200903311837.28324.marcin@juszkiewicz.com.pl>
Subject: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Wed, 01 Apr 2009 07:34:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz ha scritto:
> Hi
> 
> I would like to announce creation of new branch: stable/2009 in 
> OpenEmbedded repository. It was branched few days ago, build tested and 
> got some bugfixes which were added to .dev tree (and back to 
> stable/2009).
> 
> What was in build test? Distro "angstrom-2008.1", machines: qemuarm 
> (armv5te), at91sam9263ek (armv5te), beagleboard (armv7a), qemux86 (i586) 
> and vortex86sx (486sx). I tested building of next images: console, 
> console-base, x11, beagleboard-demo for each of those machines. So far 
> only glibc builds were tested, uclibc one is queued.
> 
> I also imported BitBake 1.8.12 (last release) into "stable/2009" branch 
> as this is minimal stable version which works with this repository.
> 
> Feel free to clone and do tests. I will write more later.
> 
> Regards, 

What command do you use to get it ?

/marco


