Received: from [84.12.140.56] (helo=moneypenny.softoption.local)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <Mark.Howells@softoption.com>) id 1GMi95-0003GV-HG
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Sep 2006 11:32:03 +0200
MIME-Version: 1.0
Date: Mon, 11 Sep 2006 10:27:40 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
Message-ID: <5144EF5B0ABC6745BEE64C74E43ABD8F11A135@moneypenny.softoption.local>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Quick question on SRC_URI in bitbake files
Thread-Index: AcbVhIbDhvma5s38SPewvLB25Y7DSA==
From: "Mark Howells" <Mark.Howells@softoption.com>
To: <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.8
Subject: Quick question on SRC_URI in bitbake files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Sep 2006 09:32:04 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Does anyone know how I can tell bitbake how to use the Mercurial =
repository manager to get sources (rather than http,ftp, cvs etc). In =
particular I want to get make a bb file that knows how to build the dvb =
drivers at HYPERLINK "http://www.linuxtv.org"www.linuxtv.org - it's a =
real pain (and somewhat contrary to the whole idea) to have to =
pre-download an image manually. I guess I want to be able to define a =
do_unpack() method...
=20
Thanks
=20
Mark

--=20
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.1.406 / Virus Database: 268.12.2/442 - Release Date: =
08/09/2006
=20

