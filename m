Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Ok1Ln-0001BI-Qw
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 22:59:55 +0200
Received: from compute3.internal (compute3.internal [10.202.2.43])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 3D8D19AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 16:59:27 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute3.internal (MEProxy); Fri, 13 Aug 2010 16:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type:content-transfer-encoding;
	s=smtpout; bh=xry/OmhesJIHl3Ny/88inGSrQwU=;
	b=AtaVXiY392RGxUtvtHYKBwum0SmP3G2GFxNS/NlpJaFBy+15klaUcx8rY4YtP/JlPfXt8sa6fhoSDIRdFwnbMIxuRsiQJz5KNkBcRyNyZP/9IYE7LJrhYvg57J0bZT7wWu7RIAgqGJz+8GgOqVwX7aQqWudEcxuPyJWL2wo6Xag=
X-Sasl-enc: QB1+Tj61NGcUQm9tPzyM4+7fnISREsbuR5jM/JCSEVus 1281733166
Received: from [192.168.1.34] (hnvr-4d07a29e.pool.mediaWays.net [77.7.162.158])
	by mail.messagingengine.com (Postfix) with ESMTPSA id AAC5E4043DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 16:59:26 -0400 (EDT)
Date: Fri, 13 Aug 2010 23:01:03 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinChtk+VTgQ4H3+sMfyTRUQks+=YQR9Agj8M7a_@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1008132255040.11048@asterix.crazy-teaparty.dyndns.org>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTikQ5qGF4N1N0Ud11cdS7P4+HxfPEXSvWwMvm4YV@mail.gmail.com>
	<alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinChtk+VTgQ4H3+sMfyTRUQks+=YQR9Agj8M7a_@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Fri, 13 Aug 2010 20:59:55 -0000
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Aug 2010, Khem Raj wrote:

> On Fri, Aug 13, 2010 at 2:59 AM, Vitus Jensen <vjensen@gmx.de> wrote:
>> On Fri, 13 Aug 2010, Frans Meulenbroeks wrote:
>>> 2010/8/13 Vitus Jensen <vjensen@gmx.de>:
>>>> On Fri, 13 Aug 2010, Vitus Jensen wrote:
>>>>
>>>>> The following patches will update canutils to the current version
>>>>> 4.0.6 and remove older 4.0.x versions. =C2=A0Also only the latest
>>>>> version of libsocketcan will be kept.
>>>>
>>>> Frans, thank you for the ACKs. =C2=A0Could you please apply the patc=
hes,=20
>>>> too? I have no right to do so.
>>>
>>> Applied. Thanks for the contribution
>>>
>>> System guru's: Vitus's patches did not show up in patchwork
>>
>> They did. =C2=A0But after you posted you ACKs I changed their state to=
 "Accepted"
>> and then they are usually filtered by "Action Required". =C2=A0I'm not=
 really
>> sure I did the right thing but I don't believe they shouldn't remain i=
n
>> "New".
>
> If they got applied change the state to 'applied'

Sure, already did!  Do I set the 'archive' bit, too?


Frans got hit by the fact, that 'accepted' patches don't show up in the=20
list by default.

Vitus posts patches
Frans acks patches
Vitus changes state to 'accepted'
Vitus asks Frans to apply
Frans: where are those patches in patchwork???
Frans forces his googlemail to produce usable mail and applies
Vitus changes state to 'applied'

Probably I should update the wiki to document the above procedure, right?

Vitus

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


