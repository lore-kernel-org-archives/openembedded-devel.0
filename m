Received: from [64.233.166.183] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Kab9Y-0007jv-Ur
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Sep 2008 21:03:01 +0200
Received: by py-out-1112.google.com with SMTP id y77so1340625pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Sep 2008 12:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=7Y4bC5kfYpCtVy3ztnVA0jA6CHrEszBIlJjKAeKAvnw=;
	b=rmLJmW7/CaCQcPPQy3h8XATEeoENmrM+Aakjo+oux66IXgYFAomf1KsZZ81FBVyp5G
	+i1vXYp6bnGo7Et1uqSw3jQPU5PfJoLgIHmNqL94lUuKHBhjuOTbtG7cy4r22BMxPq1n
	EFXbDwOuG8+Z65RN5n+dr5lr7YW7s0vbeIXiQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=lxDBGGk1xSEalp7dYftCmZomFLJyOskxE5gs2tWvz2dZkiW9ru2hcovQg6tvdBFppE
	50eqLqKjF7ks0n/KEdND+GqsjnceBbOWsRp7rwr/iBpfa096DtG0pj9K7ADJRJ5cD3ye
	oV5oa93WunXFYJ2YHURxTeM8xfqaiAC1uPaOQ=
Received: by 10.115.48.12 with SMTP id a12mr6790350wak.38.1220382057324;
	Tue, 02 Sep 2008 12:00:57 -0700 (PDT)
Received: by 10.114.241.11 with HTTP; Tue, 2 Sep 2008 12:00:56 -0700 (PDT)
Message-ID: <19c1b8a90809021200g4dfc8f9amd1948acb66918244@mail.gmail.com>
Date: Tue, 2 Sep 2008 12:00:56 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080902161915.11dfe79c.martyn.welch@gefanuc.com>
MIME-Version: 1.0
References: <1220355745.16745.1271706363@webmail.messagingengine.com>
	<d1b08f940809020543j5f968156y80590035be9dba1f@mail.gmail.com>
	<48BD421B.9020404@balister.org>
	<20080902161915.11dfe79c.martyn.welch@gefanuc.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: Which distro for OE development?
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
X-List-Received-Date: Tue, 02 Sep 2008 19:03:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Ideally you can use the hosts which have these packages.

http://wiki.openembedded.net/index.php/Required_Software

Then there is a list of known working distros.

http://wiki.openembedded.net/index.php/OEandYourDistro

If your distro is not listed here and you have made it to work on it,
feel free to contribute the prerquisites or any steps you did to make
it work on that particular distro.

Thanks

-Khem

On Tue, Sep 2, 2008 at 8:19 AM, Martyn Welch <martyn.welch@gefanuc.com> wrote:
> On Tue, 02 Sep 2008 09:39:39 -0400
> Philip Balister <philip@balister.org> wrote:
>
>> Andrea Adami wrote:
>> > I think by popularity here:
>> >
>> > Debian / Ubuntu
>> > Gentoo
>>
>> Fedora also works.
>>
>
> Though I've got a collegue who has had trouble with the stable branch on Fedora 9. Fedora 8 is fine. The compiler in F9 fails to build dbus-native (1.0.1), though the older compiler in F8 has no problems.
>
> Martyn
>
> --
> Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
> GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
> Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
> Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 729849476
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


