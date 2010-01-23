Received: from bay0-omc4-s15.bay0.hotmail.com ([65.54.190.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NYdh1-0006Ud-ML
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:58:18 +0100
Received: from BAY127-W1 ([65.54.190.199]) by bay0-omc4-s15.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 23 Jan 2010 02:54:53 -0800
Message-ID: <BAY127-W183F184A476C4349CC958D8610@phx.gbl>
X-Originating-IP: [119.152.44.229]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	<andrea.adami@gmail.com>
Date: Sat, 23 Jan 2010 15:54:52 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 23 Jan 2010 10:54:53.0416 (UTC)
	FILETIME=[7E37F680:01CA9C1A]
X-SA-Exim-Connect-IP: 65.54.190.217
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: (No subject)
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
X-List-Received-Date: Sat, 23 Jan 2010 10:58:19 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


How I can solve this problem? any solution? guidance? tutorial?Plz help me =
in moving forword.RegardsSaleh >>>>BBFILES =3D "/oe/org.openembedded.dev/pa=
ckages/*/*.bb  /oe/ossie_collection/packages/*/*.bb"
This seems wrong

>>>>NOTE: Handling BitBake files: \ (0014/0014) [100 %]
In fact you get just 14 items...

>>Dunno about ossie=2C but in openembedded we moved from 'packages' to 'rec=
ipes'.

>>Regards

>>Andrea
 >>>>I've built console-image without adding the following lines in local.c=
onf

 file and it has been built successfully.Now when I've added these lines it=
 is

giving  error.Attached is local.conf file.

>> >>ANGSTROM_EXTRA_INSTALL =3D " screen oprofile ossie-fm-from-file "

BBFILES =3D "/oe/org.openembedded.dev/packages/*/*.bb  /oe/ossie_collection=
/packages/*/*.bb"

BBFILE_COLLECTIONS =3D "upstream ossie"

BBFILE_PATTERN_upstream =3D "^/oe/org.openembedded.dev/packages"

BBFILE_PRIORITY_upstream =3D "5"

BBFILE_PATTERN_ossie =3D "^/oe/ossie/packages"

BBFILE_PRIORITY_ossie =3D "10"

Where oe is directory in which I've placed openembedded.

 Terminal window is showing following error.

[saleh <at> localhost ~]$ bitbake console-image

NOTE: Out of date cache found=2C rebuilding...

NOTE: Handling BitBake files: \ (0014/0014) [100 %]

NOTE: Parsing finished. 0 cached=2C 14 parsed=2C 0 skipped=2C 0 masked.

 ERROR: Nothing PROVIDES 'console-image' 		 	   		 =20
_________________________________________________________________
Keep your friends updated=97even when you=92re not signed in.
http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/so=
cial-network-basics.aspx?ocid=3DPID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_5:092=
010=

