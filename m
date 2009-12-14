Received: from bay0-omc4-s12.bay0.hotmail.com ([65.54.190.214])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NKCJY-0007Pj-9n
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 15:54:25 +0100
Received: from BAY127-W23 ([65.54.190.199]) by bay0-omc4-s12.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Dec 2009 06:49:52 -0800
Message-ID: <BAY127-W239262942CF14E74E9699ED8890@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	Openembedded Charis Larson <clarson@kergoth.com>,
	<przemyslaw.wesolek@cs.put.poznan.pl>
Date: Mon, 14 Dec 2009 19:49:52 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Dec 2009 14:49:52.0419 (UTC)
	FILETIME=[B15B1730:01CA7CCC]
X-SA-Exim-Connect-IP: 65.54.190.214
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problem using "bitbake"
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
X-List-Received-Date: Mon, 14 Dec 2009 14:54:25 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


Now the lockfile path is not existing .How to remove this error. Plz help m=
e to
move forward.Terminal window is looking like this.

bitbake helloworld-image
NOTE: Handling BitBake files: \ (1324/7634) [17 %]NOTE: Angstrom DOES NOT
support libiconv because the glibc builtin iconv replacement is used
NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv
replacement is used
NOTE: Handling BitBake files: \ (2305/7634) [30 %]NOTE: Angstrom DOES NOT
support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: | (2307/7634) [30 %]NOTE: Angstrom DOES NOT
support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has bee=
n
replaced by bluez4
NOTE: Handling BitBake files: / (2320/7634) [30 %]NOTE: Angstrom DOES NOT
support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: | (2325/7634) [30 %]NOTE: Angstrom DOES NOT
support bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: Handling BitBake files: - (7634/7634) [100 %]
NOTE: Parsing finished. 0 cached=2C 7348 parsed=2C 286 skipped=2C 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 736 (ID: 19=2C
/oe/openembedded/recipes/shasum/shasum-native.bb=2C do_setscene)
NOTE: Running task 2 of 736 (ID: 20=2C
/oe/openembedded/recipes/shasum/shasum-native.bb=2C do_fetch)
NOTE: Running task 3 of 736 (ID: 21=2C
/oe/openembedded/recipes/shasum/shasum-native.bb=2C do_unpack)
NOTE: Unpacking ../openembedded/recipes/shasum/files/main.c to
tmp/work/i686-linux/shasum-native-1.0-r1/
NOTE: Unpacking ../openembedded/recipes/shasum/files/mhash_sha256.h to
tmp/work/i686-linux/shasum-native-1.0-r1/
NOTE: Unpacking ../openembedded/recipes/shasum/files/sha256.c to
tmp/work/i686-linux/shasum-native-1.0-r1/
NOTE: Running task 4 of 736 (ID: 22=2C
/oe/openembedded/recipes/shasum/shasum-native.bb=2C do_patch)
NOTE: Running task 5 of 736 (ID: 23=2C
/oe/openembedded/recipes/shasum/shasum-native.bb=2C do_configure)
NOTE: Running task 6 of 736 (ID: 24=2C
/oe/openembedded/recipes/shasum/shasum-native.bb=2C do_qa_configure)
NOTE: Running task 7 of 736 (ID: 25=2C
/oe/openembedded/recipes/shasum/shasum-native.bb=2C do_compile)
NOTE: Running task 8 of 736 (ID: 26=2C
/oe/openembedded/recipes/shasum/shasum-native.bb=2C do_install)
NOTE: Running task 9 of 736 (ID: 27=2C
/oe/openembedded/recipes/shasum/shasum-native.bb=2C do_populate_staging)
NOTE: Legacy staging mode for /oe/openembedded/recipes/shasum/shasum-native=
.bb
NOTE: Running task 10 of 736 (ID: 280=2C
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb=2C do_s=
etscene)
NOTE: Running task 11 of 736 (ID: 281=2C
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb=2C do_f=
etch)
NOTE: Running task 12 of 736 (ID: 282=2C
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb=2C do_u=
npack)
NOTE: Unpacking ../openembedded/recipes/stage-manager/files/stage-manager t=
o
tmp/work/i686-linux/stagemanager-native-0.0.1-r11/
NOTE: Unpacking ../openembedded/recipes/stage-manager/files/stage-manager-i=
pkg
to tmp/work/i686-linux/stagemanager-native-0.0.1-r11/
NOTE: Unpacking
../openembedded/recipes/stage-manager/files/stage-manager-ipkg-build to
tmp/work/i686-linux/stagemanager-native-0.0.1-r11/
NOTE: Running task 13 of 736 (ID: 283=2C
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb=2C do_p=
atch)
NOTE: Running task 14 of 736 (ID: 284=2C
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb=2C do_c=
onfigure)
NOTE: Running task 15 of 736 (ID: 285=2C
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb=2C
do_qa_configure)
NOTE: Running task 16 of 736 (ID: 286=2C
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb=2C do_c=
ompile)
NOTE: Running task 17 of 736 (ID: 287=2C
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb=2C do_i=
nstall)
NOTE: Running task 18 of 736 (ID: 288=2C
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb=2C
do_populate_staging)
NOTE: Legacy staging mode for
/oe/openembedded/recipes/stage-manager/stagemanager-native_0.0.1.bb
NOTE: Running task 19 of 736 (ID: 110=2C
/oe/openembedded/recipes/coreutils/coreutils-native_7.2.bb=2C do_setscene)
NOTE: Running task 20 of 736 (ID: 111=2C
/oe/openembedded/recipes/coreutils/coreutils-native_7.2.bb=2C do_fetch)
ERROR: Error=2C lockfile path does not exist!: ${oe}/sources
NOTE: Task failed: Unknown fetch Error: 1
ERROR: TaskFailed event exception=2C aborting
ERROR: Build of /oe/openembedded/recipes/coreutils/coreutils-native_7.2.bb
do_fetch failed
ERROR: Task 111 (/oe/openembedded/recipes/coreutils/coreutils-native_7.2.bb=
=2C
do_fetch) failed
NOTE: Tasks Summary: Attempted 19 tasks of which 0 didn't need to be rerun =
and 1
failed.
ERROR: '/oe/openembedded/recipes/coreutils/coreutils-native_7.2.bb' failed

Regards=20
Saleh Usman



rzemyslaw Wesolek <przemyslaw.wesolek <at> cs.put.poznan.pl> writes:

>=20
> saleh usman wrote:
> > If I'll use "stars" where to specify image for which bitbake will build=
.
>=20
> As usually=2C as the argument to bitbake command.
>=20
> The stars in BBFILES are replacement for path parts. Just use the
> correct prefix instead of "/stuff/openembedded/" and run 'bitbake
> helloworld-image'.
>=20
> Przemek
>=20



 		 	   		 =20
_________________________________________________________________
Keep your friends updated=97even when you=92re not signed in.
http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/so=
cial-network-basics.aspx?ocid=3DPID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_5:092=
010=

