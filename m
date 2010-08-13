Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OjqUu-000369-Uy
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 11:24:22 +0200
Received: by gyd8 with SMTP id 8so855528gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HFZhpjqPhMZ+FcsOJNibU6OJVKD+MX/b9qCJIw9rlT8=;
	b=Qn4NsYI0UstlDfybEDvfVu7efWOskUmHGUDjfbPagIhOg0J5FCdOLtfxtuy26bsDiH
	G5XErLNZqV+xTtZXZvT8tKRLG8fFpdnTKQjbsrhjtIci6B/SM6ABM9HVfO6zMF1DoEzj
	EPZtyKN/lin00zTpSRm0/705OUPCuyatyeCjo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=foDthTGmRDuauKuq40h6S6u9/14FW2uOrXg2pN0nek2fJX5Dkymbd4eye3RG0hvEPb
	upFQp2Cx5D00/XEtyPyPATHW6p2btHHG9tqeBV2yqI/NiHel7erHM0cmQCttiCzcEpP9
	LUxgjNmHa4zak5HAKElGTrY+OJo/qRiDE/p4c=
MIME-Version: 1.0
Received: by 10.231.13.130 with SMTP id c2mr1547577iba.24.1281691443551; Fri,
	13 Aug 2010 02:24:03 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Fri, 13 Aug 2010 02:24:03 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
Date: Fri, 13 Aug 2010 11:24:03 +0200
Message-ID: <AANLkTikQ5qGF4N1N0Ud11cdS7P4+HxfPEXSvWwMvm4YV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Fri, 13 Aug 2010 09:24:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/13 Vitus Jensen <vjensen@gmx.de>:
> On Fri, 13 Aug 2010, Vitus Jensen wrote:
>
>> The following patches will update canutils to the current version
>> 4.0.6 and remove older 4.0.x versions. =A0Also only the latest
>> version of libsocketcan will be kept.
>
> Frans, thank you for the ACKs. =A0Could you please apply the patches, too=
? I
> have no right to do so.


Applied. Thanks for the contribution

System guru's: Vitus's patches did not show up in patchwork

Frans


