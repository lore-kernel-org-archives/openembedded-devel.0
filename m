Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OqV3S-0004wT-Nc
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 19:57:41 +0200
Received: by wyg36 with SMTP id 36so7576859wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Lgh3mlbHZsNoG0migNLd0iGH7VXKDLjozljDvG7Nd9E=;
	b=hLd+XH5k2OPTWU9pz426IlvuH3afk8P661YAUEdThrgh2E2ClChPygWagMzpVX7qgE
	b42KGn845mi4llKP83gbJjQAJoG3CKlSHWttGxzZd0AvbsnQ84NX0RLNCm4F5JmBz8km
	xMma9AdmS0QH6KP2y1r5AZc4GvSItcAog6DQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=tMK4R6mUPUxwVk00U/kPIXGIPcLuJ+AR48D8VDrnPyEHjrdHv3ztB3qeMk6iws5f84
	dww1u2af+AGZleqE9y8E3MO2XLTLvKSLEuoj8O/js/sMwmN5grYRaQSTV7ePiFNSyUtz
	pgbIq7s5/kn2yr3pkIne91qfoPhzOEy2vBZmo=
MIME-Version: 1.0
Received: by 10.227.140.154 with SMTP id i26mr5921851wbu.199.1283277291809;
	Tue, 31 Aug 2010 10:54:51 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Tue, 31 Aug 2010 10:54:51 -0700 (PDT)
Date: Tue, 31 Aug 2010 10:54:51 -0700
Message-ID: <AANLkTi=g-_nhnDWGwoxf7-MaJ=JG_Yp6Uvu-crmOLv=O@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: coreutils 8.5
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
X-List-Received-Date: Tue, 31 Aug 2010 17:58:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

While building my image I am seeing this message coming up building coreutils:

NOTE: Running task 8912 of 10787 (ID: 7139,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/coreutils/coreutils_8.5.bb,
do_package)
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Couldn't find shared library provider for libgcc_s.so.1
NOTE: Running task 8913 of 10787 (ID: 7144,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/coreutils/coreutils_8.5.bb,
do_package_write_ipk)
Packaged contents of coreutils-dbg into
/home/vdubhack/overo-oe/tmp/deploy/glibc/ipk/armv7a/coreutils-dbg_8.5-r0.5_armv7a.ipk
Packaged contents of coreutils into
/home/vdubhack/overo-oe/tmp/deploy/glibc/ipk/armv7a/coreutils_8.5-r0.5_armv7a.ipk
Packaged contents of coreutils-doc into
/home/vdubhack/overo-oe/tmp/deploy/glibc/ipk/armv7a/coreutils-doc_8.5-r0.5_armv7a.ipk


Is this something normal and to be expected or is there an error in
the recipe? Thanks for any help and or info on this.


