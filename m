Received: from cp-out11.libero.it ([212.52.84.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ilpaso@inwind.it>) id 1Ok1Bw-0000vK-Il
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 22:49:42 +0200
Received: from [192.168.1.2] (151.47.90.212) by cp-out11.libero.it (8.5.119)
	(authenticated as ilpaso@inwind.it)
	id 4C4578E6019EB59D for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 22:46:44 +0200
From: Davide Pasini <ilpaso@inwind.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Aug 2010 22:46:42 +0200
Message-ID: <1281732402.28856.6.camel@paso-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 212.52.84.111
X-SA-Exim-Mail-From: ilpaso@inwind.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE on my new tablet. How write a new machine conf file?
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
X-List-Received-Date: Fri, 13 Aug 2010 20:49:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi all
I'm new in OpenEmbedded and it is a very good idea!
Maybe this is not the right place for a newbie help req but the user
mail list is a desert.

I bought a china tablet few days ago. It has Android or WinCe OS.
I'd like to install a linux distro on it.

I'm trying to build my distro (minimal distro with only a shell
interface) but I'm lost in the .conf files.
Obviously my machine is not in the "machines list" and I'd like to
create an ad-hoc conf file maybe starting from an existing machine file.

my device mount an ARM 11 (ARM v6) CPU and this is the link to some
additional infos http://forum.xda-developers.com/showthread.php?t=740631

How write a new machine conf file?
Any help is appreciated.

Thanks

Davide Pasini



