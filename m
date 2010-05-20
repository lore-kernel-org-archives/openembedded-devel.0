Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OF6IF-0006Bs-1E
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 16:00:11 +0200
Received: by gya1 with SMTP id 1so87789gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 06:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+di3zd1N2JUOxujxv0MK3X5DpuOzKCjohM/vzGNmMIY=;
	b=uiyrlDmEdzXZ3TRym0f9ipWntte3ZrUtNci1GSuU0yMCJBV/bP4/Qjlc8CYLkZMPJt
	ryI/RW2xKag6pNmPTRkklmur7veeZ5QujlYH4+/bpRT5nm5UGX44x+xdpZp4ZypBi/L0
	RwlEiel59AnMCFGVDMWEWXz2q4hYfZVmqaP2Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WPLF/l0MDaeLcmEUiAooGugFMSOqssefYWuKdRtasKA4pUPjgT5IoHoSln2NPSdOpI
	3vOM3/MEwvMdcbbcB5yKx65xaBbyZFKMyb3wiIrmtdlaH6QGbonxLVwi7ToX4BYqUUro
	QiSFW6aySI9pbuG3IJnTdyy4QAb2eOEnJ+n+M=
MIME-Version: 1.0
Received: by 10.91.144.10 with SMTP id w10mr602501agn.181.1274363767953; Thu, 
	20 May 2010 06:56:07 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Thu, 20 May 2010 06:56:07 -0700 (PDT)
In-Reply-To: <4BF53ED3.2000806@mlbassoc.com>
References: <4BF532DA.4080601@mlbassoc.com>
	<AANLkTimYRrV82uHzco2jxLhEXw-7YTBx7fBOJb5YV4ZY@mail.gmail.com>
	<4BF53ED3.2000806@mlbassoc.com>
Date: Thu, 20 May 2010 15:56:07 +0200
Message-ID: <AANLkTil8Wgu6KX91M-dl3IURrQNHTJk4zVWImCYxLITF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why is OE so slow?
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
X-List-Received-Date: Thu, 20 May 2010 14:00:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/5/20 Gary Thomas <gary@mlbassoc.com>:
> On 05/20/2010 07:28 AM, Andrea Adami wrote:
>>
>> I guess you're using bitbake_1.8.18.
>> Use bitbake_1.10.0.
>
> Where do I get it? =A0It's not at http://download.berlios.de/bitbake/

cgit.openembedded.org/bitbake

>
> Thanks
>
>> On Thu, May 20, 2010 at 3:02 PM, Gary Thomas<gary@mlbassoc.com> =A0wrote=
:
>>>
>>> I'm using OpenEmbedded to build Angstrom. =A0Recent trees
>>> in the org.openembedded.dev branch have some 8370 recipes.
>>> When I initiate a build, it takes *forever* just to get started.
>
> --
> ------------------------------------------------------------
> Gary Thomas =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0Consulting for the
> MLB Associates =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


