Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QzNEo-0008Lt-Uk
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 08:28:27 +0200
Received: by bkbzu17 with SMTP id zu17so2351418bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 23:23:30 -0700 (PDT)
Received: by 10.204.157.8 with SMTP id z8mr344343bkw.145.1314944550120;
	Thu, 01 Sep 2011 23:22:30 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id zw12sm264193bkb.10.2011.09.01.23.22.28
	(version=SSLv3 cipher=OTHER); Thu, 01 Sep 2011 23:22:29 -0700 (PDT)
Message-ID: <4E607624.8010300@dresearch-fe.de>
Date: Fri, 02 Sep 2011 08:22:28 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Tom Rini <tom_rini@mentor.com>
X-Enigmail-Version: 1.3.1
Subject: [2011.03-maintenance] pull request (gcc/java)
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
X-List-Received-Date: Fri, 02 Sep 2011 06:28:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull these 2 commits from here:

URI: git://git.openembedded.org/openembedded
Branch: sledz/maintenance

Jesse Gilles (1):
      classpath in 2011.03-maintenance

Stefan Herbrechtsmeier (1):
      gcc: Remove package libstdc++-dev and libgcc-dev from gcc-cross

Both are bugfixes and already in oe-dev master.

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


