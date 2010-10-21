Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHa-0007Po-Th
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:17 +0200
Received: by gxk22 with SMTP id 22so12464gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=VseJJxV6SvADrBLLKsZJmXjWHccumxnmdRHhI8JnwPs=;
	b=lYXjf3FoTGAafbvexi49RkyGViOPA7jC1QNrVF8wbblSLgU7AThWUESfnpWmKBMBFO
	Zx7xeLg3yGZ51qxwe4vPndZcOvoZ1OJt7mT3nFq5xXniQiv/Mzt9GJXQHMB0q4Yyw0bD
	91mnsaPIomd9+19TnW0jyfj97tgtHt/fdxxWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=sqMAw1wEVo/OoJrwvblaK4P1o8NAI8MCoYxzcK0lny6/LZy8KJmHzkVAr5wxlfJyRi
	V+GDlKDUI/xvC0FGsSqap0lpSitII3dj82gbiwTcMcN65nDJEe79ZUoiQunyGz0Fin7W
	jmgSWbMX9f8fhLebBXvkNg5P30bZoPHyiRgVs=
Received: by 10.150.198.3 with SMTP id v3mr3687591ybf.132.1287668014547;
	Thu, 21 Oct 2010 06:33:34 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:33 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:08 -0500
Message-Id: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 00/22] update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:34:19 -0000

This set of patches is breaking up the previous patch I had
sent into a patch for each package.  This is to allow them
to be reviewed and commited easier.  I will mark my previous
patch as superseded.




