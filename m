Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QtJ7j-0000ug-JY
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 14:52:03 +0200
Received: by bkbzu17 with SMTP id zu17so4055914bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 05:47:26 -0700 (PDT)
Received: by 10.204.171.66 with SMTP id g2mr1512000bkz.9.1313498845905;
	Tue, 16 Aug 2011 05:47:25 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id zx9sm1491bkb.28.2011.08.16.05.47.23
	(version=SSLv3 cipher=OTHER); Tue, 16 Aug 2011 05:47:24 -0700 (PDT)
Message-ID: <4E4A66DB.60902@dresearch-fe.de>
Date: Tue, 16 Aug 2011 14:47:23 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
Followup-To: openembedded-devel,<openembedded-devel@lists.openembedded.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
X-Enigmail-Version: 1.2
Subject: runlevel
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
X-List-Received-Date: Tue, 16 Aug 2011 12:52:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We like to use different init runlevel in our application for different purposes.

Which runlevels are used with which semantics in OE and/or distros using OE (especially Angsrom)?

Does OE support runlevels 7-9 like the linux telinit manpage mentions: "Runlevels 7-9 are also valid, though not really documented. This is because "traditional" Unix variants don't use them."?

Regards,
Steffen

PS: Followup-To set to <openembedded-devel@lists.openembedded.org>

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


