Received: from smtp7.myhsphere.biz ([204.10.105.69] helo=mail9.myhsphere.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <balakrishnan@e-consystems.com>) id 1Nn2mM-0002nn-Fs
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 05:35:31 +0100
Received: (qmail 27909 invoked by uid 399); 4 Mar 2010 04:32:23 -0000
Received: from dsl-tn-dynamic-209.251.164.122.airtelbroadband.in (HELO
	?192.168.1.4?) (balakrishnan@e-consystems.com@122.164.251.209)
	by mail9.myhsphere.biz with ESMTPAM; 4 Mar 2010 04:32:23 -0000
X-Originating-IP: 122.164.251.209
X-Sender: balakrishnan@e-consystems.com
From: balakrishnan <balakrishnan@e-consystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 04 Mar 2010 10:02:21 +0530
Message-Id: <1267677141.3495.24.camel@balakrishnan-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 204.10.105.69
X-SA-Exim-Mail-From: balakrishnan@e-consystems.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Xserver problem...
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
X-List-Received-Date: Thu, 04 Mar 2010 04:35:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
I am using Angstrom OS for my pxa270 based board, which is build by
Stable/2009 branch. In this, Xserver is running perperly on  240x320 and
640x480 resolution, but while running 480x272 resolution lcd 4.3" it
making problem. How can I  resolve this.

Version      :     xserver-kdrive-1_1.4.0.90-r5
Branch       :     Stable/2009

Error log are,
/*****************************************/
root@regulus:~# Xfbdev -br -pn  -mouse tslib -hide-cursor :0 -noreset
Warning: mode not found, using default
error: Invalid argument

Fatal server error:
no screens found
root@regulus:~#
/*****************************************/

With Regards
J.Balakrishnan.



