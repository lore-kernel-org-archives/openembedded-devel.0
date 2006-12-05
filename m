Received: from [84.12.140.56] (helo=moneypenny.softoption.local)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <Mark.Howells@softoption.com>) id 1GrYBD-0002UW-J9
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Dec 2006 12:09:43 +0100
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Tue, 5 Dec 2006 11:08:04 -0000
Message-ID: <5144EF5B0ABC6745BEE64C74E43ABD8F11AA8C@moneypenny.softoption.local>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: e2fsprogs won't build
Thread-Index: AccYXaLzrExj8BLxT6G+0S1MxIAH8Q==
From: "Mark Howells" <Mark.Howells@softoption.com>
To: <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: e2fsprogs won't build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2006 11:09:43 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

I think _hope_ this is just a quickie - when I try to build e2fsprogs I =
see the following
=20
[snip]
Packaged contents of e2fsprogs-doc into =
/home/mark/slugos-head/openslug/tmp/deploy/ipk/e2fsprogs-doc_1.38-r6_arme=
b.ipk
NOTE: Not creating empty archive for e2fsprogs-dev-1.38-r6
ERROR: Error in executing: =
/home/mark/slugos-head/openembedded/packages/e2fsprogs/e2fsprogs_1.38.bb
ERROR: Exception:exceptions.OSError Message:[Errno 2] No such file or =
directory: =
'/home/mark/slugos-head/openslug/tmp/work/e2fsprogs-1.38-r6/install/e2fsp=
rogs-locale'
=20
In the install dir. there are a set of locale directories for =
'e2fslocale-cs', 'e2fslocale-tr' and so on but not 'e2fsprogs-locale'.
=20
Can anyone explain what I need to create in the installdir (and a =
pointer as to how I fix the bb file would be helpful).
=20
Cheers
=20
Mark

--=20
No virus found in this outgoing message.
Checked by AVG.
Version: 7.5.432 / Virus Database: 268.15.6/568 - Release Date: =
04/12/2006 15:20
=20

