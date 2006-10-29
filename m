Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GeJOT-0005Yw-9a
	for openembedded-devel@openembedded.org; Sun, 29 Oct 2006 23:44:41 +0100
Received: (qmail 11054 invoked by uid 813007); 29 Oct 2006 22:44:07 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 29 Oct 2006 22:44:07 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Oct 2006 23:44:09 +0100
User-Agent: KMail/1.9.5
MIME-Version: 1.0
Message-Id: <200610292344.10844.openembedded@hrw.one.pl>
Subject: Debian and RPM packages for easier start with OpenEmbedded
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
X-List-Received-Date: Sun, 29 Oct 2006 22:44:41 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


For one of my customers I prepared packages which have to make starting 
with OpenEmbedded easier. The idea is to install one metapackage which 
will depend on all required tools.

There are two formats provided:

- deb for Debian and Debian based distros

http://www.openembedded.org/dl/packages/openembedded-essential_1.0-1_all.deb
http://www.openembedded.org/dl/packages/openembedded-essential_1.0-1.dsc
http://www.openembedded.org/dl/packages/openembedded-essential_1.0-1.tar.gz

- rpm for RPM based distros

http://www.openembedded.org/dl/packages/openembedded-essential-1.0-1.noarch.rpm
http://www.openembedded.org/dl/packages/openembedded-essential-1.0-1.src.rpm
http://www.openembedded.org/dl/packages/openembedded-essential-1.0.spec


Debian ones will be provided as APT repository so users will be able to 
just 'apt-get install openembedded-essential'. If someone know how to 
prepare repository for RPM users then I am open for help.

You can find their source in org.openembedded.dev/contrib/distro-packages/ 
directory.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                           She sells C shells...




