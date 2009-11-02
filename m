Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N4mgi-0001sK-Qj
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 03:30:35 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 340101B10C05;
	Mon,  2 Nov 2009 02:39:24 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 2 Nov 2009 03:06:33 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
	<c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
In-Reply-To: <c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200911020306.33189.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Mon, 02 Nov 2009 02:30:35 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 01 November 2009 21:35:32 Leon Woestenberg wrote:
> Hello,
> 
> On Thu, Oct 29, 2009 at 12:41 PM, Marcin Juszkiewicz
> 
> <marcin@juszkiewicz.com.pl> wrote:
> > [archivename]
> > url0=url-to-sources
> > url1=alternative-url-to-sources
> > url2=another-alternative-url-to-sources
> > md5=md5sum
> > sha256=sha256sum
> 
> Can we simplify this a bit? i.e.
> 
> archivename
> url=url-to-sources
> url=alternative-url-to-sources
> url=another-alternative-url-to-sources
> md5=md5sum
> sha256=sha256sum
> 
> Why not just url instead of url0, url1, url2, ... ?

the problem with archivename there is no gurantee that the name will be 
globally unique. E.g. with Open Palmtop Integreated Environment (OPIE) One 
Password.. (OPIE) there was a clash and we might or might not have had a clash 
in release versions too...

z.


