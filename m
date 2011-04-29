Received: from smtp-out05.msg.oleane.net ([62.161.7.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QFqDd-0001ab-ER for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 18:07:01 +0200
Received: from smtp05.msg.oleane.net (smtp05.mail.priv [172.17.20.114]) 
	by smtp-out05.msg.oleane.net with ESMTP id p3TG4TwT026596
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 18:04:30 +0200
Received: from localhost.localdomain
	(AMarseille-551-1-3-92.w80-9.abo.wanadoo.fr [80.9.74.92]) 
	by smtp05.msg.oleane.net (MTA) with ESMTP id p3TFiC58021692
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 17:44:12 +0200
X-Oleane-Rep: REPA
From: "C. Charreyre" <christian.charreyre@cioinfoindus.fr>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2011 17:43:56 +0200
Message-Id: <1304091838-23333-1-git-send-email-christian.charreyre@cioinfoindus.fr>
X-Mailer: git-send-email 1.7.0.4
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.6.0.2009776, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.4.29.152715 (no antivirus check)
Subject: mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Fri, 29 Apr 2011 16:07:01 -0000


Hi all,

this new recipe (corrected) will build the painting soft mypaint.

In order to correctly run on the target, it is necessary to add new recipes dependencies in python-numpy recipe.

Here are the two patches in version 2.

Hoping it will be valuable.



