Received: from mail-ew0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R3rVf-0004LR-UP
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 17:36:25 +0200
Received: by ewy2 with SMTP id 2so1332003ewy.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2011 08:31:09 -0700 (PDT)
Received: by 10.204.0.66 with SMTP id 2mr3394890bka.328.1316014269377;
	Wed, 14 Sep 2011 08:31:09 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id d1sm623195bku.1.2011.09.14.08.31.07
	(version=SSLv3 cipher=OTHER); Wed, 14 Sep 2011 08:31:08 -0700 (PDT)
Message-ID: <4E70C8BA.9030901@dresearch-fe.de>
Date: Wed, 14 Sep 2011 17:31:06 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.3.1
Subject: guidelines for upstart in oe?
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
X-List-Received-Date: Wed, 14 Sep 2011 15:36:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If i remember right there are some first experiments with using upstart as an sysvinit replacement in some oe based distros.

Do some guidelines or suggestions exist to make an application recipes upstart ready?

Nowadays a recipe for a common service contains INITSCRIPT_NAME & Co and installs an init script for sysvinit.

How should such a recipe be modified to be able to install the application in a native upstart image (without sysvinit compatible runlevels)?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


