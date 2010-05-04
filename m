Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1O9P5P-0005kF-Bo
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 22:51:24 +0200
Received: by fxm11 with SMTP id 11so3522422fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 13:47:36 -0700 (PDT)
Received: by 10.223.62.202 with SMTP id y10mr4593510fah.100.1273006056605;
	Tue, 04 May 2010 13:47:36 -0700 (PDT)
Received: from is.home (93-81-71-47.broadband.corbina.ru [93.81.71.47])
	by mx.google.com with ESMTPS id z15sm2669751fkz.21.2010.05.04.13.47.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 May 2010 13:47:36 -0700 (PDT)
Sender: Yuri Bushmelev <jay@jay-tech.ru>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 5 May 2010 00:47:29 +0400
User-Agent: KMail/1.13.1 (Linux/2.6.32-std-def-alt9; KDE/4.4.1; i686; ; )
MIME-Version: 1.0
Message-Id: <201005050047.29955.jay4mail@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_SORBS_WEB,SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: JFYI: bootchart boot logger functionality patch to busybox
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
X-List-Received-Date: Tue, 04 May 2010 20:51:24 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

Hello!

I've just forwarded this message from celinux-dev ML for your information.
Original message is here:
http://tree.celinuxforum.org/pipermail/celinux-dev/2010-May/002026.html

Look there for contacts or ask me :)

----
Denys Vlasenko has just recently submitted a patch against
busybox which adds bootchartd support to that program.

Please see http://lists.busybox.net/pipermail/busybox/2010-May/072365.html

This is in relation to the CELF project described at:
http://elinux.org/Add_bootchart_boot_logger_functionality_to_busybox

I'm looking for a volunteer to test this.  Please contact me
if you are willing to take a look at this functionality, and
report on whether it works for you.  The test would consist of
using the tool as described in the online help to gather the
bootchart data, and then using the bootchart visualization tool
to produce a graph.

I'm guessing this is a one or two-day task at most.

"Extra credit" is provided if you do a short write-up on the
elinux wiki. :-)

-- 
Yuri Bushmelev


