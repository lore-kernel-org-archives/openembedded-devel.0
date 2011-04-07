Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q7pAD-00027A-6k
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 15:22:21 +0200
Received: by gxk3 with SMTP id 3so462376gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:subject:date:message-id:x-mailer; 
	bh=fD9u8WCs/ZFpHk1H1a94DRMZUz5sIejaQTV0qWfE6u8=;
	b=UaFXRHeitZYN7Q/2c1cVaAFvxTCP/jNLhiUpeZmJx+lkR6Us2WQF7lA7AFMa4uhERC
	WS5rcEYN222jo1lMlWfiaoH3LCAjUBYBx53PFpf+1mgT88TSbpFRsPKcEqjJkNgBsvsU
	wDh9fUC471KS/G3a8NdvnIjcxn/aM9Ow5PB+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=DuNA3szmbe2ZLhq0Xkc4rxMD2ajxxtpsWETg7STqsfSYR7JcOwQtIiAwjIAH8M2Mjb
	nu06KAViQu6ZTCbfIopE2qdWiob8apHWgNszvVxV44zcD2hAbBrrMt1FMdsnpazmXlN4
	Oz7uwK/6EOZwoKo0kbTZyQe84rfaQoQCndtpU=
Received: by 10.236.116.40 with SMTP id f28mr1117601yhh.314.1302182410597;
	Thu, 07 Apr 2011 06:20:10 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l43sm726453yhn.36.2011.04.07.06.20.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 06:20:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:19:50 +0000
Message-Id: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 0/6] Patchset for pushing into master
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
X-List-Received-Date: Thu, 07 Apr 2011 13:22:21 -0000

Hello,

Here goes our current patchset that is ready for pushing into
master. Please review and apply those that fit your quality
requirements ;-)

Att,



