Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N7u2K-0003sN-FO
	for openembedded-devel@openembedded.org; Tue, 10 Nov 2009 17:57:47 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAAGrO5L020752; Tue, 10 Nov 2009 16:53:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DLoPehFwFOsT; Tue, 10 Nov 2009 16:53:23 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAAGrGAM020674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 10 Nov 2009 16:53:18 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Tue, 10 Nov 2009 16:52:55 +0000
Message-Id: <1257871975.29038.263.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Bitbake 1.8.18 released!
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
X-List-Received-Date: Tue, 10 Nov 2009 16:57:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Bitbake 1.8.18 has been released.

Some fixes have emerged that are important enough to warrant another
release including some issues with the last release not allowing all the
improvements OE wished to make to its core.

This release can be downloaded at:

http://prdownload.berlios.de/bitbake/bitbake-1.8.18.tar.gz

Changes since the last release:

Chris Conroy (1):
      providers.py: Fix package sorting order to reflect priorities

Denys Dmytriyenko (1):
      utils.py: add special handling for version delimiters

Richard Purdie (6):
      Increment version post release
      git.py: Search mirrors for tarballs before fetching, not just local directories
      fetch/__init__.py: Fix a bug where errors could corrupt bitbake internal state wrt SRCREVINACTION (from Poky)
      fetch/__init__.py: Allow SRC_URI to be overridden in fetcher go() function
      BBHandler.py: Backport anonymous function handling improvements from 1.10 branch
      Release 1.8.18





