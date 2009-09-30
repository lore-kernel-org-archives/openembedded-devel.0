Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Msu5c-0004dP-GO
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 09:59:13 +0200
Received: by fg-out-1718.google.com with SMTP id e21so1160914fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 00:58:26 -0700 (PDT)
Received: by 10.86.230.27 with SMTP id c27mr4991687fgh.63.1254297506195;
	Wed, 30 Sep 2009 00:58:26 -0700 (PDT)
Received: from localhost.localdomain (94-193-242-65.zone7.bethere.co.uk
	[94.193.242.65])
	by mx.google.com with ESMTPS id l19sm856246fgb.12.2009.09.30.00.58.25
	(version=SSLv3 cipher=RC4-MD5); Wed, 30 Sep 2009 00:58:25 -0700 (PDT)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2009 08:58:18 +0100
Message-Id: <1254297499-3508-1-git-send-email-dp@xora.org.uk>
X-Mailer: git-send-email 1.6.2.5
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Signoff needed from dev on core glibc change
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
X-List-Received-Date: Wed, 30 Sep 2009 07:59:19 -0000

This change in glibc is needed to get oabi compiling working, the change
is already in eglibc so is low risk.

Graeme



