Received: from server211.wifirst.net ([213.91.4.211] helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <adrien.demarez@bolloretelecom.eu>)
	id 1OBpfi-0006F4-St for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 15:38:55 +0200
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 9D21B5FFA6;
	Tue, 11 May 2010 15:28:21 +0200 (CEST)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 2FA485FFD9;
	Tue, 11 May 2010 15:28:21 +0200 (CEST)
Received: from blini.bolloretelecom.eu
	(LMontsouris-156-26-24-166.w80-14.abo.wanadoo.fr [80.14.183.166])
	by bart.wifirst.net (Postfix) with ESMTP id 6FAA55FFA8;
	Tue, 11 May 2010 15:28:19 +0200 (CEST)
Received: from [192.168.95.152] (unknown [192.168.95.152])
	by blini.bolloretelecom.eu (Postfix) with ESMTPSA id 12B2F23EB7;
	Tue, 11 May 2010 15:28:19 +0200 (CEST)
From: Adrien Demarez <adrien.demarez@bolloretelecom.eu>
Date: Tue, 11 May 2010 15:28:18 +0200
Message-Id: <6E4816EA-E232-4559-BA26-E62F885B0644@bolloretelecom.eu>
To: Koen Kooi <k.kooi@student.utwente.nl>
Mime-Version: 1.0 (Apple Message framework v1078)
X-Mailer: Apple Mail (2.1078)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: adrien.demarez@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Trolltech FTP -> Nokia HTTP
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
X-List-Received-Date: Tue, 11 May 2010 13:38:55 -0000
Content-Type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,

Most products from Trolltech still have their SRC_URI pointing to =
ftp://ftp.trolltech.com.
Since Trolltech was bought by Nokia, everything now hosted on =
http://get.qt.nokia.com/, with the same directory structure. Although =
the legacy Trolltech FTP is still working, the downloads on =
http://get.qt.nokia.com/* are much faster, and also probably more =
reliable in the long term. Thus I propose to change the SRC_URI of all =
Trolltech softwares (e.g. QT...) as described in the attached patch (of =
course, the checksums do not change).

Best regards,


--
Adrien Demarez
Bollor=E9 telecom
Bureaux/Office : 11bis, rue Scribe | F-75009 Paris
Tel : +33 1 78 14 04 08 / +33 6 49 46 96 03
www.bolloretelecom.eu
>> Mobile broadband is here and across Europe! See us @ =
http://www.wimaxoperators.org/regional/europe


