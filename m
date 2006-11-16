Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GkmsP-0001oA-1a
	for openembedded-devel@openembedded.org; Thu, 16 Nov 2006 20:26:21 +0100
Received: (qmail 22096 invoked by uid 813007); 16 Nov 2006 19:24:02 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 16 Nov 2006 19:24:02 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Nov 2006 20:23:19 +0100
User-Agent: KMail/1.9.5
MIME-Version: 1.0
Message-Id: <200611162023.23012.openembedded@hrw.one.pl>
Subject: RFC: KERNELORG_MIRROR variable
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
X-List-Received-Date: Thu, 16 Nov 2006 19:26:21 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


We have several mirrors defined in base.bbclass like SourceForge mirror, 
GNU mirror etc. There are also mirrors defined for few popular sources 
(gnutls for example).

I want to introduce kernel.org mirror variable: KERNELORG_MIRROR because 
currently we use:

http://ftp.kernel.org/
ftp://ftp.kernel.org/
http://kernel.org/

and only second one is listed in base.bbclass

I would push changeset with it during weekend.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 punk's not dead. it just smells that way.




