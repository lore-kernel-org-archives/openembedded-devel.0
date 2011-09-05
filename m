Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R0bRV-0006HD-BA
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 17:50:37 +0200
Received: by ewy5 with SMTP id 5so2264245ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Sep 2011 08:45:37 -0700 (PDT)
Received: by 10.213.26.151 with SMTP id e23mr1432886ebc.62.1315237536939;
	Mon, 05 Sep 2011 08:45:36 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de [217.92.191.7])
	by mx.google.com with ESMTPS id w19sm10471360eeh.6.2011.09.05.08.45.35
	(version=SSLv3 cipher=OTHER); Mon, 05 Sep 2011 08:45:35 -0700 (PDT)
Message-ID: <4E64EE9D.6090909@dresearch-fe.de>
Date: Mon, 05 Sep 2011 17:45:33 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Tom Rini <tom.rini@gmail.com>
References: <4E607624.8010300@dresearch-fe.de>
In-Reply-To: <4E607624.8010300@dresearch-fe.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [2011.03-maintenance] pull request (gcc/java/binutils) - Update
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
X-List-Received-Date: Mon, 05 Sep 2011 15:50:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull these 3 commits from here:

URI: git://git.openembedded.org/openembedded
Branch: sledz/maintenance

Jesse Gilles (1):
      classpath in 2011.03-maintenance

Stefan Herbrechtsmeier (1):
      gcc: Remove package libstdc++-dev and libgcc-dev from gcc-cross

Steffen Sledz (1):
      binutils-2.18: fix checksums

All are bugfixes and already in oe-dev master.

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


