Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NR11s-000249-36
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jan 2010 11:16:19 +0100
Received: by pwi18 with SMTP id 18so8614221pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jan 2010 02:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=szLy3WCso9SIrTgmzvLsl1v+Dj5EGDGafjmnMmwa1gY=;
	b=pGvysJKoLcwHoggulFioLgmh6S2Lc2JDP/jsm87kgRBBRh40he8tsV/yI2sItaWvr7
	FlIU2NTA0sc3jd5rYCQj9at37FEW0g+D21XwFS3iPxzl4C6j3o7ZiJGG1S6CLrus2Ozs
	N3nENyFi508rg9RNUfRQBhvB6541EdMnz8/XQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=UmZnedcizJ/h1m5eS4w2eyUaZAg/pl4YqYlAPcPpbgXQk4LQDVpPqlXEc/pWpvqIJV
	UFfxkG1Hz/15l82fun4XI27vrxwccV2DcRoI44Do/HiShaupDxUOcGZu6eX3CeYNSidr
	39/fWyvJGiJETe0Fb8knl3fhZChsczRC3n+Qg=
Received: by 10.143.27.42 with SMTP id e42mr14517270wfj.220.1262427254261;
	Sat, 02 Jan 2010 02:14:14 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 21sm16091007pzk.7.2010.01.02.02.14.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 02 Jan 2010 02:14:13 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1262424517-21966-1-git-send-email-camelguo@gmail.com>
	<1262426945.2553.70.camel@lenovo.internal.reciva.com>
Date: Sat, 02 Jan 2010 18:14:07 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5whdtwbmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1262426945.2553.70.camel@lenovo.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Add mips entry for linux-uclibc into package_qa_get_machine_dict of insane.bbclass
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
X-List-Received-Date: Sat, 02 Jan 2010 10:16:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

proud of it!  ;)

=E5=9C=A8 Sat, 02 Jan 2010 18:09:05 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Sat, 2010-01-02 at 17:28 +0800, Guo Hongruan wrote:
>> * Without it the insance check will fail due to key miss exception.
>>
>> Signed-off-by: Guo Hongruan <camelguo@gmail.com>
>> ---
>>  classes/insane.bbclass |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> Thanks for the patch.  I checked this in.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


