Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NYpkA-0003a1-Ac
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 00:50:21 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 6E16C1D3607A; Sun, 24 Jan 2010 00:47:56 +0100 (CET)
Date: Sun, 24 Jan 2010 00:47:56 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100123234756.GR18793@ibawizard.net>
References: <1264273402-29910-1-git-send-email-john@soundmetrics.com>
	<1264276434.3738.53.camel@mattotaupa.wohnung.familie-menzel.net>
	<4B5B78D9.5060809@soundmetrics.com>
MIME-Version: 1.0
In-Reply-To: <4B5B78D9.5060809@soundmetrics.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] socat: Add version 1.7.1.2
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
X-List-Received-Date: Sat, 23 Jan 2010 23:50:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

John Faith <john@soundmetrics.com> [2010-01-23 14:31:53]:

> Paul Menzel wrote:
>> Am Samstag, den 23.01.2010, 11:03 -0800 schrieb John Faith:
>>         warning: squelched 13 whitespace errors
>>         warning: 18 lines add whitespace errors.
>>   
>
> There are space-tabs in the original source file so I'm not sure how to  
> remove those.  The other trailing whitespace I see is might be an  
> artifact from diff which I used to create  
> files/socat-1.7.1.2-cross.patch; I can remove those manually.

Maybe settings this can fix that whitespace problem?

git config core.whitespace "trailing-space,space-before-tab"
git config apply.whitespace "trailing-space,space-before-tab"

-- ynezz


