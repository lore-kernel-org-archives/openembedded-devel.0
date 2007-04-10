Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HbOVM-00068w-8i
	for openembedded-devel@openembedded.org; Wed, 11 Apr 2007 00:08:00 +0200
Received: from dominion.dominion.void (dominion.kabel.utwente.nl
	[130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3AM7tLr027781 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2007 00:07:56 +0200
Received: from www-data by dominion.dominion.void with local (Exim 4.60)
	(envelope-from <k.kooi@student.utwente.nl>) id 1HbOVK-0005xK-5V
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2007 00:07:58 +0200
Received: from 212.41.157.237 ([212.41.157.237]) 
	by dominion.kabel.utwente.nl (IMP) with HTTP 
	for <koen@localhost>; Wed, 11 Apr 2007 00:07:57 +0200
Message-ID: <1176242877.461c0abdeb0cd@dominion.kabel.utwente.nl>
Date: Wed, 11 Apr 2007 00:07:57 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
References: <461BB515.7030108@balister.org>
	<200704101902.04699.repvik@kynisk.com>
	<461BC751.4090606@balister.org>
	<200704101932.19318.repvik@kynisk.com>
In-Reply-To: <200704101932.19318.repvik@kynisk.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.6
X-Originating-IP: 212.41.157.237
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l3AM7tLr027781
Subject: Re: RFC: U-Boot package clean up
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2007 22:08:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Quoting =C3=98yvind Repvik <repvik@kynisk.com>:

> Add u-boot-utils as a sub-package of u-boot.

That will break for the openmoko uboot, since that doesn't build as arm/E=
ABI,
but I do need mkimage to build the kernel.

regards,

Koen

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


