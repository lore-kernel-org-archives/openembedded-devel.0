Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N344B-0004uB-3N
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2009 09:39:42 +0100
Received: by ewy5 with SMTP id 5so489094ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2009 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=pC0ZA8D1mqKP0OqiBLbSS6+3FIjhvV1dgnLrDnNcjxQ=;
	b=tUo31FF+TsheeMcCChyxNYDdGmYoEJa7yr1HsdHqDA1T8fUfnBCX+hlDsPwaXy23ww
	xdku7z3eJVHE5wJe6ywpwRm46YsQ6SpucBxd1lyWG8K5vWHQiyU6fRKtsmBgmuAg8xnJ
	kUf5bD67bcQWGB5GIK7/jmJ7ZGEht8qArSjn0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=WMuDi7JwnKqA91gDFM/ITrOvsQDSLtZKGrjKXw0dVWPgC8EGXb+BsD8269MFXD+8ZD
	42jQlsdclnglM1tWBOAzUU77LjhJQoojjzGmJnqf5KJT/nUu29Kr4Q4o+lYhP2+88sfW
	sPJSkdfBJbQouSLxe1YPXoxwgE2ufLFKp9dBY=
Received: by 10.211.145.12 with SMTP id x12mr13234686ebn.44.1256719111440;
	Wed, 28 Oct 2009 01:38:31 -0700 (PDT)
Received: from localhost.localdomain (248.Red-213-97-239.staticIP.rima-tde.net
	[213.97.239.248])
	by mx.google.com with ESMTPS id 10sm2203065eyz.19.2009.10.28.01.38.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Oct 2009 01:38:30 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 09:38:34 +0100
Message-Id: <1256719119-2413-1-git-send-email-eballetbo@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE] Patch series - add support for IGEP v2
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
X-List-Received-Date: Wed, 28 Oct 2009 08:39:42 -0000

Hi all,

These patches add support for IGEP v2 board to openembedded stable branch. Basically have been ported from development branch, please consider to adding.

Thanks in advance,

Enric  




