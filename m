Return-Path: <ulf@emagii.com>
Received: from mxf5.bahnhof.se (mxf5.bahnhof.se [213.80.101.29])
	by mail.openembedded.org (Postfix) with ESMTP id C011677025
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 08:50:19 +0000 (UTC)
Received: from localhost (mxf5.local [127.0.0.1])
	by mxf5-reinject (Postfix) with ESMTP id C60409CD9AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 10:27:09 +0200 (CEST)
X-Virus-Scanned: by amavisd-new using ClamAV at bahnhof.se (MXF1)
X-Spam-Score: 0.306
X-Spam-Level: 
X-Spam-Status: No, score=0.306 tagged_above=-99 required=5
	tests=[DNS_FROM_AHBL_RHSBL=0.306]
Received: from mxf5.bahnhof.se ([127.0.0.1])
	by localhost (mxf5.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMaElATivEs0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 10:27:02 +0200 (CEST)
Received: from smtp-auth2.bahnhof.se (smtp-auth.bahnhof.se [213.136.33.6])
	by mxf5.bahnhof.se (Postfix) with ESMTP id 7666D9CD9C7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 10:27:02 +0200 (CEST)
Received: from Thranduil.bahnhof.se (h-169-62.a454.priv.bahnhof.se
	[37.123.169.62]) (Authenticated sender: mb782575)
	by smtp-auth2.bahnhof.se (Postfix) with ESMTPA id 4CB5428440
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 10:27:02 +0200 (CEST)
From: Ulf Samuelsson <ulf@emagii.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2015 10:26:54 +0200
Message-Id: <1443601616-25650-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-gnome][dizzy][PATCH] Use GFDL-1.1 instead of GFDLv1.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Sep 2015 08:50:23 -0000


The name for the GNU Free Documentation License is GFDL-1.1, 
not GFDLv1.1 as used in the "gnome-panel" recipes.

