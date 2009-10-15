Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MyXKZ-00024w-70
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Oct 2009 22:53:55 +0200
Received: from 88-109-185-146.dynamic.dsl.as9105.com ([88.109.185.146]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MyXJO-0005tx-Uv
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Oct 2009 21:52:40 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b10910151320t7c6064efqa6d8ad598ecd29d4@mail.gmail.com>
References: <ac9c93b10910151320t7c6064efqa6d8ad598ecd29d4@mail.gmail.com>
Date: Thu, 15 Oct 2009 21:52:18 +0100
Message-Id: <1255639938.9214.514.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to get a new machine on the feeds?
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
X-List-Received-Date: Thu, 15 Oct 2009 20:53:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-10-15 at 22:20 +0200, Frans Meulenbroeks wrote:
> As reported before I created a new machine conf for openrd-client.
> This is a kirkwood (= armv5te) system.
> I can make console-image and boot from it.
> opkg also works with one exception:
> If I do an opkg update it cannot find
> http://www.angstrom-distribution.org/feeds/unstable/ipk/glibc/armv5te/machine/openrd-client/Packages.gz
> 
> Who can add this to the build system and to the feeds?

OE itself doesn't maintain any feeds.  It sounds like you would need to
take this up with the angstrom folk, who have their own mailing lists.
See:

http://www.angstrom-distribution.org/contact

p.




