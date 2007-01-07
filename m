Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H3YTQ-0006lq-Q7
	for openembedded-devel@openembedded.org; Sun, 07 Jan 2007 14:54:08 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l07DqWox001912; Sun, 7 Jan 2007 14:52:32 +0100
Message-ID: <45A0FB1D.40907@dominion.kabel.utwente.nl>
Date: Sun, 07 Jan 2007 14:52:29 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org, Paul Sokolovsky <pmiscml@gmail.com>
References: <E1H3LkV-0005Np-21@linuxtogo.org>
In-Reply-To: <E1H3LkV-0005Np-21@linuxtogo.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev matchbox-panel: Update from using specific machine overrides to using machine
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
X-List-Received-Date: Sun, 07 Jan 2007 13:54:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pfalcon commit schreef:
> matchbox-panel: Update from using specific machine overrides to using machine
> features (GUI_MACHINE_CLASS).
> 
> Author: pfalcon@openembedded.org

|
/data/build/koen/OE/build/tmp/angstrom/work/collie-angstrom-linux/matchbox-panel-0.9.3-r1/temp/run.do_configure.27231:
line 196:
/data/build/koen/OE/build/tmp/angstrom/work/collie-angstrom-linux/matchbox-panel-0.9.3-r1/matchbox-panel-0.9.3/configure
              --build=i686-linux              --host=arm-angstrom-linux
- --target=arm-angstrom-linux                     --prefix=/usr
- --exec_prefix=/usr           --bindir=/usr/bin                --sbindir=/usr/sbin
            --libexecdir=/usr/libexec               --datadir=/usr/share
  --sysconfdir=/etc               --sharedstatedir=/usr/com
- --localstatedir=/var                     --libdir=/usr/lib
- --includedir=/usr/include               --oldincludedir=/usr/include
- --infodir=/usr/share/info               --mandir=/usr/share/man
- --enable-startup-notification --enable-dnotify ${CONF_${GUI_MACHINE_CLASS}}
 $@: bad substitution
NOTE: Task failed:
/data/build/koen/OE/build/tmp/angstrom/work/collie-angstrom-linux/matchbox-panel-0.9.3-r1/temp/log.do_configure.27231
NOTE: package matchbox-panel-0.9.3-r1: task do_configure: failed

Could you fix that please?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFoPsdMkyGM64RGpERAqw5AJ9FxCBw/j2GEi/dJo/4QHBH3HDZMgCgu01a
ymqJV7g1mVA3K2QU/VpSU/8=
=WGin
-----END PGP SIGNATURE-----


