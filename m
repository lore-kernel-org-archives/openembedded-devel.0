Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QoBjd-0002DZ-Ea
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 11:58:01 +0200
Received: by fxg11 with SMTP id 11so6099302fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2011 02:53:40 -0700 (PDT)
Received: by 10.204.55.199 with SMTP id v7mr1774949bkg.83.1312278820368;
	Tue, 02 Aug 2011 02:53:40 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cb174.dip0.t-ipconnect.de [217.92.177.116])
	by mx.google.com with ESMTPS id l1sm1385892bks.61.2011.08.02.02.53.39
	(version=SSLv3 cipher=OTHER); Tue, 02 Aug 2011 02:53:39 -0700 (PDT)
Message-ID: <4E37C922.9000205@dresearch-fe.de>
Date: Tue, 02 Aug 2011 11:53:38 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.2
Subject: [2011.03-maintenance] Pull request (net-snmp)
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
X-List-Received-Date: Tue, 02 Aug 2011 09:58:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tom,

Please pull the 2 commits from here:

URI: git://git.openembedded.org/openembedded
Branch: sledz/maintenance

Khem Raj (1):
      net-snmp: Fix build error ./.libs/libnetsnmpmibs.so: undefined reference to `pthread_create'

Steffen Sledz (1):
      net-snmp: disable libnl use

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


