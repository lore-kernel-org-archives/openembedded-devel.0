Received: from caiajhbdccac.dreamhost.com ([208.97.132.202]
	helo=homiemail-a11.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NUKMm-0007g6-9M
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 14:31:35 +0100
Received: from [82.130.121.62] (mtec-hg-docking-2-dhcp-062.ethz.ch
	[82.130.121.62])
	by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPA id 0D22B194058
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 05:29:23 -0800 (PST)
Message-ID: <4B4B27B2.7000607@SSpaeth.de>
Date: Mon, 11 Jan 2010 14:29:22 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8pre) Gecko/20100105 Shredder/3.0.1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <hif5ir$ccj$1@ger.gmane.org>
In-Reply-To: <hif5ir$ccj$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 208.97.132.202
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: unset foo && bar in .desktop files doesn't work with all launchers
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
X-List-Received-Date: Mon, 11 Jan 2010 13:31:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/10 13:29, Koen Kooi wrote:
> I tried to launch navit from inside angstrom-gnome-image and it
> complained that it couldn't find the file 'unset', which isn't suprising
> since it's a shell builtin for (b)ash.

I removed this from the .desktop file. We'll think about whether to use 
a shell script wrapper.

> Could the navit maintainers please change .desktop hacking to a shell

I don't find "navit" in MAINTAINERS but it would be nice to have a navit 
maintainer, actually :).

spaetz


