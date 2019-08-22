Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id C01037F27B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:26 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 3898F103763
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:17:27 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 19:17:06 +0200
Message-Id: <20190822171723.18657-1-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: evolution-data-server: Update to 3.32.4 and cleanup the recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Aug 2019 17:17:27 -0000
Content-Transfer-Encoding: 8bit

The goal of this patchset is to update evolution-data-server to latest
stable version 3.32.4 and make a series of improvements and cleanups.

Most of the patches from this set have previously been submitted as one
monolithic patch titled "evolution-data-server: Update to version 3.32.4"
This new split version  does include a few additional minor changes not
submitted in the previous patch.



