Received: from [58.185.154.238] (helo=cassis-intl.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <galvez.andy@cassis-intl.com>) id 1MXvN7-0006sw-Lk
	for openembedded-devel@openembedded.org; Mon, 03 Aug 2009 13:06:30 +0200
Received: (qmail 22020 invoked by uid 509); 3 Aug 2009 18:45:08 +0800
Received: from 10.65.9.1 by postman.cassis-intl.com (envelope-from
	<galvez.andy@cassis-intl.com>,
	uid 501) with qmail-scanner-1.25-st-qms 
	(clamdscan: 0.83/1213. spamassassin: 3.0.4. perlscan: 1.25-st-qms.  
	Clear:RC:1(10.65.9.1):. 
	Processed in 0.04424 secs); 03 Aug 2009 10:45:08 -0000
X-Antivirus-MYDOMAIN-Mail-From: galvez.andy@cassis-intl.com via
	postman.cassis-intl.com
X-Antivirus-MYDOMAIN: 1.25-st-qms (Clear:RC:1(10.65.9.1):. Processed in
	0.04424 secs Process 22014)
Received: from unknown (HELO galvezljxpdt1) (10.65.9.1)
	by cassis-intl.com with SMTP; 3 Aug 2009 18:45:07 +0800
Message-ID: <576338E6E56E404D801ACFEEF7A09CCE@sg01.cassis>
From: "Leandro Q. Galvez" <galvez.andy@cassis-intl.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Aug 2009 18:59:35 +0800
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: t1lib QA Issues
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
X-List-Received-Date: Mon, 03 Aug 2009 11:06:30 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

    I am trying to build opie-image using openembedded. I am receiving =
QA Issues with the t1lib having "no GNU_HASH in the elf binary: =
.../usr/lib/libt1.so.5.0.2" and "no GNU_HASH in the elf binary: =
.../usr/lib/libt1x.so.5.0.2" and having "non -dev package contains =
symlink .so: .../usr/lib/libt1x.so" and "non -dev package contains =
symlink .so: .../usr/lib/libt1.so". Does anybody have any solution for =
this?

Thanks and best regards,
Andy=20

