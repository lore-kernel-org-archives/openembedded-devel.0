Received: from mail-wy0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R4WTg-0000UF-5O
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 13:21:04 +0200
Received: by wyh21 with SMTP id 21so3667286wyh.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 04:15:48 -0700 (PDT)
Received: by 10.227.41.198 with SMTP id p6mr1453609wbe.67.1316171748180;
	Fri, 16 Sep 2011 04:15:48 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de. [217.92.191.7])
	by mx.google.com with ESMTPS id p26sm11961460wbm.16.2011.09.16.04.15.46
	(version=SSLv3 cipher=OTHER); Fri, 16 Sep 2011 04:15:47 -0700 (PDT)
Message-ID: <4E732FE1.6030202@dresearch-fe.de>
Date: Fri, 16 Sep 2011 13:15:45 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Tom Rini <tom.rini@gmail.com>
X-Enigmail-Version: 1.3.1
Subject: [2011.03-maintenance] pull request
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
X-List-Received-Date: Fri, 16 Sep 2011 11:21:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull these 2 commits from here:

URI: git://git.openembedded.org/openembedded
Branch: sledz/maintenance

Steffen Sledz (2):
      rsyslog: switch to new upstream version 5.8.4
      linux-libc-headers 2.6.24: backport arm/asm/hwcap.h from linux 2.6.26

Both are bugfixes and already in oe-dev (aka OE classic) master.

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


