Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OTx2b-00005x-LR
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 15:09:26 +0200
Received: by bwz11 with SMTP id 11so410674bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Rv5FOItyd9tJWGxLgVrI5t7iNMBfBUP3rqnI+D1Ljqc=;
	b=eLUyaq3DkG1GFcMBZSR6/2uf+snszWK9hrIZmWNIjptmf4IrOfOBSRRP8ca4A8L86l
	RiPct19QSDHsDvJuUkqSWHzbunqTQYvgHJw/bTOsBeW7dTyUIM6V3ur78kypC+WgXqNj
	QFVOp8F5jw5cXv+kuz/MIkif4ps+Xh448ka6g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EOD04eLXq/+Mdu4eTprNTkDf6TVI/8I8T7lbNnfhNoXdIFqPhNUUZtBaHPycroBorl
	9+LKS/YzzDZ1IJp3VLF1FsYXNml1kFH1XmqhLwGmsg4mEJf4HHb874odPh0qCOvCMn5K
	jWXflUpjSOH544q20r2LpS6ojzLOVrskgLsPY=
MIME-Version: 1.0
Received: by 10.204.126.153 with SMTP id c25mr2830262bks.27.1277903083636; 
	Wed, 30 Jun 2010 06:04:43 -0700 (PDT)
Received: by 10.204.73.81 with HTTP; Wed, 30 Jun 2010 06:04:43 -0700 (PDT)
In-Reply-To: <i0f8ct$acp$1@dough.gmane.org>
References: <4C0F9119.3000909@freyther.de> <4C2B1BC4.2030808@freyther.de>
	<i0f8ct$acp$1@dough.gmane.org>
Date: Wed, 30 Jun 2010 15:04:43 +0200
Message-ID: <AANLkTimVCz6RgffQhqIPg8TGcqQchCQz7buJD-I1wKdF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Wed, 30 Jun 2010 13:09:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/30 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 30-06-10 12:26, Holger Freyther wrote:
>> On 06/09/2010 09:03 PM, Holger Freyther wrote:
>>
>>
>>> The TSC would like to make the following proposal:
>>>
>>> =A0 a.) Contributor's will be asked to push to master, a git-hook
>>> =A0 =A0 =A0 will prevent pushes to the old branch name.
>>> =A0 b.) The default branch will be changed to 'master' and the
>>> =A0 =A0 =A0 documentation will be updated.
>>> =A0 c.) To ease this for existing users and to reduce the amount of
>>> =A0 =A0 =A0 support org.openembedded.dev will track master and remains
>>> =A0 =A0 =A0 available for a limited but long amount of time.
>>
>>
>> Okay, any idea about the time line? What resources to update? The Wiki
>> [1]? The Manual? External resources?
>
> What about tackling the items from the previous month first before going
> off on this cosmetic change that wasn't even discussed in the community
> first before the TSC jumped the gun on it?

And the pre-previous ones?

Probably somewhere keep a list of decisions/actions.

Frans


