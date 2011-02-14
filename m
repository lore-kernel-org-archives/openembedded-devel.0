Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pp2Td-0002d7-H2
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:44:45 +0100
Received: by iwn8 with SMTP id 8so4974707iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 09:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=JXudSmbxffebXQEry5kewo8YZTd8KVoN6EPFhVS7W8A=;
	b=wGy060ZNtI3S5CrjhsLyCawJIQoANcoLFEcwk5uM6WeopAEf5ewkEGfKCTRgdF78QZ
	VLcHBicllqitByuopGkmC1e1JoX4yvGQKtdf6xuj2frnLWR+SdBkS7KLqtbL9kWz/xtf
	e95zEf8EdF4PmfYp+eqqN+4q76DoXcQyLEgtQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=i9MEwuvUCleWZ93XwKsy2JZ/j1y+q41gQBvmRfSgyqPVn4Zz256q1f+efGqIWIFXN0
	hSDV51oNXNUpRUcXSct6er9Ct1jvGYcjba5eH0106SDfMGdOM1iNXvsJ27ySEzzR4V2j
	967K/HATa1X1WmSsBos2rQG1tg1QOlIxAfJUg=
MIME-Version: 1.0
Received: by 10.231.35.200 with SMTP id q8mr2333668ibd.147.1297705412629; Mon,
	14 Feb 2011 09:43:32 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Mon, 14 Feb 2011 09:43:32 -0800 (PST)
In-Reply-To: <4D596427.7060205@mentor.com>
References: <4D51566B.9060603@mentor.com>
	<20110208145355.GF2050@xora-build.xora.org.uk>
	<4D515A17.3060203@mentor.com> <4D523623.7030509@opensimpad.org>
	<4D59543B.50506@mentor.com>
	<AANLkTikCsSry215+voCYt4ekMpE_kbM7cE7Jn+zPE3po@mail.gmail.com>
	<4D596427.7060205@mentor.com>
Date: Mon, 14 Feb 2011 18:43:32 +0100
Message-ID: <AANLkTinQNLzJhKfDbzf7bQp-wPV66v0JeM4FM5d2Gm9r@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Mon, 14 Feb 2011 17:44:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/14 Tom Rini <tom_rini@mentor.com>:
> On 02/14/2011 09:57 AM, Frans Meulenbroeks wrote:
>>
>> Tom, if you are still taking requests.
>>
>> A collegue asked whether it would also be possible to add
>> neek/minimal/minimal-image to the test set
>> (console-image for it failed on a QA issue last time I tried it).
>
> Just MACHINE=3Dneek DISTRO=3Dminimal BBPKGS=3Dminimal-image? =A0I think I=
'll have
> room for the next round (re-reworking the job I run again).

Yes please. Thanks alot.
GUess as it is minimal-image it should build pretty quickly.

Frans


