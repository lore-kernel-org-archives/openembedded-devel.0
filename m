Received: from bay0-omc4-s14.bay0.hotmail.com ([65.54.190.216])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <salehusman@hotmail.com>) id 1PuQx8-0006nc-8I
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 15:53:30 +0100
Received: from BAY127-W20 ([65.54.190.199]) by bay0-omc4-s14.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 1 Mar 2011 06:50:09 -0800
Message-ID: <BAY127-W206420CDF3284BCE4FAF0CD8C10@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Mar 2011 19:50:09 +0500
Importance: Normal
In-Reply-To: <BAY127-W1192DA5D5640002E5C3260D8DE0@phx.gbl>
References: <BAY127-W1192DA5D5640002E5C3260D8DE0@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Mar 2011 14:50:09.0240 (UTC)
	FILETIME=[F5F74580:01CBD81F]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: linux-libc-headers do fetch Failed
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
X-List-Received-Date: Tue, 01 Mar 2011 14:53:30 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable







Hi
I am building console-image and having problem while fetching liunx-libc-he=
aders. Its giving an error of checksum mismatch. Kindly guide me how to res=
olve this issue.console log follows

NOTE: Running task 16 of 4329 (ID: 678=2C virtual:native:/oe/openembedded/r=
ecipes/linux-libc-headers/linux-libc-headers_2.6.31.bb=2C do_fetch)
NOTE: package linux-libc-headers-native-2.6.31-r6: task do_fetch: Started
FATAL: linux-libc-headers-native-2.6.31: http://kernel.org/pub/linux/kernel=
/v2.6/linux-2.6.31.tar.bz2 cannot check archive integrity
ERROR: Error in executing python function in: /oe/openembedded/recipes/linu=
x-libc-headers/linux-libc-headers_2.6.31.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Function base_do_fetch failed
ERROR: TaskFailed event exception=2C aborting
ERROR: Build of virtual:native:/oe/openembedded/recipes/linux-libc-headers/=
linux-libc-headers_2.6.31.bb do_fetch failed
NOTE: The checksums for '/oe/openembedded/sources/linux-2.6.31.tar.bz2' did=
 not match.
Expected MD5: '84c077a37684e4cbfa67b18154390d8a' and Got: '9244b699b966804d=
fc2e243c89b3ead4'
Expected SHA256: '0acd83f7b85db7ee18c2b0b7505e1ba6fd722c36f49a8870a831c8516=
60e3512' and Got: 'c522e06dc9639473f9962ed49b038ef5577e5d10cd2f4d9e4c62cdf3=
223de089'
NOTE: Your checksums:
SRC_URI[md5sum] =3D "9244b699b966804dfc2e243c89b3ead4"
SRC_URI[sha256sum] =3D "c522e06dc9639473f9962ed49b038ef5577e5d10cd2f4d9e4c6=
2cdf3223de089"

FATAL: linux-libc-headers-native-2.6.31: http://kernel.org/pub/linux/kernel=
/v2.6/linux-2.6.31.tar.bz2 cannot check archive integrity

Saelh Usman


 		 	   		  =

