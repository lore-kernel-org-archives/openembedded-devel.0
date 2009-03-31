Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LohN1-0007YV-Sy
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 19:03:28 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LohKs-0002t0-K6
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 17:01:14 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 31 Mar 2009 17:01:14 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 31 Mar 2009 17:01:14 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 31 Mar 2009 19:00:59 +0200
Message-ID: <gqti8d$6qs$1@ger.gmane.org>
References: <200903311837.28324.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090322 Shredder/3.0b3pre
In-Reply-To: <200903311837.28324.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Tue, 31 Mar 2009 17:03:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-03-09 18:37, Marcin Juszkiewicz wrote:
>
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

Great!

I already have a few patches queued up for the stablebranch:

http://dominion.thruhere.net/koen/OE/for-stable/

What's the proper procedure for getting those in?

regards,

Koen



