Received: from [209.18.79.153] (helo=carreragt.cwihosting.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1JqUPz-0002Ch-JL
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 16:33:23 +0200
Received: from [127.0.0.1] (helo=vollmann.com)
	by carreragt.cwihosting.com with esmtpa (Exim 4.63)
	(envelope-from <dv@vollmann.ch>) id 1JqUPB-0002lR-UL
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 10:32:34 -0400
Received: from 194.56.133.3 ([194.56.133.3])
	(SquirrelMail authenticated user dvstore@vollmann.com)
	by vollmann.com with HTTP; Mon, 28 Apr 2008 16:32:33 +0200 (CEST)
Message-ID: <3810.194.56.133.3.1209393153.squirrel@vollmann.com>
In-Reply-To: <a7f8874a0804251149w4d740b1ftc40e41703de334da@mail.gmail.com>
References: <a7f8874a0804251149w4d740b1ftc40e41703de334da@mail.gmail.com>
Date: Mon, 28 Apr 2008 16:32:33 +0200 (CEST)
From: "Detlef Vollmann" <dv@vollmann.ch>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-cPanel-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: 1JqUPB-0002lR-UL
X-cPanel-MailScanner: Not scanned: please contact your Internet E-Mail Service
	Provider for details
X-cPanel-MailScanner-SpamCheck: 
X-cPanel-MailScanner-From: dv@vollmann.ch
X-Spam-Status: No
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - carreragt.cwihosting.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - vollmann.ch
Subject: Re: OE on Ubuntu 8.04?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 14:33:23 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Hans Henry von Tresckow wrote:
> Now that Ubuntu 8.04 has been released, I would like to upgrade my build
> laptop. I was wondering if anybody has had any experience with 8.04 and
> knows of any OE specific pitfalls to watch for.
I did some builds over the weekend (on x86-64), and apart from the
usual Ubuntu problem of /bin/sh -> dash (instead of bash)
everything worked fine.

  Detlef




