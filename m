Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7RBu-0003b1-42
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 13:46:30 +0200
Received: by fxm19 with SMTP id 19so1044407fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=tbdEKh1u5ryA2jDHUjodomW95AjTlj5Rsl5WPLeJuAE=;
	b=c85k2h/p5CqMKLKZDsi0uYBuuo4Vs7ZmHmEnguRVzauuHJM9lQ2ANpbWwPjampxRva
	CO0og1ZRJmxXflAcS+5KCYq7Q/ZbLv8Z/hJA4cnHmTlsDOyHz4cn8Q+Ve252zim4u6Ui
	EBOHXKnyvTHf7qpI/8sCpteB0MGrE9DxhAFQs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=mzc9LAVinRX9eyrsoZAbv1gAMiVxw55OT5fhOaXeKmJILNaNuOYnafyCWA3Yrz+efx
	HQp/M8jvH8rEydjWAEoTFbMbmn6mxIMbGFCuA4qrLMnzxc864YY+EQAanjzGXMtxJKXx
	0lExePmoR0AUw6DbphTGuLZH3ZlRHEeyp0Kxc=
Received: by 10.223.6.11 with SMTP id 11mr934726fax.98.1302090260372;
	Wed, 06 Apr 2011 04:44:20 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b18sm161291fak.32.2011.04.06.04.44.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 04:44:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 13:44:03 +0200
Message-Id: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [RFC][WIP] xorg-xserver upgrade
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
X-List-Received-Date: Wed, 06 Apr 2011 11:46:30 -0000

Please review and test following patches.

Last 2 are really WIP, I don't know if I'll find time to finish 
xserver-1.10.ABI.patch (volunteers welcome) or rather drop it from om-gta0*



