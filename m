Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1PPLDQ-0005uN-Gy
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 21:29:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oB5KSMeq030056
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Dec 2010 20:28:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29604-06 for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Dec 2010 20:28:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id oB5KSCIV030050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Dec 2010 20:28:13 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinoazy9yOU04JPZEJTB8+Huea6wPVW8uGfP2hKd@mail.gmail.com>
References: <AANLkTinoazy9yOU04JPZEJTB8+Huea6wPVW8uGfP2hKd@mail.gmail.com>
Date: Sun, 05 Dec 2010 20:28:11 +0000
Message-ID: <1291580891.14277.2903.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] remove AUTOTOOLS_STAGE_PKGCONFIG
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
X-List-Received-Date: Sun, 05 Dec 2010 20:29:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-12-05 at 20:58 +0100, Frans Meulenbroeks wrote:
> Dear all,
> 
> As confirmed and proved by Robert (see
> http://article.gmane.org/gmane.comp.handhelds.openembedded/40268/match=autotools_stage_pkgconfig
> )
> AUTOTOOLS_STAGE_PKGCONFIG is not used any more since about a year.
> 
> Proposal is to remove this var from all 4 classes that define it and
> all 66 recipes.
> Below is a list of all files.
> 
> If you disagree with this, or feel there are reasons to keep it,
> please speak up.
> And if you feel removal is OK, please reply with an ACK (that I then
> will use when making the edit).
> 
> Thanks alot! Frans

Acked-by: Richard Purdie <rpurdie@rpsys.net>



