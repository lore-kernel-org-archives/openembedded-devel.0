Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <developer@alexandfliss.com>) id 1Oey4c-0007PZ-MH
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 00:29:08 +0200
Received: by wyb38 with SMTP id 38so1744877wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 15:28:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.145.20 with SMTP id b20mr2373677wbv.28.1280528917908; Fri, 
	30 Jul 2010 15:28:37 -0700 (PDT)
Sender: developer@alexandfliss.com
Received: by 10.216.235.233 with HTTP; Fri, 30 Jul 2010 15:28:37 -0700 (PDT)
Received: by 10.216.235.233 with HTTP; Fri, 30 Jul 2010 15:28:37 -0700 (PDT)
In-Reply-To: <1280388213.3873.3.camel@mattotaupa>
References: <AANLkTintoXJZHPGxj1-sxHP31-VzOK3Washy+hZqbmgd@mail.gmail.com>
	<1280388213.3873.3.camel@mattotaupa>
Date: Fri, 30 Jul 2010 23:28:37 +0100
X-Google-Sender-Auth: LZmiRbuO0-CpzOZBMqT-LNYdEfk
Message-ID: <AANLkTi=1itjn_FxoPwqu4je+yJYSpK7BmSis4kG2bWbb@mail.gmail.com>
From: Alex Bennee <kernel-hacker@bennee.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: developer@alexandfliss.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Fix the compile failure of recode
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
X-List-Received-Date: Fri, 30 Jul 2010 22:29:12 -0000
Content-Type: text/plain; charset=UTF-8

Will do. Sorry for the line noise.

On 29 Jul 2010 08:25, "Paul Menzel" <paulepanter@users.sourceforge.net>
wrote:

Am Mittwoch, den 28.07.2010, 17:40 +0100 schrieb Alex Bennee:

> The recode build fails because of CC/CXX environment variables being
banged by:
>
> TARGET_CC_ARC...
It looks like your MUA mangled the patch. Could you please resend as v2.
GMail should also be compatible with `git send-email` [1].


Thanks,

Paul


[1] http://www.kernel.org/pub/software/scm/git/docs/git-send-email.html

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

