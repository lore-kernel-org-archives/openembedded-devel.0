Received: from mail-iw0-f184.google.com ([209.85.223.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NkduX-0007ih-AC
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 14:37:54 +0100
Received: by iwn14 with SMTP id 14so5154676iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 05:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ZuQ1HdLCllDsr5dkhsIzLV7DyaGI1x88phGP0/ImPP4=;
	b=VuRd8dFgjkDw03u+axx0Q0oiJj2hx7vsH5sOfkdErBTA9Pg5yDtMqsEfjwdEIMdTff
	iUjrERbdnqCok3NghkEF0c08dYSCHjkvZvn7CToDkfxwsJJWHyreD0L+GJdKyxOYBokw
	JXQV2j2+BCq9aPASY5laugf8SH7dodwWn0fyE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xtqReNlyBWMrkABj5v6hTFv0ulgwBg1H4yi6FHGQ+Lk+zmEoboKgfqlrEVjOR7ho3u
	Q+O013rxKm/nGmCgQT5K6mq3X5jhz6dryAnXAQpV6B19IXhZLtQ3Opmr1ldZZwgz2n79
	GKHrbUtAG5je6DAR44sr0vz0YPMVxl/5aeuLI=
MIME-Version: 1.0
Received: by 10.231.191.131 with SMTP id dm3mr132335ibb.45.1267104899888; Thu, 
	25 Feb 2010 05:34:59 -0800 (PST)
In-Reply-To: <1266947342.18176.32.camel@trini-m4400>
References: <f96d234e1002091310h6eb4f93ei67068714adadd017@mail.gmail.com>
	<201002102228.49805.holger+oe@freyther.de>
	<f96d234e1002230903j24d67bcauca7714045a8d7c77@mail.gmail.com>
	<1266947342.18176.32.camel@trini-m4400>
Date: Thu, 25 Feb 2010 08:34:59 -0500
Message-ID: <f96d234e1002250534x153c3757rb2a560b8936b72c1@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.184
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE weekly changelog 2010-02-01 to 2010-02-08
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
X-List-Received-Date: Thu, 25 Feb 2010 13:37:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 23, 2010 at 12:49 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On Tue, 2010-02-23 at 12:03 -0500, Cliff Brake wrote:
>> On Wed, Feb 10, 2010 at 4:28 PM, Holger Hans Peter Freyther
>> <holger+oe@freyther.de> wrote:
>> > On Tuesday 09 February 2010 22:10:40 Cliff Brake wrote:
>> >> OE weekly changelog 2010-02-01 to 2010-02-08
>> >
>> > Hi Cliff,
>> >
>> > do you think having the output of `git shortlog holger/staging-branch` in the
>> > weekly changelog would be a nice addition?
>>
>> Added to the script, thanks.
>
> I kinda meant to say this earlier, and not to pick on holger, really,
> but how about we make the script take a few params and let everyone /
> anyone cron what they like (going where appropriate) so the shr folks
> can log their branches and so on.

Good idea, done.  If anyone wants their branch included in the weekly
changelog report, then please add to:

http://cgit.openembedded.org/cgit.cgi/openembedded/tree/contrib/weekly-changelog-report.sh

Thanks,
Cliff


