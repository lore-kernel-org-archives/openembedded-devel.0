Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mrt.karadenz@gmail.com>) id 1Ntmpi-0000sz-5A
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 19:58:38 +0100
Received: by pwi2 with SMTP id 2so456633pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 11:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:organization:to:subject
	:date:user-agent:mime-version:content-type:content-transfer-encoding
	:message-id; bh=2izo7BPgkc7WDsVrD2q9O7gVhneUn8U6PKg6dwS8CdQ=;
	b=ak75QArHXv/HMqsyQriCoKkdfy78t9Qt6X4RdI8m5Sz3g0wWWCzlEHfT9bvFrMyqGK
	NHGAAPNk6rPRNpOX6x/lMsJnEtd3MClNeJKcG6EXFO99XR25Gz2xbwgS8dQqKqQQxZt+
	AuZvkMZSkL455Nx8JhlWVqtSAyCyuWq4GPdAc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=ncfSaWmEpJJgcGD4LU1Vcp/4ZUJ3KVdsAfPDLyxJ0/pMCh+TrhgVlKkxZMk4sCPGHo
	h4iL0fXLj5U8b43aY1eDxH3GaMic0TfYW3TM63qgId75H+y7YR71e4rfN1zRj5JVbnkY
	eOXW5xBu9eL0MpO/t+R9+YWlH6ZH0uB9VqpvQ=
Received: by 10.142.151.31 with SMTP id y31mr2454152wfd.107.1269284128510;
	Mon, 22 Mar 2010 11:55:28 -0700 (PDT)
Received: from linux-dm4x.localnet ([88.224.192.131])
	by mx.google.com with ESMTPS id h18sm171657wfg.13.2010.03.22.11.55.26
	(version=SSLv3 cipher=RC4-MD5); Mon, 22 Mar 2010 11:55:27 -0700 (PDT)
From: Murat Karadeniz <mrt.karadenz@gmail.com>
Organization: Bilkon Bilgisayar =?utf-8?q?Kontroll=C3=BC_Cihazlar_Ltd=2E?= 
	=?utf-8?q?_=C5=9Eti=2E?=
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 20:55:23 +0200
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-default; KDE/4.3.5; i686; ; )
MIME-Version: 1.0
Message-Id: <201003222055.23408.murat@bilkon-kontrol.com.tr>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: mrt.karadenz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: u-boot_git recipe
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
X-List-Received-Date: Mon, 22 Mar 2010 18:58:39 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

i m the newbie on using oe. i m getting this message from shell. i dont know 
why it is. bitbake version is 1.19, Machine is dm6446-evm and DISTRO is 
angstrom-2008.1

Thanks for taking your time


ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'u-
boot_git' but it wasn't found in any PACKAGE or RPROVIDES variables
Unknown Event: <bb.event.NoProvider instance at 0xf3241ac>
NOTE: Resolving any missing task queue dependencies
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'u-
boot_git' but it wasn't found in any PACKAGE or RPROVIDES variables
Unknown Event: <bb.event.NoProvider instance at 0x1159792c>
NOTE: Runtime target 'u-boot_git' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['u-boot_git']


