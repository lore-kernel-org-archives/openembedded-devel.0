Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P6Hqv-0003Vs-RD
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 09:03:52 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 5BA46275CE2E; Thu, 14 Oct 2010 09:03:21 +0200 (CEST)
Received: from localhost (unknown [89.204.137.8])
	by gravedo.de (Postfix) with ESMTPSA id 9EBD4275CDC9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:03:17 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 09:03:02 +0200
Message-Id: <1287039784-1667-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Some work on libgee recipes
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
X-List-Received-Date: Thu, 14 Oct 2010 07:03:52 -0000

Heyho,

the last commits did some work the libgee recipes which will be fixed with the following
two patches. The first one adds a INC_PR var to indicate changes in the common libgee.inc
recipe. The second one removes the dependency on gobject-introspection as it is not needed
for libgee to compile successfully.

Please review these two patches so I can commit them to our repository.

regards,
morphis



