Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RmsDn-0006iE-Jw
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 20:27:59 +0100
Received: by qap15 with SMTP id 15so2403455qap.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2012 11:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=at3ecZkTbk57MgPq1qlIOtvO+N2y2dkE5JcWw6FiFSU=;
	b=fCH/ZRX3SnQhXHSifgXHFqlpgGry6gUUTFTgAssLSmQ7NGrCuB/6amPRfXv3vTan3O
	kpmTAU95rfi8aMz+Wpc8Hm0OBZB1YiHDZqSmTMBpoft+3cIv5fJrAYyK4OZJ025ogbsR
	ckl2un91ba+obO6q+ALTxpC9UvGJFA8c/1rmQ=
MIME-Version: 1.0
Received: by 10.224.111.6 with SMTP id q6mr16755787qap.65.1326741622011; Mon,
	16 Jan 2012 11:20:22 -0800 (PST)
Sender: tom.rini@gmail.com
Received: by 10.229.98.149 with HTTP; Mon, 16 Jan 2012 11:20:21 -0800 (PST)
In-Reply-To: <CACW_hTaxUWYmPmvczsBFNgaGBKMFyt7Pg40ZCr6JNppe3btScA@mail.gmail.com>
References: <CACW_hTaxUWYmPmvczsBFNgaGBKMFyt7Pg40ZCr6JNppe3btScA@mail.gmail.com>
Date: Mon, 16 Jan 2012 12:20:21 -0700
X-Google-Sender-Auth: YqvEU_e_mQIBvoVWOaXhCW6398k
Message-ID: <CA+M6bXnz_B48oc4Nt_Cw-arQpR_nqx=HSLMba49+5giqGt4mSQ@mail.gmail.com>
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] commit 89cb863234616620d172984ff173f1d84ce4caa9
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
X-List-Received-Date: Mon, 16 Jan 2012 19:27:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 12, 2012 at 12:33 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Dear all,
>
> I just accidently committed
> 89cb863234616620d172984ff173f1d84ce4caa9<http://cgit.openembedded.org/openembedded/commit/?h=2011.03-maintenance&id=89cb863234616620d172984ff173f1d84ce4caa9>on
> the maintenance branch.
>
> My intention was to commit this to master and send a maintenance pull
> request, but as i did not notice that my branch was on 2011.03-maintenance,
> I accidently pushed to that branch
> (actually somewhat surprizing me, as i did not expect to be able to push
> against that branch).
>
> I'll leave it to the maintainers to decide on how to handle this.
> I would like to see this recipe in the maintenance branch too thoguh.
>
> The patch moves the recipe from the 2007_365 version to the 2010_365
> version.
> commit message:

*kicks gmail for not marking this important*

Well, how does this fit against the rest of the requirements for the
branch?  In other words, have you gotten all of these changes in
somewhere else so they won't be lost?

-- 
Tom


