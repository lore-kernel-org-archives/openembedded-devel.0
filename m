Received: from [58.185.154.238] (helo=cassis-intl.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <galvez.andy@cassis-intl.com>) id 1MYVa8-0002ol-9a
	for openembedded-devel@openembedded.org; Wed, 05 Aug 2009 03:46:28 +0200
Received: (qmail 17648 invoked by uid 509); 5 Aug 2009 09:24:31 +0800
Received: from 10.65.9.1 by postman.cassis-intl.com (envelope-from
	<galvez.andy@cassis-intl.com>,
	uid 501) with qmail-scanner-1.25-st-qms 
	(clamdscan: 0.83/1213. spamassassin: 3.0.4. perlscan: 1.25-st-qms.  
	Clear:RC:1(10.65.9.1):. 
	Processed in 0.022843 secs); 05 Aug 2009 01:24:31 -0000
X-Antivirus-MYDOMAIN-Mail-From: galvez.andy@cassis-intl.com via
	postman.cassis-intl.com
X-Antivirus-MYDOMAIN: 1.25-st-qms (Clear:RC:1(10.65.9.1):. Processed in
	0.022843 secs Process 17642)
Received: from unknown (HELO galvezljxpdt1) (10.65.9.1)
	by cassis-intl.com with SMTP; 5 Aug 2009 09:24:31 +0800
Message-ID: <5C32738B30114A07A0B8DCEFF3CC92AB@sg01.cassis>
From: "Leandro Q. Galvez" <galvez.andy@cassis-intl.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Aug 2009 09:39:08 +0800
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Subject: Openembedded Angstrom Distro Rootfs Creation Problem
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
X-List-Received-Date: Wed, 05 Aug 2009 01:46:28 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Hi,

My opie-image is failing due to missing angstrom-version ipk file. When I 
tried to rebuild the angdtrom-version recipe, I noticed that I have a 
notification "NOTE: Not creating empty archive for 
angstrom-version-2009.X-test-20090804-r2.3". Further, the opie-image build 
is throwing "Cannot find package angstrom-version. ERROR:Cannot satisfy the 
following dependencies for task-base-extended: angstrom-version" Hope 
somebody can help me here.

Thanks and best regards,
Andy



