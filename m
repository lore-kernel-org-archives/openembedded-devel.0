Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OqKOn-0000Ma-6l
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 08:32:49 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 771F3275D101; Tue, 31 Aug 2010 08:32:18 +0200 (CEST)
Received: from localhost (unknown [89.204.137.96])
	by gravedo.de (Postfix) with ESMTPSA id EB040275CCC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 08:32:16 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Aug 2010 08:31:57 +0200
Message-Id: <1283236322-5116-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_WEB
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Updates for the palmpre machine
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
X-List-Received-Date: Tue, 31 Aug 2010 06:32:49 -0000

Heyho,

the following patches improves the support for the palmpre machine. They updates the
recipes for the msmcomm daemon to the latest version and fix the dependencies on
libfsotransport and fsogsmd. If nobody has any complaints about these patches I will 
commit them in the next days.

regards,
morphis



