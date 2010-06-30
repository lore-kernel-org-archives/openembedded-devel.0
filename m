Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlTN-0002HK-Ll
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:48:22 +0200
Received: by gwj18 with SMTP id 18so144999gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=ugLnT532Doarc+tI2h69dv+JOSR0vJ5+sOHouQgpgF0=;
	b=fisxXz4ohxXhFRupG2cc+0jswBFqeZchFYSurpNyQetd3Gxm5IznjlxzvTxvn0GZk0
	NnBi76XVnxzwmTgloJiZSCsXnXA2I/ZGEtKHuOtL8twtw3XVlfPrG8rf4C62ELc/t0gA
	hy48L9EPpHmVsyDVbDAHcX9YPruQRc3tekd+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=glFMrsRrjZh7r0KS31YBwWVnUr1wV/G+fcwmSj9feZLBYnFJTOm2xS0u+LPkyFjwBC
	ZZxm6WUXK4gZ+GqQpsDEYzIyeURJd5a5JTuc0VH1alPJS1Q2K7p8PHeUTRzJYZDvAZ12
	6fRKcLtJS70agbnF6GF9eeKt55PbxN4X1lJ/s=
Received: by 10.101.128.14 with SMTP id f14mr9698570ann.46.1277858613629;
	Tue, 29 Jun 2010 17:43:33 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id b11sm10624359ana.6.2010.06.29.17.43.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:43:33 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:43:17 -0300
Message-Id: <1277858599-27400-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Added new cmake version
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
X-List-Received-Date: Wed, 30 Jun 2010 00:48:22 -0000

[PATCH 1/2] add cmake 2.8.1recipes/cmake/cmake-native_2.8.1.bb
[PATCH 2/2] replace sdk -> nativesdk

Thanks


