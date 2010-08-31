Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OqVNp-0004Uw-Ee
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 20:17:51 +0200
Received: by fxm6 with SMTP id 6so4463852fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 11:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=uQrB5A9DlZxx/k/EfRTgKaRU/QLWRQjqEKul+FB6NhY=;
	b=MJU+UKIsY9WKr2K+l5C/3zPYDG0HiFn9VwZqE/jH+tpm/eep7npnflal5BHNpg8ufu
	r+0h2+vtq1QF1XyyOJLg6i3CkHQcGlxq+37+6p7sGLpawtuXxNSdCBRwM4kIsPRb/vMk
	97FEpuld0vuk3BRsKUdQBq365MikSTBEq8QBg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=gtB72pOhcLE3WyLivr/l5+jYheGFOymOLKo9pVLaWH4DqKAK0khno6jErGoMCcrBPl
	wLtnv5TCShk5hdPIGMGdY/58iLsq9NyEOksQ4xLFqyNYnpQ7o7ZLTO0Nbx12RKfeTfOq
	G9XNrIlwahJG3MAI2Y/7NRbGmMcKcUWn8MYYg=
Received: by 10.223.112.13 with SMTP id u13mr1087555fap.36.1283278560156; Tue,
	31 Aug 2010 11:16:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.112.81 with HTTP; Tue, 31 Aug 2010 11:15:40 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Tue, 31 Aug 2010 12:15:40 -0600
Message-ID: <AANLkTiknf6cyy6i5uE5nFAW2sTyXCDkO+aHZcibZMsYn@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: unionfs-utils fails to build also
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
X-List-Received-Date: Tue, 31 Aug 2010 18:17:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

NOTE: Running task 359 of 552 (ID: 0,
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb, do_unpack)
NOTE: Unpacking sources/unionfs-1.0.13.tar.gz to
tmp/work/armv7a-angstrom-linux-gnueabi/unionfs-utils-1.0.13-r0/
NOTE: Running task 377 of 552 (ID: 1,
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb, do_patch)
NOTE: Running task 378 of 552 (ID: 7,
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb, do_configure)
NOTE: Running task 389 of 552 (ID: 8,
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb, do_qa_configure)
NOTE: Running task 390 of 552 (ID: 9,
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb, do_compile)
NOTE: Running task 391 of 552 (ID: 2,
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb, do_install)
NOTE: Running task 395 of 552 (ID: 12,
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb, do_package)
ERROR: QA Issue with unionfs-utils: No GNU_HASH in the elf binary:
'/home/coolaj86/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/unionfs-utils-1.0.13-r0/packages-split/unionfs-utils/usr/sbin/unionctl'
ERROR: QA Issue with unionfs-utils-dev: No GNU_HASH in the elf binary:
'/home/coolaj86/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/unionfs-utils-1.0.13-r0/packages-split/unionfs-utils-dev/usr/sbin/uniondbg'
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Error in executing:
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of
/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb do_package failed
ERROR: Task 12
(/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb, do_package) failed
NOTE: Tasks Summary: Attempted 394 tasks of which 386 didn't need to be
rerun and 1 failed.
ERROR: '/home/coolaj86/overo-oe/org.openembedded.dev/recipes/unionfs/
unionfs-utils_1.0.13.bb' failed

AJ ONeal

