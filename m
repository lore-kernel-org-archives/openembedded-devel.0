Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M6PgK-0002UC-0e
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 15:48:41 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M6PZD-0001iF-0y
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 13:41:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 19 May 2009 13:41:15 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 19 May 2009 13:41:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 19 May 2009 15:41:03 +0200
Message-ID: <guuctg$d52$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090515 Shredder/3.0b3pre
Sender: news <news@ger.gmane.org>
Subject: Patches in patchwork
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
X-List-Received-Date: Tue, 19 May 2009 13:48:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The following patches in patchwork still have the 'new' status:

(e)glibc.inc: add minimal sane kernel versions	
  wvstreams fix	
  cacao: add missing patch	
  checksums.ini: added entry for gtksourceview2_2.6.0	
  gtksourceview: renamed the 1.x tree to gtksourceview1	
  gtksourceview2 2.6.0: new recipe for the current stable version.	
  bitbake.conf, freeze.inc: Add version lockdown implementation and use 
it by default.	
  linux: drop alix, move geodelx to 2.6.29	
  kaeilos: use include/sane-feed.inc	
  kaeilos.inc/sane-feed.inc: use spaces instead of tabs	
  kaeilos/sane-feed: remove alix, mark geodelx as i586	
  Remove alix machine, update geodelx one to use Alix settings	
  at2440evb.conf: Add AT2440EVB machine config.	
  mtools now an FSF project	
  grub: Split the grub-install script and friends into a separate package.	
  Remove unused grub-0.93.	
  python-native_2.6.1.bb: Add zlib-native to DEPENDS	
  u-boot: update git recipe with the new DaVinci EVMs	
  linux-davinci: build linux-davinci kernels for dm6446, dm6467 and 
dm355 EVMs	
  dm357-evm: add new machine definition	
  dm365-evm: add new machine definition	
  dm355-evm: add new machine definition and defconfig	
  dm6467-evm: add new machine definition and defconfig	
  dm6446-evm: rename machine from davinci-dvevm and add defconfig	
  davinci.inc: add common DaVinci machine configuration	
  x11-gpe-java-image: gdk-pixbuf	
  python-native_2.6.1.bb: Configure with --with-zlib	
  grub: split menu.lst into a separate package, grub-config.	
  grub: use ${libdir}, not /usr/lib	
  Remove unused grub-0.93.	
  at2440evb.conf: Add AT2440EVB machine config.	
  grub: allow menu.lst to be overridden using GRUB_CONFIG_PACKAGE.	
  Remove unused grub-0.93.	
  kernel.bbclass: also stage include/trace if it's available	
  kernel.bbclass: stage more include files for x86 in 2.6.27+	
  Fix staging of binutils static libraries	
  enable zlib in python-native to fix image building, cannot import 
gzip module	
  gcc_4.2.4.bb: QA Issue: No GNU_HASH in theelf binary	
  gcc_4.2.4.bb: QA Issue: No GNU_HASH in theelf binary	
  uclibc-initial: Fix FILESPATH mangling in all versions	
  dsplink: change path to the XDC tools directory	
  gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary	

All: please have a look at them and update the status/mail 
comments/apply/whatever.

The oldest ones are nearly a month old now...


regards,

Koen



