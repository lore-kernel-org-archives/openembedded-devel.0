Received: from [58.185.154.238] (helo=cassis-intl.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <galvez.andy@cassis-intl.com>) id 1MYCPE-00010K-Ku
	for openembedded-devel@openembedded.org; Tue, 04 Aug 2009 07:17:51 +0200
Received: (qmail 2198 invoked by uid 509); 4 Aug 2009 12:56:16 +0800
Received: from 10.65.9.1 by postman.cassis-intl.com (envelope-from
	<galvez.andy@cassis-intl.com>,
	uid 501) with qmail-scanner-1.25-st-qms 
	(clamdscan: 0.83/1213. spamassassin: 3.0.4. perlscan: 1.25-st-qms.  
	Clear:RC:1(10.65.9.1):. 
	Processed in 0.027786 secs); 04 Aug 2009 04:56:16 -0000
X-Antivirus-MYDOMAIN-Mail-From: galvez.andy@cassis-intl.com via
	postman.cassis-intl.com
X-Antivirus-MYDOMAIN: 1.25-st-qms (Clear:RC:1(10.65.9.1):. Processed in
	0.027786 secs Process 2191)
Received: from unknown (HELO galvezljxpdt1) (10.65.9.1)
	by cassis-intl.com with SMTP; 4 Aug 2009 12:56:16 +0800
Message-ID: <BE93AD82B8E74B89970AC1E6DFDE5F41@sg01.cassis>
From: "Leandro Q. Galvez" <galvez.andy@cassis-intl.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Aug 2009 13:10:49 +0800
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Subject: Cannot find package angstrom-version.
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
X-List-Received-Date: Tue, 04 Aug 2009 05:17:56 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Hi,

    I am trying to build opie-image using openembedded. while doing the 
do_rootfs stage, my build encountered the error below.  Anybody knows how I 
can get around with it? I even manually issued bitbake angstrom-version to 
get around it thinking that the dependency is somehow broken, it built it 
and it finished the build for the angstrom-version but when I re issued the 
bitbake opie-image, again it failed with the same error as shown below. 
Anybody can help?

log_check: There were error messages in the logfile
log_check: Matched keyword: [Cannot find package]
  *  angstrom-version *
 * Cannot find package angstrom-version.
+ export D=/media/OpieDrive/oebase/dragon/tmp/rootfs/opie-image

log_check: There were error messages in the logfile
log_check: Matched keyword: [Cannot satisfy the following dependencies]
Collected errors:
 * ERROR: Cannot satisfy the following dependencies for task-base-extended:
  *  angstrom-version

Thanks and best regards,
Andy 



