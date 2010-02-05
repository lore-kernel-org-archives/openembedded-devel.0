Received: from eu1sys200aog101.obsmtp.com ([207.126.144.111])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <jgrant@vml.com>) id 1NdU1i-0004wN-8r
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 20:39:41 +0100
Received: from source ([208.7.47.154]) (using TLSv1) by
	eu1sys200aob101.postini.com ([207.126.147.11]) with SMTP
	ID DSNKS2xzZogz/ehzPt9k6hG+WcdIiCRmZCpg@postini.com;
	Fri, 05 Feb 2010 19:37:10 UTC
Received: from Exchange.VML.LAN ([fe80::810e:ec00:d8da:fc48]) by vmle2kcas1
	([172.16.128.154]) with mapi; Fri, 5 Feb 2010 13:29:02 -0600
From: Jeremy Grant <jgrant@vml.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Feb 2010 13:28:59 -0600
Thread-Topic: Working with OEMs
Thread-Index: AcqmmXb9PxWRa0pIO0+Zp+Pd7mLKNg==
Message-ID: <C791CD9B.22735%jgrant@vml.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
X-SA-Exim-Connect-IP: 207.126.144.111
X-SA-Exim-Mail-From: jgrant@vml.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Working with OEMs
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
X-List-Received-Date: Fri, 05 Feb 2010 19:39:41 -0000
Content-Language: en
Content-Type: text/plain; charset="iso-8859-1"

   I am currently working on project that we are planning on using
   openembedded.  We will be using 6 ereader devices initially from 2
   different manufactures.  One of the manufactures already uses open
   embedded the other is not.  We are needing to explain to the other OEM
   why they should be uses open embedded to build the images used on the
   devices so that all devices are consistent and can pull from one feed
   source for updates.
   Here are a few of the requirements I have right now:
   Must use qt-embedded 4.6.x
   Would be nice if it can uses arora-e
   I have a few question on what I should be doing.
   Should I create my own distribution based on angstrom or just create
   and image with preferred-versions for the ereaders and used angstrom as
   the distro?
   What suggestions does anyone have on working with the OEM that does not
   uses OE already to help them see why using OE would be beneficial to
   them?  I find information on why developers and distribution
   maintainers should uses OE but not much information on how an OEM could
   create machine.conf to be used with OE or use OE.  I may just have not
   found the correct presentation or blog that has the information I am
   looking for.
   Thanks for any help you can give.
   Jeremy Grant
   VML | Lead Systems Administrator
   2020 Baltimore, Kansas City, MO 64108
   office: +1.816.218.1956
   fax: +1.816.472.5234
   mobile: +1.913.636.1112
   email: [1]jgrant@vml.com

   Before you print, please think about the environment.
   Confidentiality Statement This transmission is confidential and
   intended solely for the party to whom it is addressed. If the reader of
   this email is not the intended recipient, you are hereby notified that
   it may contain privileged, confidential and trade secret information,
   and that any dissemination, distribution, copying or use of the
   information in this transmission is strictly prohibited. If you have
   received this transmission in error, please immediately notify the
   sender at the email address above, and delete all copies of it from
   your computer.

References

   1. file://localhost/tmp/jgrant@vml.com

