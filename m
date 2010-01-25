Received: from bay0-omc4-s26.bay0.hotmail.com ([65.54.190.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NZPxi-0000Yc-85
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 15:30:45 +0100
Received: from BAY127-W22 ([65.54.190.199]) by bay0-omc4-s26.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 25 Jan 2010 06:25:09 -0800
Message-ID: <BAY127-W22F0F525D60D5F6AD43D37D85F0@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Jan 2010 19:25:09 +0500
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Jan 2010 14:25:09.0686 (UTC)
	FILETIME=[32ED7D60:01CA9DCA]
X-SA-Exim-Connect-IP: 65.54.190.228
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Erorr in bitbaking console-image
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
X-List-Received-Date: Mon, 25 Jan 2010 14:30:45 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


Hi I am building console-image but I am getting error while ding this.Termi=
nal window  is looking like below.

[saleh@localhost ~]$ export PATH=3D/oe/bitbake/bin:$PATH
[saleh@localhost ~]$ export BBPATH=3D/oe/build:/oe/openembedded:/oe/ossie_c=
ollection
[saleh@localhost ~]$ bitbake console-iamge
NOTE: Handling BitBake files: | (7648/7648) [100 %]
NOTE: Parsing finished. 7041 cached=2C 300 parsed=2C 307 skipped=2C 0 maske=
d.
ERROR: Nothing PROVIDES 'console-iamge'

Here oe is directory where I've placed openembedded and ossie_collection is=
 another directory which contains ossie related metadata files which I want=
 to bitbake.

Plz help me in removing this error.

Saleh
 		 	   		 =20
_________________________________________________________________
Keep your friends updated=97even when you=92re not signed in.
http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/so=
cial-network-basics.aspx?ocid=3DPID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_5:092=
010=

