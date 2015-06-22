Return-Path: <pierluigi.passaro@phoenixsoftware.it>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Jun 2015 09:01:46 UTC
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
	by mail.openembedded.org (Postfix) with ESMTP id 3A15A7324E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2015 09:01:46 +0000 (UTC)
Received: from [192.168.1.71] ([94.33.39.20])
	by smtpcmd02.ad.aruba.it with bizsmtp
	id jLuc1q01D0S5K6601LucWj; Mon, 22 Jun 2015 10:54:37 +0200
Message-ID: <5587CD49.8040704@phoenixsoftware.it>
Date: Mon, 22 Jun 2015 10:54:33 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [meta-qt5] fido meta-toolchain-qt5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jun 2015 09:01:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I've compiled a QT5 filesystem for imx28evk machine and QT5 apps runs fine.
I've also compiled and installed QT5 SDK, however if I try to debug 
applications I get the following error:

Debugging starts
Listening on port 10000
Remote debugging from host 192.168.2.173
Process /root/MyQt5App created; pid = 1181
/root/MyQt5App: error while loading shared libraries: unexpected PLT 
reloc type 0xf0

Child exited with status 127
Debugging has finished

Do you have any suggestion on how to investigate the problem?

Thanks
Regards
Pierluigi

