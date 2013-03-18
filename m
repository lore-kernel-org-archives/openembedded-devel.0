Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UHc4m-000802-Az
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 16:34:18 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so6448803pbc.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2013 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=YkTjyFdScNUvSyXHOM+e3rNC9Yfb389MQ79sGGFANcg=;
	b=R9HwV/SIOuFzIOOaFU6T5EhYR3SZB/l+Eveqw/GAJNEhc5BseCpUdcX/a15upCLxbK
	nqOW09u0ZtDm3Eea/B4X7LvKG243Yl52xpEQhMTPSRH0SPvZNejeOCwNfA8AX5JqoAgN
	xOa24kUeLcPHHlxu9nEat6XkpQe420Z89Cf1cTwveFT6kKW7BiiMWOJmYh+HgyGmJqGU
	lwdK4GZQl8gu4uPn1rBjFPPv/+3mtJV9R+Pvs0H7rr9xmvd/3LF8bjqJ5cXeLQqAeGgk
	/ICGnRn0B6IfnG+/IpAAM03QOf0WM8IOqGdIKpJL9rDBbxdUzU+fAu+KqaMc2siP9Lxk
	J9VQ==
X-Received: by 10.68.190.195 with SMTP id gs3mr34805446pbc.14.1363619847656;
	Mon, 18 Mar 2013 08:17:27 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id hw16sm8576281pab.19.2013.03.18.08.17.26
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 08:17:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Mar 2013 08:17:09 -0700
Message-Id: <1363619829-17071-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH] cronie: Rename the bbappend to match OE-Core
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
X-List-Received-Date: Mon, 18 Mar 2013 15:34:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cronie_1.4.8.bbappend => cronie_1.4.9.bbappend} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/meta-oe/recipes-extended/cronie/{cronie_1.4.8.bbappend => cronie_1.4.9.bbappend} (100%)

diff --git a/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.9.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
rename to meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.9.bbappend
-- 
1.7.9.5



