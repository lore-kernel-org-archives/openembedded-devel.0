Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlQp-0001MQ-2C
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:45:43 +0200
Received: by gwj18 with SMTP id 18so143897gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=+9ZtmUTAMfYPmgzxXDqLYgtkq/AooAfLmVSUkNc56a0=;
	b=HFiLM4hVkLAWI2km7RNs2quBSKwCd8QtSNdGCj9SF/vVA3WJRawQQmEG+2Vx05n7u3
	YQ1OuhZwTWfJrfI5CjjTtCIm4sT/Ag4sB4bFiE2ppjmPc34/A9wCpM6coOdsEGVjtrNE
	fhUEuXGWyIsyV5UETHu0Yctf4VQ9ntcv/kc0I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=m20/2Ag5reTE05M6wUTGV5EbJJEZwCMkHvVbq/7xCAs+NclwtXhrOqbgbk34gwbeYW
	8YTXVlKDiptPTb714j6ncKrj60Lb5DKCTlG9f4ZeHCZHDOIN9A16OXCAsvbyHW9waVAJ
	bjS2b9dlgeSW4hxLk2FChG3YtD/SGJtlAMY6M=
Received: by 10.101.134.23 with SMTP id l23mr9898732ann.129.1277858454075;
	Tue, 29 Jun 2010 17:40:54 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id 36sm344282ybr.8.2010.06.29.17.40.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:40:53 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:40:38 -0300
Message-Id: <1277858443-27280-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Fixes cgreen recipe
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
X-List-Received-Date: Wed, 30 Jun 2010 00:45:43 -0000

[PATCH 1/5] Add cgreen. Library to do unit test for C language
[PATCH 2/5] Remove mistake configs
[PATCH 3/5] add flex to recipe
[PATCH 4/5] add cgreen beta package
[PATCH 5/5] fix workdir name

Thanks


