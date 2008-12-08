Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1L9dlV-0005nJ-ED
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 11:55:01 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id mB8AkSx2023079
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Dec 2008 02:46:28 -0800 (PST)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 8 Dec 2008 11:51:03 +0100
Received: from aeglos ([172.24.49.35]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 8 Dec 2008 11:51:03 +0100
Message-ID: <C41AF57F04424526AD798F542197E674@aeglos>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: "oe-devel" <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Dec 2008 11:48:36 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-OriginalArrivalTime: 08 Dec 2008 10:51:03.0811 (UTC)
	FILETIME=[DD95C530:01C95922]
Subject: Request for a personal git tree for AT91/AVR32
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
X-List-Received-Date: Mon, 08 Dec 2008 10:55:01 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

I have now succeeded (after some hassle) to build
Angstrom for the AT91SAM9263EK using:

linux-2.6.18-rc7     Requires new recipy
u-boot-1.3.4          Requires new recipy
dataflashboot.bin    Requires a patch and updated recipy.
shasum-native        Recipy need bugfix.                   
qemu                     Need to update host files for OpenSuSE 10.2.
checksums.ini        Needs to be updated with data for four tarballs.

While doing that, I also updated the machine descriptions for the
at32stk1000 and atngw100 to use the latest u-boot,
and added/cleaned out some machine descriptions for other 
at91sam9 machines

Would like to share it with the community,
so access to a personal git tree would be nice.

Best Regards
Ulf Samuelsson




