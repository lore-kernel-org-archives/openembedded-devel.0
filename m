Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <captain.deadly@gmail.com>) id 1OvArD-0004Fl-TJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 17:22:15 +0200
Received: by wwi14 with SMTP id 14so7047121wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 08:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:x-enigmail-version:content-type:content-transfer-encoding;
	bh=gw/D2n861XeDFvrE5D2U352sdCXm3/aRq26nocRQ2hA=;
	b=pedS/guoOPVQj3vNgqpgNOyI2c0Bp9F2B32dBQ+OiXavDAvKCC0ktWPSh3AhUZ5SFJ
	9nyQrD1LPKXkduHxAJ0+hv77TO6o8F13g7HcgCBhqtxHE/RRgDS9jfNx2If2jYiTP1h6
	380TWXntyACTVyeWs9kdU8byVw7q1TSyZF3is=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=BpKsxYftBSc9VlC9nN2IuUl138X3RiZP+w5M691ii+HTlIrDoHKkzuBJlQeLjiXZwh
	J32mB56hcbk2B3g1vqFhS0Swm40+ncH/BBOhOmkieJ4lkET8pEAG3AFxcwSwpvgJ+SE4
	9TxGbA1hSqojzMNW5g8Mx80nXgCbTvXWUzNc4=
Received: by 10.227.142.139 with SMTP id q11mr3698165wbu.103.1284391284334;
	Mon, 13 Sep 2010 08:21:24 -0700 (PDT)
Received: from [192.168.1.134] (dsl-51-41.dsl.netsource.ie [213.79.51.41])
	by mx.google.com with ESMTPS id u32sm3988235weq.35.2010.09.13.08.21.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Sep 2010 08:21:22 -0700 (PDT)
Message-ID: <4C8E4171.5080208@gmail.com>
Date: Mon, 13 Sep 2010 16:21:21 +0100
From: Arigead <captain.deadly@gmail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C85058D.8070506@gmail.com>	<1283996027.3036.1.camel@gnutoo-laptop>	<AANLkTimz=Q1KsMrMUfwvSEueq1a3kEcgWFoVZDvFqzqK@mail.gmail.com>	<4C88E7C2.1030500@gmail.com>	<4C88E9BC.9040603@eukrea.com>	<4C88EAF2.7010208@gmail.com>
	<4C88EC18.3020109@eukrea.com>
In-Reply-To: <4C88EC18.3020109@eukrea.com>
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: captain.deadly@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Asterisk and termcap
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
X-List-Received-Date: Mon, 13 Sep 2010 15:22:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Eric Bénard wrote:
> Le 09/09/2010 16:10, Arigead a écrit :
>> Sorry I'll have to get back to you on that one. I left my OpenMoko (The
>> Target) at home this morning so can't install the ipk :-(
>>
>> Actually thinking about it I'd not be too sure if Asterisk was ever
>> running fine on a mobile phone. Simply wanted to play with it and see
>> what it could do. There is an OpenMoko wiki page on messing with it so
>> thought I'd have a look.
>>
>> Anyhow I'll get back to you when I test it later today or tomorrow if
>> that's any help.
>>
> thanks, before pushing it it would be great if you could test it runs
> fine with the fix.
> 
> Eric
> 
> 
Asterisk builds and runs fine, but there is one minor problem. I don't
think that it's to do with the recipe but Asterisk itself.

Basically when I try to run asterisk its failing on:

Unable to open pid file '/var/run/asterisk/asterisk.pid': No such file
or directory

Normally I'd expect the pid file to be saved directly into
"/var/run/asterisk.pid" but asterisk seems to expect another directory.
If I create the directory /var/run/asterisk then all works fine.

Like I say that's not a problem with the recipe, well I'm no expert but
/var is a temp directory so it gets created on boot, so there's no way a
recipe should install there?


