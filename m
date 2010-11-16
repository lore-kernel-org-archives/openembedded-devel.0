Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIUP3-0005Iu-2V
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 23:53:29 +0100
Received: by gyf3 with SMTP id 3so813872gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 14:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SrFNSDmlR1T8xoJkPndwZiBLPO8ji7uS/IkoPX397zE=;
	b=W1/f4dIxMZJ7V62xnXCBLFNr/ZiNoa/8EB95CeXuW7zAbKY5GZODcJFWv2Nce0mW+B
	1YHfWhx/teQDPFPdp9MR8eZVSQ2lDabeK4aArUkpQ+hQsc9hVg2EaZLu94SsiLS2nZIc
	Gd6edgZBbEsS1vfTtUCEag7l+2Xi90N9zRzc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lN9EazpomUZuQLqBVz+TkzI6oTzxCgTDJ2AtLVa624gtd3fS3ayin5cuSXTOTttsxq
	TYtl1J7DKYG65cVgqCTQnk1Hnhhsr+/KerOtbMmRo7kUC7BkmIDTxL3ceg6jA8kjQL8g
	fvlXVsuWeEUZGeiJ+yB6nkiKicaqOoK+vscso=
MIME-Version: 1.0
Received: by 10.231.15.136 with SMTP id k8mr6347948iba.51.1289947942227; Tue,
	16 Nov 2010 14:52:22 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Tue, 16 Nov 2010 14:52:22 -0800 (PST)
In-Reply-To: <AANLkTinuJ6bx+iHNq-4VLKNkaHbwaPitm7f6hZ=VM9az@mail.gmail.com>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<1289947184.11873.3.camel@mattotaupa>
	<AANLkTinuJ6bx+iHNq-4VLKNkaHbwaPitm7f6hZ=VM9az@mail.gmail.com>
Date: Tue, 16 Nov 2010 23:52:22 +0100
Message-ID: <AANLkTim2Q8BfAx=z3=RLSCQkFo-Wk6HFnbBnF562NGDM@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Tue, 16 Nov 2010 22:53:29 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/11/16 Khem Raj <raj.khem@gmail.com>:
> On Tue, Nov 16, 2010 at 2:39 PM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
>> Dear OE folks,
>>
>>
>> Am Dienstag, den 16.11.2010, 10:20 -0800 schrieb Khem Raj:
>>
>>> In order to get to the 2010.12 release, I would like to request to
>>> stop pushing any changes to master until release. Please keep your
>>> changes in you local tree ready for when the window
>>> opens again after the release.
>>
>> would it be a good idea, to either have each developer with commit
>> access create his/her own =93next=94 branch or to have a common next bra=
nch,
>> where those changes could be published, so that work is not duplicated?
>>
>
> Either way is fine. If its posted to mailing list then it goes to
> patchwork and after approvals I will sweep them
> if devs publish a pull branch thats ok too.
>
>> [=85]
>>
>>
>> Thanks,
>>
>> Paul
>>
>>
>> PS: Khem, thanks for taking the lead in getting this release done!
>>
>> _______________________________________________

What about new recipes?
I have a few new tasks and a new image that I was planning to add
tonight, but didn't get to it.
Also I will have a working uclibc++ recipe by tomorrow or so. (the
current one does not build for me).
I feel changes like those are pretty harmless.

Frans


