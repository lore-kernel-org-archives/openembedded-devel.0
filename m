Received: from [199.44.250.2] (helo=exchsrvr.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1Lez3X-0002nW-TA
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 22:55:12 +0100
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Wed, 4 Mar 2009 16:54:56 -0500
Message-ID: <EC5EE493B6046F45A2DDEC4A828DE52E039C63A2@EXCHSRVR.syntech.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Getting "fatal: Not a git repository"
thread-index: AcmdE9tdQXPL8mFdRiSE0QvqYW6TFQ==
From: "Mark Butsch" <mbutsch@syntech-fuelmaster.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Getting "fatal: Not a git repository"
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
X-List-Received-Date: Wed, 04 Mar 2009 21:55:12 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am getting the message "fatal: Not a git repository" when I build. It
doesn't seem to be causing a problem, but it bothers me none the less.

---------
[mbutsch@tuxoe 4G]$ bitbake task-base
NOTE: Handling BitBake files: \ (6587/6587) [100 %]
NOTE: Parsing finished. 6325 cached, 0 parsed, 262 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200903041647: started
fatal: Not a git repository
fatal: Not a git repository

OE Build Configuration:
BB_VERSION        =3D "1.8.13"
METADATA_BRANCH   =3D "<unknown>"
METADATA_REVISION =3D "<unknown>"
TARGET_ARCH       =3D "i686"
TARGET_OS         =3D "linux"
MACHINE           =3D "4g-i686"
DISTRO            =3D "4g"
DISTRO_VERSION    =3D ".dev-snapshot-20090304"
TARGET_FPU        =3D ""
-----------

I am using an overlay, is that causing this?

Any suggestions on how to solve this?

Thanks,

Mark



