Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OjvRl-0002FT-KL
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 16:41:44 +0200
Received: by eyx24 with SMTP id 24so1315054eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=d5dcVg5Ny+c1iP50SLzgsex3cwTJdRC5VkqyumIAw94=;
	b=D9/OW4OD9uZPfh1GoAj8OHOlvWhAZnoq08O4G8BTBQuA6CvPEcpCgm6H9JLoFQVqlJ
	8fMs2stIps4zuD0GAor5uzPCiNGPIsNhI6pea6mI2Fg4JvrrYlpG9tHU3Jg8ASgt0PLD
	5NKZT8l2WBT846V/3H8ZhUEjPL9p9InzL6GDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=t9JTo5q8Gia0XhZ090UmH6Y++dpDP50WMZDBOxBOCRLKv9faPBQfhBqvcEYwnlXwJF
	704ab78qn1mZ6g50rrx/VICl3mq1tThlHXk54bWeyxA9T2cQIA/ki2u/vYolXdtokkLp
	f5Bfsa94ZhkJzoUK9z/vUKCe7af9snN7w2sr4=
Received: by 10.213.32.135 with SMTP id c7mr1932408ebd.2.1281710468207; Fri,
	13 Aug 2010 07:41:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Fri, 13 Aug 2010 07:40:48 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTikQ5qGF4N1N0Ud11cdS7P4+HxfPEXSvWwMvm4YV@mail.gmail.com>
	<alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Aug 2010 07:40:48 -0700
Message-ID: <AANLkTinChtk+VTgQ4H3+sMfyTRUQks+=YQR9Agj8M7a_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: update canutils to current version
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
X-List-Received-Date: Fri, 13 Aug 2010 14:41:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 13, 2010 at 2:59 AM, Vitus Jensen <vjensen@gmx.de> wrote:
> On Fri, 13 Aug 2010, Frans Meulenbroeks wrote:
>
>> 2010/8/13 Vitus Jensen <vjensen@gmx.de>:
>>>
>>> On Fri, 13 Aug 2010, Vitus Jensen wrote:
>>>
>>>> The following patches will update canutils to the current version
>>>> 4.0.6 and remove older 4.0.x versions. =A0Also only the latest
>>>> version of libsocketcan will be kept.
>>>
>>> Frans, thank you for the ACKs. =A0Could you please apply the patches, t=
oo?
>>> I
>>> have no right to do so.
>>
>> Applied. Thanks for the contribution
>>
>> System guru's: Vitus's patches did not show up in patchwork
>
> They did. =A0But after you posted you ACKs I changed their state to "Acce=
pted"
> and then they are usually filtered by "Action Required". =A0I'm not reall=
y
> sure I did the right thing but I don't believe they shouldn't remain in
> "New".

If they got applied change the state to 'applied'
>
> http://wiki.openembedded.net/index.php/Patchwork doesn't describe states,
> only that you should change them :(
>
> Vitus
>
> --
> Vitus Jensen, Hannover, Germany, Universe (current)
> pgp public key available from keyservers
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


