Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Qy1DS-0007vr-DC
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 14:45:26 +0200
Received: by fxg11 with SMTP id 11so4525302fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2011 05:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=8VFJVEHgF6CTosJeh/etcTk41paYoLmYAgVo2YHkRQ4=;
	b=RWED9Rgbym7U/xhivyYqfxfx1qbqNQI9jYze10l/8APGHa/goBCGZ66hVmZjZurB7N
	fATb91/1h5J3omfCermi5t8lLaQBi1GBdxXZVeIaqtcm8+4GsLORvLRT68p3yV5m+jOj
	yeetWoEcwvqxffckMhVE/SGiVWLtKRDRyndDU=
Received: by 10.223.4.150 with SMTP id 22mr2138291far.120.1314621634441;
	Mon, 29 Aug 2011 05:40:34 -0700 (PDT)
Received: from localhost.localdomain (mx2.promwad.com [195.222.87.218])
	by mx.google.com with ESMTPS id 25sm3736353fay.7.2011.08.29.05.40.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 05:40:33 -0700 (PDT)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.76)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Qy18i-0006yZ-Rq; Mon, 29 Aug 2011 15:40:32 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 15:40:18 +0300
Message-Id: <1314621621-26512-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.5.4
Subject: Add mycable's Fujitsu Jade Evaluation Board support
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
X-List-Received-Date: Mon, 29 Aug 2011 12:45:26 -0000

This patch series adds machine configuration, kernel and uboot patches for mycable's Fujitsu MB68R01 'Jade' SoC
(http://www.fujitsu.com/emea/services/microelectronics/gdc/gdcdevices/mb86r01-jade.html).
Kernel and u-boot patches were picked from XXSVideo project on SourceForge.



