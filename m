Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYcIr-0007qO-4N
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:29:16 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 2D7D51B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 09:25:45 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 10:26:37 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <201001230943.24210.holger+oe@freyther.de>
In-Reply-To: <201001230943.24210.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <201001231026.37518.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patchwork Workflow improvement
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
X-List-Received-Date: Sat, 23 Jan 2010 09:29:16 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Saturday 23 January 2010 09:43:24 Holger Hans Peter Freyther wrote:
> Hi All,

these urls fail to apply. It would be cool if people would help with the 
following randomized algorithm:

Pick a given number between 0 to 138 and then work on a block of 10 times.

1.) Open the URL in the browser
2.) Check if the patch was applied
2.1) If it was applied, close the report
2.2) If it was not applied, and the patch makes sense, send a follow
       up mail to the author and defer the current patch
2.3) If it was not applied, and the patch does not make sense,
       just close the bug as rejected..

please help


# 139 patches failed to apply.
http://patchwork.openembedded.org/patch/454
http://patchwork.openembedded.org/patch/650
http://patchwork.openembedded.org/patch/651
http://patchwork.openembedded.org/patch/691
http://patchwork.openembedded.org/patch/714
http://patchwork.openembedded.org/patch/727
http://patchwork.openembedded.org/patch/729
http://patchwork.openembedded.org/patch/740
http://patchwork.openembedded.org/patch/743
http://patchwork.openembedded.org/patch/746
http://patchwork.openembedded.org/patch/750
http://patchwork.openembedded.org/patch/753
http://patchwork.openembedded.org/patch/770
http://patchwork.openembedded.org/patch/773
http://patchwork.openembedded.org/patch/890
http://patchwork.openembedded.org/patch/893
http://patchwork.openembedded.org/patch/902
http://patchwork.openembedded.org/patch/940
http://patchwork.openembedded.org/patch/942
http://patchwork.openembedded.org/patch/949
http://patchwork.openembedded.org/patch/959
http://patchwork.openembedded.org/patch/960
http://patchwork.openembedded.org/patch/972
http://patchwork.openembedded.org/patch/986
http://patchwork.openembedded.org/patch/988
http://patchwork.openembedded.org/patch/989
http://patchwork.openembedded.org/patch/994
http://patchwork.openembedded.org/patch/1000
http://patchwork.openembedded.org/patch/1004
http://patchwork.openembedded.org/patch/1005
http://patchwork.openembedded.org/patch/1007
http://patchwork.openembedded.org/patch/1008
http://patchwork.openembedded.org/patch/1016
http://patchwork.openembedded.org/patch/1020
http://patchwork.openembedded.org/patch/1021
http://patchwork.openembedded.org/patch/1022
http://patchwork.openembedded.org/patch/1023
http://patchwork.openembedded.org/patch/1024
http://patchwork.openembedded.org/patch/1030
http://patchwork.openembedded.org/patch/1043
http://patchwork.openembedded.org/patch/1036
http://patchwork.openembedded.org/patch/1046
http://patchwork.openembedded.org/patch/1041
http://patchwork.openembedded.org/patch/1048
http://patchwork.openembedded.org/patch/1056
http://patchwork.openembedded.org/patch/1064
http://patchwork.openembedded.org/patch/1066
http://patchwork.openembedded.org/patch/1067
http://patchwork.openembedded.org/patch/1074
http://patchwork.openembedded.org/patch/1078
http://patchwork.openembedded.org/patch/1082
http://patchwork.openembedded.org/patch/1083
http://patchwork.openembedded.org/patch/1089


