Received: from smtp-relay1.palm.com ([63.80.53.70])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=Michael.Morrell=60995c565@palm.com>)
	id 1NQQIo-0004Vd-DO for openembedded-devel@lists.openembedded.org;
	Thu, 31 Dec 2009 20:03:21 +0100
X-IronPort-AV: E=Sophos;i="4.47,483,1257148800"; d="scan'208";a="21934919"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay1.palm.com with ESMTP; 31 Dec 2009 11:00:11 -0800
Received: from ushqwmh02.palm1.palmone.com (ushqwmh02.palm1.palmone.com
	[148.92.223.143])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	nBVIwTa0013246 for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2009 10:58:32 -0800 (PST)
Received: from ushqwmb02.palm1.palmone.com ([148.92.223.121]) by
	ushqwmh02.palm1.palmone.com ([148.92.223.143]) with mapi;
	Thu, 31 Dec 2009 10:55:54 -0800
From: Michael Morrell <Michael.Morrell@palm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Dec 2009 10:55:52 -0800
Thread-Topic: Two quick questions
Thread-Index: AcqKSt/Tjm3SvWUzSimD4hsHYPfMkw==
Message-ID: <D15778FFF6A6CA4FAF01B8D2C3780300499CFF2A86@ushqwmb02.palm1.palmone.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 63.80.53.70
X-SA-Exim-Mail-From: prvs=Michael.Morrell=60995c565@palm.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Two quick questions
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
X-List-Received-Date: Thu, 31 Dec 2009 19:03:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have two quick OE questions.

First, is it possible to use any of the "directives" in a bb file or conf f=
ile based on a condition?  For example, can I "inherit" a class or use "add=
task" only under certain conditions.  I couldn't find a way to do this.

Second, if I have some code common to several bb files, I can either put it=
 in a .inc file and use "require" or in a .bbclass file and use "inherit". =
 Are there any guidelines on which approach is better?

Thanks,

  Michael


