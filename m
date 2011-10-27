Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RJMfW-000422-Gy
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 11:54:38 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p9R9mXOH029110
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Oct 2011 11:48:38 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Thu, 27 Oct 2011 11:48:34 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [2011.03-maintenance] New pull request for binutils
Thread-Index: AcyUjAXxP3SFg0+TQ1iC+tZRNdxv8A==
Date: Thu, 27 Oct 2011 09:48:32 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4013DCF6@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [2011.03-maintenance] New pull request for binutils
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
X-List-Received-Date: Thu, 27 Oct 2011 09:54:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Tom,

A new, hopefully conformant attempt at a pull request (I also sent a pull r=
equest from github but I don't know where that ended up...).
Please pull these two commits from here:

git://github.com/mkarrman/openembedded
Branch: maintenance

Paul Menzel (1):
      e5832d65b8  binutils-{canadian,cross}-sdk_2.18: Remove checksums and =
implicitly update them

Mats K=E4rrman (1):
      656bed267a  binutils_2.18: update SRC_URI to avoid manual delete

Thanks,
Mats

