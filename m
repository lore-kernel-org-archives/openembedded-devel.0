Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlRq-0001oG-5g
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:46:43 +0200
Received: by gwj18 with SMTP id 18so144315gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=2cyWENALWapR7wUAwzhkxVh/MaXoic4tP8eEcxad50w=;
	b=wLckJQh0jYM18xoWxSj46D9jOtZV2yYhwSRr1XSOXk3O8rkaVgLepJ4DOGMMZvxztu
	i4C4XshwdFSMm4KiAacMaL/DAR4Wk0t1XhkhOEcmAvm89jMsz+YYdGD2d9dfxDntyOCf
	BM5KTU9UfFLow/cUcCYiMGEQIXh8ZsBVol9rs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=Tn3H4/cXBD1eoM+l7EN9VMdBHOOlPyxGFvShuSshDaC8m66X2pauiv2eXJg0DmKP6c
	GpK+arweU2j4EawibIcW4yl+VhmKKUdA3OhFH8bVg3FhklmP4F4ph9tSm1ffE+9wIg0I
	oCsM4Kf5aJ4kYMm+TXrc3YSae2k9jCTBqORQM=
Received: by 10.100.245.35 with SMTP id s35mr9448137anh.71.1277858518052;
	Tue, 29 Jun 2010 17:41:58 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id r42sm345299yba.0.2010.06.29.17.41.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:41:57 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:41:39 -0300
Message-Id: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Fixes lksctp recipe
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
X-List-Received-Date: Wed, 30 Jun 2010 00:46:43 -0000

[PATCH 1/4] Add lksctp tools
[PATCH 2/4] Remove mistake configs
[PATCH 3/4] fix missing packages
[PATCH 4/4] rename libsctp package

Thanks


