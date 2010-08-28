Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxi-0001qj-7i
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:15 +0200
Received: by pvg6 with SMTP id 6so1648285pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=VpfoNCL9czokGx3gmCKH3s3zDhVcWhgUMptr1sX6CZo=;
	b=MQHaOXX/FsxC6IQ9z4pX0zt7DKqv8L+hRcavbrtfhUqOomo2qf2XpY02p6KE9Vnt14
	rrdN3V7G6jloeTRjfJxe3XW/dPGl+Wt5OEYwXMJ7mj2vIQKIwGiJEfmtnTXx8x7UvVti
	gTuADvVenhUESOG3SbPpa/Ujhpi1TFRRS6zs4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=m4tI1GUUaz049P6tLaFgyQiLYNgqbDKrbqOULs/e+ZVytPsUSb2G8U+Gp4m3d9CcnN
	wc46lg+99RcU216QJrLe2rbV/GmgEe9drCpobCdEeJ8HwKugih83Vny09IJNBizQ5+gJ
	qwfr4rDFNNw3wE2RrPKNTrZ9Jxix8wH0PqNmw=
Received: by 10.142.204.17 with SMTP id b17mr2789575wfg.71.1283027083146;
	Sat, 28 Aug 2010 13:24:43 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:10 -0700
Message-Id: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/23] getting to bitbake world.
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:15 -0000

Hi

I have revised the giant patch and divided it into small patches ( as
Koen's suggested)

if these patches look ok please ack

Thanks

-Khem



