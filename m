Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObXI8-0002dT-1h for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 13:16:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ObXHy-0004gD-MU for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 13:16:38 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 13:16:38 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 13:16:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 21 Jul 2010 13:16:24 +0200
Message-ID: <i26ku8$3cu$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: legacy staging
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
X-List-Received-Date: Wed, 21 Jul 2010 11:16:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I built only a small sample of packages (angstrom-gnome-image and
openjdk) and I get these 53 in legagy-staging.log:

bcel/bcel_5.2.bb
cacao/cacaoh-native_0.99.3.bb
classpath/classpath-tools-native.bb
classpath/classpath_0.98.bb
cup/cup_0.10k.bb
dbus/dbus-glib-native_0.76.bb
gawk/gawk-native_3.1.4.bb
gdbm/gdbm-native_1.8.3.bb
gdbm/gdbm_1.8.3.bb
glib-1.2/glib-1.2-native_1.2.10.bb
gnome/gconf-native_2.6.1.bb
gnome/pyorbit_2.24.0.bb
gtk+/gtk+-1.2_1.2.10.bb
guile/guile_1.8.7.bb
intltool/intltool_0.40.3.bb
jakarta-libs/regexp_1.5.bb
jamvm/jamvm-initial_1.4.5.bb
jlex/jlex_1.2.6.bb
libffi/libffi-native_2.0+gcc4.3.2.bb
libffi/libffi_3.0.8.bb
libfribidi/libfribidi-native_0.10.4.bb
libglade/libglade_2.6.4.bb
libgsm/libgsm_1.0.12.bb
libtool/libtool-cross_2.2.6b.bb
libtool/libtool_2.2.6b.bb
llvm/llvm2.7-native_2.7.bb
llvm/llvm2.7_2.7.bb
makedevs/makedevs-native_1.0.0.bb
mml-widget/gtkmathview_0.8.0.bb
mozilla/rhino_1.7r1.bb
mpeg2dec/mpeg2dec_0.4.0b.bb
mysql/mysql5-native_5.1.40.bb
mysql/mysql5_5.1.40.bb
openjdk/openjdk-6_6b18-1.8.bb
openobex/openobex_1.5.bb
perl/libnet-dbus-perl_0.33.6.bb
perl/libxml-parser-perl_2.36.bb
perl/libxml-simple-perl_2.18.bb
perl/libxml-twig-perl_3.33.bb
perl/perl_5.8.8.bb
python/python-docutils-native_0.5.bb
python/python_2.6.4.bb
samba/samba_3.3.9.bb
squashfs-tools/squashfs-tools-native_4.0.bb
tcltk/tcl-native_8.4.19.bb
tzcode/tzcode-native_2010j.bb
u-boot/u-boot_git.bb
xalan-j/xalan-j_2.7.1.bb
xerces-j/xerces-j_2.9.1.bb
xml-commons/jaxp1.3_1.3.04.bb
xml-commons/xml-commons-resolver1.1_1.2.bb
xorg-font/font-util-native_1.1.1.bb
xorg-proto/calibrateproto_git.bb


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMRtcIMkyGM64RGpERApIlAKC5BoaFsz4G348MpmRqmyWPkFsOfgCbBuF+
GByn4M5ZujEMfxs6v8WSUSk=
=Pmnm
-----END PGP SIGNATURE-----



