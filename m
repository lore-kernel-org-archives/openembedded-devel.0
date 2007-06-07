Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1HwBhR-00063n-Q9
	for openembedded-devel@openembedded.org; Thu, 07 Jun 2007 08:42:27 +0200
Received: (qmail 27300 invoked by uid 813007); 7 Jun 2007 06:39:59 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 7 Jun 2007 06:39:59 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 Jun 2007 08:39:49 +0200
User-Agent: KMail/1.9.7
References: <03ec01c7a8bc$95a2f030$6e01a8c0@twilight>
In-Reply-To: <03ec01c7a8bc$95a2f030$6e01a8c0@twilight>
MIME-Version: 1.0
Message-Id: <200706070839.52842.openembedded@hrw.one.pl>
Subject: Re: Need advice on changing kernel.bbclass
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
X-List-Received-Date: Thu, 07 Jun 2007 06:42:34 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


RPROVIDES_kernel-2.4.22-xfs = "kernel-image-2.4.22-xfs" should solve your 
problem.

Change was in kernel*.bbclass and it was discussed on this list - 
thread "[oe] RFC: Kernel image packaging" from 14 March this year.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 change your mind. it's starting to smell.




