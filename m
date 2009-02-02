Received: from [65.182.109.77] (helo=mta8.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LTxIG-0000B5-Am
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Feb 2009 12:48:48 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta8.brinkster.com (Postfix) with ESMTP id 6B7E671559A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 06:40:45 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.167
X-Spam-Level: 
X-Spam-Status: No, score=0.167 tagged_above=-10 required=5 tests=[AWL=-0.331, 
	BAYES_00=-2.599, HELO_LH_LD=1.215, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta8.brinkster.com ([127.0.0.1])
	by localhost (mta8.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kZUyAr9FuHKp
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 06:40:45 -0500 (EST)
Received: from localhost.localdomain
	(82-46-19-72.cable.ubr02.bath.blueyonder.co.uk [82.46.19.72])
	by mta8.brinkster.com (Postfix) with ESMTP id 670F0715692
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2009 06:40:44 -0500 (EST)
From: David-John Willis <John.Willis@Distant-earth.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Feb 2009 11:40:47 +0000
Message-Id: <1233574850-4230-1-git-send-email-John.Willis@Distant-earth.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Subject: Small set of patches to add a few default configuration files for the OMAP3-Pandora machine.
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
X-List-Received-Date: Mon, 02 Feb 2009 11:48:49 -0000


These patches add support for a default touchscreen calibration (pointercal), fb.modes and an xorg.conf for the OMAP3-Pandora system. I am still beating git send-email into submission so if I have got this email wrong I apologise in advance ;-).

Regards,

John Willis



