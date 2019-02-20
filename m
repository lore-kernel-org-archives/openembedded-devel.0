Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 44F697C64B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 04:37:47 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJdk-0006Y3-70; Wed, 20 Feb 2019 05:37:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=71z/yAJIq4C/laJaNo0gONJmfoLyIdw0nDghW9VZTMA=;
	b=VoOdFqOygE6WHuRO9NjRPJPYBs
	Jx6/1eHiD9aS3P+UBmfan13za+X5SnJ+dE2A7eCXmZBK/Bu0cF67kONcsU2nDCCZ52M8ZIvGGutcb
	HnOZ/CV9rOt2opakZSFBqhy9Z8UxkKdbVUU5yXtKUITh6HfyWCeOXqNYSg7JRah5FvDCBZnC8xS51
	dPGrwZNLNdFpPVkui+aKFlUZ1tq8oJw0yHvzmstkrJj2JhgGFHgM5FnXJk1qm9VkwsfdGNxTUD3UD
	iQIghVMFcTRXgMJvKWS4DEgqg4Bc4zzmocogzLtUFtER5cjJl8PvK6IdsCwD7aCEWiOnGGkXlck3V
	VqLq62mQ==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gwJdg-0003gE-5D; Wed, 20 Feb 2019 05:37:45 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2019 05:37:37 +0100
Message-Id: <20190220043740.27952-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 565104a19fe407a9c6ca8c46ee3536b4
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190220043745Z
Subject: Addendum to dracut in rootfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2019 04:37:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to build testing for different architectures.

Best regards,
Zoltán Böszörményi



