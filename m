Received: from [194.109.24.23] (helo=smtp-vbr3.xs4all.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <udovdh@xs4all.nl>) id 1KI3wb-00068h-IU
	for openembedded-devel@openembedded.org; Sun, 13 Jul 2008 17:57:01 +0200
Received: from surfplank2.hierzo (pindarots.xs4all.nl [80.101.128.228])
	(authenticated bits=0)
	by smtp-vbr3.xs4all.nl (8.13.8/8.13.8) with ESMTP id m6DFuWpJ062724
	for <openembedded-devel@openembedded.org>;
	Sun, 13 Jul 2008 17:56:34 +0200 (CEST)
	(envelope-from udovdh@xs4all.nl)
Message-ID: <487A25B0.5010707@xs4all.nl>
Date: Sun, 13 Jul 2008 17:56:32 +0200
From: Udo van den Heuvel <udovdh@xs4all.nl>
User-Agent: Thunderbird 2.0.0.14 (X11/20080501)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <c38932520807130846p2129e511qc96ca99b3dee0878@mail.gmail.com>
In-Reply-To: <c38932520807130846p2129e511qc96ca99b3dee0878@mail.gmail.com>
X-Enigmail-Version: 0.95.2
OpenPGP: id=8300CC02
X-Virus-Scanned: by XS4ALL Virus Scanner
Subject: Re: bitbake problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 13 Jul 2008 15:57:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hien Pham wrote:
>>    Do not use Bitbake as root.
> 
> how can I solve this problem?

By running bitbake as a user, not as root.

Udo



