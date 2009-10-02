Received: from [209.85.216.184] (helo=mail-px0-f184.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mail@april1985.com>) id 1MtkGJ-0002Tz-H7
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 17:41:42 +0200
Received: by pxi14 with SMTP id 14so1373457pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2009 08:40:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.74.1 with SMTP id w1mr343845wfa.156.1254498053277; Fri, 02 
	Oct 2009 08:40:53 -0700 (PDT)
Date: Fri, 2 Oct 2009 23:40:53 +0800
Message-ID: <fd72b8f50910020840r55927655h94deabff2e4da7cb@mail.gmail.com>
From: mail mail <mail@april1985.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.184
X-SA-Exim-Mail-From: mail@april1985.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: libmikmod_3.2.0-beta2, build error
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
X-List-Received-Date: Fri, 02 Oct 2009 15:41:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Log file here:
NOTE: Running task 1371 of 2265 (ID: 1561,
/home/derek/mini2440/oe/openembedded/recipes/libmikmod/
libmikmod_3.2.0-beta2.bb, do_package)
ERROR: QA Issue with libmikmod: No GNU_HASH in the elf binary:
'/home/derek/mini2440/oe/tmp/work/armv4t-angstrom-linux-gnueabi/libmikmod-3.2.0-beta2-r0/install/libmikmod/usr/lib/libmikmod.so.3.0.0'
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Error in executing:
/home/derek/mini2440/oe/openembedded/recipes/libmikmod/
libmikmod_3.2.0-beta2.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/derek/mini2440/oe/openembedded/recipes/libmikmod/
libmikmod_3.2.0-beta2.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/derek/mini2440/oe/openembedded/recipes/libmikmod/
libmikmod_3.2.0-beta2.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/derek/mini2440/oe/openembedded/recipes/libmikmod/
libmikmod_3.2.0-beta2.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of /home/derek/mini2440/oe/openembedded/recipes/libmikmod/
libmikmod_3.2.0-beta2.bb do_package failed

