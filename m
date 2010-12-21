Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PV8Wv-0002LC-3E
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 21:09:53 +0100
Received: by wwi17 with SMTP id 17so4337996wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 12:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=4dxLlwbMB9AwPjlu5tkXtC8y3TI6Tjb1L/yei8wOncQ=;
	b=FWsKi2Tp447yfUdjmuVSGcwa0IaPiGdV4zBX83cyurZ3V0WDu57SN7kLjpe8ceIZ3w
	eS8NaTLZcUTkzc39P/WFilN6TFkSWGIhK4xAoTDMH2WGWnj9ZpbcQ5p1ip/yzYGhk6Jy
	oL1gr0KRU4sI+pAqSewrEM8WqxrMP50RWx0v8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NzbvNRRxasLr+Zy1CQpnGBla3zHq+L7m2I9Bs4hw+tSAPorMiv+xoaczMTbeRSdjjg
	mOxlYvXBe+05TpgMEER8N+MUbkkNW4ANwSqxz6W8vyviOuzR5Nl2bZhumvMiRqEyzhlU
	ko2WaaVxHK6yyAtRnJeICtfDA6H8H1L/b8vCM=
MIME-Version: 1.0
Received: by 10.216.169.71 with SMTP id m49mr6708942wel.4.1292962185046; Tue,
	21 Dec 2010 12:09:45 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Tue, 21 Dec 2010 12:09:45 -0800 (PST)
In-Reply-To: <AANLkTik7jg=J8LEDcxtkTnsaH-oHhvV5ciPmsEqZBfL2@mail.gmail.com>
References: <AANLkTik7jg=J8LEDcxtkTnsaH-oHhvV5ciPmsEqZBfL2@mail.gmail.com>
Date: Tue, 21 Dec 2010 15:09:45 -0500
Message-ID: <AANLkTin=VS3FGkQqrOJA1+NfSdtpBTY=TyFUoq4jgqdd@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: git repo offline for gitolite upgrade
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
X-List-Received-Date: Tue, 21 Dec 2010 20:09:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

OK, gitolite conversion is complete.  Let me know if any problems.
This will now give us fine grained permissions, and various other
features.  See:

https://github.com/sitaramc/gitolite

Thanks,
Cliff

On Tue, Dec 21, 2010 at 1:28 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> Hello,
>
> I plan to take the OE git server offline in about 30 minutes for a
> gitosis->gitolite upgrade.
>
> Thanks,
> Cliff
>
> --
> =================
> http://bec-systems.com
>



-- 
=================
http://bec-systems.com


