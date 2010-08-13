Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OjmpG-0006I0-3P
	for Openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 07:29:07 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 29BB1AC3
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 01:28:54 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 13 Aug 2010 01:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:subject:date:message-id; s=smtpout;
	bh=FXWvoiAXiXon09cswYPer/vonfg=;
	b=j6zZpCr5BaFsncdtyb50TSwoiv2nsfWa7EcpRJieF8NItEEz6yToJ3YNtfB9TKssZc20TcHiACFvpLrgxxP1jnMONWg2MPMnVRCFTO3bWoO1udoJTFElutlYyA7xOadXv3RujObfRr/YgUvekjni1clbeYoRPV/PVaXcastV3c8=
X-Sasl-enc: 76vERIcoeoyCyvCDAuWW61uNH8U24zH7xkUzsV0rUz/p 1281677333
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d07a29e.pool.mediaWays.net [77.7.162.158])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9FE0B4032DA
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 01:28:53 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Fri, 13 Aug 2010 07:30:14 +0200
Message-Id: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: update canutils to current version
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
X-List-Received-Date: Fri, 13 Aug 2010 05:29:07 -0000

The following patches will update canutils to the current version
4.0.6 and remove older 4.0.x versions.  Also only the latest
version of libsocketcan will be kept.


