Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QmR0h-0000Yo-Pp
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 15:52:24 +0200
Received: by ewy5 with SMTP id 5so2022956ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 06:48:08 -0700 (PDT)
Received: by 10.204.148.89 with SMTP id o25mr7926bkv.261.1311860887702;
	Thu, 28 Jul 2011 06:48:07 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id t2sm290095bku.33.2011.07.28.06.48.05
	(version=SSLv3 cipher=OTHER); Thu, 28 Jul 2011 06:48:05 -0700 (PDT)
Message-ID: <4E316894.1020100@dresearch-fe.de>
Date: Thu, 28 Jul 2011 15:48:04 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.2
Subject: [2011.03-maintenance] Pull request
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
X-List-Received-Date: Thu, 28 Jul 2011 13:52:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tom,

Please pull the 10 commits from here:

URI: git://git.openembedded.org/openembedded
Branch: sledz/maintenance

Eric Bénard (1):
      apr-util: add 1.3.10

Mario Schuknecht (3):
      udev: avoid udev stopping persistent pppd connections
      linux-2.6.24: enable tun device support (hipox machine only)
      linux-2.6.24: fix deadlock situation in gmac driver (hipox machine only)

Steffen Sledz (6):
      linux-2.6.24: fix diff pathes in hipox machine specific patch file
      linux-2.6.24: fix a buggy patch file for hipox machine
      ppp-2.4.5: own package for PPPoL2TP plugin
      ppp-2.4.5: remove `DP = "-1"`
      iotop: add missing runtime dependency
      apr-util: disable odbc support to avoid QA error

All of them are in oe master. The linux commits are specific to our hipox machine. All others are bugfixes only.

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


