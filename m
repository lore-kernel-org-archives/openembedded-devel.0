Received: from asmtpout030.mac.com ([17.148.16.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1OfAMm-00007L-RE
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 13:36:37 +0200
MIME-version: 1.0
Received: from [192.168.1.103] ([87.201.169.38])
	by asmtp030.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L6F003P36VWPB60@asmtp030.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Jul 2010 04:36:00 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=6.0.2-1004200000 definitions=main-1007310047
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.0.10011,1.0.148,0.0.0000
	definitions=2010-07-31_02:2010-07-31, 2010-07-31,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <AANLkTim_ffCU8p0VGgcZmuiN1q8cj6f3NS7=m2Bb8vSL@mail.gmail.com>
Date: Sat, 31 Jul 2010 15:35:37 +0400
Message-id: <6E215953-4068-4742-8423-E2CD9CA779D8@mac.com>
References: <A806EA3C-FD29-40A7-82E7-9391241EF930@mac.com>
	<AANLkTim_ffCU8p0VGgcZmuiN1q8cj6f3NS7=m2Bb8vSL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.105
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is bitbake 1.10 the latest stable version?
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
X-List-Received-Date: Sat, 31 Jul 2010 11:36:38 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi,
       If you ask me, updating bitbake and openembedded is bound to cause problems ! 

I was running bitbake 1.8 and oe from about 3 months ago, but when I tried updating it to bitbake 1.10 and did an update of my oe repo, I had failures for glibc,  complaining about LD_LIBRARY_PATH being set to the current directory. 

It is not the first time that this is happening, everytime you do an update of the oe repository, things start going wrong and you usually have to spend a whole week trying to fix things. 

Luckily for me, I had a backup copy of my Fedora 12 x86 64-bit virtual machine, and now have switch to the older repository and working revision. 

The resulting outputs of the OE build system are reproduceable, but OE behaviour by itself  across revisions is not. 

Best regards,

Elvis Dowson


