Received: from [85.37.17.112] (helo=smtp-out112.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MwxII-0000I8-Jt
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Oct 2009 14:13:01 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 11 Oct 2009 14:12:05 +0200
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 11 Oct 2009 14:11:46 +0200
Received: from [192.168.1.109] ([79.54.159.137]) by FBCMCL01B04.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 11 Oct 2009 14:11:46 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200910080153.12683.david.lanzendoerfer@o2s.ch>
References: <200910080153.12683.david.lanzendoerfer@o2s.ch>
Date: Sun, 11 Oct 2009 14:11:38 +0200
Message-Id: <1255263098.13058.8.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-OriginalArrivalTime: 11 Oct 2009 12:11:46.0710 (UTC)
	FILETIME=[00FEC360:01CA4A6C]
X-SA-Exim-Connect-IP: 85.37.17.112
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patches and commitment
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
X-List-Received-Date: Sun, 11 Oct 2009 12:13:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2009-10-08 at 01:53 +0200, David Lanzend=C3=B6rfer wrote:
> Hi folks
> I started the project OpenMoko4HTC-Dream[1] and I'd like to have access t=
o=20
> push and commit, because I'm developing on a new image for OpenMoko, call=
ed
> fso-hildon-image.
> Until I get access, it would be nice, if someone could merge the followin=
g=20
> patches into org.openembedded.dev
> They are fixing building issues and add htcdream to the list of supported=
=20
> devices.
>=20
> nice greatings
> 	leviathan
I've also been working on htcdream support but for shr/import
basically I'm currently working on importing alsa and wanted alsa+wifi
+touchscreen(I've only a working tslib driver for now...not an evdev one
with the filters) so obviously I've machine.conf etc...
but all the things I have are in the shr folders(for the config files)
btw David Lanzend=C3=B6rfer got wifi working following
http://bobcopeland.com/android_wifi.html I did not have time to look for
wifi(still alsa and evdev to finish)
Denis.




