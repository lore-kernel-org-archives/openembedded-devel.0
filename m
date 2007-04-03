Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HYopY-0005fM-Ap
	for openembedded-devel@openembedded.org; Tue, 03 Apr 2007 21:38:12 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l33Jc8Lr017471 for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Apr 2007 21:38:08 +0200
Message-ID: <4612AD1D.5060405@dominion.kabel.utwente.nl>
Date: Tue, 03 Apr 2007 21:38:05 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: [Fwd: [LLVMdev] llvm-gcc bootstrap on arm-linux-gnueabi]
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
X-List-Received-Date: Tue, 03 Apr 2007 19:38:15 -0000
X-Groupsio-MsgNum: 1739
Content-Type: multipart/mixed; boundary="------------050603080801060600020403"

--------------050603080801060600020403
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

FYI
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGEq0cMkyGM64RGpERAvKUAJ9ejKBoXw/KZu2fftTMrmkuOtBkrACgphsF
w7E4ow8fC24aBUGvCU1qheo=
=nZaP
-----END PGP SIGNATURE-----

--------------050603080801060600020403
Content-Type: message/rfc822;
 name="[LLVMdev] llvm-gcc bootstrap on arm-linux-gnueabi"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="[LLVMdev] llvm-gcc bootstrap on arm-linux-gnueabi"

Received: from schuimpje.snt.utwente.nl ([130.89.175.3])
	by dominion.dominion.void with esmtp (Exim 4.60)
	(envelope-from <llvmdev-bounces@cs.uiuc.edu>)
	id 1HYomz-0002ln-MV
	for koen@dominion.kabel.utwente.nl; Tue, 03 Apr 2007 21:35:33 +0200
Received: from mx2.utsp.utwente.nl ([130.89.2.13] helo=mx.utwente.nl)
	by schuimpje.snt.utwente.nl with esmtp (Exim 4.63)
	(envelope-from <llvmdev-bounces@cs.uiuc.edu>)
	id 1HYomv-0001QL-L9
	for koen@dominion.kabel.utwente.nl; Tue, 03 Apr 2007 21:35:31 +0200
Received: from dcs-maillist.cs.uiuc.edu (dcs-maillist.cs.uiuc.edu [128.174.252.7])
          by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id l33JYQVT024875
          for <koen@dominion.kabel.utwente.nl>; Tue, 3 Apr 2007 21:34:27 +0200
Received: from dcs-maillist.uiuc.edu (localhost.localdomain [127.0.0.1])
	by dcs-maillist.cs.uiuc.edu (8.13.1/8.13.1) with ESMTP id l33JKkUo007476;
	Tue, 3 Apr 2007 14:20:47 -0500
Received: from dcs-mxgw.cs.uiuc.edu (dcs-mxgw.cs.uiuc.edu [128.174.252.111])
	by dcs-maillist.cs.uiuc.edu (8.13.1/8.13.1) with ESMTP id
	l33JKjZD007472
	for <llvmdev@dcs-maillist.cs.uiuc.edu>; Tue, 3 Apr 2007 14:20:45 -0500
Received: from relay7.cso.uiuc.edu (relay7.cso.uiuc.edu [128.174.5.108])
	by dcs-mxgw.cs.uiuc.edu (8.13.1/8.13.1) with ESMTP id l33JKerm020427
	for <llvmdev@cs.uiuc.edu>; Tue, 3 Apr 2007 14:20:40 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.237])
	by relay7.cso.uiuc.edu (8.13.8/8.13.8) with ESMTP id l33JKdZq029957
	for <llvmdev@cs.uiuc.edu>; Tue, 3 Apr 2007 14:20:39 -0500 (CDT)
Received: by wr-out-0506.google.com with SMTP id 36so1942482wra
	for <llvmdev@cs.uiuc.edu>; Tue, 03 Apr 2007 12:20:39 -0700 (PDT)
Received: by 10.114.127.1 with SMTP id z1mr2378175wac.1175628038422;
	Tue, 03 Apr 2007 12:20:38 -0700 (PDT)
Received: by 10.114.241.4 with HTTP; Tue, 3 Apr 2007 12:20:38 -0700 (PDT)
Message-ID: <9c10c9f0704031220w778160cfifda8e6c93e37bed8@mail.gmail.com>
Date: Tue, 3 Apr 2007 16:20:38 -0300
From: "Lauro Ramos Venancio" <lauro.venancio@gmail.com>
To: "LLVM Developers Mailing List" <llvmdev@cs.uiuc.edu>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Details: rule=tag_notspam policy=tag score=5 spamscore=5 ipscore=0
	phishscore=0 adultscore=1 classifier=spam adjust=0 reason=mlx
	engine=3.1.0-0703060001 definitions=main-0704030058 
X-Spam-Score: 5
X-Spam-OrigSender: lauro.venancio@gmail.com
X-Spam-Bar: *
Subject: [LLVMdev] llvm-gcc bootstrap on arm-linux-gnueabi
X-BeenThere: llvmdev@cs.uiuc.edu
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: LLVM Developers Mailing List <llvmdev@cs.uiuc.edu>
List-Id: LLVM Developers Mailing List <llvmdev.cs.uiuc.edu>
List-Unsubscribe: <http://lists.cs.uiuc.edu/mailman/listinfo/llvmdev>,
	<mailto:llvmdev-request@cs.uiuc.edu?subject=unsubscribe>
List-Archive: <http://lists.cs.uiuc.edu/pipermail/llvmdev>
List-Post: <mailto:llvmdev@cs.uiuc.edu>
List-Help: <mailto:llvmdev-request@cs.uiuc.edu?subject=help>
List-Subscribe: <http://lists.cs.uiuc.edu/mailman/listinfo/llvmdev>,
	<mailto:llvmdev-request@cs.uiuc.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: llvmdev-bounces@cs.uiuc.edu
Errors-To: llvmdev-bounces@cs.uiuc.edu
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: llvmdev-bounces@cs.uiuc.edu
X-Spam-Status: No
X-SNT-Signature: 27d1ffb717f779abdf34bca553350bf619c5387b
X-SNT-Spam-Score: -2.6
X-SNT-Spam-Score-Bar: --
X-SNT-Spam-Report: Content analysis details:   (-2.6 points, 5.0 required)
	pts rule name              description
	---- ---------------------- --------------------------------------------------
	-2.6 BAYES_00               BODY: Bayesian spam probability is 0 to 1%
	[score: 0.0000]

Hello,

After some months of work, many bug fixes and strong contributions
from Apple, now we can bootstrap llvm-gcc on arm-linux-gnueabi.

The bootstrap itself is not very useful. I think few poeple will want
to do the bootstrap for ARM. But it demonstrates that the ARM backend
is in the end of its experimental phase, which means that it can be
used to compile some more complex applications.

Bug reports are welcome.

Lauro
_______________________________________________
LLVM Developers mailing list
LLVMdev@cs.uiuc.edu         http://llvm.cs.uiuc.edu
http://lists.cs.uiuc.edu/mailman/listinfo/llvmdev


--------------050603080801060600020403--
