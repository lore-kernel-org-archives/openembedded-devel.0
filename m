Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PWmNP-0005jX-9f
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Dec 2010 09:54:51 +0100
Received: (qmail 31208 invoked by uid 503); 26 Dec 2010 08:56:31 -0000
Received: from b9.ovh.net (HELO mail191.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 26 Dec 2010 08:56:26 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Dec 2010 10:54:34 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 26 Dec 2010 10:54:33 +0200
Message-ID: <4D1702C8.6050300@eukrea.com>
Date: Sun, 26 Dec 2010 09:54:32 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Ovh-Tracer-Id: 200691658758270281
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: angstrom-2010.x : gnome-power-manager-2.30.0-r0: libtool: Command not found
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
X-List-Received-Date: Sun, 26 Dec 2010 08:54:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

MACHINE=beagleboard
DISTRO=angstrom-2010.x

error log :
NOTE: make
make  all-recursive
make[1]: Entering directory 
`/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/work/armv7a-angs
trom-linux-gnueabi/gnome-power-manager-2.30.0-r0/gnome-power-manager-2.30.0'
Making all in src
make[2]: Entering directory 
`/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/work/armv7a-angs
trom-linux-gnueabi/gnome-power-manager-2.30.0-r0/gnome-power-manager-2.30.0/src'
libtool --mode=execute dbus-binding-tool	\
		--prefix=gpm_manager			\
		--mode=glib-server			\
		--output=org.gnome.PowerManager.h	\
		./org.gnome.PowerManager.xml
make[2]: libtool: Command not found
make[2]: *** [org.gnome.PowerManager.h] Error 127
make[2]: Leaving directory 
`/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/work/armv7a-angst
rom-linux-gnueabi/gnome-power-manager-2.30.0-r0/gnome-power-manager-2.30.0/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory 
`/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/work/armv7a-angst
rom-linux-gnueabi/gnome-power-manager-2.30.0-r0/gnome-power-manager-2.30.0'
make: *** [all] Error 2
FATAL: oe_runmake failed
ebenard@eukrea-desktop:~/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gnome-power-manager-2.30.0-r0/temp$ 
more log.do_compile.*


Eric


