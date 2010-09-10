Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1OuAdV-00054J-MT
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 22:56:08 +0200
Received: by eyb7 with SMTP id 7so2139137eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 13:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=LWIujBcZdFus77Ms9jSCDbwek3AITzLpvugR4TImuKk=;
	b=O9C+OtNZ3TtyAHo4MdMdoXfLrEdmCmbE/m6tub2tQ8KeuErZgV82h3mzbR2xsJfZ0X
	wEbJUJt9wowUOmbWen4VxwThC8ylPAFnlev81qjE6RxYy3aYVNvgQfsU94hU0OGE9bgw
	bZaYqX9dj8ZqILtZ6hOmE6E5mVq8hZNxv/HYY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=XiaapVw/atNA/92VNast0aa5ORr5ZLGNUmasULP76fFHcJdrzYIbh469u55pYc6TM7
	iy+TeMcsipGz8Zni25WZdbJDacdLdFRGFqgxV/FrSem9et8h4rQkRho1sWYWpogi6PzZ
	NOj9gjovgmW8SRts7seQ2Gxn9OGdk/LQGieCs=
Received: by 10.213.21.129 with SMTP id j1mr1010331ebb.7.1284152111837;
	Fri, 10 Sep 2010 13:55:11 -0700 (PDT)
Received: from localhost.localdomain ([80.249.95.150])
	by mx.google.com with ESMTPS id z55sm4525469eeh.3.2010.09.10.13.55.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 10 Sep 2010 13:55:10 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	anarsoul@gmail.com
Date: Fri, 10 Sep 2010 23:54:12 +0300
Message-Id: <1284152054-27447-1-git-send-email-anarsoul@gmail.com>
X-Mailer: git-send-email 1.7.2.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/2] Update kernel for rx1950 machine
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
X-List-Received-Date: Fri, 10 Sep 2010 20:56:10 -0000

This patch series adds rx1950-specific patches to linux-2.6.35
and makes it default for this machine.



