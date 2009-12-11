Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NJ7tt-0002yt-JY
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 16:59:28 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NJ7sF-0006iN-98
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 15:57:43 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NJ7sF-0002H3-1n
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Dec 2009 15:57:43 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091211154716.GB12304@xora-eee.xora.org.uk>
References: <ac9c93b10912110039u28303201t5a762e715ed53ceb@mail.gmail.com>
	<20091211154716.GB12304@xora-eee.xora.org.uk>
Date: Fri, 11 Dec 2009 15:57:39 +0000
Message-Id: <1260547059.779.229.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: multiple DISTRO's in tmp
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
X-List-Received-Date: Fri, 11 Dec 2009 15:59:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-12-11 at 08:47 -0700, Graeme Gregory wrote:
> The only real advantage micro has in size is that it creates less
> directories. The images are not as far as I can see physically any
> smaller.

You should generally get smaller images with micro, though how much
smaller will obviously depend on what exactly you are building.  What
file sizes were you seeing in your test?

p.




